import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/base/widget/base_widget.dart';
import '../../../../core/components/column/title_widget_column.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../_widgets/card/categorie_card.dart';
import '../../../_widgets/card/title_colored_background_card.dart';
import '../../../_widgets/columns/three_widget_title.dart';
import '../viewmodel/filter_view_model.dart';

class FilterView extends StatefulWidget {
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends BaseState<FilterView> {
  FilterViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<FilterViewModel>(
      viewModel: FilterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, FilterViewModel value) =>
          BaseWidget(
        children: _buildBodyItems,
      ),
    );
  }

  List<Widget> get _buildBodyItems => [
        ThreeWidgetTitle(
          title: 'filter',
          isVisibleDoneText: true,
        ),
        context.lowValue.toHeightSizedBox,
        TitleWidgetColumn(title: 'category', widget: _buildCategories),
        context.normalValue.toHeightSizedBox,
        TitleWidgetColumn(title: 'difficulty', widget: _buildDifficulties),
        context.normalValue.toHeightSizedBox,
        TitleWidgetColumn(title: 'time', widget: _buildTimes),
        context.normalValue.toHeightSizedBox,
        TitleWidgetColumn(title: 'serving', widget: _buildServing),
      ];

  Widget get _buildCategories => Container(
          child: Observer(
        builder: (BuildContext context) => GridView.count(
          controller: ScrollController(),
          childAspectRatio: (context.width / 3) / (context.height / 4.5),
          crossAxisCount: 3,
          shrinkWrap: true,
          crossAxisSpacing: context.normalValue,
          mainAxisSpacing: context.normalValue,
          scrollDirection: Axis.vertical,
          children: _buildItems,
        ),
      ));

  List<Widget> get _buildItems => List.generate(
        6,
        (index) => CategorieCard(
          isSelected: viewModel.selectedCategoryIndex != null
              ? viewModel.selectedCategoryIndex == index
              : false,
          onPressed: () {
            viewModel.changeCategorySelected(index);
          },
          title: "Breakfast",
          url: "https://img.icons8.com/ios/100/000000/sunny-side-up-eggs.png",
        ),
      );

  Widget get _buildDifficulties => Container(
          child: Observer(
        builder: (BuildContext context) => GridView.count(
          controller: ScrollController(),
          childAspectRatio: (context.width / 3) / (context.height / 4.5),
          crossAxisCount: 3,
          shrinkWrap: true,
          crossAxisSpacing: context.normalValue,
          mainAxisSpacing: context.normalValue,
          scrollDirection: Axis.vertical,
          children: _buildDifficultyItems,
        ),
      ));

  List<Widget> get _buildDifficultyItems => List.generate(
        3,
        (index) => TitleColoredBackgroundCard(
          isSelected: viewModel.selectedDifficultyIndex != null
              ? viewModel.selectedDifficultyIndex == index
              : false,
          onPressed: () {
            viewModel.changeDifficultySelected(index);
          },
          title: "Kolay",
        ),
      );

  Widget get _buildTimes => Container(
          child: Observer(
        builder: (BuildContext context) => GridView.count(
          controller: ScrollController(),
          childAspectRatio: (context.width / 3) / (context.height / 4.5),
          crossAxisCount: 3,
          shrinkWrap: true,
          crossAxisSpacing: context.normalValue,
          mainAxisSpacing: context.normalValue,
          scrollDirection: Axis.vertical,
          children: _buildTimeItems,
        ),
      ));

  List<Widget> get _buildTimeItems => List.generate(
        3,
        (index) => TitleColoredBackgroundCard(
          isSelected: viewModel.selectedTimeIndex != null
              ? viewModel.selectedTimeIndex == index
              : false,
          onPressed: () {
            viewModel.changeTimeSelected(index);
          },
          title: "30dk",
        ),
      );

  Widget get _buildServing => Container(
          child: Observer(
        builder: (BuildContext context) => GridView.count(
          controller: ScrollController(),
          childAspectRatio: (context.width / 3) / (context.height / 4.5),
          crossAxisCount: 3,
          shrinkWrap: true,
          crossAxisSpacing: context.normalValue,
          mainAxisSpacing: context.normalValue,
          scrollDirection: Axis.vertical,
          children: _buildServingItems,
        ),
      ));
  List<Widget> get _buildServingItems => List.generate(
        3,
        (index) => TitleColoredBackgroundCard(
          isSelected: viewModel.selectedServingIndex != null
              ? viewModel.selectedServingIndex == index
              : false,
          onPressed: () {
            viewModel.changeServingSelected(index);
          },
          title: "2-4",
        ),
      );
}
