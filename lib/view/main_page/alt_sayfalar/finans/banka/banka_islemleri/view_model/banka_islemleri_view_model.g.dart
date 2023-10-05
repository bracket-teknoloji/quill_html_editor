// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_islemleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankaIslemleriViewModel on _BankaIslemleriViewModelBase, Store {
  late final _$bankaIslemleriRequestModelAtom = Atom(
      name: '_BankaIslemleriViewModelBase.bankaIslemleriRequestModel',
      context: context);

  @override
  BankaIslemleriRequestModel get bankaIslemleriRequestModel {
    _$bankaIslemleriRequestModelAtom.reportRead();
    return super.bankaIslemleriRequestModel;
  }

  @override
  set bankaIslemleriRequestModel(BankaIslemleriRequestModel value) {
    _$bankaIslemleriRequestModelAtom
        .reportWrite(value, super.bankaIslemleriRequestModel, () {
      super.bankaIslemleriRequestModel = value;
    });
  }

  late final _$hesapTipiGroupValueAtom = Atom(
      name: '_BankaIslemleriViewModelBase.hesapTipiGroupValue',
      context: context);

  @override
  String? get hesapTipiGroupValue {
    _$hesapTipiGroupValueAtom.reportRead();
    return super.hesapTipiGroupValue;
  }

  @override
  set hesapTipiGroupValue(String? value) {
    _$hesapTipiGroupValueAtom.reportWrite(value, super.hesapTipiGroupValue, () {
      super.hesapTipiGroupValue = value;
    });
  }

  late final _$paramDataAtom =
      Atom(name: '_BankaIslemleriViewModelBase.paramData', context: context);

  @override
  ObservableMap<String, dynamic>? get paramData {
    _$paramDataAtom.reportRead();
    return super.paramData;
  }

  @override
  set paramData(ObservableMap<String, dynamic>? value) {
    _$paramDataAtom.reportWrite(value, super.paramData, () {
      super.paramData = value;
    });
  }

  late final _$isScrollDownAtom =
      Atom(name: '_BankaIslemleriViewModelBase.isScrollDown', context: context);

  @override
  bool get isScrollDown {
    _$isScrollDownAtom.reportRead();
    return super.isScrollDown;
  }

  @override
  set isScrollDown(bool value) {
    _$isScrollDownAtom.reportWrite(value, super.isScrollDown, () {
      super.isScrollDown = value;
    });
  }

  late final _$dahaVarMiAtom =
      Atom(name: '_BankaIslemleriViewModelBase.dahaVarMi', context: context);

  @override
  bool get dahaVarMi {
    _$dahaVarMiAtom.reportRead();
    return super.dahaVarMi;
  }

  @override
  set dahaVarMi(bool value) {
    _$dahaVarMiAtom.reportWrite(value, super.dahaVarMi, () {
      super.dahaVarMi = value;
    });
  }

  late final _$searchBarAtom =
      Atom(name: '_BankaIslemleriViewModelBase.searchBar', context: context);

  @override
  bool get searchBar {
    _$searchBarAtom.reportRead();
    return super.searchBar;
  }

  @override
  set searchBar(bool value) {
    _$searchBarAtom.reportWrite(value, super.searchBar, () {
      super.searchBar = value;
    });
  }

  late final _$bankaIslemleriListesiAtom = Atom(
      name: '_BankaIslemleriViewModelBase.bankaIslemleriListesi',
      context: context);

  @override
  ObservableList<BankaIslemleriModel>? get bankaIslemleriListesi {
    _$bankaIslemleriListesiAtom.reportRead();
    return super.bankaIslemleriListesi;
  }

  @override
  set bankaIslemleriListesi(ObservableList<BankaIslemleriModel>? value) {
    _$bankaIslemleriListesiAtom.reportWrite(value, super.bankaIslemleriListesi,
        () {
      super.bankaIslemleriListesi = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_BankaIslemleriViewModelBase.searchText', context: context);

  @override
  String? get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String? value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$resetPageAsyncAction =
      AsyncAction('_BankaIslemleriViewModelBase.resetPage', context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_BankaIslemleriViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_BankaIslemleriViewModelBaseActionController =
      ActionController(name: '_BankaIslemleriViewModelBase', context: context);

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.setIsScrollDown');
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementSayfa() {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.incrementSayfa');
    try {
      return super.incrementSayfa();
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslamaTarihi(String? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.setBaslamaTarihi');
    try {
      return super.setBaslamaTarihi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.setBitisTarihi');
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankaIslemleriListesi(List<BankaIslemleriModel>? value) {
    final _$actionInfo =
        _$_BankaIslemleriViewModelBaseActionController.startAction(
            name: '_BankaIslemleriViewModelBase.setBankaIslemleriListesi');
    try {
      return super.setBankaIslemleriListesi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addBankaIslemleriListesi(List<BankaIslemleriModel>? value) {
    final _$actionInfo =
        _$_BankaIslemleriViewModelBaseActionController.startAction(
            name: '_BankaIslemleriViewModelBase.addBankaIslemleriListesi');
    try {
      return super.addBankaIslemleriListesi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapTipi(String? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.setHesapTipi');
    try {
      return super.setHesapTipi(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaKodu(KasaList? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.setKasaKodu');
    try {
      return super.setKasaKodu(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(CariListesiModel? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(PlasiyerList? value) {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_BankaIslemleriViewModelBaseActionController
        .startAction(name: '_BankaIslemleriViewModelBase.clearFilters');
    try {
      return super.clearFilters();
    } finally {
      _$_BankaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bankaIslemleriRequestModel: ${bankaIslemleriRequestModel},
hesapTipiGroupValue: ${hesapTipiGroupValue},
paramData: ${paramData},
isScrollDown: ${isScrollDown},
dahaVarMi: ${dahaVarMi},
searchBar: ${searchBar},
bankaIslemleriListesi: ${bankaIslemleriListesi},
searchText: ${searchText}
    ''';
  }
}
