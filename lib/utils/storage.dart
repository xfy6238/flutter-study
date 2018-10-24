import 'package:shared_preferences/shared_preferences.dart';

class Storage {

  static Future<String> getItem(String key) async {
    var sharedPreferences = await _init();
    return sharedPreferences.get(key);
  }

  static Future<void> setItem(String key, String value) async {
    var sharedPreferences = await _init();
    sharedPreferences.setString(key, value);
  }

  static Future<void> removeItem(String key) async {
    var sharedPreferences = await _init();
    sharedPreferences.remove(key);
  }

  static Future<void> clear() async {
    var sharedPreferences = await _init();
    sharedPreferences.clear();
  }

  static Future<SharedPreferences> _init() async {
    return await SharedPreferences.getInstance();
  }
}
