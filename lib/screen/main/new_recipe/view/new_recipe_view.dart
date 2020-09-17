import 'package:bitarif/core/base/widget/base_widget.dart';
import 'package:bitarif/screen/_widgets/buttons/new_recipe_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/button/dropdown_button.dart';
import '../../../../core/components/column/low_padding_column.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../_widgets/columns/three_widget_title.dart';
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
            title: "newRecipe",
          ),
          _buildImageContainer,
          context.mediumValue.toHeightSizedBox,
          ..._buildItemSection(
              "title", _buildTitleField(1, "titleOfTheRecipe", 1)),
          context.mediumValue.toHeightSizedBox,
          ..._buildItemSection(
              "categorie", _buildDropdown(['A', 'b'], (value) {})),
          context.mediumValue.toHeightSizedBox,
          ..._buildItemSection(
              "time", _buildDropdown(['30m', '1h', '1.5h'], (value) {})),
          context.mediumValue.toHeightSizedBox,
          ..._buildItemSection(
              "serving", _buildDropdown(['2-4', '4-6', '6+'], (value) {})),
          context.mediumValue.toHeightSizedBox,
          ..._buildItemSection("difficulty",
              _buildDropdown(['Kolay', 'Orta', 'Zor'], (value) {})),
          context.mediumValue.toHeightSizedBox,
          ..._buildItemSection(
              "prepation", _buildTitleField(null, "prepationOfTheRecipe", 5)),
          context.mediumValue.toHeightSizedBox,
          ..._buildItemSection("ingredients",
              _buildTitleField(null, "ingredientsOfTheRecipe", 5)),
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

  List<Widget> _buildItemSection(String text, Widget widget) => [
        LocaleText(
            value: text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: context.normalValue * 1.25)),
        context.normalValue.toHeightSizedBox,
        widget
      ];

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

  Widget _buildDropdown(List<String> list, Function(String value) onChanged) =>
      CustomDropdownButton(list: list, onChanged: onChanged);
}
