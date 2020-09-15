import 'package:flutter/material.dart';

import '../../core/components/gradient_divider.dart';
import '../../core/init/theme/app_theme_light.dart';

class ColoredGradientDivider extends StatelessWidget {
  final List<Color> colors = [
    AppThemeLight.instance.theme.colorScheme.secondary,
    AppThemeLight.instance.theme.colorScheme.secondaryVariant,
  ];
  @override
  Widget build(BuildContext context) {
    return GradientDivider(
      colors: colors,
    );
  }
}
