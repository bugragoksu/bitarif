import 'package:flutter/material.dart';

import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(Scaffold());
        break;
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
