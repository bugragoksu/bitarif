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

  final _$followListAtom = Atom(name: '_ProfileViewModelBase.followList');

  @override
  List<Follower> get followList {
    _$followListAtom.reportRead();
    return super.followList;
  }

  @override
  set followList(List<Follower> value) {
    _$followListAtom.reportWrite(value, super.followList, () {
      super.followList = value;
    });
  }

  final _$selectedImageFileAtom =
      Atom(name: '_ProfileViewModelBase.selectedImageFile');

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

  final _$getFollowListAsyncAction =
      AsyncAction('_ProfileViewModelBase.getFollowList');

  @override
  Future<List<Follower>> getFollowList({String token, String firebaseId}) {
    return _$getFollowListAsyncAction
        .run(() => super.getFollowList(token: token, firebaseId: firebaseId));
  }

  final _$getRecipeListAsyncAction =
      AsyncAction('_ProfileViewModelBase.getRecipeList');

  @override
  Future<List<Recipe>> getRecipeList({String token, String firebaseId}) {
    return _$getRecipeListAsyncAction
        .run(() => super.getRecipeList(token: token, firebaseId: firebaseId));
  }

  final _$getImageAsyncAction = AsyncAction('_ProfileViewModelBase.getImage');

  @override
  Future<dynamic> getImage({String token, String firebaseId}) {
    return _$getImageAsyncAction
        .run(() => super.getImage(token: token, firebaseId: firebaseId));
  }

  final _$updateUserImageAsyncAction =
      AsyncAction('_ProfileViewModelBase.updateUserImage');

  @override
  Future<BitarifUser> updateUserImage(
      {String token, String firebaseId, String imageLink}) {
    return _$updateUserImageAsyncAction.run(() => super.updateUserImage(
        token: token, firebaseId: firebaseId, imageLink: imageLink));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
recipeList: ${recipeList},
followList: ${followList},
selectedImageFile: ${selectedImageFile}
    ''';
  }
}
