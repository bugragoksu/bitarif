import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../../core/constants/enums/http_types_enum.dart';
import '../../../../../core/constants/server/server_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/utils/widget_utils.dart';
import '../../recipe_detail.dart/model/recipe_model.dart';

part 'recipe_list_view_model.g.dart';

class RecipeListViewModel = _RecipeListViewModelBase with _$RecipeListViewModel;

abstract class _RecipeListViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  String _searchValue;
  bool isCategory;

  set search(String value) {
    this._searchValue = value;
  }

  void setIsCategory(bool value) {
    isCategory = value;
  }

  @observable
  bool isLoading = false;

  @observable
  List<Recipe> recipeList;

  @action
  Future<List<Recipe>> getRecipeList({String token}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<List<Recipe>, Recipe>(
          isCategory
              ? ServerConstants.RECIPE_LIST_BY_CATEGORY_ENDPOINT
              : ServerConstants.RECIPE_LIST_ENDPOINT,
          token: token,
          data: isCategory ? {"category_name": this._searchValue} : null,
          queryParameters: isCategory ? null : {"search": this._searchValue},
          parseModel: Recipe(),
          type: isCategory?HttpTypes.POST:HttpTypes.GET);
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
