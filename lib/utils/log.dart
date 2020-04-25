import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

enum LogType { d, w, e }

typedef LogPrinter = void Function(LogItem item);

class Log {
  static List<LogPrinter> _logPrinters = [];

  static const logFileName = 'log.txt';
  static final List<LogItem> logs = List();
  static final DateFormat _dateFormat = DateFormat('dd-MM-yyyy–HH:mm:ss:ms');

  static void addLogPrinter(LogPrinter logPrinter) {
    _logPrinters.add(logPrinter);
  }

  static void d(String tag, Object message) {
    log(LogType.d, tag, message);
  }

  static void w(String tag, Object message) {
    log(LogType.w, tag, message);
  }

  static void e(String tag, Object message) {
    log(LogType.e, tag, message);
  }

  static void log(LogType type, String tag, Object message) {
    final now = DateTime.now();
    final date = _dateFormat.format(now);
    final logItem = LogItem(type, now, date, tag, "$message");

    for (final logPrinter in _logPrinters) {
      logPrinter(logItem);
    }

    if (kIsWeb) {
      print("$date [$tag]: $message");
    } else {
      debugPrint("$date [$tag]: $message");
    }

    logs.add(logItem);
  }

  static Future<List<int>> logsToBytes() async {
    final buffer = StringBuffer();
    logs.forEach(
        (log) => buffer.writeln("${log.date} [${log.tag}]: ${log.text}"));
    return utf8.encode(buffer.toString());
  }
}

class LogItem {
  final LogType type;
  final DateTime rawDate;
  final String date;
  final String tag;
  final String text;

  LogItem(this.type, this.rawDate, this.date, this.tag, this.text);
}
