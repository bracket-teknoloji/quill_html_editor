// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_siparisler_genel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseSiparislerGenelViewModel
    on _BaseSiparislerGenelViewModelBase, Store {
  late final _$kdvDahilAtom = Atom(
      name: '_BaseSiparislerGenelViewModelBase.kdvDahil', context: context);

  @override
  bool get kdvDahil {
    _$kdvDahilAtom.reportRead();
    return super.kdvDahil;
  }

  @override
  set kdvDahil(bool value) {
    _$kdvDahilAtom.reportWrite(value, super.kdvDahil, () {
      super.kdvDahil = value;
    });
  }

  late final _$_BaseSiparislerGenelViewModelBaseActionController =
      ActionController(
          name: '_BaseSiparislerGenelViewModelBase', context: context);

  @override
  void changeKdvDahil(bool value) {
    final _$actionInfo = _$_BaseSiparislerGenelViewModelBaseActionController
        .startAction(name: '_BaseSiparislerGenelViewModelBase.changeKdvDahil');
    try {
      return super.changeKdvDahil(value);
    } finally {
      _$_BaseSiparislerGenelViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kdvDahil: ${kdvDahil}
    ''';
  }
}
