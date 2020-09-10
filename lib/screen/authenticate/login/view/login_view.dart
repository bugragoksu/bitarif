import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/column/body_column.dart';
import '../../../../core/components/text/link_text.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../_widgets/buttons/facebook_sign_button.dart';
import '../../../_widgets/buttons/forgot_password_button.dart';
import '../../../_widgets/buttons/google_sign_button.dart';
import '../../../_widgets/buttons/login_button.dart';
import '../../../_widgets/fields/auth_text_field.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatefulWidget {
  final VoidCallback goToRegister;

  const LoginView({Key key, @required this.goToRegister}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel loginViewModel;

  TextEditingController emailController, passwordController;

  GlobalKey _formKey;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          loginViewModel = model;
          emailController = TextEditingController();
          passwordController = TextEditingController();
          _formKey = GlobalKey<FormState>();
        },
        onPageBuilder: (BuildContext context, LoginViewModel value) {
          return SafeArea(
            child: Container(
                height: double.infinity,
                child: SingleChildScrollView(child: buildBodyColumn(context))),
          );
        });
  }

  Widget buildBodyColumn(BuildContext context) {
    return BodyColumn(
      children: [
        LocaleText(
          value: 'signIn',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: context.mediumValue,
        ),
        buildForm,
        ForgotPasswordButton(),
        LoginButton(
          onCompleted: (String errorMessage) {},
        ),
        _buildSignInWithText,
        _buildSocialBtnRow,
        _buildSignupBtn,
        SizedBox(
          height: context.mediumValue,
        ),
        _buildTermsText
      ],
    );
  }

  Form get buildForm => Form(
      key: _formKey,
      child: Column(
        children: [
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

  Widget get _buildSignInWithText => Column(
        children: <Widget>[
          SizedBox(height: context.lowValue),
          LocaleText(
            value: 'or',
          ),
          SizedBox(height: context.lowValue),
          LocaleText(
            value: 'signInWith',
          ),
        ],
      );

  Widget get _buildSocialBtnRow => Padding(
        padding: EdgeInsets.symmetric(vertical: context.mediumValue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GoogleSignButton(
              onCompleted: () {},
            ),
            FacebookSignButton(
              onCompleted: () {},
            )
          ],
        ),
      );

  Widget get _buildSignupBtn => GestureDetector(
        onTap: () => widget.goToRegister(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LocaleText(
              value: "dontHaveAccount",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            LocaleText(
              value: 'signUp',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget get _buildTermsText => Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
            child: Column(children: <Widget>[
          LocaleText(value: "agreeTo"),
          LinkText(
            url: "https://humabreath.com/tos.html",
            title: "terms",
          ),
          LocaleText(value: "and"),
          LinkText(
            url: "https://humabreath.com/privacy.html",
            title: "privacy",
          ),
        ])),
      );
}
