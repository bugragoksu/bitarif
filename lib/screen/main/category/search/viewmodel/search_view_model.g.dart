// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchViewModel on _SearchViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_SearchViewModelBase.isLoading');

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

  final _$categoryListAtom = Atom(name: '_SearchViewModelBase.categoryList');

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

  final _$getCategoryListAsyncAction =
      AsyncAction('_SearchViewModelBase.getCategoryList');

  @override
  Future<List<Category>> getCategoryList({String token}) {
    return _$getCategoryListAsyncAction
        .run(() => super.getCategoryList(token: token));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
categoryList: ${categoryList}
    ''';
  }
}
