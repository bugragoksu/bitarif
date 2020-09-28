// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_recipe_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewRecipeViewModel on _NewRecipeViewModelBase, Store {
  final _$selectedImageFileAtom =
      Atom(name: '_NewRecipeViewModelBase.selectedImageFile');

  @override
  File get selectedImageFile {
    _$selectedImageFileAtom.reportRead();
    return super.selectedImageFile;
  }

  @override
  set selectedImageFile(File value) {
    _$selectedImageFileAtom.reportWrite(value, super.selectedImageFile, () {
      super.selectedImageFile = value;
    });
  }

  final _$categoryAtom = Atom(name: '_NewRecipeViewModelBase.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$timeAtom = Atom(name: '_NewRecipeViewModelBase.time');

  @override
  String get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(String value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$servingAtom = Atom(name: '_NewRecipeViewModelBase.serving');

  @override
  String get serving {
    _$servingAtom.reportRead();
    return super.serving;
  }

  @override
  set serving(String value) {
    _$servingAtom.reportWrite(value, super.serving, () {
      super.serving = value;
    });
  }

  final _$difficultyAtom = Atom(name: '_NewRecipeViewModelBase.difficulty');

  @override
  String get difficulty {
    _$difficultyAtom.reportRead();
    return super.difficulty;
  }

  @override
  set difficulty(String value) {
    _$difficultyAtom.reportWrite(value, super.difficulty, () {
      super.difficulty = value;
    });
  }

  final _$titleAtom = Atom(name: '_NewRecipeViewModelBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$ingredientsAtom = Atom(name: '_NewRecipeViewModelBase.ingredients');

  @override
  String get ingredients {
    _$ingredientsAtom.reportRead();
    return super.ingredients;
  }

  @override
  set ingredients(String value) {
    _$ingredientsAtom.reportWrite(value, super.ingredients, () {
      super.ingredients = value;
    });
  }

  final _$prepationAtom = Atom(name: '_NewRecipeViewModelBase.prepation');

  @override
  String get prepation {
    _$prepationAtom.reportRead();
    return super.prepation;
  }

  @override
  set prepation(String value) {
    _$prepationAtom.reportWrite(value, super.prepation, () {
      super.prepation = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_NewRecipeViewModelBase.isLoading');

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

  final _$categoryListAtom = Atom(name: '_NewRecipeViewModelBase.categoryList');

  @override
  List<Category> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(List<Category> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$getImageAsyncAction = AsyncAction('_NewRecipeViewModelBase.getImage');

  @override
  Future<dynamic> getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  final _$addRecipeAsyncAction =
      AsyncAction('_NewRecipeViewModelBase.addRecipe');

  @override
  Future<Recipe> addRecipe(
      {@required String token,
      @required String firebaseId,
      @required String imageLink}) {
    return _$addRecipeAsyncAction.run(() => super
        .addRecipe(token: token, firebaseId: firebaseId, imageLink: imageLink));
  }

  final _$getCategoryListAsyncAction =
      AsyncAction('_NewRecipeViewModelBase.getCategoryList');

  @override
  Future<List<Category>> getCategoryList({String token}) {
    return _$getCategoryListAsyncAction
        .run(() => super.getCategoryList(token: token));
  }

  final _$_NewRecipeViewModelBaseActionController =
      ActionController(name: '_NewRecipeViewModelBase');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_NewRecipeViewModelBaseActionController.startAction(
        name: '_NewRecipeViewModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_NewRecipeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIngredients(String value) {
    final _$actionInfo = _$_NewRecipeViewModelBaseActionController.startAction(
        name: '_NewRecipeViewModelBase.setIngredients');
    try {
      return super.setIngredients(value);
    } finally {
      _$_NewRecipeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrepation(String value) {
    final _$actionInfo = _$_NewRecipeViewModelBaseActionController.startAction(
        name: '_NewRecipeViewModelBase.setPrepation');
    try {
      return super.setPrepation(value);
    } finally {
      _$_NewRecipeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(String value) {
    final _$actionInfo = _$_NewRecipeViewModelBaseActionController.startAction(
        name: '_NewRecipeViewModelBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_NewRecipeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTime(String value) {
    final _$actionInfo = _$_NewRecipeViewModelBaseActionController.startAction(
        name: '_NewRecipeViewModelBase.setTime');
    try {
      return super.setTime(value);
    } finally {
      _$_NewRecipeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setServing(String value) {
    final _$actionInfo = _$_NewRecipeViewModelBaseActionController.startAction(
        name: '_NewRecipeViewModelBase.setServing');
    try {
      return super.setServing(value);
    } finally {
      _$_NewRecipeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDifficulty(String value) {
    final _$actionInfo = _$_NewRecipeViewModelBaseActionController.startAction(
        name: '_NewRecipeViewModelBase.setDifficulty');
    try {
      return super.setDifficulty(value);
    } finally {
      _$_NewRecipeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedImageFile: ${selectedImageFile},
category: ${category},
time: ${time},
serving: ${serving},
difficulty: ${difficulty},
title: ${title},
ingredients: ${ingredients},
prepation: ${prepation},
isLoading: ${isLoading},
categoryList: ${categoryList}
    ''';
  }
}
