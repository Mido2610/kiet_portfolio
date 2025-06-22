import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<void> setString(String key, String value);
  Future<String?> getString(String key);
  Future<void> setBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<void> remove(String key);
  Future<void> clear();
  Future<bool> containsKey(String key);
  Future<void> saveLanguage(String language);
  Future<String> getLanguage();
}

class SharedPreferencesService implements LocalStorage {
  SharedPreferences? _prefs;

  // Singleton pattern
  static SharedPreferencesService? _instance;
  static SharedPreferencesService get instance {
    _instance ??= SharedPreferencesService._internal();
    return _instance!;
  }

  SharedPreferencesService._internal();

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  SharedPreferences get _preferences {
    if (_prefs == null) {
      throw Exception(
        'SharedPreferencesService not initialized. Call init() first.',
      );
    }
    return _prefs!;
  }

  @override
  Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return _preferences.getString(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return _preferences.getBool(key);
  }

  @override
  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await _preferences.clear();
  }

  @override
  Future<bool> containsKey(String key) async {
    return _preferences.containsKey(key);
  }

  @override
  Future<void> saveLanguage(String language) async {
    await setString('app_language', language);
  }

  @override
  Future<String> getLanguage() async {
    return await getString('app_language') ?? 'en';
  }
}