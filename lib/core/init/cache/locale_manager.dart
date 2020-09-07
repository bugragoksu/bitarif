import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/preferences_keys_enum.dart';
import 'ILocaleManager.dart';

class LocaleManager implements ILocaleManager {
  static LocaleManager _instance = LocaleManager._init();
  SharedPreferences _preferences;
  static LocaleManager get instance => _instance;

  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) => _preferences = value);
  }

  static preferencesInit() async {
    if (instance._preferences == null) {
      instance._preferences = await SharedPreferences.getInstance();
    }
    return;
  }

  @override
  bool getBoolValue(PreferencesKeys key) =>
      _preferences.getBool(key.toString()) ?? false;
  @override
  int getIntValue(PreferencesKeys key) =>
      _preferences.getInt(key.toString()) ?? -1;

  @override
  String getStringValue(PreferencesKeys key) =>
      _preferences.getString(key.toString()) ?? "";

  @override
  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences.setBool(key.toString(), value);
  }

  @override
  Future<void> setIntValue(PreferencesKeys key, int value) async {
    await _preferences.setInt(key.toString(), value);
  }

  @override
  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences.setString(key.toString(), value);
  }
}
