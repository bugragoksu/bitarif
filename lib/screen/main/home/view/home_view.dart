import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/base/widget/base_widget.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../../../_widgets/colored_gradient_divider.dart';
import '../../../_widgets/container/animated_blog_card.dart';
import '../../../_widgets/container/animated_recipe_card.dart';
import '../../../_widgets/texts/body_title_text.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => BaseWidget(
        children: [
          _buildTitle,
          context.lowValue.toHeightSizedBox,
          ColoredGradientDivider(),
          context.normalValue.toHeightSizedBox,
          BodyTitleText(
            text: "getInspired",
            haveIcon: false,
          ),
          context.lowValue.toHeightSizedBox,
          AnimatedBlogCard(),
          context.mediumValue.toHeightSizedBox,
          ..._buildLatestRecipeSection
        ],
      );

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
        LocaleText(
          value: 'Buğra',
          style: TextStyle(
              fontSize: context.normalValue * 1.25,
              color: context.theme.colorScheme.primary),
        ),
        Spacer(),
        IconButton(
          color: context.theme.colorScheme.primary,
          icon: Icon(FeatherIcons.globe),
          onPressed: () {
            context.locale = LanguageManager.instance.changeLocale();
          },
        )
      ]);

  List<Widget> get _buildLatestRecipeSection => [
        BodyTitleText(
            text: "latestRecipes",
            haveIcon: true,
            onPressed: () {
              NavigationManager.instance
                  .navigateToPage(path: NavigationConstants.RECIPE_LIST_VIEW);
            }),
        Container(
          height: context.height / 3,
          width: context.width,
          child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => AnimatedRecipeCard(),
          ),
        ),
      ];
  List<String> get urlList => [
        "https://shemins.scdn2.secure.raxcdn.com/wp-content/uploads/2018/02/Shemins-Lucknowi-Biryani.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSHFyfu99I-xpDA8ZZyeXL1KaixY1E9oEkVSQ&usqp=CAU",
        "https://img.delicious.com.au/bsUYtcs3/w759-h506-cfill/del/2019/02/zucchini-spaghetti-with-bolognese-101168-2.jpg",
        "https://www.dinneratthezoo.com/wp-content/uploads/2019/04/chicken-marinade-11.jpg"
      ];
}
