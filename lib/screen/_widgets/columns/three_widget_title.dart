import 'package:flutter/material.dart';

import '../../../core/components/text/locale_text.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/double_extension.dart';
import '../colored_gradient_divider.dart';

class ThreeWidgetTitle extends StatelessWidget {
  final String title;

  const ThreeWidgetTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: LocaleText(
                  value: "back",
                  style: TextStyle(
                      fontSize: context.normalValue * 1.25,
                      color: context.theme.colorScheme.secondary)),
            ),
            LocaleText(
                value: title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.normalValue * 1.5,
                    color: context.theme.colorScheme.primary)),
            LocaleText(
                value: "done",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.background))
          ],
        ),
        context.lowValue.toHeightSizedBox,
        ColoredGradientDivider(),
        context.normalValue.toHeightSizedBox,
      ],
    );
  }
}
