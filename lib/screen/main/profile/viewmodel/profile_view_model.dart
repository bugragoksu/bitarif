import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/http_types_enum.dart';
import '../../../../core/constants/server/server_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/widget_utils.dart';
import '../../recipe/recipe_detail.dart/model/recipe_model.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  List<Recipe> recipeList = [];

  @action
  Future<List<Recipe>> getRecipeList({String token, String firebaseId}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<List<Recipe>, Recipe>(
          ServerConstants.RECIPE_LIST_BY_USER_ENDPOINT,
          token: token,
          data: {"firebase_id": firebaseId},
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
