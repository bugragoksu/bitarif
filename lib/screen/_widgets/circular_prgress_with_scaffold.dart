import 'package:flutter/material.dart';

import 'secondary_color_circular_progress.dart';

class ScaffoldCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: SecondaryColorCircularProgress(),
    ));
  }
}
