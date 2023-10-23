// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$obscurePasswordAtom = Atom(name: '_LoginViewModelBase.obscurePassword', context: context);

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  late final _$isDebugAtom = Atom(name: '_LoginViewModelBase.isDebug', context: context);

  @override
  bool get isDebug {
    _$isDebugAtom.reportRead();
    return super.isDebug;
  }

  @override
  set isDebug(bool value) {
    _$isDebugAtom.reportWrite(value, super.isDebug, () {
      super.isDebug = value;
    });
  }

  late final _$baseUrlAtom = Atom(name: '_LoginViewModelBase.baseUrl', context: context);

  @override
  String get baseUrl {
    _$baseUrlAtom.reportRead();
    return super.baseUrl;
  }

  @override
  set baseUrl(String value) {
    _$baseUrlAtom.reportWrite(value, super.baseUrl, () {
      super.baseUrl = value;
    });
  }

  late final _$_LoginViewModelBaseActionController = ActionController(name: '_LoginViewModelBase', context: context);

  @override
  void checkDebug() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(name: '_LoginViewModelBase.checkDebug');
    try {
      return super.checkDebug();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowPassword() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(name: '_LoginViewModelBase.changeShowPassword');
    try {
      return super.changeShowPassword();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
obscurePassword: ${obscurePassword},
isDebug: ${isDebug},
baseUrl: ${baseUrl}
    ''';
  }
}
