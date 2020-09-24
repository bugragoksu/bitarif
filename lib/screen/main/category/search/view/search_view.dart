import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/base/widget/base_widget.dart';
import '../../../../../core/components/text/locale_text.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/double_extension.dart';
import '../../../../../core/init/navigation/navigation_manager.dart';
import '../../../../_widgets/card/categorie_card.dart';
import '../../../../_widgets/circular_prgress_with_scaffold.dart';
import '../../../../_widgets/colored_gradient_divider.dart';
import '../../../../_widgets/rows/search_bar_row.dart';
import '../../../../_widgets/texts/clickable_icon_text.dart';
import '../viewmodel/search_view_model.dart';

class SearchView extends StatefulWidget {
  final String token;
  SearchView({Key key, @required this.token}) : super(key: key);
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends BaseState<SearchView> {
  SearchViewModel viewModel;
  TextEditingController _searchFieldController;

  @override
  void initState() {
    _searchFieldController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      viewModel: SearchViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        viewModel = model;
        await viewModel.getCategoryList(token: widget.token);
      },
      onPageBuilder: (BuildContext context, SearchViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => Observer(
      builder: (BuildContext context) => viewModel.isLoading
          ? ScaffoldCircularProgress()
          : BaseWidget(
              children: [
                ..._buildHeadLineSection,
                context.mediumValue.toHeightSizedBox,
                _buildCategories,
                context.mediumValue.toHeightSizedBox,
                ..._buildAllTextsSection,
              ],
            ));

  List<Widget> get _buildHeadLineSection => [
        LocaleText(
            value: "search",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: context.mediumValue)),
        context.lowValue.toHeightSizedBox,
        SearchBarRow(
          searchFieldController: _searchFieldController,
        ),
        context.lowValue.toHeightSizedBox,
        ColoredGradientDivider()
      ];

  Widget get _buildCategories => Container(
        child: GridView.count(
          controller: ScrollController(),
          childAspectRatio: (context.width / 3) / (context.height / 4.5),
          crossAxisCount: 3,
          shrinkWrap: true,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          scrollDirection: Axis.vertical,
          children: [..._buildItems],
        ),
      );

  List<Widget> get _buildItems => List.generate(
      9,
      (index) => CategorieCard(
            onPressed: () {
              NavigationManager.instance
                  .navigateToPage(path: NavigationConstants.RECIPE_LIST_VIEW);
            },
            title: viewModel.categoryList[index].name,
            url: viewModel.categoryList[index].imageUrl,
          ));

  List<Widget> get _buildAllTextsSection => [
        ClickableIconText(
          icon: FeatherIcons.chevronRight,
          onPressed: () {
            NavigationManager.instance.navigateToPage(
                path: NavigationConstants.CATEGORIES,
                data: viewModel.categoryList);
          },
          text: "allCategories",
        ),
        context.lowValue.toHeightSizedBox,
        ClickableIconText(
          icon: FeatherIcons.chevronRight,
          onPressed: () {
            NavigationManager.instance
                .navigateToPage(path: NavigationConstants.RECIPE_LIST_VIEW);
          },
          text: "allRecipes",
        ),
        context.lowValue.toHeightSizedBox,
        ClickableIconText(
          icon: FeatherIcons.chevronRight,
          onPressed: () {
            NavigationManager.instance
                .navigateToPage(path: NavigationConstants.INSPIRATIONS);
          },
          text: "allInspirations",
        )
      ];
}
