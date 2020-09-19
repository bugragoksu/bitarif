import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../../core/base/state/base_state.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/base/widget/base_widget.dart';
import '../../../../../core/components/button/dropdown_button.dart';
import '../../../../../core/components/column/title_widget_column.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/double_extension.dart';
import '../../../../../core/extensions/string_extension.dart';
import '../../../../_widgets/buttons/new_recipe_button.dart';
import '../../../../_widgets/columns/three_widget_title.dart';
import '../viewmodel/new_recipe_view_model.dart';

class NewRecipeView extends StatefulWidget {
  @override
  _NewRecipeViewState createState() => _NewRecipeViewState();
}

class _NewRecipeViewState extends BaseState<NewRecipeView> {
  NewRecipeViewModel viewModel;
  bool hasImageSelected = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<NewRecipeViewModel>(
      viewModel: NewRecipeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, NewRecipeViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => BaseWidget(
        children: [
          ThreeWidgetTitle(
            isVisibleDoneText: false,
            title: "newRecipe",
          ),
          _buildImageContainer,
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "title",
              widget: _buildTitleField(1, "titleOfTheRecipe", 1)),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "categorie",
              widget: CustomDropdownButton(
                  list: ['A', 'b'], onChanged: (value) {})),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "time",
              widget: CustomDropdownButton(
                  list: ['30m', '1h', '1.5h'], onChanged: (value) {})),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "serving",
              widget: CustomDropdownButton(
                  list: ['2-4', '4-6', '6+'], onChanged: (value) {})),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "difficulty",
              widget: CustomDropdownButton(
                  list: ['Kolay', 'Orta', 'Zor'], onChanged: (value) {})),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "prepation",
              widget: _buildTitleField(null, "prepationOfTheRecipe", 5)),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "ingredients",
              widget: _buildTitleField(null, "ingredientsOfTheRecipe", 5)),
          context.mediumValue.toHeightSizedBox,
          Center(child: NewRecipeButton())
        ],
      );

  Widget get _buildImageContainer => Center(
          child: Container(
        height: context.height / 4,
        width: context.width / 1.5,
        decoration: BoxDecoration(
            image: _buildDecorationImage,
            borderRadius: BorderRadius.circular(10.0),
            color: context.theme.colorScheme.primary.withOpacity(0.1)),
        child: Center(
            child: IconButton(
          iconSize: context.mediumValue,
          icon: Icon(FeatherIcons.image),
          onPressed: () {},
        )),
      ));

  DecorationImage get _buildDecorationImage => hasImageSelected
      ? DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage("https://via.placeholder.com/150"))
      : null;

  Widget _buildTitleField(
          int maxLines, String hintText, int heightMultiplier) =>
      Container(
          height: context.mediumValue * 1.25 * heightMultiplier,
          decoration: BoxDecoration(
              color: context.theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0)),
          child: TextFormField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText.locale,
              contentPadding: EdgeInsets.only(left: 15, bottom: 10),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ));
}
