import 'package:bitarif/core/constants/navigation/navigation_constants.dart';
import 'package:bitarif/core/init/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/card/stack_image_card.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../_widgets/secondary_color_circular_progress.dart';
import '../viewmodel/favourite_view_model.dart';

class FavouriteView extends StatefulWidget {
  final String token;
  FavouriteView({Key key, @required this.token}) : super(key: key);
  @override
  _FavouriteViewState createState() => _FavouriteViewState();
}

class _FavouriteViewState extends BaseState<FavouriteView>
    with TickerProviderStateMixin {
  TabController tabController;
  FavouriteViewModel viewModel;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FavouriteViewModel>(
      viewModel: FavouriteViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        viewModel = model;
        await viewModel.fetchFavouriteRecipes(token: widget.token);
        await viewModel.fetchFavouriteBlogs(token: widget.token);
      },
      onPageBuilder: (BuildContext context, FavouriteViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => SafeArea(
        child: Scaffold(appBar: _buildAppBar, body: _buildBody),
      );
  Widget get _buildAppBar => AppBar(
      elevation: 0,
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
  Widget get _buildBody => Observer(
        builder: (BuildContext context) => viewModel.isLoading
            ? Center(
                child: SecondaryColorCircularProgress(),
              )
            : TabBarView(
                controller: tabController,
                children: [
                  Padding(
                    padding: context.paddingNormal,
                    child: viewModel.recipeList.isEmpty
                        ? Center(
                            child: LocaleText(
                            value: "noItemsFound",
                          ))
                        : _buildList(isRecipe: true),
                  ),
                  Padding(
                    padding: context.paddingNormal,
                    child: viewModel.blogList.isEmpty
                        ? Center(
                            child: LocaleText(
                            value: "noItemsFound",
                          ))
                        : _buildList(isRecipe: false),
                  )
                ],
              ),
      );
  ListView _buildList({bool isRecipe}) => ListView.builder(
        shrinkWrap: true,
        itemExtent: context.height / 10,
        itemCount:
            isRecipe ? viewModel.recipeList.length : viewModel.blogList.length,
        itemBuilder: (_, index) => Column(
          children: [
            _buildTile(
                onTap: () {
                  NavigationManager.instance.navigateToPage(
                      path: isRecipe
                          ? NavigationConstants.RECIPE_DETAIL
                          : NavigationConstants.BLOG_DETAIL,
                      data: isRecipe
                          ? viewModel.recipeList[index]
                          : viewModel.blogList[index]);
                },
                title: isRecipe
                    ? viewModel.recipeList[index].title
                    : viewModel.blogList[index].title,
                url: isRecipe
                    ? viewModel.recipeList[index].imageUrl
                    : viewModel.blogList[index].imageLink),
            Divider()
          ],
        ),
      );
  Widget _buildTile({String title, String url, VoidCallback onTap}) => ListTile(
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
