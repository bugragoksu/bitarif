import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  final double height;
  final List<Color> colors;

  const GradientDivider({Key key, this.height, @required this.colors})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 1.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: colors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )),
    );
  }
}
