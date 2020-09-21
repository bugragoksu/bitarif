import 'package:bitarif/core/constants/enums/preferences_keys_enum.dart';
import 'package:bitarif/core/init/cache/locale_manager.dart';
import 'package:bitarif/screen/authenticate/auth/model/bitarif_user.dart';
import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/button/sign_button.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/firebase/firebase_manager.dart';
import '../../../core/init/firebase/model/firebase_response.dart';
import '../../../core/utils/widget_utils.dart';
import '../../authenticate/register/viewmodel/register_view_model.dart';

class RegisterButton extends StatefulWidget {
  final Function(FirebaseResponse result) onCompleted;
  final String email, password, name;
  final RegisterViewModel viewModel;
  const RegisterButton(
      {Key key,
      @required this.onCompleted,
      @required this.email,
      @required this.password,
      @required this.viewModel,
      @required this.name})
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
            widget.password.isNotNulAndNotEmpty &&
            widget.name.isNotNulAndNotEmpty) {
          changeLoading();
          response = await FirebaseManager.instance
              .registerWithEmailAndPassword(
                  email: widget.email.trim(), password: widget.password.trim());
          changeLoading();
          if (response.success) {
            //register to db
            final result = await widget.viewModel.registerToDatabase(
                name: widget.name.trim(),
                firebaseId: response.firebaseUser.uid,
                email: widget.email.trim(),
                password: widget.password.trim().toSha256);
            if (result.data is BitarifUser) {
              //success
              print(result.data.firebaseId);
              LocaleManager.instance.setStringValue(
                  PreferencesKeys.PASSWORD, widget.password.trim().toSha256);
              LocaleManager.instance
                  .setStringValue(PreferencesKeys.EMAIL, widget.email.trim());
            } else {
              this.context.showSnackBar(WidgetUtils.instance
                  .buildSnackBar(context, "somethingWentWrong"));
            }
          } else {
            context.showSnackBar(WidgetUtils.instance
                .buildSnackBar(context, response.getErrorMessage()));
          }
        } else {
          context.showSnackBar(
              WidgetUtils.instance.buildSnackBar(context, "pleaseEnterFields"));
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
