// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Task> _$taskSerializer = new _$TaskSerializer();

class _$TaskSerializer implements StructuredSerializer<Task> {
  @override
  final Iterable<Type> types = const [Task, _$Task];
  @override
  final String wireName = 'Task';

  @override
  Iterable<Object> serialize(Serializers serializers, Task object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'info',
      serializers.serialize(object.info, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'subtitle',
      serializers.serialize(object.subtitle,
          specifiedType: const FullType(String)),
      'duration',
      serializers.serialize(object.duration,
          specifiedType: const FullType(Duration)),
    ];

    return result;
  }

  @override
  Task deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaskBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subtitle':
          result.subtitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(Duration)) as Duration;
          break;
      }
    }

    return result.build();
  }
}

class _$Task extends Task {
  @override
  final String info;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final Duration duration;

  factory _$Task([void Function(TaskBuilder) updates]) =>
      (new TaskBuilder()..update(updates)).build();

  _$Task._({this.info, this.title, this.subtitle, this.duration}) : super._() {
    if (info == null) {
      throw new BuiltValueNullFieldError('Task', 'info');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Task', 'title');
    }
    if (subtitle == null) {
      throw new BuiltValueNullFieldError('Task', 'subtitle');
    }
    if (duration == null) {
      throw new BuiltValueNullFieldError('Task', 'duration');
    }
  }

  @override
  Task rebuild(void Function(TaskBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskBuilder toBuilder() => new TaskBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Task &&
        info == other.info &&
        title == other.title &&
        subtitle == other.subtitle &&
        duration == other.duration;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, info.hashCode), title.hashCode), subtitle.hashCode),
        duration.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Task')
          ..add('info', info)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('duration', duration))
        .toString();
  }
}

class TaskBuilder implements Builder<Task, TaskBuilder> {
  _$Task _$v;

  String _info;
  String get info => _$this._info;
  set info(String info) => _$this._info = info;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _subtitle;
  String get subtitle => _$this._subtitle;
  set subtitle(String subtitle) => _$this._subtitle = subtitle;

  Duration _duration;
  Duration get duration => _$this._duration;
  set duration(Duration duration) => _$this._duration = duration;

  TaskBuilder();

  TaskBuilder get _$this {
    if (_$v != null) {
      _info = _$v.info;
      _title = _$v.title;
      _subtitle = _$v.subtitle;
      _duration = _$v.duration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Task other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Task;
  }

  @override
  void update(void Function(TaskBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Task build() {
    final _$result = _$v ??
        new _$Task._(
            info: info, title: title, subtitle: subtitle, duration: duration);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
