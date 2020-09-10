import 'package:flutter/material.dart';

import '../../../core/components/button/sign_button.dart';

class RegisterButton extends StatefulWidget {
  final Function(String errorMessage) onCompleted;

  const RegisterButton({Key key, @required this.onCompleted}) : super(key: key);
  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SignButton(
      isLoading: isLoading,
      onPressed: () {},
      title: "register",
    );
  }
}
