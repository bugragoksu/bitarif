import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/column/imaged_start_column.dart';
import '../../../../core/components/column/title_widget_column.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../_widgets/card/recipe_cooking_info_card.dart';
import '../../../_widgets/container/title_gradient_border_container.dart';
import '../viewmodel/recipe_detail_view_model.dart';

class RecipeDetailView extends StatefulWidget {
  final String url, title;

  const RecipeDetailView({Key key, this.url, this.title}) : super(key: key);
  @override
  _RecipeDetailViewState createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends BaseState<RecipeDetailView> {
  RecipeDetailViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<RecipeDetailViewModel>(
      viewModel: RecipeDetailViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, RecipeDetailViewModel value) =>
          Scaffold(
        body: SingleChildScrollView(
          child: ImagedStartColumn(
            children: _buildChildren,
            isNetwork: true,
            path: widget.url,
          ),
        ),
      ),
    );
  }

  List<Widget> get _buildChildren => [
        TitleGradientBorderContainer(title: "Breakfast"),
        context.lowValue.toHeightSizedBox,
        _buildRecipeTitle,
        context.lowValue.toHeightSizedBox,
        Divider(),
        context.lowValue.toHeightSizedBox,
        RecipeCookingInfoCard(
          cookingTime: "30m",
          difficulty: "Easy",
          serving: "3-4",
        ),
        context.lowValue.toHeightSizedBox,
        Divider(),
        Padding(
          padding: context.paddingNormal,
          child: TitleWidgetColumn(
            title: "ingredients",
            widget: Container(
                alignment: Alignment.centerLeft,
                padding: context.paddingLow,
                child: Text("* 1 kaşık çay\n* 1 bardak su")),
          ),
        ),
        context.lowValue.toHeightSizedBox,
        Padding(
          padding: context.paddingNormal,
          child: TitleWidgetColumn(
            title: "prepation",
            widget: Container(
                alignment: Alignment.centerLeft,
                padding: context.paddingLow,
                child: Text("* 1 kaşık çay\n* 1 bardak su")),
          ),
        ),
      ];

  Widget get _buildRecipeTitle => Padding(
        padding: context.paddingNormal,
        child: Text(widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: context.mediumValue)),
      );
}
