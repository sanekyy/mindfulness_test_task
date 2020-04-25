import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task/data/model/sound.dart';
import 'package:task/data/model/state/task_state.dart';
import 'package:task/data/model/task.dart';
import 'package:task/data/repository/sound_repository.dart';
import 'package:task/service/player_service.dart';
import 'package:task/service/preferences_service.dart';
import 'package:task/utils/log.dart';

const _tag = "task_page_bloc";

class TaskPageBloc {
  final Task _task;
  final SoundRepository _soundRepository;
  final PlayerService _playerService;
  final PreferencesService _prefs;

  final _stateSubject = BehaviorSubject<TaskPageState>();

  Stream<TaskPageState> get state => _stateSubject;

  double _mutedVolume = 1.0;

  bool _stopTimer;

  TaskPageBloc({
    @required Task task,
    @required SoundRepository soundRepository,
    @required PlayerService playerService,
    @required PreferencesService prefs,
  })  : _task = task,
        _soundRepository = soundRepository,
        _playerService = playerService,
        _prefs = prefs {
    _init();
  }

  void dispose() {
    _stateSubject.close();
    _playerService.stop();
    _stopTimer = true;
  }

  void _updateState(updates(TaskPageStateBuilder b)) {
    final newState = _stateSubject.value.rebuild(updates);
    Log.d(_tag, "updateState: $newState");
    _stateSubject.add(newState);
  }

  _init() async {
    final volume = _prefs.getLastVolume();
    final sounds = await _soundRepository.sounds.first;

    final lastActiveSoundId = _prefs.getLastActiveSoundId();

    Sound activeSound = sounds.first;

    if (lastActiveSoundId != null) {
      activeSound = sounds.firstWhere(
        (it) => it.id == lastActiveSoundId,
        orElse: () => activeSound,
      );
    }

    final initialState = TaskPageState(
      (b) => b
        ..playing = true
        ..volume = volume
        ..currentPosition = Duration()
        ..sounds = sounds.toBuilder()
        ..activeSound = activeSound.toBuilder(),
    );

    _stateSubject.add(initialState);

    _setupPlayer();
    _startCurrentPositionUpdateLoop();
  }

  _setupPlayer() async {
    await _playerService.play(
      _stateSubject.value.activeSound.soundUrl,
      isLocal: false,
      stayAwake: true,
    );
    _playerService.setReleaseMode(ReleaseMode.LOOP);
    _playerService.setVolume(_stateSubject.value.volume);
  }

  void setVolume(double volume) {
    _updateState((b) => b.volume = volume);
    _playerService.setVolume(volume);
    _prefs.setLastVolume(volume);
  }

  void pause() {
    _updateState((b) => b.playing = false);
    _playerService.pause();
    _stopTimer = true;
  }

  void resume() {
    _updateState((b) => b.playing = true);
    _playerService.resume();
    _startCurrentPositionUpdateLoop();
  }

  void stop() {
    _updateState(
      (b) => b
        ..playing = false
        ..currentPosition = Duration(),
    );
    _playerService.stop();
    _stopTimer = true;
  }

  void toggleVolume() {
    final currentVolume = _stateSubject.value.volume;
    double newVolume;
    if (_stateSubject.value.volume == 0) {
      newVolume = _mutedVolume == 0 ? 1 : _mutedVolume;
    } else {
      _mutedVolume = currentVolume;
      newVolume = 0;
    }

    _playerService.setVolume(newVolume);
    _updateState((b) => b.volume = newVolume);
  }

  setActiveSound(Sound sound) async {
    _prefs.setLastActiveSoundId(sound.id);
    _updateState((b) => b.activeSound = sound.toBuilder());
    await _playerService.setUrl(sound.soundUrl);
  }

  void _startCurrentPositionUpdateLoop() async {
    _stopTimer = false;
    while (true) {
      await Future.delayed(Duration(milliseconds: 100));
      if (_stopTimer) return;
      final currentPosition = _stateSubject.value.currentPosition;
      if (currentPosition >= _task.duration) {
        stop();
        return;
      }
      final newCurrentPosition =
          Duration(milliseconds: currentPosition.inMilliseconds + 100);

      final newState = _stateSubject.value
          .rebuild((b) => b.currentPosition = newCurrentPosition);
      _stateSubject.add(newState);
    }
  }

  void play() async {
    resume();
  }
}
