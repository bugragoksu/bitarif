import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/column/body_column.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../_widgets/buttons/register_button.dart';
import '../../../_widgets/fields/auth_text_field.dart';
import '../viewmodel/register_view_model.dart';

class RegisterView extends StatefulWidget {
  final VoidCallback goToLogin;

  const RegisterView({Key key, @required this.goToLogin}) : super(key: key);
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView> {
  RegisterViewModel registerViewModel;
  GlobalKey _formKey;
  TextEditingController nameController, emailController, passwordController;

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        registerViewModel = model;
        nameController = TextEditingController();
        emailController = TextEditingController();
        passwordController = TextEditingController();
      },
      onPageBuilder: (BuildContext context, RegisterViewModel value) =>
          buildScaffold,
    );
  }

  Widget get buildScaffold => SafeArea(
        child: Container(
            height: double.infinity,
            child: SingleChildScrollView(child: buildBodyColumn)),
      );

  Widget get buildBodyColumn => BodyColumn(
        children: [
          LocaleText(
            value: 'signUp',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          _buildForm,
          SizedBox(
            height: context.mediumValue,
          ),
          RegisterButton(
            onCompleted: (String errorMessage) {},
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          _buildSignInBtn
        ],
      );

  Form get _buildForm => Form(
      key: _formKey,
      child: Column(
        children: [
          AuthTextField(
            isObsureText: false,
            labelText: "name",
            controller: nameController,
            icon: Icons.info,
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          AuthTextField(
            isObsureText: false,
            labelText: "email",
            controller: emailController,
            icon: Icons.email,
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          AuthTextField(
            isObsureText: true,
            labelText: "password",
            controller: passwordController,
            icon: Icons.lock,
          ),
        ],
      ));

  Widget get _buildSignInBtn => GestureDetector(
        onTap: () => widget.goToLogin(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocaleText(
              value: "haveAccount",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            LocaleText(
              value: 'signIn',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}
