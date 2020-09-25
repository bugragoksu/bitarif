import 'dart:convert';

import '../../../../core/constants/enums/http_types_enum.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/server/server_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/utils/widget_utils.dart';
import '../../recipe/recipe_detail.dart/model/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'favourite_view_model.g.dart';

class FavouriteViewModel = _FavouriteViewModelBase with _$FavouriteViewModel;

abstract class _FavouriteViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {
    getFavouriteRecipesIdFromCache();
  }

  @observable
  bool isLoading = false;
  @observable
  List<String> favouriteRecipeIdList;

  @observable
  List<Recipe> recipeList;

  @action
  void getFavouriteRecipesIdFromCache() {
    final result =
        LocaleManager.instance.getStringValue(PreferencesKeys.FAV_RECIPES);
    if (result.isEmpty) {
      favouriteRecipeIdList = [];
    } else {
      favouriteRecipeIdList = result.split(',');
    }
  }

  @action 
  Future<List<Recipe>> fetchFavouriteRecipes({String token}) async {
    if (favouriteRecipeIdList.isEmpty) {
      recipeList = [];
      return recipeList;
    }

    try {
      isLoading = true;
 //db tarafından data gelmiyor
      List favRecipeObjList = [];
      favouriteRecipeIdList.forEach((element) {
        if ((element.length!=0)) favRecipeObjList.add({"id": int.parse(element)});
      });
      final result = await this.coreDio.fetch<List<Recipe>, Recipe>(
          ServerConstants.LIKED_RECIPE_LIST_ENDPOINT,
          token: token,
          data: {"recipe_id_list": json.encode(favRecipeObjList)},
          parseModel: Recipe(),
          type: HttpTypes.POST);
      if (result.data is List<Recipe>) {
        recipeList = result.data;
      } else {
        this.context.showSnackBar(
            WidgetUtils.instance.buildSnackBar(context, result.error.message));
      }
      return recipeList;
    } catch (e) {
      this.context.showSnackBar(
          WidgetUtils.instance.buildSnackBar(context, "somethingWentWrong"));
      return [];
    } finally {
      isLoading = false;
    }
  }
}
