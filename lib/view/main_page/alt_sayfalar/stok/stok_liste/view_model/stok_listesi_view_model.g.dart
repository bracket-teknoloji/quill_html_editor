// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokListesiViewModel on _StokListesiViewModelBase, Store {
  Computed<StokBottomSheetModel>? _$getBottomSheetModelComputed;

  @override
  StokBottomSheetModel get getBottomSheetModel =>
      (_$getBottomSheetModelComputed ??= Computed<StokBottomSheetModel>(
              () => super.getBottomSheetModel,
              name: '_StokListesiViewModelBase.getBottomSheetModel'))
          .value;
  Computed<List<BaseGrupKoduModel>?>? _$grupKoduComputed;

  @override
  List<BaseGrupKoduModel>? get grupKodu => (_$grupKoduComputed ??=
          Computed<List<BaseGrupKoduModel>?>(() => super.grupKodu,
              name: '_StokListesiViewModelBase.grupKodu'))
      .value;
  Computed<List<BaseGrupKoduModel>?>? _$kod1Computed;

  @override
  List<BaseGrupKoduModel>? get kod1 =>
      (_$kod1Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod1,
              name: '_StokListesiViewModelBase.kod1'))
          .value;
  Computed<List<BaseGrupKoduModel>?>? _$kod2Computed;

  @override
  List<BaseGrupKoduModel>? get kod2 =>
      (_$kod2Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod2,
              name: '_StokListesiViewModelBase.kod2'))
          .value;
  Computed<List<BaseGrupKoduModel>?>? _$kod3Computed;

  @override
  List<BaseGrupKoduModel>? get kod3 =>
      (_$kod3Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod3,
              name: '_StokListesiViewModelBase.kod3'))
          .value;
  Computed<List<BaseGrupKoduModel>?>? _$kod4Computed;

  @override
  List<BaseGrupKoduModel>? get kod4 =>
      (_$kod4Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod4,
              name: '_StokListesiViewModelBase.kod4'))
          .value;
  Computed<List<BaseGrupKoduModel>?>? _$kod5Computed;

  @override
  List<BaseGrupKoduModel>? get kod5 =>
      (_$kod5Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod5,
              name: '_StokListesiViewModelBase.kod5'))
          .value;
  Computed<String?>? _$bakiyeComputed;

  @override
  String? get bakiye =>
      (_$bakiyeComputed ??= Computed<String?>(() => super.bakiye,
              name: '_StokListesiViewModelBase.bakiye'))
          .value;
  Computed<bool>? _$hasAnyFiltersComputed;

  @override
  bool get hasAnyFilters =>
      (_$hasAnyFiltersComputed ??= Computed<bool>(() => super.hasAnyFilters,
              name: '_StokListesiViewModelBase.hasAnyFilters'))
          .value;

  late final _$bakiyeGroupValueAtom = Atom(
      name: '_StokListesiViewModelBase.bakiyeGroupValue', context: context);

  @override
  String? get bakiyeGroupValue {
    _$bakiyeGroupValueAtom.reportRead();
    return super.bakiyeGroupValue;
  }

  @override
  set bakiyeGroupValue(String? value) {
    _$bakiyeGroupValueAtom.reportWrite(value, super.bakiyeGroupValue, () {
      super.bakiyeGroupValue = value;
    });
  }

  late final _$kategoriMiAtom =
      Atom(name: '_StokListesiViewModelBase.kategoriMi', context: context);

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

  late final _$grupNoAtom =
      Atom(name: '_StokListesiViewModelBase.grupNo', context: context);

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

  late final _$resimleriGosterAtom =
      Atom(name: '_StokListesiViewModelBase.resimleriGoster', context: context);

  @override
  String get resimleriGoster {
    _$resimleriGosterAtom.reportRead();
    return super.resimleriGoster;
  }

  @override
  set resimleriGoster(String value) {
    _$resimleriGosterAtom.reportWrite(value, super.resimleriGoster, () {
      super.resimleriGoster = value;
    });
  }

  late final _$isSearchBarOpenAtom =
      Atom(name: '_StokListesiViewModelBase.isSearchBarOpen', context: context);

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

  late final _$searchTextAtom =
      Atom(name: '_StokListesiViewModelBase.searchText', context: context);

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

  late final _$bottomSheetModelAtom = Atom(
      name: '_StokListesiViewModelBase.bottomSheetModel', context: context);

  @override
  StokBottomSheetModel get bottomSheetModel {
    _$bottomSheetModelAtom.reportRead();
    return super.bottomSheetModel;
  }

  @override
  set bottomSheetModel(StokBottomSheetModel value) {
    _$bottomSheetModelAtom.reportWrite(value, super.bottomSheetModel, () {
      super.bottomSheetModel = value;
    });
  }

  late final _$bottomSheetModelTempAtom = Atom(
      name: '_StokListesiViewModelBase.bottomSheetModelTemp', context: context);

  @override
  StokBottomSheetModel get bottomSheetModelTemp {
    _$bottomSheetModelTempAtom.reportRead();
    return super.bottomSheetModelTemp;
  }

  @override
  set bottomSheetModelTemp(StokBottomSheetModel value) {
    _$bottomSheetModelTempAtom.reportWrite(value, super.bottomSheetModelTemp,
        () {
      super.bottomSheetModelTemp = value;
    });
  }

  late final _$grupKodlariAtom =
      Atom(name: '_StokListesiViewModelBase.grupKodlari', context: context);

  @override
  ObservableList<BaseGrupKoduModel> get grupKodlari {
    _$grupKodlariAtom.reportRead();
    return super.grupKodlari;
  }

  @override
  set grupKodlari(ObservableList<BaseGrupKoduModel> value) {
    _$grupKodlariAtom.reportWrite(value, super.grupKodlari, () {
      super.grupKodlari = value;
    });
  }

  late final _$kategoriGrupKodlariAtom = Atom(
      name: '_StokListesiViewModelBase.kategoriGrupKodlari', context: context);

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

  late final _$observableListAtom =
      Atom(name: '_StokListesiViewModelBase.observableList', context: context);

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

  late final _$isScrollDownAtom =
      Atom(name: '_StokListesiViewModelBase.isScrollDown', context: context);

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

  late final _$siralamaAtom =
      Atom(name: '_StokListesiViewModelBase.siralama', context: context);

  @override
  String get siralama {
    _$siralamaAtom.reportRead();
    return super.siralama;
  }

  @override
  set siralama(String value) {
    _$siralamaAtom.reportWrite(value, super.siralama, () {
      super.siralama = value;
    });
  }

  late final _$changeScrollStatusAsyncAction = AsyncAction(
      '_StokListesiViewModelBase.changeScrollStatus',
      context: context);

  @override
  Future<void> changeScrollStatus(ScrollPosition position) {
    return _$changeScrollStatusAsyncAction
        .run(() => super.changeScrollStatus(position));
  }

  late final _$resetListAsyncAction =
      AsyncAction('_StokListesiViewModelBase.resetList', context: context);

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getGrupKodlariAsyncAction =
      AsyncAction('_StokListesiViewModelBase.getGrupKodlari', context: context);

  @override
  Future<void> getGrupKodlari() {
    return _$getGrupKodlariAsyncAction.run(() => super.getGrupKodlari());
  }

  late final _$getKategoriGrupKodlariAsyncAction = AsyncAction(
      '_StokListesiViewModelBase.getKategoriGrupKodlari',
      context: context);

  @override
  Future<void> getKategoriGrupKodlari() {
    return _$getKategoriGrupKodlariAsyncAction
        .run(() => super.getKategoriGrupKodlari());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_StokListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_StokListesiViewModelBaseActionController =
      ActionController(name: '_StokListesiViewModelBase', context: context);

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeSearchBarStatus');
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchList(List<StokDetayliAramaAlanlar>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setSearchList');
    try {
      return super.setSearchList(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSelectedArr() {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.resetSelectedArr');
    try {
      return super.resetSelectedArr();
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrGrupKodu(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrGrupKodu');
    try {
      return super.changeArrGrupKodu(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrGrupKoduTemp(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrGrupKoduTemp');
    try {
      return super.changeArrGrupKoduTemp(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod1(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod1');
    try {
      return super.changeArrKod1(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod1Temp(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod1Temp');
    try {
      return super.changeArrKod1Temp(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod2(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod2');
    try {
      return super.changeArrKod2(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod2Temp(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod2Temp');
    try {
      return super.changeArrKod2Temp(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod3(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod3');
    try {
      return super.changeArrKod3(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod3Temp(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod3Temp');
    try {
      return super.changeArrKod3Temp(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod4(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod4');
    try {
      return super.changeArrKod4(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod4Temp(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod4Temp');
    try {
      return super.changeArrKod4Temp(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod5(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod5');
    try {
      return super.changeArrKod5(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod5Temp(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeArrKod5Temp');
    try {
      return super.changeArrKod5Temp(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResimleriGoster() {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setResimleriGoster');
    try {
      return super.setResimleriGoster();
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGrupKodlari(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setGrupKodlari');
    try {
      return super.setGrupKodlari(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKategoriGrupKodlari(List<BaseGrupKoduModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setKategoriGrupKodlari');
    try {
      return super.setKategoriGrupKodlari(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<StokListesiModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setObservableList');
    try {
      return super.setObservableList(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addObservableList(List<StokListesiModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.addObservableList');
    try {
      return super.addObservableList(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsScrolledDown(bool value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeIsScrolledDown');
    try {
      return super.changeIsScrolledDown(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedWithIndex(int index) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setSelectedWithIndex');
    try {
      return super.setSelectedWithIndex(index);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBakiyeDurumu(String? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeBakiyeDurumu');
    try {
      return super.changeBakiyeDurumu(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBakiyeDurumuTemp(int? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.changeBakiyeDurumuTemp');
    try {
      return super.changeBakiyeDurumuTemp(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKategoriMi(bool value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setKategoriMi');
    try {
      return super.setKategoriMi(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGrupNo(int value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController
        .startAction(name: '_StokListesiViewModelBase.setGrupNo');
    try {
      return super.setGrupNo(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bakiyeGroupValue: ${bakiyeGroupValue},
kategoriMi: ${kategoriMi},
grupNo: ${grupNo},
resimleriGoster: ${resimleriGoster},
isSearchBarOpen: ${isSearchBarOpen},
searchText: ${searchText},
bottomSheetModel: ${bottomSheetModel},
bottomSheetModelTemp: ${bottomSheetModelTemp},
grupKodlari: ${grupKodlari},
kategoriGrupKodlari: ${kategoriGrupKodlari},
observableList: ${observableList},
isScrollDown: ${isScrollDown},
siralama: ${siralama},
getBottomSheetModel: ${getBottomSheetModel},
grupKodu: ${grupKodu},
kod1: ${kod1},
kod2: ${kod2},
kod3: ${kod3},
kod4: ${kod4},
kod5: ${kod5},
bakiye: ${bakiye},
hasAnyFilters: ${hasAnyFilters}
    ''';
  }
}
