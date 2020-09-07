import 'package:flutter/material.dart';

import 'INavigationManager.dart';

class NavigationManager implements INavigationManager {
  static NavigationManager _instance = NavigationManager._init();
  static NavigationManager get instance => _instance;

  NavigationManager._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String path, Object data}) async {
    await navigatorKey.currentState.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String path, Object data}) async {
    await navigatorKey.currentState
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}
