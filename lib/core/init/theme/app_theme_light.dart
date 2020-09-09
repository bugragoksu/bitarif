import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';

class AppThemeLight {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme(),
      );

  ColorScheme _appColorScheme() {
    return ColorScheme(
        primary: Color(0xff424242),
        primaryVariant: Colors.black,
        secondary: Color(0xffff2164),
        secondaryVariant: Color(0xffff893d),
        surface: Colors.white70,
        background: Colors.white,
        error: Colors.red[900],
        onPrimary: Colors.white,
        onSecondary: Colors.black38,
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Colors.red,
        brightness: Brightness.light);
  }
}
