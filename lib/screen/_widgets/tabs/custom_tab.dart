import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../core/extensions/context_extension.dart';

class CustomTab extends StatefulWidget {
  final Function(int index) onChanged;
  final TabController controller;
  const CustomTab({
    Key key,
    @required this.onChanged,
    @required this.controller,
  }) : super(key: key);
  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  List<IconData> iconList;
  IconData currentIcon;
  @override
  void initState() {
    iconList = [FeatherIcons.grid, FeatherIcons.users];
    currentIcon = iconList[0];

    widget.controller.addListener(() {
      setState(() {
        if (widget.controller.index == 0)
          currentIcon = iconList[0];
        else
          currentIcon = iconList[1];
      });
      widget.onChanged(widget.controller.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: widget.controller,
        labelColor: context.theme.colorScheme.primary,
        unselectedLabelColor: context.theme.colorScheme.primary,
        indicatorPadding: EdgeInsets.all(0.0),
        indicatorWeight: 4.0,
        labelPadding: EdgeInsets.only(left: 0.0, right: 0.0),
        indicatorColor: context.theme.colorScheme.secondary,
        tabs: _buildTabItems);
  }

  List<Widget> get _buildTabItems =>
      iconList.map((data) => _buildTab(data)).toList();

  Widget _buildTab(IconData icon) => Container(
        height: 40,
        alignment: Alignment.center,
        color: Colors.white,
        child: currentIcon == icon
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
            : Icon(icon),
      );
}
