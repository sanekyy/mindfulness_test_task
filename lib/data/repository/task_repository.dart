import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task/data/model/task.dart';
import 'package:task/data/model/task_group.dart';
import 'package:task/utils/log.dart';

const _tag = "task_repository";

class TaskRepository {
  final rand = Random();

  final _meditationTaskGroupsSubject = BehaviorSubject<BuiltList<TaskGroup>>();
  final _coursesTaskGroupsSubject = BehaviorSubject<BuiltList<TaskGroup>>();
  final _soundsTaskGroupsSubject = BehaviorSubject<BuiltList<TaskGroup>>();

  Stream<BuiltList<TaskGroup>> get meditationTaskGroupsSubject =>
      _meditationTaskGroupsSubject;

  Stream<BuiltList<TaskGroup>> get coursesTaskGroupsSubject =>
      _coursesTaskGroupsSubject;

  Stream<BuiltList<TaskGroup>> get soundsTaskGroupsSubject =>
      _soundsTaskGroupsSubject;

  TaskRepository() {
    Log.d(_tag, "_init");
    _generateData();
  }

  void dispose() {
    _meditationTaskGroupsSubject.close();
    _coursesTaskGroupsSubject.close();
    _soundsTaskGroupsSubject.close();
  }

  void _generateData() {
    Log.d(_tag, "_generateData");

    final taskGroups = List.generate(
      5,
      (i) => TaskGroup(
        (b) => b
          ..title = "Group $i"
          ..tasks = _generateTasks(i).toBuilder(),
      ),
    ).toBuiltList();

    _meditationTaskGroupsSubject.add(taskGroups);
    _coursesTaskGroupsSubject.add(taskGroups);
    _soundsTaskGroupsSubject.add(taskGroups);
  }

  BuiltList<Task> _generateTasks(int groupId) {
    return List.generate(
      5,
      (i) => Task(
        (b) => b
          ..info =
              "Info $groupId $i Info $i Info $i Info $i Info $i Info $i Info $i Info $i"
          ..title =
              "Title $groupId $i Title $i Title $i Title $i Title $i Title $i"
          ..subtitle =
              "Subtitle $groupId $i Subtitle $i Subtitle $i Subtitle $i Subtitle $i Subtitle $i Subtitle $i Subtitle"
          ..duration = Duration(
              minutes: rand.nextInt(3), seconds: rand.nextInt(50) + 10),
      ),
    ).toBuiltList();
  }
}
