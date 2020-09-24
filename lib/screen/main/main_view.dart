import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../core/base/state/base_state.dart';
import '../_widgets/bottom_bar/bottom_bar.dart';
import '../authenticate/auth/model/bitarif_user.dart';
import 'category/search/view/search_view.dart';
import 'favourite/view/favourite_view.dart';
import 'home/view/home_view.dart';
import 'profile/view/profile_view.dart';

class MainView extends StatefulWidget {
  final BitarifUser user;

  const MainView({Key key, @required this.user}) : super(key: key);
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends BaseState<MainView> {
  List<Widget> pages;
  Widget currentPage;
  IconData selectedIcon;
  int currentIndex;
  @override
  void initState() {
    pages = [
      HomeView(user: widget.user),
      SearchView(
        token: widget.user.token,
      ),
      FavouriteView(),
      ProfileView()
    ];
    currentPage = pages[0];
    selectedIcon = iconList[0];
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar, body: _buildBody);
  }

  Widget get _buildBody => IndexedStack(children: pages, index: currentIndex);

  Widget get _buildBottomNavigationBar => BottomBar(
        selectedIcon: selectedIcon,
        iconList: iconList,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentPage = pages[index];
            selectedIcon = iconList[index];
            currentIndex = index;
          });
        },
      );

  List<IconData> get iconList => [
        FeatherIcons.home,
        FeatherIcons.search,
        FeatherIcons.bookmark,
        FeatherIcons.user
      ];
}
