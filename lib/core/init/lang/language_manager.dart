import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager _instance;
  static LanguageManager get instance {
    if (_instance == null) _instance = LanguageManager._init();
    return _instance;
  }

  Locale _currentLocale;
  LanguageManager._init() {
    _currentLocale = trLocale;
  }

  Locale changeLocale() {
    if (_currentLocale == trLocale) {
      _currentLocale = enLocale;
    } else {
      _currentLocale = trLocale;
    }
    return _currentLocale;
  }

  final enLocale = Locale("en", "US");
  final trLocale = Locale("tr", "TR");

  List<Locale> get supportedLocales => [trLocale, enLocale];
}
