import 'package:flutter/material.dart';

class ColoredBackGroundCard extends StatelessWidget {
  final Color bgColor;
  final Widget child;

  const ColoredBackGroundCard(
      {Key key, @required this.bgColor, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10.0)),
        alignment: Alignment.center,
        child: child);
  }
}
