// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_ProfileViewModelBase.isLoading');

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

  final _$recipeListAtom = Atom(name: '_ProfileViewModelBase.recipeList');

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

  final _$getRecipeListAsyncAction =
      AsyncAction('_ProfileViewModelBase.getRecipeList');

  @override
  Future<List<Recipe>> getRecipeList({String token, String firebaseId}) {
    return _$getRecipeListAsyncAction
        .run(() => super.getRecipeList(token: token, firebaseId: firebaseId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
recipeList: ${recipeList}
    ''';
  }
}
