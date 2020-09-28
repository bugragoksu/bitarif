import 'package:bitarif/screen/authenticate/auth/model/bitarif_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  final BitarifUser user;

  const NewRecipeView({Key key, @required this.user}) : super(key: key);
  @override
  _NewRecipeViewState createState() => _NewRecipeViewState();
}

class _NewRecipeViewState extends BaseState<NewRecipeView> {
  String title, prepation, ingredients;

  NewRecipeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<NewRecipeViewModel>(
      viewModel: NewRecipeViewModel(),
      onModelReady: (model) async {
        model.setContext(context);
        model.init();
        viewModel = model;
        await viewModel.getCategoryList(token: widget.user.token);
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
              widget: _buildTitleField(1, "titleOfTheRecipe", 1,
                  (value) => viewModel.setTitle(value))),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "categorie",
              widget: Observer(builder: (_) {
                return CustomDropdownButton(
                    selectedValue: viewModel.category,
                    list: viewModel.categoryList == null
                        ? []
                        : viewModel.categoryList.map((e) => e.name).toList(),
                    onChanged: (value) {
                      viewModel.setCategory(value);
                    });
              })),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "time",
              widget: Observer(builder: (_) {
                return CustomDropdownButton(
                    selectedValue: viewModel.time,
                    list: ['0-30m', '30m-1h', '1h-1.5h', '1.5h-2h', '2h+'],
                    onChanged: (value) {
                      viewModel.setTime(value);
                    });
              })),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "serving",
              widget: Observer(builder: (_) {
                return CustomDropdownButton(
                    selectedValue: viewModel.serving,
                    list: ['2-4', '4-6', '6+'],
                    onChanged: (value) {
                      viewModel.setServing(value);
                    });
              })),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "difficulty",
              widget: Observer(builder: (_) {
                return CustomDropdownButton(
                    selectedValue: viewModel.difficulty,
                    list: ['Kolay', 'Orta', 'Zor'],
                    onChanged: (value) {
                      viewModel.setDifficulty(value);
                    });
              })),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "prepation",
              widget: _buildTitleField(null, "prepationOfTheRecipe", 5,
                  (value) => viewModel.setPrepation(value))),
          context.mediumValue.toHeightSizedBox,
          TitleWidgetColumn(
              title: "ingredients",
              widget: _buildTitleField(null, "ingredientsOfTheRecipe", 5,
                  (value) => viewModel.setIngredients(value))),
          context.mediumValue.toHeightSizedBox,
          Center(
              child: NewRecipeButton(
                  onCompleted: (success) {
                    if (success) {
                      Navigator.of(context).pop();
                    }
                  },
                  token: widget.user.token,
                  viewModel: viewModel,
                  firebaseId: widget.user.firebaseId,
                  category: viewModel.category,
                  difficulty: viewModel.difficulty,
                  ingredients: viewModel.ingredients,
                  time: viewModel.time,
                  serving: viewModel.serving,
                  title: viewModel.title,
                  desc: viewModel.prepation))
        ],
      );

  Widget get _buildImageContainer => Center(child: Observer(builder: (_) {
        return GestureDetector(
          onTap: () async {
            await viewModel.getImage();
          },
          child: Container(
            height: context.height / 4,
            width: context.width / 1.5,
            decoration: BoxDecoration(
                image: viewModel.selectedImageFile != null
                    ? _buildDecorationImage
                    : null,
                borderRadius: BorderRadius.circular(10.0),
                color: context.theme.colorScheme.primary.withOpacity(0.1)),
            child: viewModel.selectedImageFile != null
                ? Container()
                : Center(
                    child: Icon(FeatherIcons.image),
                  ),
          ),
        );
      }));

  DecorationImage get _buildDecorationImage => DecorationImage(
      fit: BoxFit.fill, image: FileImage(viewModel.selectedImageFile));

  Widget _buildTitleField(int maxLines, String hintText, int heightMultiplier,
          Function(String) onChanged) =>
      Container(
          height: context.mediumValue * 1.25 * heightMultiplier,
          decoration: BoxDecoration(
              color: context.theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0)),
          child: TextFormField(
            onChanged: onChanged,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText.locale,
              contentPadding: EdgeInsets.only(left: 15, bottom: 10),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ));
}
