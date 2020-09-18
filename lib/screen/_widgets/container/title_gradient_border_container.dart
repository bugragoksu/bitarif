import 'package:bitarif/core/components/container/gradient_border_container.dart';
import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TitleGradientBorderContainer extends StatelessWidget {
  final String title;

  const TitleGradientBorderContainer({Key key, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GradientBorderContainer(
      gradientColors: [
        context.theme.colorScheme.secondary,
        context.theme.colorScheme.secondaryVariant
      ],
      child: Text(title),
    );
  }
}
