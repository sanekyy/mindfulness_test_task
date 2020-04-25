import 'package:built_value/built_value.dart';
import 'package:task/data/model/sound.dart';
import 'package:built_collection/built_collection.dart';

part 'task_state.g.dart';

abstract class TaskPageState
    implements Built<TaskPageState, TaskPageStateBuilder> {
  bool get playing;

  Duration get currentPosition;

  double get volume;

  BuiltList<Sound> get sounds;

  Sound get activeSound;

  TaskPageState._();

  factory TaskPageState([void Function(TaskPageStateBuilder) updates]) =
      _$TaskPageState;
}
