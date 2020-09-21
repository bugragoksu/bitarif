import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:bitarif/core/extensions/string_extension.dart';
import 'package:bitarif/core/utils/widget_utils.dart';

import '../../../core/init/firebase/firebase_manager.dart';
import '../../../core/init/firebase/model/firebase_response.dart';
import 'package:flutter/material.dart';

import '../../../core/components/button/sign_button.dart';

class LoginButton extends StatefulWidget {
  final Function(FirebaseResponse response) onCompleted;
  final String email, password;

  const LoginButton(
      {Key key,
      @required this.onCompleted,
      @required this.email,
      @required this.password})
      : super(key: key);
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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
          response = await FirebaseManager.instance.signInWithEmailAndPassword(
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
      title: "login",
    );
  }

  changeLoading() => setState(() {
        isLoading = !isLoading;
      });
}
