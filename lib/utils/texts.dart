import 'package:intl/intl.dart';

class Texts {
  static final trackFormatter = new DateFormat('mm:ss');
  
  static final taskFormatter = new DateFormat('mm\'m\' ss\'s\'');

  static String formatTrackDuration(Duration duration) {
    return trackFormatter.format(
      DateTime.fromMillisecondsSinceEpoch(
        duration.inMilliseconds,
      ),
    );
  }

  static String formatTaskDuration(Duration duration) {
    return taskFormatter.format(
      DateTime.fromMillisecondsSinceEpoch(
        duration.inMilliseconds,
      ),
    );
  }
}
