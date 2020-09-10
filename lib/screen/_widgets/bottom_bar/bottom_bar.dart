import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class BottomBar extends StatelessWidget {
  final void Function(int) onTap;
  final IconData selectedIcon;
  final int currentIndex;
  final List<IconData> iconList;

  const BottomBar(
      {Key key,
      @required this.onTap,
      @required this.selectedIcon,
      @required this.currentIndex,
      @required this.iconList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: onTap,
      elevation: 0.0,
      items: _buildBottomBarItems(context),
    );
  }

  List<BottomNavigationBarItem> _buildBottomBarItems(BuildContext context) =>
      iconList.map((data) => _buildBottomBarItem(data, context)).toList();

  BottomNavigationBarItem _buildBottomBarItem(
          IconData icon, BuildContext context) =>
      BottomNavigationBarItem(
          icon: selectedIcon == icon
              ? ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return ui.Gradient.linear(
                      Offset(4.0, 24.0),
                      Offset(24.0, 4.0),
                      [
                        context.theme.colorScheme.secondary,
                        context.theme.colorScheme.secondaryVariant,
                      ],
                    );
                  },
                  child: Icon(icon),
                )
              : Icon(
                  icon,
                  color: context.theme.colorScheme.primary,
                ),
          title: Text(''));
}
