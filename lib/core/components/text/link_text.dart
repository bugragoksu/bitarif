import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'locale_text.dart';

class LinkText extends StatelessWidget {
  final String url;
  final String title;

  const LinkText({Key key, @required this.url, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch(url);
      },
      child: LocaleText(
          value: title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline)),
    );
  }
}
