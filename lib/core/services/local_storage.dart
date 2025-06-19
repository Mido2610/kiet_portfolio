import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<void> setString(String key, String value);
  Future<String?> getString(String key);
  Future<void> setBool(String key, bool value);
  Future<bool?> getBool(String key);
  Future<void> setInt(String key, int value);
  Future<int?> getInt(String key);
  Future<void> setDouble(String key, double value);
  Future<double?> getDouble(String key);
  Future<void> setStringList(String key, List<String> value);
  Future<List<String>?> getStringList(String key);
  Future<void> setObject(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>?> getObject(String key);
  Future<void> remove(String key);
  Future<void> clear();
  Future<bool> containsKey(String key);
  Future<Set<String>> getKeys();
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
      throw Exception('SharedPreferencesService not initialized. Call init() first.');
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
  Future<void> setInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  @override
  Future<int?> getInt(String key) async {
    return _preferences.getInt(key);
  }

  @override
  Future<void> setDouble(String key, double value) async {
    await _preferences.setDouble(key, value);
  }

  @override
  Future<double?> getDouble(String key) async {
    return _preferences.getDouble(key);
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    await _preferences.setStringList(key, value);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return _preferences.getStringList(key);
  }

  @override
  Future<void> setObject(String key, Map<String, dynamic> value) async {
    final jsonString = jsonEncode(value);
    await setString(key, jsonString);
  }

  @override
  Future<Map<String, dynamic>?> getObject(String key) async {
    final jsonString = await getString(key);
    if (jsonString == null) return null;
    
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
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
  Future<Set<String>> getKeys() async {
    return _preferences.getKeys();
  }

  // Additional utility methods
  Future<void> saveUserSettings(Map<String, dynamic> settings) async {
    await setObject('user_settings', settings);
  }

  Future<Map<String, dynamic>?> getUserSettings() async {
    return await getObject('user_settings');
  }

  Future<void> saveTheme(String theme) async {
    await setString('app_theme', theme);
  }

  Future<String> getTheme() async {
    return await getString('app_theme') ?? 'light';
  }

  Future<void> saveLanguage(String language) async {
    await setString('app_language', language);
  }

  Future<String> getLanguage() async {
    return await getString('app_language') ?? 'en';
  }

  Future<void> saveFirstLaunch(bool isFirstLaunch) async {
    await setBool('is_first_launch', isFirstLaunch);
  }

  Future<bool> isFirstLaunch() async {
    return await getBool('is_first_launch') ?? true;
  }

  // Cache management
  Future<void> setCacheData(String key, Map<String, dynamic> data, {Duration? expiry}) async {
    final cacheData = {
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      if (expiry != null) 'expiry': expiry.inMilliseconds,
    };
    await setObject('cache_$key', cacheData);
  }

  Future<Map<String, dynamic>?> getCacheData(String key) async {
    final cacheData = await getObject('cache_$key');
    if (cacheData == null) return null;

    final timestamp = cacheData['timestamp'] as int?;
    final expiry = cacheData['expiry'] as int?;
    
    if (timestamp != null && expiry != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      if (now - timestamp > expiry) {
        await remove('cache_$key');
        return null;
      }
    }

    return cacheData['data'] as Map<String, dynamic>?;
  }

  Future<void> clearCache() async {
    final keys = await getKeys();
    final cacheKeys = keys.where((key) => key.startsWith('cache_'));
    
    for (final key in cacheKeys) {
      await remove(key);
    }
  }

  // Debug methods
  Future<void> printAllKeys() async {
    final keys = await getKeys();
    debug('LocalStorage Keys: ${keys.toList()}');
  }

  Future<Map<String, dynamic>> getAllData() async {
    final keys = await getKeys();
    final data = <String, dynamic>{};
    
    for (final key in keys) {
      // Try different data types
      final stringValue = await getString(key);
      if (stringValue != null) {
        data[key] = stringValue;
        continue;
      }
      
      final boolValue = await getBool(key);
      if (boolValue != null) {
        data[key] = boolValue;
        continue;
      }
      
      final intValue = await getInt(key);
      if (intValue != null) {
        data[key] = intValue;
        continue;
      }
      
      final doubleValue = await getDouble(key);
      if (doubleValue != null) {
        data[key] = doubleValue;
        continue;
      }
    }
    
    return data;
  }

  void debug(String s) {}
}