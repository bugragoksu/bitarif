import 'package:flutter/material.dart';

import '../../../core/components/text/locale_text.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/double_extension.dart';

class ClickableIconText extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const ClickableIconText(
      {Key key,
      @required this.text,
      @required this.icon,
      @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          LocaleText(
              value: text,
              style: TextStyle(
                  color: context.theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold)),
          context.lowValue.toWidthSizedBox,
          Icon(
            icon,
            color: context.theme.colorScheme.secondary,
          )
        ],
      ),
    );
  }
}
