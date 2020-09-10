import 'package:flutter/material.dart';

import '../../../core/components/button/sign_button.dart';

class LoginButton extends StatefulWidget {
  final Function(String errorMessage) onCompleted;

  const LoginButton({Key key, @required this.onCompleted}) : super(key: key);
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SignButton(
      isLoading: isLoading,
      onPressed: () {},
      title: "login",
    );
  }
}
