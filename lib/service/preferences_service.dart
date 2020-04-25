import 'package:shared_preferences/shared_preferences.dart';

const _tag = "preferences_service";

class PreferencesService {
  static SharedPreferences prefs;

  static const String _lastActiveSoundIdKey = "LAST_ACTIVE_SOUND_ID";
  static const String _lastVolumeKey = "LAST_VOLUME_ID";

  static const defaultLastVolume = 1.0;

  void setLastActiveSoundId(String soundId) {
    prefs.setString(_lastActiveSoundIdKey, soundId);
  }

  String getLastActiveSoundId() {
    return prefs.getString(_lastActiveSoundIdKey);
  }

  void setLastVolume(double volume) {
    prefs.setDouble(_lastVolumeKey, volume);
  }

  double getLastVolume() {
    return prefs.getDouble(_lastVolumeKey) ?? defaultLastVolume;
  }
}
