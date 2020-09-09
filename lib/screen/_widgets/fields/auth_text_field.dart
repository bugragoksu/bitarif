import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isObsureText;
  final String labelText;
  final String Function(String) validator;
  final IconData icon;

  const AuthTextField(
      {Key key,
      @required this.controller,
      @required this.isObsureText,
      @required this.labelText,
      this.validator,
      this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          height: context.highValue,
          child: Theme(
            data: ThemeData(
                hintColor: context.theme.colorScheme.primary,
                primaryColor: context.theme.colorScheme.primary),
            child: TextFormField(
              obscureText: isObsureText,
              controller: controller,
              cursorColor: context.theme.colorScheme.primary,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                ),
                hintStyle: TextStyle(color: Colors.green),
                labelStyle: TextStyle(color: context.theme.colorScheme.primary),
                labelText: labelText.locale,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(),
                ),
              ),
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
