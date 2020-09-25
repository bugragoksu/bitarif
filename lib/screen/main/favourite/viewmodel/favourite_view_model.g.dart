// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavouriteViewModel on _FavouriteViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_FavouriteViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$favouriteRecipeIdListAtom =
      Atom(name: '_FavouriteViewModelBase.favouriteRecipeIdList');

  @override
  List<String> get favouriteRecipeIdList {
    _$favouriteRecipeIdListAtom.reportRead();
    return super.favouriteRecipeIdList;
  }

  @override
  set favouriteRecipeIdList(List<String> value) {
    _$favouriteRecipeIdListAtom.reportWrite(value, super.favouriteRecipeIdList,
        () {
      super.favouriteRecipeIdList = value;
    });
  }

  final _$recipeListAtom = Atom(name: '_FavouriteViewModelBase.recipeList');

  @override
  List<Recipe> get recipeList {
    _$recipeListAtom.reportRead();
    return super.recipeList;
  }

  @override
  set recipeList(List<Recipe> value) {
    _$recipeListAtom.reportWrite(value, super.recipeList, () {
      super.recipeList = value;
    });
  }

  final _$fetchFavouriteRecipesAsyncAction =
      AsyncAction('_FavouriteViewModelBase.fetchFavouriteRecipes');

  @override
  Future<List<Recipe>> fetchFavouriteRecipes({String token}) {
    return _$fetchFavouriteRecipesAsyncAction
        .run(() => super.fetchFavouriteRecipes(token: token));
  }

  final _$_FavouriteViewModelBaseActionController =
      ActionController(name: '_FavouriteViewModelBase');

  @override
  void getFavouriteRecipesIdFromCache() {
    final _$actionInfo = _$_FavouriteViewModelBaseActionController.startAction(
        name: '_FavouriteViewModelBase.getFavouriteRecipesIdFromCache');
    try {
      return super.getFavouriteRecipesIdFromCache();
    } finally {
      _$_FavouriteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
favouriteRecipeIdList: ${favouriteRecipeIdList},
recipeList: ${recipeList}
    ''';
  }
}
