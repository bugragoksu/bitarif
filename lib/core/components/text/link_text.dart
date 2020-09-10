import 'package:bitarif/core/components/text/locale_text.dart';
import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String url;
  final String title;

  const LinkText({Key key, @required this.url, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(url);
      },
      child: LocaleText(
          value: title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline)),
    );
  }
}
