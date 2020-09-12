import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/card/stack_image_card.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
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
              height: context.height / 5,
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
      preferredSize: Size.fromHeight(context.height / 4),
      child: CustomTab(
        controller: controller,
        onChanged: (int index) {
          setState(() {
            controller.animateTo(index);
          });
        },
      ));

  Widget get _buildBody => TabBarView(
        controller: controller,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.yellow)
        ],
      );

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
}
