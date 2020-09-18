import 'package:bitarif/core/components/text/locale_text.dart';
import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:bitarif/core/extensions/double_extension.dart';
import 'package:flutter/material.dart';

class TitleWidgetColumn extends StatelessWidget {
  final String title;
  final Widget widget;

  const TitleWidgetColumn(
      {Key key, @required this.title, @required this.widget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocaleText(
            value: title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: context.normalValue * 1.25)),
        context.normalValue.toHeightSizedBox,
        widget
      ],
    );
  }
}
