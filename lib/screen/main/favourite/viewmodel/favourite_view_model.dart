import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/http_types_enum.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/server/server_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/utils/widget_utils.dart';
import '../../blog/blog_detail/model/blog.dart';
import '../../recipe/recipe_detail.dart/model/recipe_model.dart';

part 'favourite_view_model.g.dart';

class FavouriteViewModel = _FavouriteViewModelBase with _$FavouriteViewModel;

abstract class _FavouriteViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {
    getFavouriteRecipesIdFromCache();
    getFavouriteBlogsIdFromCache();
  }

  @observable
  bool isLoading = false;
  @observable
  List<String> favouriteRecipeIdList;
  @observable
  List<String> favouriteBlogIdList;

  @observable
  List<Recipe> recipeList;

  @observable
  List<BlogPost> blogList;

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
      List favRecipeObjList = [];
      favouriteRecipeIdList.forEach((element) {
        if ((element.length != 0))
          favRecipeObjList.add({"id": int.parse(element)});
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

  @action
  Future<List<BlogPost>> fetchFavouriteBlogs({String token}) async {
    if (favouriteBlogIdList.isEmpty) {
      blogList = [];
      return blogList;
    }

    try {
      isLoading = true;
      List favBlogObjList = [];
      favouriteBlogIdList.forEach((element) {
        if ((element.length != 0))
          favBlogObjList.add({"id": int.parse(element)});
      });
      final result = await this.coreDio.fetch<List<BlogPost>, BlogPost>(
          ServerConstants.LIKED_BLOG_LIST_ENDPOINT,
          token: token,
          data: {"blog_id_list": json.encode(favBlogObjList)},
          parseModel: BlogPost(),
          type: HttpTypes.POST);
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
  void getFavouriteBlogsIdFromCache() {
    final result =
        LocaleManager.instance.getStringValue(PreferencesKeys.FAV_BLOGS);
    if (result.isEmpty) {
      favouriteBlogIdList = [];
    } else {
      favouriteBlogIdList = result.split(',');
    }
  }
}
