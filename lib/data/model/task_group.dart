import 'package:built_collection/built_collection.dart';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:task/data/model/task.dart';

part 'task_group.g.dart';

abstract class TaskGroup implements Built<TaskGroup, TaskGroupBuilder> {
  static Serializer<TaskGroup> get serializer => _$taskGroupSerializer;

  String get title;

  BuiltList<Task> get tasks;

  TaskGroup._();

  factory TaskGroup([void Function(TaskGroupBuilder) updates]) = _$TaskGroup;
}
