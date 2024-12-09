// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_auth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashAuthViewModel on _SplashAuthViewModelBase, Store {
  late final _$titleAtom =
      Atom(name: '_SplashAuthViewModelBase.title', context: context);

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

  late final _$isErrorAtom =
      Atom(name: '_SplashAuthViewModelBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$accountResponseModelAtom = Atom(
      name: '_SplashAuthViewModelBase.accountResponseModel', context: context);

  @override
  AccountResponseModel? get accountResponseModel {
    _$accountResponseModelAtom.reportRead();
    return super.accountResponseModel;
  }

  @override
  set accountResponseModel(AccountResponseModel? value) {
    _$accountResponseModelAtom.reportWrite(value, super.accountResponseModel,
        () {
      super.accountResponseModel = value;
    });
  }

  late final _$_SplashAuthViewModelBaseActionController =
      ActionController(name: '_SplashAuthViewModelBase', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_SplashAuthViewModelBaseActionController.startAction(
        name: '_SplashAuthViewModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_SplashAuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccountResponseModel(AccountResponseModel? value) {
    final _$actionInfo = _$_SplashAuthViewModelBaseActionController.startAction(
        name: '_SplashAuthViewModelBase.setAccountResponseModel');
    try {
      return super.setAccountResponseModel(value);
    } finally {
      _$_SplashAuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_SplashAuthViewModelBaseActionController.startAction(
        name: '_SplashAuthViewModelBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_SplashAuthViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
isError: ${isError},
accountResponseModel: ${accountResponseModel}
    ''';
  }
}
