// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_group.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaskGroup> _$taskGroupSerializer = new _$TaskGroupSerializer();

class _$TaskGroupSerializer implements StructuredSerializer<TaskGroup> {
  @override
  final Iterable<Type> types = const [TaskGroup, _$TaskGroup];
  @override
  final String wireName = 'TaskGroup';

  @override
  Iterable<Object> serialize(Serializers serializers, TaskGroup object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'tasks',
      serializers.serialize(object.tasks,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Task)])),
    ];

    return result;
  }

  @override
  TaskGroup deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskGroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tasks':
          result.tasks.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Task)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$TaskGroup extends TaskGroup {
  @override
  final String title;
  @override
  final BuiltList<Task> tasks;

  factory _$TaskGroup([void Function(TaskGroupBuilder) updates]) =>
      (new TaskGroupBuilder()..update(updates)).build();

  _$TaskGroup._({this.title, this.tasks}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('TaskGroup', 'title');
    }
    if (tasks == null) {
      throw new BuiltValueNullFieldError('TaskGroup', 'tasks');
    }
  }

  @override
  TaskGroup rebuild(void Function(TaskGroupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskGroupBuilder toBuilder() => new TaskGroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskGroup && title == other.title && tasks == other.tasks;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, title.hashCode), tasks.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaskGroup')
          ..add('title', title)
          ..add('tasks', tasks))
        .toString();
  }
}

class TaskGroupBuilder implements Builder<TaskGroup, TaskGroupBuilder> {
  _$TaskGroup _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  ListBuilder<Task> _tasks;
  ListBuilder<Task> get tasks => _$this._tasks ??= new ListBuilder<Task>();
  set tasks(ListBuilder<Task> tasks) => _$this._tasks = tasks;

  TaskGroupBuilder();

  TaskGroupBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _tasks = _$v.tasks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskGroup other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TaskGroup;
  }

  @override
  void update(void Function(TaskGroupBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TaskGroup build() {
    _$TaskGroup _$result;
    try {
      _$result = _$v ?? new _$TaskGroup._(title: title, tasks: tasks.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tasks';
        tasks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TaskGroup', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
