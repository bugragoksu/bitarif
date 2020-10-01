import 'package:bitarif/core/init/firebase/firebase_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/components/button/sign_button.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/utils/widget_utils.dart';
import '../../main/recipe/new_recipe/viewmodel/new_recipe_view_model.dart';
import '../../main/recipe/recipe_detail.dart/model/recipe_model.dart';

class NewRecipeButton extends StatefulWidget {
  final Function(bool isSuccess) onCompleted;
  final NewRecipeViewModel viewModel;
  final String token,
      category,
      desc,
      difficulty,
      firebaseId,
      ingredients,
      time,
      serving,
      title;

  const NewRecipeButton(
      {Key key,
      this.onCompleted,
      @required this.viewModel,
      @required this.token,
      @required this.category,
      @required this.difficulty,
      @required this.firebaseId,
      @required this.ingredients,
      @required this.time,
      @required this.serving,
      @required this.title,
      @required this.desc})
      : super(key: key);
  @override
  _NewRecipeButtonState createState() => _NewRecipeButtonState();
}

class _NewRecipeButtonState extends BaseState<NewRecipeButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SignButton(
      isLoading: isLoading,
      onPressed: () async {
        changeLoading();
        if (widget.category.isNotNulAndNotEmpty &&
            widget.desc.isNotNulAndNotEmpty &&
            widget.difficulty.isNotNulAndNotEmpty &&
            widget.ingredients.isNotNulAndNotEmpty &&
            widget.serving.isNotNulAndNotEmpty &&
            widget.title.isNotNulAndNotEmpty &&
            widget.time.isNotNulAndNotEmpty &&
            widget.viewModel.selectedImageFile != null) {
          changeLoading();
          final imageLink = await FirebaseManager.instance
              .uploadImage(widget.viewModel.selectedImageFile);
          if (imageLink?.length != 0) {
            final result = await widget.viewModel.addRecipe(
                imageLink: imageLink,
                token: widget.token,
                firebaseId: widget.firebaseId);
            if (result is Recipe) {
              widget.onCompleted(true);
              context.showSnackBar(WidgetUtils.instance
                  .buildSnackBar(context, "successNewRecipe"));
            } else {
              widget.onCompleted(false);
              context.showSnackBar(WidgetUtils.instance
                  .buildSnackBar(context, "failedNewRecipe"));
            }
          } else {
            context.showSnackBar(WidgetUtils.instance
                .buildSnackBar(context, "somethingWentWrong"));
            widget.onCompleted(false);
          }
        } else {
          context.showSnackBar(
              WidgetUtils.instance.buildSnackBar(context, "pleaseEnterFields"));
          widget.onCompleted(false);
        }
        changeLoading();
      },
      title: "send",
    );
  }

  changeLoading() => setState(() {
        isLoading = !isLoading;
      });
}
