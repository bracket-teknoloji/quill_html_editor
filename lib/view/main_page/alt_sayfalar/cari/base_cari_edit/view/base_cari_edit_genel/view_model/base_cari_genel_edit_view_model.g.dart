// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_cari_genel_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseCariGenelEditViewModel on _BaseCariGenelEditViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_BaseCariGenelEditViewModelBase.model', context: context);

  @override
  CariSaveRequestModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CariSaveRequestModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
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

  late final _$sehirlerAtom =
      Atom(name: '_BaseCariGenelEditViewModelBase.sehirler', context: context);

  @override
  List<CariSehirlerModel>? get sehirler {
    _$sehirlerAtom.reportRead();
    return super.sehirler;
  }

  @override
  set sehirler(List<CariSehirlerModel>? value) {
    _$sehirlerAtom.reportWrite(value, super.sehirler, () {
      super.sehirler = value;
    });
  }

  late final _$ulkelerAtom =
      Atom(name: '_BaseCariGenelEditViewModelBase.ulkeler', context: context);

  @override
  List<UlkeModel>? get ulkeler {
    _$ulkelerAtom.reportRead();
    return super.ulkeler;
  }

  @override
  set ulkeler(List<UlkeModel>? value) {
    _$ulkelerAtom.reportWrite(value, super.ulkeler, () {
      super.ulkeler = value;
    });
  }

  late final _$getFilterDataAsyncAction = AsyncAction(
      '_BaseCariGenelEditViewModelBase.getFilterData',
      context: context);

  @override
  Future<void> getFilterData() {
    return _$getFilterDataAsyncAction.run(() => super.getFilterData());
  }

  late final _$getUlkeDataAsyncAction = AsyncAction(
      '_BaseCariGenelEditViewModelBase.getUlkeData',
      context: context);

  @override
  Future<void> getUlkeData() {
    return _$getUlkeDataAsyncAction.run(() => super.getUlkeData());
  }

  late final _$_BaseCariGenelEditViewModelBaseActionController =
      ActionController(
          name: '_BaseCariGenelEditViewModelBase', context: context);

  @override
  void changeIslemKodu(int? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeIslemKodu');
    try {
      return super.changeIslemKodu(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void changeKodu(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeKodu');
    try {
      return super.changeKodu(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModel(CariSaveRequestModel? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCariTipi(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeCariTipi');
    try {
      return super.changeCariTipi(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIl(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeIl');
    try {
      return super.changeIl(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeWeb(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeWeb');
    try {
      return super.changeWeb(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEposta(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeEposta');
    try {
      return super.changeEposta(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeVergiDairesi(String? value) {
    final _$actionInfo =
        _$_BaseCariGenelEditViewModelBaseActionController.startAction(
            name: '_BaseCariGenelEditViewModelBase.changeVergiDairesi');
    try {
      return super.changeVergiDairesi(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeVergiNo(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeVergiNo');
    try {
      return super.changeVergiNo(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIlce(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeIlce');
    try {
      return super.changeIlce(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePostaKodu(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changePostaKodu');
    try {
      return super.changePostaKodu(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeAdres(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeAdres');
    try {
      return super.changeAdres(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTelefon(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeTelefon');
    try {
      return super.changeTelefon(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeVadeGunu(int? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeVadeGunu');
    try {
      return super.changeVadeGunu(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDovizTipi(DovizList? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeDovizTipi');
    try {
      return super.changeDovizTipi(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePlasiyer(String? value) {
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
  void changeUlke(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeUlke');
    try {
      return super.changeUlke(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBagliCari(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeBagliCari');
    try {
      return super.changeBagliCari(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAdi(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeAdi');
    try {
      return super.changeAdi(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBilgi(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeBilgi');
    try {
      return super.changeBilgi(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKosul(String? value) {
    final _$actionInfo = _$_BaseCariGenelEditViewModelBaseActionController
        .startAction(name: '_BaseCariGenelEditViewModelBase.changeKosul');
    try {
      return super.changeKosul(value);
    } finally {
      _$_BaseCariGenelEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
isDovizli: ${isDovizli},
isSahisFirmasi: ${isSahisFirmasi},
sehirler: ${sehirler},
ulkeler: ${ulkeler}
    ''';
  }
}
