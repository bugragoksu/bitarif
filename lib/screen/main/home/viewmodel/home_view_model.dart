import 'package:bitarif/core/utils/widget_utils.dart';
import 'package:bitarif/screen/main/recipe/recipe_detail.dart/model/recipe_model.dart';

import '../../../../core/constants/enums/http_types_enum.dart';
import '../../../../core/constants/server/server_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../blog/blog_detail/model/blog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  List<BlogPost> blogList = [];

  @observable
  List<Recipe> recipeList = [];

  @action
  Future<List<BlogPost>> getBlogPosts({String token}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<List<BlogPost>, BlogPost>(
          ServerConstants.BLOG_LIST_ENDPOINT,
          token: token,
          parseModel: BlogPost(),
          type: HttpTypes.GET);
      if (result.data is List<BlogPost>) {
        blogList = result.data;
      } else {
        this.context.showSnackBar(
            WidgetUtils.instance.buildSnackBar(context, result.error.message));
      }
      return blogList;
    } catch (e) {
      this.context.showSnackBar(
          WidgetUtils.instance.buildSnackBar(context, "somethingWentWrong"));
      return [];
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<List<Recipe>> getRecipeList({String token}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<List<Recipe>, Recipe>(
          ServerConstants.RECIPE_LIST_ENDPOINT,
          token: token,
          parseModel: Recipe(),
          type: HttpTypes.GET);
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
