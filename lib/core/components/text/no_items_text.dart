import 'package:flutter/material.dart';

import 'locale_text.dart';

class NoItemsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: LocaleText(value: 'noItemsFound'));
  }
}