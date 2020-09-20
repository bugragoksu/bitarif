import 'package:flutter/material.dart';

import '../components/text/locale_text.dart';
import '../extensions/context_extension.dart';

class WidgetUtils {
  static WidgetUtils _instance;
  static WidgetUtils get instance {
    if (_instance == null) _instance = WidgetUtils._init();
    return _instance;
  }

  WidgetUtils._init();

  SnackBar buildSnackBar(BuildContext context, String message) => SnackBar(
      backgroundColor: context.theme.colorScheme.primary,
      content: LocaleText(
        value: message,
        style: TextStyle(color: context.theme.colorScheme.secondary),
      ));
}
