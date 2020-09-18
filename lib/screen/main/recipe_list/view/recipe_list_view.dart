import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/base/widget/base_widget.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../_widgets/columns/three_widget_title.dart';
import '../../../_widgets/container/animated_recipe_card.dart';
import '../../../_widgets/rows/search_bar_row.dart';
import '../viewmodel/recipe_list_view_model.dart';

class RecipeListView extends StatefulWidget {
  @override
  _RecipeListViewState createState() => _RecipeListViewState();
}

class _RecipeListViewState extends BaseState<RecipeListView> {
  TextEditingController _searchFieldController;
  RecipeListViewModel viewModel;

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
    return BaseView<RecipeListViewModel>(
        viewModel: RecipeListViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          viewModel = model;
        },
        onPageBuilder: (BuildContext context, RecipeListViewModel value) =>
            _buildScaffold);
  }

  Widget get _buildScaffold => BaseWidget(
        children: [
          ThreeWidgetTitle(
            isVisibleDoneText: false,
            title: "Breakfast",
          ),
          SearchBarRow(
            searchFieldController: _searchFieldController,
          ),
          context.normalValue.toHeightSizedBox,
          _buildRecipes
        ],
      );

  Widget get _buildRecipes => GridView.count(
        childAspectRatio: (context.width / 3) / (context.height / 4),
        controller: ScrollController(),
        crossAxisCount: 2,
        shrinkWrap: true,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        scrollDirection: Axis.vertical,
        children: [..._buildItems],
      );

  List<Widget> get _buildItems =>
      List.generate(9, (index) => AnimatedRecipeCard());
}
