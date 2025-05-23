// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariRehberiViewModel on _CariRehberiViewModelBase, Store {
  Computed<List<BaseGrupKoduModel>?>? _$grupKodlari1Computed;

  @override
  List<BaseGrupKoduModel>? get grupKodlari1 => (_$grupKodlari1Computed ??= Computed<List<BaseGrupKoduModel>?>(
    () => super.grupKodlari1,
    name: '_CariRehberiViewModelBase.grupKodlari1',
  )).value;
  Computed<List<BaseGrupKoduModel>?>? _$grupKodlari2Computed;

  @override
  List<BaseGrupKoduModel>? get grupKodlari2 => (_$grupKodlari2Computed ??= Computed<List<BaseGrupKoduModel>?>(
    () => super.grupKodlari2,
    name: '_CariRehberiViewModelBase.grupKodlari2',
  )).value;
  Computed<List<BaseGrupKoduModel>?>? _$grupKodlari3Computed;

  @override
  List<BaseGrupKoduModel>? get grupKodlari3 => (_$grupKodlari3Computed ??= Computed<List<BaseGrupKoduModel>?>(
    () => super.grupKodlari3,
    name: '_CariRehberiViewModelBase.grupKodlari3',
  )).value;
  Computed<List<BaseGrupKoduModel>?>? _$grupKodlari4Computed;

  @override
  List<BaseGrupKoduModel>? get grupKodlari4 => (_$grupKodlari4Computed ??= Computed<List<BaseGrupKoduModel>?>(
    () => super.grupKodlari4,
    name: '_CariRehberiViewModelBase.grupKodlari4',
  )).value;
  Computed<List<BaseGrupKoduModel>?>? _$grupKodlari5Computed;

  @override
  List<BaseGrupKoduModel>? get grupKodlari5 => (_$grupKodlari5Computed ??= Computed<List<BaseGrupKoduModel>?>(
    () => super.grupKodlari5,
    name: '_CariRehberiViewModelBase.grupKodlari5',
  )).value;

  late final _$isSearchBarOpenAtom = Atom(name: '_CariRehberiViewModelBase.isSearchBarOpen', context: context);

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

  late final _$searchTextAtom = Atom(name: '_CariRehberiViewModelBase.searchText', context: context);

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

  late final _$isScrollDownAtom = Atom(name: '_CariRehberiViewModelBase.isScrollDown', context: context);

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

  late final _$observableListAtom = Atom(name: '_CariRehberiViewModelBase.observableList', context: context);

  @override
  ObservableList<CariListesiModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<CariListesiModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$sehirlerAtom = Atom(name: '_CariRehberiViewModelBase.sehirler', context: context);

  @override
  ObservableList<CariSehirlerModel>? get sehirler {
    _$sehirlerAtom.reportRead();
    return super.sehirler;
  }

  @override
  set sehirler(ObservableList<CariSehirlerModel>? value) {
    _$sehirlerAtom.reportWrite(value, super.sehirler, () {
      super.sehirler = value;
    });
  }

  late final _$grupKodlariAtom = Atom(name: '_CariRehberiViewModelBase.grupKodlari', context: context);

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

  late final _$cariListesiRequestModelAtom = Atom(
    name: '_CariRehberiViewModelBase.cariListesiRequestModel',
    context: context,
  );

  @override
  CariListesiRequestModel? get cariListesiRequestModel {
    _$cariListesiRequestModelAtom.reportRead();
    return super.cariListesiRequestModel;
  }

  @override
  set cariListesiRequestModel(CariListesiRequestModel? value) {
    _$cariListesiRequestModelAtom.reportWrite(value, super.cariListesiRequestModel, () {
      super.cariListesiRequestModel = value;
    });
  }

  late final _$changeScrollStatusAsyncAction = AsyncAction(
    '_CariRehberiViewModelBase.changeScrollStatus',
    context: context,
  );

  @override
  Future<void> changeScrollStatus(ScrollPosition position) {
    return _$changeScrollStatusAsyncAction.run(() => super.changeScrollStatus(position));
  }

  late final _$resetListAsyncAction = AsyncAction('_CariRehberiViewModelBase.resetList', context: context);

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getDataAsyncAction = AsyncAction('_CariRehberiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$getSehirBilgileriAsyncAction = AsyncAction(
    '_CariRehberiViewModelBase.getSehirBilgileri',
    context: context,
  );

  @override
  Future<void> getSehirBilgileri() {
    return _$getSehirBilgileriAsyncAction.run(() => super.getSehirBilgileri());
  }

  late final _$getGrupKodlariAsyncAction = AsyncAction('_CariRehberiViewModelBase.getGrupKodlari', context: context);

  @override
  Future<void> getGrupKodlari() {
    return _$getGrupKodlariAsyncAction.run(() => super.getGrupKodlari());
  }

  late final _$_CariRehberiViewModelBaseActionController = ActionController(
    name: '_CariRehberiViewModelBase',
    context: context,
  );

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeSearchBarStatus',
    );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMenuKodu(String? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.setMenuKodu',
    );
    try {
      return super.setMenuKodu(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeTuru(String? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.setBelgeTuru',
    );
    try {
      return super.setBelgeTuru(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiparisKarsilanmaDurumu(String? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.setSiparisKarsilanmaDurumu',
    );
    try {
      return super.setSiparisKarsilanmaDurumu(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsScrollDown(bool value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeIsScrollDown',
    );
    try {
      return super.changeIsScrollDown(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<CariListesiModel>? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addObservableList(List<CariListesiModel>? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.addObservableList',
    );
    try {
      return super.addObservableList(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBagliCariKodu(String? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeBagliCariKodu',
    );
    try {
      return super.changeBagliCariKodu(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSehir(String? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeSehir',
    );
    try {
      return super.changeSehir(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIlce(String? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeIlce',
    );
    try {
      return super.changeIlce(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTipi(String? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeTipi',
    );
    try {
      return super.changeTipi(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod1(List<String>? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeKod1',
    );
    try {
      return super.changeKod1(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod2(List<String>? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeKod2',
    );
    try {
      return super.changeKod2(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod3(List<String>? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeKod3',
    );
    try {
      return super.changeKod3(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod4(List<String>? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeKod4',
    );
    try {
      return super.changeKod4(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod5(List<String>? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeKod5',
    );
    try {
      return super.changeKod5(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSiralama(String? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.changeSiralama',
    );
    try {
      return super.changeSiralama(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_CariRehberiViewModelBaseActionController.startAction(
      name: '_CariRehberiViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_CariRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearchBarOpen: ${isSearchBarOpen},
searchText: ${searchText},
isScrollDown: ${isScrollDown},
observableList: ${observableList},
sehirler: ${sehirler},
grupKodlari: ${grupKodlari},
cariListesiRequestModel: ${cariListesiRequestModel},
grupKodlari1: ${grupKodlari1},
grupKodlari2: ${grupKodlari2},
grupKodlari3: ${grupKodlari3},
grupKodlari4: ${grupKodlari4},
grupKodlari5: ${grupKodlari5}
    ''';
  }
}
