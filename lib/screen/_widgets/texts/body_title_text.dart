import 'package:bitarif/core/components/text/locale_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class BodyTitleText extends StatelessWidget {
  final String text;
  final bool haveIcon;
  final IconData icon;
  final VoidCallback onPressed;

  const BodyTitleText(
      {Key key, this.text, @required this.haveIcon, this.onPressed, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LocaleText(value: text, style: TextStyle(fontWeight: FontWeight.bold)),
        haveIcon
            ? IconButton(
                icon: Icon(icon ?? FeatherIcons.chevronRight),
                onPressed: onPressed,
              )
            : Container()
      ],
    );
  }
}
