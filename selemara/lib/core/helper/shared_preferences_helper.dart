import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static Future<bool> writeString(String key, String value) async {
    return await _preferences!.setString(key, value);
  }

  static Future<bool> writeBool(String key, bool value) async {
    return await _preferences!.setBool(key, value);
  }

  static Future<bool> writeInt(String key, int value) async {
    return await _preferences!.setInt(key, value);
  }

  static Future<bool> writeDouble(String key, double value) async {
    return await _preferences!.setDouble(key, value);
  }

  static String? readString(String key) {
    return _preferences!.getString(key);
  }

  static bool? readBool(String key) {
    return _preferences!.getBool(key);
  }

  static int? readInt(String key) {
    return _preferences!.getInt(key);
  }

  static double? readDouble(String key) {
    return _preferences!.getDouble(key);
  }

  static Future<bool> remove(String key) async {
    return await _preferences!.remove(key);
  }

  static Future<bool> clear() async {
    return await _preferences!.clear();
  }
}
