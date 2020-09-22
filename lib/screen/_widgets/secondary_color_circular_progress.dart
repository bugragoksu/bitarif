import 'package:bitarif/core/components/circular_progress.dart';
import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SecondaryColorCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredCircularProgress(
      color: context.theme.colorScheme.secondary,
    );
  }
}
