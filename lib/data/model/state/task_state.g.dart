// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TaskPageState extends TaskPageState {
  @override
  final bool playing;
  @override
  final Duration currentPosition;
  @override
  final double volume;
  @override
  final BuiltList<Sound> sounds;
  @override
  final Sound activeSound;

  factory _$TaskPageState([void Function(TaskPageStateBuilder) updates]) =>
      (new TaskPageStateBuilder()..update(updates)).build();

  _$TaskPageState._(
      {this.playing,
      this.currentPosition,
      this.volume,
      this.sounds,
      this.activeSound})
      : super._() {
    if (playing == null) {
      throw new BuiltValueNullFieldError('TaskPageState', 'playing');
    }
    if (currentPosition == null) {
      throw new BuiltValueNullFieldError('TaskPageState', 'currentPosition');
    }
    if (volume == null) {
      throw new BuiltValueNullFieldError('TaskPageState', 'volume');
    }
    if (sounds == null) {
      throw new BuiltValueNullFieldError('TaskPageState', 'sounds');
    }
    if (activeSound == null) {
      throw new BuiltValueNullFieldError('TaskPageState', 'activeSound');
    }
  }

  @override
  TaskPageState rebuild(void Function(TaskPageStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskPageStateBuilder toBuilder() => new TaskPageStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaskPageState &&
        playing == other.playing &&
        currentPosition == other.currentPosition &&
        volume == other.volume &&
        sounds == other.sounds &&
        activeSound == other.activeSound;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, playing.hashCode), currentPosition.hashCode),
                volume.hashCode),
            sounds.hashCode),
        activeSound.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaskPageState')
          ..add('playing', playing)
          ..add('currentPosition', currentPosition)
          ..add('volume', volume)
          ..add('sounds', sounds)
          ..add('activeSound', activeSound))
        .toString();
  }
}

class TaskPageStateBuilder
    implements Builder<TaskPageState, TaskPageStateBuilder> {
  _$TaskPageState _$v;

  bool _playing;
  bool get playing => _$this._playing;
  set playing(bool playing) => _$this._playing = playing;

  Duration _currentPosition;
  Duration get currentPosition => _$this._currentPosition;
  set currentPosition(Duration currentPosition) =>
      _$this._currentPosition = currentPosition;

  double _volume;
  double get volume => _$this._volume;
  set volume(double volume) => _$this._volume = volume;

  ListBuilder<Sound> _sounds;
  ListBuilder<Sound> get sounds => _$this._sounds ??= new ListBuilder<Sound>();
  set sounds(ListBuilder<Sound> sounds) => _$this._sounds = sounds;

  SoundBuilder _activeSound;
  SoundBuilder get activeSound => _$this._activeSound ??= new SoundBuilder();
  set activeSound(SoundBuilder activeSound) =>
      _$this._activeSound = activeSound;

  TaskPageStateBuilder();

  TaskPageStateBuilder get _$this {
    if (_$v != null) {
      _playing = _$v.playing;
      _currentPosition = _$v.currentPosition;
      _volume = _$v.volume;
      _sounds = _$v.sounds?.toBuilder();
      _activeSound = _$v.activeSound?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaskPageState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TaskPageState;
  }

  @override
  void update(void Function(TaskPageStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TaskPageState build() {
    _$TaskPageState _$result;
    try {
      _$result = _$v ??
          new _$TaskPageState._(
              playing: playing,
              currentPosition: currentPosition,
              volume: volume,
              sounds: sounds.build(),
              activeSound: activeSound.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sounds';
        sounds.build();
        _$failedField = 'activeSound';
        activeSound.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TaskPageState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
