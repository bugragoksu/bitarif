import 'package:flutter/material.dart';

class ColoredCircularProgress extends StatelessWidget {
  final Color color;

  const ColoredCircularProgress({Key key, @required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(color),
    );
  }
}
