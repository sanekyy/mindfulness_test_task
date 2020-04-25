import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'task.g.dart';

abstract class Task implements Built<Task, TaskBuilder> {
  static Serializer<Task> get serializer => _$taskSerializer;

  String get info;

  String get title;

  String get subtitle;

  Duration get duration;

  Task._();

  factory Task([void Function(TaskBuilder) updates]) = _$Task;
}
