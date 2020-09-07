import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/notifier/provider_list.dart';

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
    return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: MaterialApp(
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationManager.instance.navigatorKey),
    );
  }
}
