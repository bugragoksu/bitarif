import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/base/widget/base_widget.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../_widgets/card/categorie_card.dart';
import '../../../_widgets/columns/three_widget_title.dart';
import '../viewmodel/category_list_view_model.dart';

class CategoryListView extends StatefulWidget {
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends BaseState<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    CategoryListViewModel viewModel;
    return BaseView<CategoryListViewModel>(
      viewModel: CategoryListViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, CategoryListViewModel value) =>
          BaseWidget(
        children: _buildBodyItems,
      ),
    );
  }

  List<Widget> get _buildBodyItems => [
        ThreeWidgetTitle(
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
      15,
      (index) => CategorieCard(
            title: "Breakfast",
            url: "https://img.icons8.com/ios/100/000000/sunny-side-up-eggs.png",
          ));
}
