import 'package:bitarif/core/constants/enums/preferences_keys_enum.dart';

abstract class ILocaleManager {
  void setStringValue(PreferencesKeys key, String value);
  String getStringValue(PreferencesKeys key);
  void setIntValue(PreferencesKeys key, int value);
  int getIntValue(PreferencesKeys key);
  void setBoolValue(PreferencesKeys key, bool value);
  bool getBoolValue(PreferencesKeys key);
}
