// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_islemleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KasaIslemleriViewModel on _KasaIslemleriViewModelBase, Store {
  Computed<ObservableList<KasaIslemleriModel>?>? _$getKasaIslemleriListesiComputed;

  @override
  ObservableList<KasaIslemleriModel>? get getKasaIslemleriListesi =>
      (_$getKasaIslemleriListesiComputed ??= Computed<ObservableList<KasaIslemleriModel>?>(
        () => super.getKasaIslemleriListesi,
        name: '_KasaIslemleriViewModelBase.getKasaIslemleriListesi',
      )).value;
  Computed<bool>? _$getAnyFilterComputed;

  @override
  bool get getAnyFilter => (_$getAnyFilterComputed ??= Computed<bool>(
    () => super.getAnyFilter,
    name: '_KasaIslemleriViewModelBase.getAnyFilter',
  )).value;

  late final _$kasaIslemleriRequestModelAtom = Atom(
    name: '_KasaIslemleriViewModelBase.kasaIslemleriRequestModel',
    context: context,
  );

  @override
  KasaIslemleriRequestModel get kasaIslemleriRequestModel {
    _$kasaIslemleriRequestModelAtom.reportRead();
    return super.kasaIslemleriRequestModel;
  }

  @override
  set kasaIslemleriRequestModel(KasaIslemleriRequestModel value) {
    _$kasaIslemleriRequestModelAtom.reportWrite(
      value,
      super.kasaIslemleriRequestModel,
      () {
        super.kasaIslemleriRequestModel = value;
      },
    );
  }

  late final _$paramDataAtom = Atom(
    name: '_KasaIslemleriViewModelBase.paramData',
    context: context,
  );

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

  late final _$hesapTipiGroupValueAtom = Atom(
    name: '_KasaIslemleriViewModelBase.hesapTipiGroupValue',
    context: context,
  );

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

  late final _$isScrollDownAtom = Atom(
    name: '_KasaIslemleriViewModelBase.isScrollDown',
    context: context,
  );

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

  late final _$dahaVarMiAtom = Atom(
    name: '_KasaIslemleriViewModelBase.dahaVarMi',
    context: context,
  );

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

  late final _$kasaIslemleriListesiAtom = Atom(
    name: '_KasaIslemleriViewModelBase.kasaIslemleriListesi',
    context: context,
  );

  @override
  ObservableList<KasaIslemleriModel>? get kasaIslemleriListesi {
    _$kasaIslemleriListesiAtom.reportRead();
    return super.kasaIslemleriListesi;
  }

  @override
  set kasaIslemleriListesi(ObservableList<KasaIslemleriModel>? value) {
    _$kasaIslemleriListesiAtom.reportWrite(
      value,
      super.kasaIslemleriListesi,
      () {
        super.kasaIslemleriListesi = value;
      },
    );
  }

  late final _$searchBarAtom = Atom(
    name: '_KasaIslemleriViewModelBase.searchBar',
    context: context,
  );

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

  late final _$searchTextAtom = Atom(
    name: '_KasaIslemleriViewModelBase.searchText',
    context: context,
  );

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

  late final _$resetPageAsyncAction = AsyncAction(
    '_KasaIslemleriViewModelBase.resetPage',
    context: context,
  );

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_KasaIslemleriViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_KasaIslemleriViewModelBaseActionController = ActionController(
    name: '_KasaIslemleriViewModelBase',
    context: context,
  );

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setDahaVarMi',
    );
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setIsScrollDown',
    );
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.changeSearchBar',
    );
    try {
      return super.changeSearchBar();
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementSayfa() {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.incrementSayfa',
    );
    try {
      return super.incrementSayfa();
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.resetSayfa',
    );
    try {
      return super.resetSayfa();
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslamaTarihi(String? value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setBaslamaTarihi',
    );
    try {
      return super.setBaslamaTarihi(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setBitisTarihi',
    );
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaIslemleriListesi(List<KasaIslemleriModel>? value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setKasaIslemleriListesi',
    );
    try {
      return super.setKasaIslemleriListesi(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addKasaIslemleriListesi(List<KasaIslemleriModel>? value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.addKasaIslemleriListesi',
    );
    try {
      return super.addKasaIslemleriListesi(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapTipi(String? value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setHesapTipi',
    );
    try {
      return super.setHesapTipi(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaKodu(KasaList? value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setKasaKodu',
    );
    try {
      return super.setKasaKodu(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(CariListesiModel? value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setCariKodu',
    );
    try {
      return super.setCariKodu(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(PlasiyerList? value) {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.setPlasiyerKodu',
    );
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilters() {
    final _$actionInfo = _$_KasaIslemleriViewModelBaseActionController.startAction(
      name: '_KasaIslemleriViewModelBase.clearFilters',
    );
    try {
      return super.clearFilters();
    } finally {
      _$_KasaIslemleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kasaIslemleriRequestModel: ${kasaIslemleriRequestModel},
paramData: ${paramData},
hesapTipiGroupValue: ${hesapTipiGroupValue},
isScrollDown: ${isScrollDown},
dahaVarMi: ${dahaVarMi},
kasaIslemleriListesi: ${kasaIslemleriListesi},
searchBar: ${searchBar},
searchText: ${searchText},
getKasaIslemleriListesi: ${getKasaIslemleriListesi},
getAnyFilter: ${getAnyFilter}
    ''';
  }
}
