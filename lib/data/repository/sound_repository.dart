import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task/data/model/sound.dart';
import 'package:task/utils/log.dart';

const _tag = "sound_repository";

class SoundRepository {
  final _soundsSubject = BehaviorSubject<BuiltList<Sound>>();

  Stream<BuiltList<Sound>> get sounds => _soundsSubject;

  SoundRepository() {
    Log.d(_tag, "_init");
    _generateSounds();
  }

  void dispose() {
    _soundsSubject.close();
  }

  Future<void> _generateSounds() async {
    Log.d(_tag, "_generateSounds");

    _soundsSubject.add(
      BuiltList(
        [
          Sound((b) => b
          ..id = "sound1"
            ..title = "Ocean"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/ocean.jpg"
            ..soundUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/ocean2.mp3"),
          Sound((b) => b
            ..id = "sound2"
            ..title = "Cafe"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/cafe.jpg"
            ..soundUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/noise.wav"),
          Sound((b) => b
            ..id = "sound3"
            ..title = "Airport"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/airport.jpeg"
            ..soundUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/airport.mp3"),
          Sound((b) => b
            ..id = "sound4"
            ..title = "Piano"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/piano.jpeg"
            ..soundUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/paino.mp3"),
          Sound((b) => b
            ..id = "sound5"
            ..title = "Storm"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/storm.jpeg"
            ..soundUrl = "https://storage.googleapis.com/terra-incognita-static/static/task/storm.mp3"),
          Sound((b) => b
            ..id = "sound6"
            ..title = "Ocean"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/ocean.jpg"
            ..soundUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/ocean2.mp3"),
          Sound((b) => b
            ..id = "sound7"
            ..title = "Cafe"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/cafe.jpg"
            ..soundUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/noise.wav"),
          Sound((b) => b
            ..id = "sound8"
            ..title = "Airport"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/airport.jpeg"
            ..soundUrl = "https://storage.googleapis.com/terra-incognita-static/static/task/airport.mp3"),
          Sound((b) => b
            ..id = "sound9"
            ..title = "Piano"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/piano.jpeg"
            ..soundUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/paino.mp3"),
          Sound((b) => b
            ..id = "sound10"
            ..title = "Storm"
            ..imageUrl =
                "https://storage.googleapis.com/terra-incognita-static/static/task/storm.jpeg"
            ..soundUrl = "https://storage.googleapis.com/terra-incognita-static/static/task/storm.mp3"),
        ],
      ),
    );
  }
}
