import 'dart:io';

import 'package:bitarif/core/constants/enums/http_types_enum.dart';
import 'package:bitarif/core/constants/server/server_constants.dart';
import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:bitarif/core/utils/widget_utils.dart';
import 'package:bitarif/screen/main/recipe/recipe_detail.dart/model/recipe_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'new_recipe_view_model.g.dart';

class NewRecipeViewModel = _NewRecipeViewModelBase with _$NewRecipeViewModel;

abstract class _NewRecipeViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  File selectedImageFile;

  @action
  Future getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImageFile = File(pickedFile.path);
    }
  }

  @observable
  String category, time, serving, difficulty, title, ingredients, prepation;

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  void setIngredients(String value) {
    ingredients = value;
  }

  @action
  void setPrepation(String value) {
    prepation = value;
  }

  @action
  void setCategory(String value) {
    category = value;
  }

  @action
  void setTime(String value) {
    time = value;
  }

  @action
  void setServing(String value) {
    serving = value;
  }

  @action
  void setDifficulty(String value) {
    difficulty = value;
  }

  @observable
  bool isLoading = false;

  @action
  Future<Recipe> addRecipe({
    @required String token,
    @required String firebaseId,
    @required String imageLink,
  }) async {
    try {
      isLoading = true;
      final result = await this
          .coreDio
          .fetch<Recipe, Recipe>(ServerConstants.NEW_RECIPE_ENDPOINT,
              token: token,
              data: {
                "firebase_id": firebaseId,
                "title": title,
                "desc": prepation,
                "category": category,
                "difficulty": difficulty,
                "ingredients": ingredients,
                "image_url": imageLink,
                "time": time,
                "serving": serving,
              },
              parseModel: Recipe(),
              type: HttpTypes.POST);
      if (result?.data is Recipe) {
        return result.data;
      } else {
        this.context.showSnackBar(
            WidgetUtils.instance.buildSnackBar(context, result.error.message));
      }
      return null;
    } catch (e) {
      this.context.showSnackBar(
          WidgetUtils.instance.buildSnackBar(context, "somethingWentWrong"));
      return null;
    } finally {
      isLoading = false;
    }
  }

  @observable
  List<Category> categoryList;

  @action
  Future<List<Category>> getCategoryList({String token}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<List<Category>, Category>(
          ServerConstants.CATEGORY_LIST_ENDPOINT,
          token: token,
          parseModel: Category(),
          type: HttpTypes.GET);
      if (result.data is List<Category>) {
        categoryList = result.data;
      } else {
        this.context.showSnackBar(
            WidgetUtils.instance.buildSnackBar(context, result.error.message));
      }
      return categoryList;
    } catch (e) {
      this.context.showSnackBar(
          WidgetUtils.instance.buildSnackBar(context, "somethingWentWrong"));
      return [];
    } finally {
      isLoading = false;
    }
  }
}
