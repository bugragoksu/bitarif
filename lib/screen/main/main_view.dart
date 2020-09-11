import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../core/base/state/base_state.dart';
import '../_widgets/bottom_bar/bottom_bar.dart';
import 'home/view/home_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends BaseState<MainView> {
  final PageStorageBucket bucket = PageStorageBucket();
  final Key _homeKey = PageStorageKey('homeView');
  final Key _searchKey = PageStorageKey('searchView');
  final Key _favoriteKey = PageStorageKey('favoriveView');
  final Key _profileKey = PageStorageKey('profileView');

  List<Widget> pages;
  Widget currentPage;
  IconData selectedIcon;
  int currentIndex;
  @override
  void initState() {
    pages = [
      HomeView(key: _homeKey),
      Container(
        color: Colors.green,
        key: _searchKey,
      ),
      Container(
        color: Colors.yellow,
        key: _favoriteKey,
      ),
      Container(
        color: Colors.blue,
        key: _profileKey,
      )
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

  Widget get _buildBody => PageStorage(
        child: currentPage,
        bucket: bucket,
      );

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
