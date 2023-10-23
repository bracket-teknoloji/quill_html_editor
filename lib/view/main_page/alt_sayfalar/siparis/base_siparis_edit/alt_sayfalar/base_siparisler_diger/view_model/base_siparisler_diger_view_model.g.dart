// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_siparisler_diger_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseSiparislerDigerViewModel on _BaseSiparislerDigerViewModelBase, Store {
  late final _$isInitAtom = Atom(name: '_BaseSiparislerDigerViewModelBase.isInit', context: context);

  @override
  bool get isInit {
    _$isInitAtom.reportRead();
    return super.isInit;
  }

  @override
  set isInit(bool value) {
    _$isInitAtom.reportWrite(value, super.isInit, () {
      super.isInit = value;
    });
  }

  late final _$_BaseSiparislerDigerViewModelBaseActionController = ActionController(name: '_BaseSiparislerDigerViewModelBase', context: context);

  @override
  void init() {
    final _$actionInfo = _$_BaseSiparislerDigerViewModelBaseActionController.startAction(name: '_BaseSiparislerDigerViewModelBase.init');
    try {
      return super.init();
    } finally {
      _$_BaseSiparislerDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isInit: ${isInit}
    ''';
  }
}
