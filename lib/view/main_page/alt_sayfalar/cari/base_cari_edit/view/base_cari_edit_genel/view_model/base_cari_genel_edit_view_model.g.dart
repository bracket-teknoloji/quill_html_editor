// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_cari_genel_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseCariGenelEditViewModel on _BaseCariGenelEditViewModelBase, Store {
  late final _$isSahisFirmasiAtom = Atom(
      name: '_BaseCariGenelEditViewModelBase.isSahisFirmasi', context: context);

  @override
  bool get isSahisFirmasi {
    _$isSahisFirmasiAtom.reportRead();
    return super.isSahisFirmasi;
  }

  @override
  set isSahisFirmasi(bool value) {
    _$isSahisFirmasiAtom.reportWrite(value, super.isSahisFirmasi, () {
      super.isSahisFirmasi = value;
    });
  }

  late final _$isDovizliAtom =
      Atom(name: '_BaseCariGenelEditViewModelBase.isDovizli', context: context);

  @override
  bool get isDovizli {
    _$isDovizliAtom.reportRead();
    return super.isDovizli;
  }

  @override
  set isDovizli(bool value) {
    _$isDovizliAtom.reportWrite(value, super.isDovizli, () {
      super.isDovizli = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_BaseCariGenelEditViewModelBase.model', context: context);

  @override
  CariListesiModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CariListesiModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$_BaseCariGenelEditViewModelBaseActionController =
      ActionController(
          name: '_BaseCariGenelEditViewModelBase', context: context);

  @override
  void changeIsSahisFirmasi(bool value) {
    final _$actionInfo =
        _$_BaseCariGenelEditViewModelBaseActionController.startAction(
            name: '_BaseCariGenelEditViewModelBase.changeIsSahisFirmasi');
    try {
      return super.changeIsSahisFirmasi(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsDovizli(bool value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeIsDovizli');
    try {
      return super.changeIsDovizli(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeModel(CariListesiModel? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeModel');
    try {
      return super.changeModel(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModel(CariListesiModel? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSiradakiKod(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeSiradakiKod');
    try {
      return super.changeSiradakiKod(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKodu(String value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeKodu');
    try {
      return super.changeKodu(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCariTipi(BaseBottomSheetResponseModel value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeCariTipi');
    try {
      return super.changeCariTipi(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePlasiyer(PlasiyerList? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changePlasiyer');
    try {
      return super.changePlasiyer(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeOdemeTipi(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeOdemeTipi');
    try {
      return super.changeOdemeTipi(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeUlke(BaseBottomSheetResponseModel? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeUlke');
    try {
      return super.changeUlke(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAdi(String value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeAdi');
    try {
      return super.changeAdi(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSahisFirmasi: ${isSahisFirmasi},
isDovizli: ${isDovizli},
model: ${model}
    ''';
  }
}
