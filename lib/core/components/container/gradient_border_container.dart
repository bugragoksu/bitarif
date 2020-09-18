import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class GradientBorderContainer extends StatelessWidget {
  final List<Color> gradientColors;
  final Widget child;
  final double height, width;

  const GradientBorderContainer(
      {Key key,
      @required this.gradientColors,
      this.height,
      this.width,
      @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? context.highValue / 2,
      width: width ?? context.width / 3,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          alignment: Alignment.center,
          child: child,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
