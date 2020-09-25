import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/base/widget/base_widget.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../../../_widgets/circular_prgress_with_scaffold.dart';
import '../../../_widgets/colored_gradient_divider.dart';
import '../../../_widgets/container/animated_blog_card.dart';
import '../../../_widgets/container/animated_recipe_card.dart';
import '../../../_widgets/texts/body_title_text.dart';
import '../../../authenticate/auth/model/bitarif_user.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  final VoidCallback changeLanguageOnPressed;
  final BitarifUser user;
  const HomeView(
      {Key key, @required this.user, @required this.changeLanguageOnPressed})
      : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        viewModel = model;

        await viewModel.getBlogPosts(token: widget.user.token);
        await viewModel.getRecipeList(token: widget.user.token);
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => Observer(
      builder: (_) => !viewModel.isLoading
          ? BaseWidget(children: _buildBodyChildrend)
          : ScaffoldCircularProgress());

  List<Widget> get _buildBodyChildrend => [
        _buildTitle,
        context.lowValue.toHeightSizedBox,
        ColoredGradientDivider(),
        context.normalValue.toHeightSizedBox,
        BodyTitleText(
          text: "getInspired",
          haveIcon: false,
        ),
        context.lowValue.toHeightSizedBox,
        AnimatedBlogCard(
          blog: viewModel.blogList[0],
        ),
        context.mediumValue.toHeightSizedBox,
        ..._buildLatestRecipeSection
      ];

  Widget get _buildTitle => Row(children: [
        LocaleText(
          value: 'welcome',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.normalValue * 1.25,
              color: context.theme.colorScheme.primaryVariant),
        ),
        SizedBox(
          width: context.normalValue,
        ),
        Text(
          widget.user.name,
          style: TextStyle(
              fontSize: context.normalValue * 1.25,
              color: context.theme.colorScheme.primary),
        ),
        Spacer(),
        IconButton(
          color: context.theme.colorScheme.primary,
          icon: Icon(FeatherIcons.globe),
          onPressed: widget.changeLanguageOnPressed,
        )
      ]);

  List<Widget> get _buildLatestRecipeSection => [
        BodyTitleText(
            text: "latestRecipes",
            haveIcon: true,
            onPressed: () {
              NavigationManager.instance.navigateToPage(
                  path: NavigationConstants.RECIPE_LIST_VIEW,
                  data: {"search": "", "title": "allRecipes"});
            }),
        Container(
          height: context.height / 3,
          width: context.width,
          child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => AnimatedRecipeCard(
              recipe: viewModel.recipeList[index],
            ),
          ),
        ),
      ];
}
