import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys {
  counter,
  users,
}

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  void _checkInitialize() {
    if (preferences == null) {
      throw SharedPreferencesInitializeException();
    }
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkInitialize();

    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkInitialize();

    await preferences?.setStringList(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkInitialize();
    return preferences?.getString(key.name);
  }

  List<String>? getStringList(SharedKeys key) {
    _checkInitialize();
    return preferences?.getStringList(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkInitialize();
    return (await preferences?.remove(key.name)) ?? false;
  }
}

class SharedPreferencesInitializeException implements Exception {
  @override
  String toString() {
    return "Shared Preferences has not been initialized";
  }
}
