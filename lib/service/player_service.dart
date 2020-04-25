import 'package:audioplayers/audioplayers.dart';

class PlayerService {
  final _player = AudioPlayer();

  PlayerService();

  Stream<Duration> get onAudioPositionChanged => _player.onAudioPositionChanged;

  Future<void> play(String url, {bool isLocal, stayAwake}) async {
    return _player.play(url, isLocal: isLocal, stayAwake: stayAwake);
  }

  Future<void> setUrl(String url, {bool isLocal, stayAwake}) {
    return _player.setUrl(url, isLocal: isLocal);
  }

  void setReleaseMode(ReleaseMode releaseMode) {
    _player.setReleaseMode(releaseMode);
  }

  void pause() {
    _player.pause();
  }

  void resume() {
    _player.resume();
  }

  Future<void> stop() {
    return _player.stop();
  }

  void setVolume(double volume) {
    _player.setVolume(volume);
  }

  void dispose() {
    _player.dispose();
    _player.release();
  }

  Future<Duration> getDuration() async {
    final rawDuration = await _player.getDuration();

    return Duration(milliseconds: rawDuration);
  }
}
