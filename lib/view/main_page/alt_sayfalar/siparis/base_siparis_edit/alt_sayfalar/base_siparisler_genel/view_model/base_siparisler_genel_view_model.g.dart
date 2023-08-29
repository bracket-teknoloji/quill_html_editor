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

  late final _$modelAtom =
      Atom(name: '_BaseSiparislerGenelViewModelBase.model', context: context);

  @override
  BaseSiparisEditModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(BaseSiparisEditModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
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
  void setProjeKodu(BaseProjeModel? value) {
    final _$actionInfo = _$_BaseSiparislerGenelViewModelBaseActionController
        .startAction(name: '_BaseSiparislerGenelViewModelBase.setProjeKodu');
    try {
      return super.setProjeKodu(value);
    } finally {
      _$_BaseSiparislerGenelViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setKosulKodu(String? value) {
    final _$actionInfo = _$_BaseSiparislerGenelViewModelBaseActionController
        .startAction(name: '_BaseSiparislerGenelViewModelBase.setKosulKodu');
    try {
      return super.setKosulKodu(value);
    } finally {
      _$_BaseSiparislerGenelViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setOzelKod1(String? value) {
    final _$actionInfo = _$_BaseSiparislerGenelViewModelBaseActionController
        .startAction(name: '_BaseSiparislerGenelViewModelBase.setOzelKod1');
    try {
      return super.setOzelKod1(value);
    } finally {
      _$_BaseSiparislerGenelViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setOzelKod2(String? value) {
    final _$actionInfo = _$_BaseSiparislerGenelViewModelBaseActionController
        .startAction(name: '_BaseSiparislerGenelViewModelBase.setOzelKod2');
    try {
      return super.setOzelKod2(value);
    } finally {
      _$_BaseSiparislerGenelViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setOdemeKodu(String? value) {
    final _$actionInfo = _$_BaseSiparislerGenelViewModelBaseActionController
        .startAction(name: '_BaseSiparislerGenelViewModelBase.setOdemeKodu');
    try {
      return super.setOdemeKodu(value);
    } finally {
      _$_BaseSiparislerGenelViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyer(PlasiyerList? value) {
    final _$actionInfo = _$_BaseSiparislerGenelViewModelBaseActionController
        .startAction(name: '_BaseSiparislerGenelViewModelBase.setPlasiyer');
    try {
      return super.setPlasiyer(value);
    } finally {
      _$_BaseSiparislerGenelViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTopluDepoKodu(int? value) {
    final _$actionInfo =
        _$_BaseSiparislerGenelViewModelBaseActionController.startAction(
            name: '_BaseSiparislerGenelViewModelBase.setTopluDepoKodu');
    try {
      return super.setTopluDepoKodu(value);
    } finally {
      _$_BaseSiparislerGenelViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kdvDahil: ${kdvDahil},
model: ${model}
    ''';
  }
}
