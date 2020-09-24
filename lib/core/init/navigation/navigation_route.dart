import 'package:flutter/material.dart';

import '../../../screen/authenticate/auth/model/bitarif_user.dart';
import '../../../screen/authenticate/auth/view/auth_view.dart';
import '../../../screen/authenticate/splash/view/splash_view.dart';
import '../../../screen/main/blog/blog_list/view/blog_list_view.dart';
import '../../../screen/main/category/category_list/view/category_list_view.dart';
import '../../../screen/main/category/filter/view/filter_view.dart';
import '../../../screen/main/main_view.dart';
import '../../../screen/main/recipe/new_recipe/view/new_recipe_view.dart';
import '../../../screen/main/recipe/recipe_detail.dart/model/recipe_model.dart';
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
          recipeList: args.arguments["recipes"] as List<Recipe>,
          title: args.arguments["title"] as String,
        ));
        break;
      case NavigationConstants.NEW_RECIPE:
        return normalNavigate(NewRecipeView());
        break;
      case NavigationConstants.CATEGORIES:
        return normalNavigate(
            CategoryListView(categoryList: args.arguments as List<Category>));
        break;
      case NavigationConstants.INSPIRATIONS:
        return normalNavigate(BlogListView());
        break;
      case NavigationConstants.FILTER:
        return normalNavigate(FilterView());
        break;
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
