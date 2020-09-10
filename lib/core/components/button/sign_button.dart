import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../circular_progress.dart';
import '../text/locale_text.dart';

class SignButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  final String title;

  const SignButton(
      {Key key,
      @required this.isLoading,
      @required this.onPressed,
      @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.transparent,
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5.0,
        onPressed: this.onPressed,
        child: Container(
          width: context.width / 2,
          height: context.mediumPlusValue,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.theme.colorScheme.secondary,
                  context.theme.colorScheme.secondaryVariant,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          alignment: Alignment.center,
          child: isLoading
              ? Padding(
                  padding: context.paddingLow,
                  child: ColoredCircularProgress(
                    color: context.theme.colorScheme.background,
                  ),
                )
              : LocaleText(
                  value: title,
                  style: TextStyle(
                    color: Colors.white,
                  )),
        ));
  }
}
