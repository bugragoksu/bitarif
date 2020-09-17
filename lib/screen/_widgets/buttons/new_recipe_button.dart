import 'package:bitarif/core/base/state/base_state.dart';
import 'package:bitarif/core/components/button/sign_button.dart';
import 'package:flutter/material.dart';

class NewRecipeButton extends StatefulWidget {
  final Function(String errorMessage) onCompleted;

  const NewRecipeButton({Key key, this.onCompleted}) : super(key: key);
  @override
  _NewRecipeButtonState createState() => _NewRecipeButtonState();
}

class _NewRecipeButtonState extends BaseState<NewRecipeButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SignButton(
      isLoading: isLoading,
      onPressed: () async {
        changeLoading();
        await Future.delayed(Duration(seconds: 2));
        changeLoading();
        widget.onCompleted("");
      },
      title: "send",
    );
  }

  changeLoading() => setState(() {
        isLoading = !isLoading;
      });
}
