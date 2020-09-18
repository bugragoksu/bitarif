import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimatedOpenContainer extends StatelessWidget {
  final Widget openWidget, closeWidget;

  const AnimatedOpenContainer(
      {Key key, @required this.openWidget, @required this.closeWidget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      closedElevation: 0,
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      closedBuilder: (BuildContext context, void Function() action) =>
          closeWidget,
      openBuilder:
          (BuildContext context, void Function({Object returnValue}) action) =>
              openWidget,
    );
  }
}
