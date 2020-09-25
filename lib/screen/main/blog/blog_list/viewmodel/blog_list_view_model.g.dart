// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlogListViewModel on _BlogListViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_BlogListViewModelBase.isLoading');

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

  final _$blogListAtom = Atom(name: '_BlogListViewModelBase.blogList');

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

  final _$getBlogPostsAsyncAction =
      AsyncAction('_BlogListViewModelBase.getBlogPosts');

  @override
  Future<List<BlogPost>> getBlogPosts({String token}) {
    return _$getBlogPostsAsyncAction
        .run(() => super.getBlogPosts(token: token));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
blogList: ${blogList}
    ''';
  }
}
