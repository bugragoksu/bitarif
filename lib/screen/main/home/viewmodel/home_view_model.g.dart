// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_HomeViewModelBase.isLoading');

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

  final _$blogListAtom = Atom(name: '_HomeViewModelBase.blogList');

  @override
  List<BlogPost> get blogList {
    _$blogListAtom.reportRead();
    return super.blogList;
  }

  @override
  set blogList(List<BlogPost> value) {
    _$blogListAtom.reportWrite(value, super.blogList, () {
      super.blogList = value;
    });
  }

  final _$recipeListAtom = Atom(name: '_HomeViewModelBase.recipeList');

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

  final _$getBlogPostsAsyncAction =
      AsyncAction('_HomeViewModelBase.getBlogPosts');

  @override
  Future<List<BlogPost>> getBlogPosts({String token}) {
    return _$getBlogPostsAsyncAction
        .run(() => super.getBlogPosts(token: token));
  }

  final _$getRecipeListAsyncAction =
      AsyncAction('_HomeViewModelBase.getRecipeList');

  @override
  Future<List<Recipe>> getRecipeList({String token}) {
    return _$getRecipeListAsyncAction
        .run(() => super.getRecipeList(token: token));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
blogList: ${blogList},
recipeList: ${recipeList}
    ''';
  }
}
