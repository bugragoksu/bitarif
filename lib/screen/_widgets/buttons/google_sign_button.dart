import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/button/social_login_button.dart';
import '../../../core/constants/app/app_constants.dart';

class GoogleSignButton extends StatefulWidget {
  final Function() onCompleted;

  const GoogleSignButton({Key key, @required this.onCompleted})
      : super(key: key);
  @override
  _GoogleSignButtonState createState() => _GoogleSignButtonState();
}

class _GoogleSignButtonState extends BaseState<GoogleSignButton> {
  @override
  Widget build(BuildContext context) {
    return SocialLoginButton(
      path: ApplicationConstants.GOOGLE_LOGO,
      onTap: () {},
    );
  }
}
