import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/button/sign_button.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/firebase/firebase_manager.dart';
import '../../../core/init/firebase/model/firebase_response.dart';
import '../../../core/utils/widget_utils.dart';

class RegisterButton extends StatefulWidget {
  final Function(FirebaseResponse result) onCompleted;
  final String email, password;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const RegisterButton(
      {Key key,
      @required this.onCompleted,
      @required this.email,
      @required this.password,
      this.scaffoldKey})
      : super(key: key);
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends BaseState<RegisterButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SignButton(
      isLoading: isLoading,
      onPressed: () async {
        FirebaseResponse response = FirebaseResponse();
        if (widget.email.isNotNulAndNotEmpty &&
            widget.password.isNotNulAndNotEmpty) {
          changeLoading();
          response = await FirebaseManager.instance
              .registerWithEmailAndPassword(
                  email: widget.email.trim(), password: widget.password.trim());
          changeLoading();
          if (!response.success) {
            context.showSnackBar(WidgetUtils.instance
                .buildSnackBar(context, response.getErrorMessage()));
          }
        } else {
          String message;
          if (!widget.email.isNotNulAndNotEmpty) {
            message = "pleaseEnterEmail";
          }
          if (!widget.password.isNotNulAndNotEmpty) {
            message = "pleaseEnterPassword";
          }
          if (!widget.password.isNotNulAndNotEmpty &&
              !widget.email.isNotNulAndNotEmpty) {
            message = "pleaseEnterEmailPassword";
          }
          context.showSnackBar(
              WidgetUtils.instance.buildSnackBar(context, message));
          response.success = false;
        }
        widget.onCompleted(response);
      },
      title: "register",
    );
  }

  changeLoading() => setState(() {
        isLoading = !isLoading;
      });
}
