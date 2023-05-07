import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late final SharedPreferences _prefs;
  static final Map<String, dynamic> _memoryPrefs = {};

  static Future<SharedPreferences> load() async {
    _prefs = await SharedPreferences.getInstance();
    final keys = _prefs.getKeys();
    for (String key in keys) {
      _memoryPrefs[key] = _prefs.get(key);
    }
    return _prefs;
  }

  static void setString(String key, String value) {
    _prefs.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static void setInt(String key, int value) {
    _prefs.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
    _memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static String? getString(String key) =>
      _memoryPrefs[key] ?? _prefs.getString(key);

  static int? getInt(String key) => _memoryPrefs[key] ?? _prefs.getInt(key);

  static double? getDouble(String key) =>
      _memoryPrefs[key] ?? _prefs.getDouble(key);

  static bool? getBool(String key) => _memoryPrefs[key] ?? _prefs.getBool(key);

  static void remove(String key) {
    _prefs.remove(key);
    _memoryPrefs.remove(key);
  }

  static void clearAll() {
    _prefs.clear();
    _memoryPrefs.clear();
  }
}
