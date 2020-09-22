import 'package:bitarif/screen/authenticate/auth/model/bitarif_user.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/splah_view_model.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  SplashViewModel splashViewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        splashViewModel = model;
        final result = await splashViewModel.initLogin();
        if (result.data is BitarifUser) {
          NavigationManager.instance.navigateToPageClear(
              path: NavigationConstants.MAIN_VIEW, data: result.data);
        } else {
          NavigationManager.instance
              .navigateToPageClear(path: NavigationConstants.AUTH_VIEW);
        }
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => SafeArea(
        child: Scaffold(
          body: _buildBody,
        ),
      );

  Widget get _buildBody => Container(
      height: double.infinity,
      padding: context.paddingMedium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(ApplicationConstants.LOGO_YAZI)],
      ));
}
