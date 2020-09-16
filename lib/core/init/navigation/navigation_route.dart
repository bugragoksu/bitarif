import 'package:bitarif/screen/main/recipe_list/view/recipe_list_view.dart';
import 'package:flutter/material.dart';

import '../../../screen/authenticate/auth/view/auth_view.dart';
import '../../../screen/authenticate/splash/view/splash_view.dart';
import '../../../screen/main/main_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(args) {
    switch (args.name) {
      case NavigationConstants.AUTH_VIEW:
        return normalNavigate(AuthView());
        break;
      case NavigationConstants.SPLASH_VIEW:
        return normalNavigate(SplashView());
        break;
      case NavigationConstants.MAIN_VIEW:
        return normalNavigate(MainView());
        break;
      case NavigationConstants.RECIPE_LIST_VIEW:
        return normalNavigate(RecipeListView());
        break;
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
