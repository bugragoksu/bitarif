import 'package:bitarif/core/components/text/locale_text.dart';
import 'package:flutter/material.dart';

class BodyTitleText extends StatelessWidget {
  final String text;

  const BodyTitleText({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LocaleText(
        value: text, style: TextStyle(fontWeight: FontWeight.bold));
  }
}
