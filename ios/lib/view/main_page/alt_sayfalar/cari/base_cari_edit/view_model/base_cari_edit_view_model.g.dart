// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_cari_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseCariEditViewModel on _BaseCariEditViewModelBase, Store {
  late final _$isValidateAtom =
      Atom(name: '_BaseCariEditViewModelBase.isValidate', context: context);

  @override
  bool get isValidate {
    _$isValidateAtom.reportRead();
    return super.isValidate;
  }

  @override
  set isValidate(bool value) {
    _$isValidateAtom.reportWrite(value, super.isValidate, () {
      super.isValidate = value;
    });
  }

  late final _$_BaseCariEditViewModelBaseActionController =
      ActionController(name: '_BaseCariEditViewModelBase', context: context);

  @override
  void setIsValidate(bool value) {
    final _$actionInfo = _$_BaseCariEditViewModelBaseActionController
        .startAction(name: '_BaseCariEditViewModelBase.setIsValidate');
    try {
      return super.setIsValidate(value);
    } finally {
      _$_BaseCariEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isValidate: ${isValidate}
    ''';
  }
}
