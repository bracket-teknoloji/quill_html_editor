// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_account_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddAccountViewModel on _AddAccountViewModelBase, Store {
  late final _$obscurePasswordAtom = Atom(
    name: '_AddAccountViewModelBase.obscurePassword',
    context: context,
  );

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

  late final _$togglePasswordAsyncAction = AsyncAction(
    '_AddAccountViewModelBase.togglePassword',
    context: context,
  );

  @override
  Future<void> togglePassword() {
    return _$togglePasswordAsyncAction.run(() => super.togglePassword());
  }

  @override
  String toString() {
    return '''
obscurePassword: ${obscurePassword}
    ''';
  }
}
