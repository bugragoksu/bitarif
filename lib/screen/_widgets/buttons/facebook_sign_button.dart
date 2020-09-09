import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/button/social_login_button.dart';
import '../../../core/constants/app/app_constants.dart';

class FacebookSignButton extends StatefulWidget {
  final Function() onCompleted;

  const FacebookSignButton({Key key, @required this.onCompleted})
      : super(key: key);
  @override
  _FacebookSignButtontate createState() => _FacebookSignButtontate();
}

class _FacebookSignButtontate extends BaseState<FacebookSignButton> {
  @override
  Widget build(BuildContext context) {
    return SocialLoginButton(
      path: ApplicationConstants.FACEBOOK_LOGO,
      onTap: () {},
    );
  }
}
