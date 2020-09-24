import 'package:flutter/material.dart';

import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/base/widget/base_widget.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/double_extension.dart';
import '../../../../../core/init/navigation/navigation_manager.dart';
import '../../../../_widgets/card/categorie_card.dart';
import '../../../../_widgets/columns/three_widget_title.dart';
import '../../../recipe/recipe_detail.dart/model/recipe_model.dart';
import '../viewmodel/category_list_view_model.dart';

class CategoryListView extends StatefulWidget {
  final List<Category> categoryList;

  const CategoryListView({Key key, @required this.categoryList})
      : super(key: key);
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends BaseState<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryListViewModel>(
      viewModel: CategoryListViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, CategoryListViewModel value) =>
          BaseWidget(
        children: _buildBodyItems,
      ),
    );
  }

  List<Widget> get _buildBodyItems => [
        ThreeWidgetTitle(
          isVisibleDoneText: false,
          title: "categories",
        ),
        context.lowValue.toHeightSizedBox,
        _buildCategories
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
      widget.categoryList.length,
      (index) => CategorieCard(
            onPressed: () {
              NavigationManager.instance
                  .navigateToPage(path: NavigationConstants.RECIPE_LIST_VIEW);
            },
            title: widget.categoryList[index].name,
            url: widget.categoryList[index].imageUrl,
          ));
}
