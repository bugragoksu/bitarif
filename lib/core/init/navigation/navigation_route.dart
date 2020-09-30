import 'package:flutter/material.dart';

import '../../../screen/authenticate/auth/model/bitarif_user.dart';
import '../../../screen/authenticate/auth/view/auth_view.dart';
import '../../../screen/authenticate/splash/view/splash_view.dart';
import '../../../screen/main/blog/blog_detail/model/blog.dart';
import '../../../screen/main/blog/blog_detail/view/blog_view.dart';
import '../../../screen/main/blog/blog_list/view/blog_list_view.dart';
import '../../../screen/main/category/category_list/view/category_list_view.dart';
import '../../../screen/main/category/filter/view/filter_view.dart';
import '../../../screen/main/main_view.dart';
import '../../../screen/main/recipe/new_recipe/view/new_recipe_view.dart';
import '../../../screen/main/recipe/recipe_detail.dart/model/recipe_model.dart';
import '../../../screen/main/recipe/recipe_detail.dart/view/recipe_detail_view.dart';
import '../../../screen/main/recipe/recipe_list/view/recipe_list_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(args) {
    switch (args.name) {
      case NavigationConstants.AUTH_VIEW:
        return normalNavigate(AuthView());
        break;
      case NavigationConstants.SPLASH_VIEW:
        return normalNavigate(SplashView());
        break;
      case NavigationConstants.MAIN_VIEW:
        return normalNavigate(MainView(user: args.arguments as BitarifUser));
        break;
      case NavigationConstants.RECIPE_LIST_VIEW:
        return normalNavigate(RecipeListView(
          isCategory: args.arguments["isCategory"] as bool ?? false,
          title: args.arguments["title"] as String,
          searchValue: args.arguments["search"] as String,
          token: args.arguments["token"] as String,
        ));
        break;
      case NavigationConstants.NEW_RECIPE:
        return normalNavigate(NewRecipeView(
          user: args.arguments as BitarifUser,
        ));
        break;
      case NavigationConstants.CATEGORIES:
        return normalNavigate(CategoryListView(
          categoryList: args.arguments["categoryList"] as List<Category>,
          token: args.arguments["token"] as String,
        ));
        break;
      case NavigationConstants.INSPIRATIONS:
        return normalNavigate(BlogListView(
          token: args.arguments as String,
        ));
        break;
      case NavigationConstants.FILTER:
        return normalNavigate(FilterView());
        break;
      case NavigationConstants.RECIPE_DETAIL:
        return normalNavigate(RecipeDetailView(
          recipe: args.arguments as Recipe,
        ));
        break;
      case NavigationConstants.BLOG_DETAIL:
        return normalNavigate(BlogDetailView(
          blog: args.arguments as BlogPost,
        ));
        break;
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
