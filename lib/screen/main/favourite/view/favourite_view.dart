import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/card/stack_image_card.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../viewmodel/favourite_view_model.dart';

class FavouriteView extends StatefulWidget {
  FavouriteView({Key key}) : super(key: key);
  @override
  _FavouriteViewState createState() => _FavouriteViewState();
}

class _FavouriteViewState extends BaseState<FavouriteView>
    with TickerProviderStateMixin {
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return BaseView<FavouriteViewModel>(
      viewModel: FavouriteViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        tabController = TabController(
          length: 2,
          vsync: this,
        );
      },
      onPageBuilder: (BuildContext context, FavouriteViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => SafeArea(
        child: Scaffold(appBar: _buildAppBar, body: _buildBody),
      );
  Widget get _buildAppBar => AppBar(
      flexibleSpace: Container(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.lowValue.toHeightSizedBox,
            LocaleText(
                value: "favList",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.mediumValue)),
          ],
        ),
      ),
      backgroundColor: context.theme.colorScheme.background,
      bottom: TabBar(
        controller: tabController,
        labelColor: context.theme.colorScheme.primary,
        unselectedLabelColor: context.theme.colorScheme.primary,
        indicatorColor: context.theme.colorScheme.secondary,
        tabs: [
          Tab(text: "recipes".locale),
          Tab(
            text: "inspirations".locale,
          )
        ],
      ));
  Widget get _buildBody => TabBarView(
        controller: tabController,
        children: [
          Padding(
            padding: context.paddingNormal,
            child: _buildRecipeList,
          ),
          Padding(
            padding: context.paddingNormal,
            child: _buildRecipeList,
          )
        ],
      );
  ListView get _buildRecipeList => ListView.builder(
        shrinkWrap: true,
        itemExtent: context.height / 10,
        itemCount: 6,
        itemBuilder: (_, index) => Column(
          children: [
            _buildRecipeTile(
                onTap: () {},
                title: 'Coconut Curry $index',
                url:
                    "https://shemins.scdn2.secure.raxcdn.com/wp-content/uploads/2018/02/Shemins-Lucknowi-Biryani.jpg"),
            Divider()
          ],
        ),
      );
  Widget _buildRecipeTile({String title, String url, VoidCallback onTap}) =>
      ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.all(0),
        trailing: IconButton(
          icon: Icon(FeatherIcons.arrowRight),
          onPressed: onTap,
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        leading: StackImageCard(
          width: context.width / 6,
          isNetwork: true,
          path: url,
          child: null,
        ),
      );
}
