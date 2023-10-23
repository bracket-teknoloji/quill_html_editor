// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_text_field_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomTextFieldViewModel on _CustomTextFieldViewModelBase, Store {
  late final _$showClearButtonAtom = Atom(name: '_CustomTextFieldViewModelBase.showClearButton', context: context);

  @override
  bool get showClearButton {
    _$showClearButtonAtom.reportRead();
    return super.showClearButton;
  }

  @override
  set showClearButton(bool value) {
    _$showClearButtonAtom.reportWrite(value, super.showClearButton, () {
      super.showClearButton = value;
    });
  }

  late final _$_CustomTextFieldViewModelBaseActionController = ActionController(name: '_CustomTextFieldViewModelBase', context: context);

  @override
  void setShowClearButton(bool value) {
    final _$actionInfo = _$_CustomTextFieldViewModelBaseActionController.startAction(name: '_CustomTextFieldViewModelBase.setShowClearButton');
    try {
      return super.setShowClearButton(value);
    } finally {
      _$_CustomTextFieldViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showClearButton: ${showClearButton}
    ''';
  }
}
