import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/constants/navigation/navigation_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  LocaleManager.preferencesInit();
  await Firebase.initializeApp();
  runApp(Phoenix(
    child: MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
          useOnlyLangCode: true,
          path: ApplicationConstants.LANG_ASSETS_PATH,
          supportedLocales: LanguageManager.instance.supportedLocales,
          child: MyApp()),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        initialRoute: NavigationConstants.SPLASH_VIEW,
        navigatorKey: NavigationManager.instance.navigatorKey);
  }
}
