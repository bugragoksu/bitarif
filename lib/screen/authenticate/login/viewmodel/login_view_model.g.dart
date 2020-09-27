// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_LoginViewModelBase.isLoading');

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

  final _$loginToDatabaseAsyncAction =
      AsyncAction('_LoginViewModelBase.loginToDatabase');

  @override
  Future<IResponseModel<BitarifUser>> loginToDatabase(
      {String email, String password}) {
    return _$loginToDatabaseAsyncAction
        .run(() => super.loginToDatabase(email: email, password: password));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
