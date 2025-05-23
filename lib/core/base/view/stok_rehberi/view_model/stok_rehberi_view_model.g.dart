// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokRehberiViewModel on _StokRehberiViewModelBase, Store {
  late final _$isSearchBarOpenAtom = Atom(name: '_StokRehberiViewModelBase.isSearchBarOpen', context: context);

  @override
  bool get isSearchBarOpen {
    _$isSearchBarOpenAtom.reportRead();
    return super.isSearchBarOpen;
  }

  @override
  set isSearchBarOpen(bool value) {
    _$isSearchBarOpenAtom.reportWrite(value, super.isSearchBarOpen, () {
      super.isSearchBarOpen = value;
    });
  }

  late final _$isScrollDownAtom = Atom(name: '_StokRehberiViewModelBase.isScrollDown', context: context);

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

  late final _$searchTextAtom = Atom(name: '_StokRehberiViewModelBase.searchText', context: context);

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

  late final _$kategoriMiAtom = Atom(name: '_StokRehberiViewModelBase.kategoriMi', context: context);

  @override
  bool get kategoriMi {
    _$kategoriMiAtom.reportRead();
    return super.kategoriMi;
  }

  @override
  set kategoriMi(bool value) {
    _$kategoriMiAtom.reportWrite(value, super.kategoriMi, () {
      super.kategoriMi = value;
    });
  }

  late final _$grupNoAtom = Atom(name: '_StokRehberiViewModelBase.grupNo', context: context);

  @override
  int get grupNo {
    _$grupNoAtom.reportRead();
    return super.grupNo;
  }

  @override
  set grupNo(int value) {
    _$grupNoAtom.reportWrite(value, super.grupNo, () {
      super.grupNo = value;
    });
  }

  late final _$grupKodlariAtom = Atom(name: '_StokRehberiViewModelBase.grupKodlari', context: context);

  @override
  ObservableList<BaseGrupKoduModel>? get grupKodlari {
    _$grupKodlariAtom.reportRead();
    return super.grupKodlari;
  }

  @override
  set grupKodlari(ObservableList<BaseGrupKoduModel>? value) {
    _$grupKodlariAtom.reportWrite(value, super.grupKodlari, () {
      super.grupKodlari = value;
    });
  }

  late final _$kategoriGrupKodlariAtom = Atom(name: '_StokRehberiViewModelBase.kategoriGrupKodlari', context: context);

  @override
  ObservableList<BaseGrupKoduModel>? get kategoriGrupKodlari {
    _$kategoriGrupKodlariAtom.reportRead();
    return super.kategoriGrupKodlari;
  }

  @override
  set kategoriGrupKodlari(ObservableList<BaseGrupKoduModel>? value) {
    _$kategoriGrupKodlariAtom.reportWrite(value, super.kategoriGrupKodlari, () {
      super.kategoriGrupKodlari = value;
    });
  }

  late final _$observableListAtom = Atom(name: '_StokRehberiViewModelBase.observableList', context: context);

  @override
  ObservableList<StokListesiModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<StokListesiModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$resetListAsyncAction = AsyncAction('_StokRehberiViewModelBase.resetList', context: context);

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getDataAsyncAction = AsyncAction('_StokRehberiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$getGrupKodlariAsyncAction = AsyncAction('_StokRehberiViewModelBase.getGrupKodlari', context: context);

  @override
  Future<void> getGrupKodlari() {
    return _$getGrupKodlariAsyncAction.run(() => super.getGrupKodlari());
  }

  late final _$getKategoriGrupKodlariAsyncAction = AsyncAction(
    '_StokRehberiViewModelBase.getKategoriGrupKodlari',
    context: context,
  );

  @override
  Future<void> getKategoriGrupKodlari() {
    return _$getKategoriGrupKodlariAsyncAction.run(() => super.getKategoriGrupKodlari());
  }

  late final _$_StokRehberiViewModelBaseActionController = ActionController(
    name: '_StokRehberiViewModelBase',
    context: context,
  );

  @override
  void setGrupKodlari(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setGrupKodlari',
    );
    try {
      return super.setGrupKodlari(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsScrolledDown(bool value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.changeIsScrolledDown',
    );
    try {
      return super.changeIsScrolledDown(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod1(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.changeArrKod1',
    );
    try {
      return super.changeArrKod1(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod2(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.changeArrKod2',
    );
    try {
      return super.changeArrKod2(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod3(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.changeArrKod3',
    );
    try {
      return super.changeArrKod3(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod4(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.changeArrKod4',
    );
    try {
      return super.changeArrKod4(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod5(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.changeArrKod5',
    );
    try {
      return super.changeArrKod5(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchList(List<StokDetayliAramaAlanlar>? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setSearchList',
    );
    try {
      return super.setSearchList(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<StokListesiModel>? list) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addObservableList(List<StokListesiModel>? list) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.addObservableList',
    );
    try {
      return super.addObservableList(list);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setSiralama',
    );
    try {
      return super.setSiralama(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGrupKodu(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setGrupKodu',
    );
    try {
      return super.setGrupKodu(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFiyatGrubu(String? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setFiyatGrubu',
    );
    try {
      return super.setFiyatGrubu(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOzelKod1(String? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setOzelKod1',
    );
    try {
      return super.setOzelKod1(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOzelKod2(String? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setOzelKod2',
    );
    try {
      return super.setOzelKod2(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedStokModel(String? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setSelectedStokModel',
    );
    try {
      return super.setSelectedStokModel(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKategoriGrupKodlari(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setKategoriGrupKodlari',
    );
    try {
      return super.setKategoriGrupKodlari(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKategoriMi(bool value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setKategoriMi',
    );
    try {
      return super.setKategoriMi(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGrupNo(int value) {
    final _$actionInfo = _$_StokRehberiViewModelBaseActionController.startAction(
      name: '_StokRehberiViewModelBase.setGrupNo',
    );
    try {
      return super.setGrupNo(value);
    } finally {
      _$_StokRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearchBarOpen: ${isSearchBarOpen},
isScrollDown: ${isScrollDown},
searchText: ${searchText},
kategoriMi: ${kategoriMi},
grupNo: ${grupNo},
grupKodlari: ${grupKodlari},
kategoriGrupKodlari: ${kategoriGrupKodlari},
observableList: ${observableList}
    ''';
  }
}
