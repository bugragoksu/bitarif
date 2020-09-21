import 'package:flutter/material.dart';

import '../../../core/components/button/sign_button.dart';
import '../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../../core/init/firebase/firebase_manager.dart';
import '../../../core/init/firebase/model/firebase_response.dart';
import '../../../core/utils/widget_utils.dart';
import '../../authenticate/auth/model/bitarif_user.dart';
import '../../authenticate/login/viewmodel/login_view_model.dart';

class LoginButton extends StatefulWidget {
  final Function(FirebaseResponse response, BitarifUser user) onCompleted;
  final String email, password;
  final LoginViewModel viewModel;

  const LoginButton(
      {Key key,
      @required this.onCompleted,
      @required this.email,
      @required this.password,
      this.viewModel})
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
        changeLoading();
        if (widget.email.isNotNulAndNotEmpty &&
            widget.password.isNotNulAndNotEmpty) {
          response = await FirebaseManager.instance.signInWithEmailAndPassword(
              email: widget.email.trim(), password: widget.password.trim());
          if (response.success) {
            final result = await widget.viewModel.loginToDatabase(
                email: widget.email.trim(),
                password: widget.password.trim().toSha256);
            if (result.data is BitarifUser) {
              LocaleManager.instance.setStringValue(
                  PreferencesKeys.PASSWORD, widget.password.trim().toSha256);
              LocaleManager.instance
                  .setStringValue(PreferencesKeys.EMAIL, widget.email.trim());
              widget.onCompleted(response, result.data);
            } else {
              this.context.showSnackBar(WidgetUtils.instance
                  .buildSnackBar(context, "somethingWentWrong"));
              response.success = false;
              widget.onCompleted(response, null);
            }
          } else {
            context.showSnackBar(WidgetUtils.instance
                .buildSnackBar(context, response.getErrorMessage()));
            response.success = false;
            widget.onCompleted(response, null);
          }
        } else {
          context.showSnackBar(
              WidgetUtils.instance.buildSnackBar(context, "pleaseEnterFields"));
          response.success = false;
          widget.onCompleted(response, null);
        }
        changeLoading();
      },
      title: "login",
    );
  }

  changeLoading() => setState(() {
        isLoading = !isLoading;
      });
}
