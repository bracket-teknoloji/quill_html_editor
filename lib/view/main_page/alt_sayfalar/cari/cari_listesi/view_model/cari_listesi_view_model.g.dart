// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariListesiViewModel on _CariListesiViewModelBase, Store {
  Computed<bool>? _$getRotaComputed;

  @override
  bool get getRota => (_$getRotaComputed ??= Computed<bool>(() => super.getRota,
          name: '_CariListesiViewModelBase.getRota'))
      .value;
  Computed<Map<String, dynamic>>? _$getCariRequestModelComputed;

  @override
  Map<String, dynamic> get getCariRequestModel =>
      (_$getCariRequestModelComputed ??= Computed<Map<String, dynamic>>(
              () => super.getCariRequestModel,
              name: '_CariListesiViewModelBase.getCariRequestModel'))
          .value;
  Computed<ObservableList<BaseGrupKoduModel>?>? _$getGrupKod0Computed;

  @override
  ObservableList<BaseGrupKoduModel>? get getGrupKod0 =>
      (_$getGrupKod0Computed ??= Computed<ObservableList<BaseGrupKoduModel>?>(
              () => super.getGrupKod0,
              name: '_CariListesiViewModelBase.getGrupKod0'))
          .value;
  Computed<ObservableList<BaseGrupKoduModel>?>? _$getGrupKod1Computed;

  @override
  ObservableList<BaseGrupKoduModel>? get getGrupKod1 =>
      (_$getGrupKod1Computed ??= Computed<ObservableList<BaseGrupKoduModel>?>(
              () => super.getGrupKod1,
              name: '_CariListesiViewModelBase.getGrupKod1'))
          .value;
  Computed<ObservableList<BaseGrupKoduModel>?>? _$getGrupKod2Computed;

  @override
  ObservableList<BaseGrupKoduModel>? get getGrupKod2 =>
      (_$getGrupKod2Computed ??= Computed<ObservableList<BaseGrupKoduModel>?>(
              () => super.getGrupKod2,
              name: '_CariListesiViewModelBase.getGrupKod2'))
          .value;
  Computed<ObservableList<BaseGrupKoduModel>?>? _$getGrupKod3Computed;

  @override
  ObservableList<BaseGrupKoduModel>? get getGrupKod3 =>
      (_$getGrupKod3Computed ??= Computed<ObservableList<BaseGrupKoduModel>?>(
              () => super.getGrupKod3,
              name: '_CariListesiViewModelBase.getGrupKod3'))
          .value;
  Computed<ObservableList<BaseGrupKoduModel>?>? _$getGrupKod4Computed;

  @override
  ObservableList<BaseGrupKoduModel>? get getGrupKod4 =>
      (_$getGrupKod4Computed ??= Computed<ObservableList<BaseGrupKoduModel>?>(
              () => super.getGrupKod4,
              name: '_CariListesiViewModelBase.getGrupKod4'))
          .value;
  Computed<ObservableList<BaseGrupKoduModel>?>? _$getGrupKod5Computed;

  @override
  ObservableList<BaseGrupKoduModel>? get getGrupKod5 =>
      (_$getGrupKod5Computed ??= Computed<ObservableList<BaseGrupKoduModel>?>(
              () => super.getGrupKod5,
              name: '_CariListesiViewModelBase.getGrupKod5'))
          .value;
  Computed<bool>? _$hasAnyFiltersComputed;

  @override
  bool get hasAnyFilters =>
      (_$hasAnyFiltersComputed ??= Computed<bool>(() => super.hasAnyFilters,
              name: '_CariListesiViewModelBase.hasAnyFilters'))
          .value;

  late final _$paramDataAtom =
      Atom(name: '_CariListesiViewModelBase.paramData', context: context);

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

  late final _$errorTextAtom =
      Atom(name: '_CariListesiViewModelBase.errorText', context: context);

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$isScrollDownAtom =
      Atom(name: '_CariListesiViewModelBase.isScrollDown', context: context);

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

  late final _$searchBarAtom =
      Atom(name: '_CariListesiViewModelBase.searchBar', context: context);

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

  late final _$aramaAtom =
      Atom(name: '_CariListesiViewModelBase.arama', context: context);

  @override
  String get arama {
    _$aramaAtom.reportRead();
    return super.arama;
  }

  @override
  set arama(String value) {
    _$aramaAtom.reportWrite(value, super.arama, () {
      super.arama = value;
    });
  }

  late final _$observableListAtom =
      Atom(name: '_CariListesiViewModelBase.observableList', context: context);

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

  late final _$kodlariGosterAtom =
      Atom(name: '_CariListesiViewModelBase.kodlariGoster', context: context);

  @override
  bool get kodlariGoster {
    _$kodlariGosterAtom.reportRead();
    return super.kodlariGoster;
  }

  @override
  set kodlariGoster(bool value) {
    _$kodlariGosterAtom.reportWrite(value, super.kodlariGoster, () {
      super.kodlariGoster = value;
    });
  }

  late final _$grupKodlariAtom =
      Atom(name: '_CariListesiViewModelBase.grupKodlari', context: context);

  @override
  List<BaseGrupKoduModel>? get grupKodlari {
    _$grupKodlariAtom.reportRead();
    return super.grupKodlari;
  }

  @override
  set grupKodlari(List<BaseGrupKoduModel>? value) {
    _$grupKodlariAtom.reportWrite(value, super.grupKodlari, () {
      super.grupKodlari = value;
    });
  }

  late final _$sehirlerAtom =
      Atom(name: '_CariListesiViewModelBase.sehirler', context: context);

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

  late final _$cariRequestModelAtom = Atom(
      name: '_CariListesiViewModelBase.cariRequestModel', context: context);

  @override
  CariRequestModel get cariRequestModel {
    _$cariRequestModelAtom.reportRead();
    return super.cariRequestModel;
  }

  @override
  set cariRequestModel(CariRequestModel value) {
    _$cariRequestModelAtom.reportWrite(value, super.cariRequestModel, () {
      super.cariRequestModel = value;
    });
  }

  late final _$cariRequestModelTempAtom = Atom(
      name: '_CariListesiViewModelBase.cariRequestModelTemp', context: context);

  @override
  CariRequestModel get cariRequestModelTemp {
    _$cariRequestModelTempAtom.reportRead();
    return super.cariRequestModelTemp;
  }

  @override
  set cariRequestModelTemp(CariRequestModel value) {
    _$cariRequestModelTempAtom.reportWrite(value, super.cariRequestModelTemp,
        () {
      super.cariRequestModelTemp = value;
    });
  }

  late final _$changeScrollStatusAsyncAction = AsyncAction(
      '_CariListesiViewModelBase.changeScrollStatus',
      context: context);

  @override
  Future<void> changeScrollStatus(ScrollPosition position) {
    return _$changeScrollStatusAsyncAction
        .run(() => super.changeScrollStatus(position));
  }

  late final _$resetListAsyncAction =
      AsyncAction('_CariListesiViewModelBase.resetList', context: context);

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getKodAsyncAction =
      AsyncAction('_CariListesiViewModelBase.getKod', context: context);

  @override
  Future<void> getKod() {
    return _$getKodAsyncAction.run(() => super.getKod());
  }

  late final _$getFilterDataAsyncAction =
      AsyncAction('_CariListesiViewModelBase.getFilterData', context: context);

  @override
  Future<void> getFilterData() {
    return _$getFilterDataAsyncAction.run(() => super.getFilterData());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_CariListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_CariListesiViewModelBaseActionController =
      ActionController(name: '_CariListesiViewModelBase', context: context);

  @override
  void changeKodlariGoster() {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeKodlariGoster');
    try {
      return super.changeKodlariGoster();
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRota(bool value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.setRota');
    try {
      return super.setRota(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.increaseSayfa');
    try {
      return super.increaseSayfa();
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArama(String value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArama');
    try {
      return super.changeArama(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<CariListesiModel>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.setObservableList');
    try {
      return super.setObservableList(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParamData(Map<String, dynamic>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.setParamData');
    try {
      return super.setParamData(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addObservableList(List<CariListesiModel>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.addObservableList');
    try {
      return super.addObservableList(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDahaVarMi(bool value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeDahaVarMi');
    try {
      return super.changeDahaVarMi(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSiralama(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeSiralama');
    try {
      return super.changeSiralama(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFilterText(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeFilterText');
    try {
      return super.changeFilterText(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFilterBakiye(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeFilterBakiye');
    try {
      return super.changeFilterBakiye(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrPlasiyerKodu(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrPlasiyerKodu');
    try {
      return super.changeArrPlasiyerKodu(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrGrupKodu(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrGrupKodu');
    try {
      return super.changeArrGrupKodu(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrSehir(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrSehir');
    try {
      return super.changeArrSehir(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod0(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod0');
    try {
      return super.changeArrKod0(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod1(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod1');
    try {
      return super.changeArrKod1(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod2(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod2');
    try {
      return super.changeArrKod2(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod3(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod3');
    try {
      return super.changeArrKod3(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod4(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod4');
    try {
      return super.changeArrKod4(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod5(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod5');
    try {
      return super.changeArrKod5(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIlce(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeIlce');
    try {
      return super.changeIlce(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCariTipi(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeCariTipi');
    try {
      return super.changeCariTipi(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSiralamaTemp(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeSiralamaTemp');
    try {
      return super.changeSiralamaTemp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFilterTextTemp(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeFilterTextTemp');
    try {
      return super.changeFilterTextTemp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFilterBakiyeTemp(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeFilterBakiyeTemp');
    try {
      return super.changeFilterBakiyeTemp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrPlasiyerKoduTemp(List<String>? value) {
    final _$actionInfo =
        _$_CariListesiViewModelBaseActionController.startAction(
            name: '_CariListesiViewModelBase.changeArrPlasiyerKoduTemp');
    try {
      return super.changeArrPlasiyerKoduTemp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrGrupKoduTemp(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrGrupKoduTemp');
    try {
      return super.changeArrGrupKoduTemp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrSehirTemp(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrSehirTemp');
    try {
      return super.changeArrSehirTemp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod0Temp(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod0Temp');
    try {
      return super.changeArrKod0Temp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod1Temp(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod1Temp');
    try {
      return super.changeArrKod1Temp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod2Temp(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod2Temp');
    try {
      return super.changeArrKod2Temp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod3Temp(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod3Temp');
    try {
      return super.changeArrKod3Temp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod4Temp(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod4Temp');
    try {
      return super.changeArrKod4Temp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod5Temp(List<String>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeArrKod5Temp');
    try {
      return super.changeArrKod5Temp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIlceTemp(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeIlceTemp');
    try {
      return super.changeIlceTemp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCariTipiTemp(String? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeCariTipiTemp');
    try {
      return super.changeCariTipiTemp(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilter() {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.resetFilter');
    try {
      return super.resetFilter();
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paramData: ${paramData},
errorText: ${errorText},
isScrollDown: ${isScrollDown},
searchBar: ${searchBar},
arama: ${arama},
observableList: ${observableList},
kodlariGoster: ${kodlariGoster},
grupKodlari: ${grupKodlari},
sehirler: ${sehirler},
cariRequestModel: ${cariRequestModel},
cariRequestModelTemp: ${cariRequestModelTemp},
getRota: ${getRota},
getCariRequestModel: ${getCariRequestModel},
getGrupKod0: ${getGrupKod0},
getGrupKod1: ${getGrupKod1},
getGrupKod2: ${getGrupKod2},
getGrupKod3: ${getGrupKod3},
getGrupKod4: ${getGrupKod4},
getGrupKod5: ${getGrupKod5},
hasAnyFilters: ${hasAnyFilters}
    ''';
  }
}
