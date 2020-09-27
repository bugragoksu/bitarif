import 'package:bitarif/core/init/firebase/firebase_manager.dart';
import 'package:bitarif/screen/_widgets/texts/body_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/card/stack_image_card.dart';
import '../../../../core/components/column/low_padding_column.dart';
import '../../../../core/components/img/circle_img.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/components/text/no_items_text.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../../../_widgets/card/categorie_recipe_card.dart';
import '../../../_widgets/secondary_color_circular_progress.dart';
import '../../../_widgets/tabs/custom_tab.dart';
import '../../../authenticate/auth/model/bitarif_user.dart';
import '../viewmodel/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  final BitarifUser user;
  const ProfileView({Key key, @required this.user}) : super(key: key);
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView>
    with SingleTickerProviderStateMixin {
  ProfileViewModel viewModel;
  TabController controller;

  @override
  void initState() {
    controller = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        viewModel = model;
        await viewModel.getRecipeList(
            token: widget.user.token, firebaseId: widget.user.firebaseId);
        await viewModel.getFollowList(
            token: widget.user.token, firebaseId: widget.user.firebaseId);
      },
      onPageBuilder: (BuildContext context, ProfileViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => SafeArea(
          child: DefaultTabController(
        length: 2,
        child: Observer(
            builder: (BuildContext context) =>
                Scaffold(appBar: _buildAppBar, body: _buildBody)),
      ));

  Widget get _buildAppBar => AppBar(
      elevation: 0,
      flexibleSpace: Container(
        padding: context.paddingNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StackImageCard(
              height: context.height / 4.5,
              width: context.width / 3,
              isNetwork: true,
              path: widget.user.profilePic,
              child: null,
            ),
            _buildInfoColumn
          ],
        ),
      ),
      backgroundColor: context.theme.colorScheme.background,
      bottom: _buildTabBar);

  PreferredSize get _buildTabBar => PreferredSize(
      preferredSize: Size.fromHeight(context.height / 3),
      child: CustomTab(
        controller: controller,
        onChanged: (int index) {
          setState(() {
            controller.animateTo(index);
          });
        },
      ));

  Widget get _buildInfoColumn => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
              icon: Icon(FeatherIcons.settings),
              onPressed: () async {
                await FirebaseManager.instance.signOut();
                Phoenix.rebirth(context);
              }),
          context.lowValue.toHeightSizedBox,
          Text(widget.user.name,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold)),
          context.lowValue.toHeightSizedBox,
          Text(widget.user.email),
          context.mediumValue.toHeightSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(viewModel.recipeList.length.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  LocaleText(value: "recipes"),
                ],
              ),
              context.mediumValue.toWidthSizedBox,
              Column(
                children: [
                  Text(widget.user.follower.length.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  LocaleText(value: "followers"),
                ],
              )
            ],
          )
        ],
      );
  Widget get _buildBody => TabBarView(
        controller: controller,
        children: [_buildRecipeGridTab, _buildFollowersTab],
      );

  Widget get _buildRecipeGridTab => viewModel.isLoading
      ? Center(child: SecondaryColorCircularProgress())
      : LowPaddingColumn(
          children: [
            BodyTitleText(
              icon: FeatherIcons.plusCircle,
              text: "myRecipes",
              haveIcon: true,
              onPressed: () {
                NavigationManager.instance
                    .navigateToPage(path: NavigationConstants.NEW_RECIPE);
              },
            ),
            context.lowValue.toHeightSizedBox,
            viewModel.recipeList.length == 0
                ? NoItemsText()
                : _buildRecipeGridView,
          ],
        );

  Expanded get _buildRecipeGridView => Expanded(
        child: GridView.builder(
            itemCount: viewModel.recipeList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: context.normalValue,
                mainAxisSpacing: context.normalValue),
            itemBuilder: (BuildContext context, int index) =>
                CategorieRecipeCard(
                    onPressed: () {
                      NavigationManager.instance.navigateToPage(
                          path: NavigationConstants.RECIPE_DETAIL,
                          data: viewModel.recipeList[index]);
                    },
                    path: viewModel.recipeList[index].imageUrl,
                    category: viewModel.recipeList[index].category[0].name)),
      );

  Widget get _buildFollowersTab => LowPaddingColumn(children: [
        Expanded(
          child: Column(
            children: [
              context.lowValue.toHeightSizedBox,
              BodyTitleText(
                text: "follows",
                haveIcon: false,
              ),
              context.lowValue.toHeightSizedBox,
              _buildUserList(isFollower: false)
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              context.lowValue.toHeightSizedBox,
              BodyTitleText(
                text: "followers",
                haveIcon: false,
              ),
              context.lowValue.toHeightSizedBox,
              _buildUserList(isFollower: true)
            ],
          ),
        ),
      ]);

  Widget _buildUserList({bool isFollower}) => widget.user.follower.length == 0
      ? NoItemsText()
      : Expanded(
          child: ListView.builder(
            itemCount: isFollower
                ? widget.user.follower.length
                : viewModel.followList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Padding(
              padding: context.paddingLow,
              child: CircleImage(
                  onTap: () {},
                  isNetwork: true,
                  path: isFollower
                      ? widget.user.follower[index].profilePic
                      : viewModel.followList[index].profilePic),
            ),
          ),
        );
}
