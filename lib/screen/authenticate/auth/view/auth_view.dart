import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/int_extensions.dart';
import '../../login/view/login_view.dart';
import '../viewmodel/auth_view_model.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends BaseState<AuthView> {
  PageController _controller;
  AuthViewModel authViewModel;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      viewModel: AuthViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        authViewModel = model;
      },
      onPageBuilder: (BuildContext context, AuthViewModel value) =>
          buildScaffold,
    );
  }

  Scaffold get buildScaffold => Scaffold(
      body: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              authViewModel.changePage(value);
            });
          },
          itemCount: 2,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildPage));

  Widget get buildPage => authViewModel.currentPageIndex == 0
      ? LoginView()
      : Container(
          color: Colors.red,
        );

  void goToLogin() => setState(() {
        authViewModel.changePage(0);
      });

  void goToRegister() => setState(() {
        authViewModel.changePage(1);
      });
}