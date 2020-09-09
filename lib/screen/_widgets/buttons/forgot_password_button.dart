import 'package:flutter/material.dart';

import '../../../core/components/text/locale_text.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: LocaleText(
          value: 'forgotPassword',
        ),
      ),
    );
  }
}
