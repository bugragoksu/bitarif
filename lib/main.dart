import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/lang/language_manager.dart';

void main() {
  runApp(EasyLocalization(
      useOnlyLangCode: true,
      path: ApplicationConstants.LANG_ASSETS_PATH,
      supportedLocales: LanguageManager.instance.supportedLocales,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
