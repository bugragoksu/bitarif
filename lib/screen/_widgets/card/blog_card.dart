import 'package:bitarif/core/components/card/stack_image_card.dart';
import 'package:bitarif/core/components/text/locale_text.dart';
import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String desc;
  final String path;

  const BlogCard(
      {Key key, @required this.title, @required this.desc, @required this.path})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StackImageCard(
      isNetwork: true,
      path: path,
      child: Positioned(
        left: context.lowValue,
        bottom: context.lowValue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocaleText(
              value: title,
              style: TextStyle(
                  color: context.theme.colorScheme.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            LocaleText(
              value: desc,
              style: TextStyle(color: context.theme.colorScheme.background),
            )
          ],
        ),
      ),
    );
  }
}
