import 'package:bitarif/core/init/navigation/navigation_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider _instance;
  static ApplicationProvider get instance {
    if (_instance == null) _instance = ApplicationProvider._init();
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    Provider.value(value: NavigationManager.instance)
  ];
}
