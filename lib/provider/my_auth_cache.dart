import 'package:la_via/provider/my_auth_cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAuthCache {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putString(
      {required MyAuthCacheKeys key, required String value}) async {
    return await preferences?.setString(key.name, value);
  }

  static String getString({
    required MyAuthCacheKeys key,
  }) {
    return preferences?.getString(
      key.name,
    ) ??
        '';
  }

  static void putBoolean(
      {required MyAuthCacheKeys key, required bool value}) async {
    await preferences?.setBool(key.name, value);
  }

  static bool getBoolean({
    required bool defaultValue,
    required MyAuthCacheKeys key,
  }) {
    return preferences?.getBool(
      key.name,
    ) ??
        defaultValue;
  }

  static void putInt({required MyAuthCacheKeys key, required int value}) async {
    await preferences?.setInt(key.name, value);
  }

  static int getInt({
    required MyAuthCacheKeys key,
  }) {
    return preferences?.getInt(
      key.name,
    ) ??
        0;
  }

  static void putDouble(
      {required MyAuthCacheKeys key, required double value}) async {
    await preferences?.setDouble(key.name, value);
  }

  static double getDouble({
    required MyAuthCacheKeys key,
  }) {
    return preferences?.getDouble(
      key.name,
    ) ??
        0.0;
  }

  static Future<void> removeFromShared({    required MyAuthCacheKeys key,
  }) async {
    await preferences?.remove(key.name);
  }

  static Future<void> clearShared() async {
    await preferences?.clear();
  }
}