import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager _instace;
  static LanguageManager get instance {
    if (_instace == null) _instace = LanguageManager._init();
    return _instace;
  }

  LanguageManager._init();

  final enLocale = Locale("en", "US");
  final trLocale = Locale("tr", "TR");

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
