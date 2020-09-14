import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/card/stack_image_card.dart';
import '../../../../core/components/column/low_padding_column.dart';
import '../../../../core/components/img/circle_img.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../_widgets/card/categorie_recipe_card.dart';
import '../../../_widgets/tabs/custom_tab.dart';
import '../viewmodel/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key key}) : super(key: key);
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
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, ProfileViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => SafeArea(
        child: DefaultTabController(
            length: 2, child: Scaffold(appBar: _buildAppBar, body: _buildBody)),
      );

  Widget get _buildAppBar => AppBar(
      flexibleSpace: Container(
        padding: context.paddingNormal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StackImageCard(
              height: context.height / 4.5,
              width: context.width / 3,
              isNetwork: true,
              path:
                  "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
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
          IconButton(icon: Icon(FeatherIcons.settings), onPressed: () {}),
          context.lowValue.toHeightSizedBox,
          Text("Buğra Göksu",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold)),
          context.lowValue.toHeightSizedBox,
          Text("bugragoksu2@gmail.com"),
          context.mediumValue.toHeightSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("17", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Books"),
                ],
              ),
              context.mediumValue.toWidthSizedBox,
              Column(
                children: [
                  Text("73", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Recipes"),
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

  Widget get _buildRecipeGridTab => LowPaddingColumn(
        children: [
          context.lowValue.toHeightSizedBox,
          _buildRecipeTitleRow(
              title: "My cookbooks",
              icon: FeatherIcons.plusCircle,
              onPressed: () {}),
          context.lowValue.toHeightSizedBox,
          _buildRecipeGridView,
        ],
      );

  Expanded get _buildRecipeGridView => Expanded(
        child: GridView.builder(
            itemCount: 5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: context.normalValue,
                mainAxisSpacing: context.normalValue),
            itemBuilder: (BuildContext context, int index) =>
                CategorieRecipeCard(
                  path:
                      "https://static01.nyt.com/images/2020/02/10/dining/onepot-cheesypasta/onepot-cheesypasta-articleLarge.jpg",
                )),
      );

  Row _buildRecipeTitleRow(
          {String title, IconData icon, VoidCallback onPressed}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocaleText(
              value: title, style: TextStyle(fontWeight: FontWeight.bold)),
          IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
            color: context.theme.colorScheme.secondaryVariant,
          )
        ],
      );

  Widget get _buildFollowersTab => LowPaddingColumn(children: [
        Expanded(
          child: Column(
            children: [
              context.lowValue.toHeightSizedBox,
              _buildRecipeTitleRow(
                  title: "Follows",
                  icon: FeatherIcons.arrowRightCircle,
                  onPressed: () {}),
              context.lowValue.toHeightSizedBox,
              _buildUserList()
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              context.lowValue.toHeightSizedBox,
              _buildRecipeTitleRow(
                  title: "Followers",
                  icon: FeatherIcons.arrowRightCircle,
                  onPressed: () {}),
              context.lowValue.toHeightSizedBox,
              _buildUserList()
            ],
          ),
        ),
      ]);

  Widget _buildUserList() => Expanded(
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Padding(
            padding: context.paddingLow,
            child: CircleImage(
              onTap: () {
                print("hell");
              },
              isNetwork: true,
              path:
                  "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            ),
          ),
        ),
      );
}
