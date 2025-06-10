// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talep_teklif_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TalepTeklifListesiViewModel on _TalepTeklifListesiViewModelBase, Store {
  Computed<String>? _$getKdvHaricComputed;

  @override
  String get getKdvHaric => (_$getKdvHaricComputed ??= Computed<String>(
    () => super.getKdvHaric,
    name: '_TalepTeklifListesiViewModelBase.getKdvHaric',
  )).value;
  Computed<String>? _$getKdvComputed;

  @override
  String get getKdv => (_$getKdvComputed ??= Computed<String>(
    () => super.getKdv,
    name: '_TalepTeklifListesiViewModelBase.getKdv',
  )).value;
  Computed<String>? _$getKdvDahilToplamComputed;

  @override
  String get getKdvDahilToplam =>
      (_$getKdvDahilToplamComputed ??= Computed<String>(
        () => super.getKdvDahilToplam,
        name: '_TalepTeklifListesiViewModelBase.getKdvDahilToplam',
      )).value;
  Computed<List<BaseGrupKoduModel>?>? _$getGrupKodlari0Computed;

  @override
  List<BaseGrupKoduModel>? get getGrupKodlari0 =>
      (_$getGrupKodlari0Computed ??= Computed<List<BaseGrupKoduModel>?>(
        () => super.getGrupKodlari0,
        name: '_TalepTeklifListesiViewModelBase.getGrupKodlari0',
      )).value;
  Computed<List<BaseGrupKoduModel>?>? _$getGrupKodlari1Computed;

  @override
  List<BaseGrupKoduModel>? get getGrupKodlari1 =>
      (_$getGrupKodlari1Computed ??= Computed<List<BaseGrupKoduModel>?>(
        () => super.getGrupKodlari1,
        name: '_TalepTeklifListesiViewModelBase.getGrupKodlari1',
      )).value;
  Computed<List<BaseGrupKoduModel>?>? _$getGrupKodlari2Computed;

  @override
  List<BaseGrupKoduModel>? get getGrupKodlari2 =>
      (_$getGrupKodlari2Computed ??= Computed<List<BaseGrupKoduModel>?>(
        () => super.getGrupKodlari2,
        name: '_TalepTeklifListesiViewModelBase.getGrupKodlari2',
      )).value;
  Computed<List<BaseGrupKoduModel>?>? _$getGrupKodlari3Computed;

  @override
  List<BaseGrupKoduModel>? get getGrupKodlari3 =>
      (_$getGrupKodlari3Computed ??= Computed<List<BaseGrupKoduModel>?>(
        () => super.getGrupKodlari3,
        name: '_TalepTeklifListesiViewModelBase.getGrupKodlari3',
      )).value;
  Computed<List<BaseGrupKoduModel>?>? _$getGrupKodlari4Computed;

  @override
  List<BaseGrupKoduModel>? get getGrupKodlari4 =>
      (_$getGrupKodlari4Computed ??= Computed<List<BaseGrupKoduModel>?>(
        () => super.getGrupKodlari4,
        name: '_TalepTeklifListesiViewModelBase.getGrupKodlari4',
      )).value;
  Computed<List<BaseGrupKoduModel>?>? _$getGrupKodlari5Computed;

  @override
  List<BaseGrupKoduModel>? get getGrupKodlari5 =>
      (_$getGrupKodlari5Computed ??= Computed<List<BaseGrupKoduModel>?>(
        () => super.getGrupKodlari5,
        name: '_TalepTeklifListesiViewModelBase.getGrupKodlari5',
      )).value;
  Computed<bool>? _$hasFilterComputed;

  @override
  bool get hasFilter => (_$hasFilterComputed ??= Computed<bool>(
    () => super.hasFilter,
    name: '_TalepTeklifListesiViewModelBase.hasFilter',
  )).value;

  late final _$teslimatDurumuValueListAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.teslimatDurumuValueList',
    context: context,
  );

  @override
  List<String?> get teslimatDurumuValueList {
    _$teslimatDurumuValueListAtom.reportRead();
    return super.teslimatDurumuValueList;
  }

  @override
  set teslimatDurumuValueList(List<String?> value) {
    _$teslimatDurumuValueListAtom.reportWrite(
      value,
      super.teslimatDurumuValueList,
      () {
        super.teslimatDurumuValueList = value;
      },
    );
  }

  late final _$ekstraAlanlarMapAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.ekstraAlanlarMap',
    context: context,
  );

  @override
  ObservableMap<String, bool> get ekstraAlanlarMap {
    _$ekstraAlanlarMapAtom.reportRead();
    return super.ekstraAlanlarMap;
  }

  @override
  set ekstraAlanlarMap(ObservableMap<String, bool> value) {
    _$ekstraAlanlarMapAtom.reportWrite(value, super.ekstraAlanlarMap, () {
      super.ekstraAlanlarMap = value;
    });
  }

  late final _$grupKodlariGosterAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.grupKodlariGoster',
    context: context,
  );

  @override
  bool get grupKodlariGoster {
    _$grupKodlariGosterAtom.reportRead();
    return super.grupKodlariGoster;
  }

  @override
  set grupKodlariGoster(bool value) {
    _$grupKodlariGosterAtom.reportWrite(value, super.grupKodlariGoster, () {
      super.grupKodlariGoster = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.isSearchBarOpen',
    context: context,
  );

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

  late final _$searchTextAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.searchText',
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

  late final _$siparislerRequestModelAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.siparislerRequestModel',
    context: context,
  );

  @override
  SiparislerRequestModel get siparislerRequestModel {
    _$siparislerRequestModelAtom.reportRead();
    return super.siparislerRequestModel;
  }

  @override
  set siparislerRequestModel(SiparislerRequestModel value) {
    _$siparislerRequestModelAtom.reportWrite(
      value,
      super.siparislerRequestModel,
      () {
        super.siparislerRequestModel = value;
      },
    );
  }

  late final _$observableListAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<BaseSiparisEditModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<BaseSiparisEditModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$grupKodlariListAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.grupKodlariList',
    context: context,
  );

  @override
  ObservableList<BaseGrupKoduModel>? get grupKodlariList {
    _$grupKodlariListAtom.reportRead();
    return super.grupKodlariList;
  }

  @override
  set grupKodlariList(ObservableList<BaseGrupKoduModel>? value) {
    _$grupKodlariListAtom.reportWrite(value, super.grupKodlariList, () {
      super.grupKodlariList = value;
    });
  }

  late final _$isScrollDownAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.isScrollDown',
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

  late final _$paramDataAtom = Atom(
    name: '_TalepTeklifListesiViewModelBase.paramData',
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

  late final _$changeSearchBarStatusAsyncAction = AsyncAction(
    '_TalepTeklifListesiViewModelBase.changeSearchBarStatus',
    context: context,
  );

  @override
  Future<void> changeSearchBarStatus() {
    return _$changeSearchBarStatusAsyncAction.run(
      () => super.changeSearchBarStatus(),
    );
  }

  late final _$resetFilterAsyncAction = AsyncAction(
    '_TalepTeklifListesiViewModelBase.resetFilter',
    context: context,
  );

  @override
  Future<void> resetFilter() {
    return _$resetFilterAsyncAction.run(() => super.resetFilter());
  }

  late final _$changeGrupKodlariGosterAsyncAction = AsyncAction(
    '_TalepTeklifListesiViewModelBase.changeGrupKodlariGoster',
    context: context,
  );

  @override
  Future<void> changeGrupKodlariGoster() {
    return _$changeGrupKodlariGosterAsyncAction.run(
      () => super.changeGrupKodlariGoster(),
    );
  }

  late final _$resetListAsyncAction = AsyncAction(
    '_TalepTeklifListesiViewModelBase.resetList',
    context: context,
  );

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_TalepTeklifListesiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$getGrupKodlariAsyncAction = AsyncAction(
    '_TalepTeklifListesiViewModelBase.getGrupKodlari',
    context: context,
  );

  @override
  Future<void> getGrupKodlari() {
    return _$getGrupKodlariAsyncAction.run(() => super.getGrupKodlari());
  }

  late final _$_TalepTeklifListesiViewModelBaseActionController =
      ActionController(
        name: '_TalepTeklifListesiViewModelBase',
        context: context,
      );

  @override
  void changeEkstraAlanlarMap(String key, bool value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(
          name: '_TalepTeklifListesiViewModelBase.changeEkstraAlanlarMap',
        );
    try {
      return super.changeEkstraAlanlarMap(key, value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void resetEkstraAlanlarMap() {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(
          name: '_TalepTeklifListesiViewModelBase.resetEkstraAlanlarMap',
        );
    try {
      return super.resetEkstraAlanlarMap();
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setIsScrolledDown(bool value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(
          name: '_TalepTeklifListesiViewModelBase.setIsScrolledDown',
        );
    try {
      return super.setIsScrolledDown(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setPickerBelgeTuru(String value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(
          name: '_TalepTeklifListesiViewModelBase.setPickerBelgeTuru',
        );
    try {
      return super.setPickerBelgeTuru(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setObservableList(List<BaseSiparisEditModel>? list) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(
          name: '_TalepTeklifListesiViewModelBase.setObservableList',
        );
    try {
      return super.setObservableList(list);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void addObservableList(List<BaseSiparisEditModel>? list) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(
          name: '_TalepTeklifListesiViewModelBase.addObservableList',
        );
    try {
      return super.addObservableList(list);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setArrPlasiyerKodu(List<String>? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(
          name: '_TalepTeklifListesiViewModelBase.setArrPlasiyerKodu',
        );
    try {
      return super.setArrPlasiyerKodu(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setArrKod0(List<String>? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setArrKod0');
    try {
      return super.setArrKod0(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setArrKod1(List<String>? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setArrKod1');
    try {
      return super.setArrKod1(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setArrKod2(List<String>? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setArrKod2');
    try {
      return super.setArrKod2(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setArrKod3(List<String>? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setArrKod3');
    try {
      return super.setArrKod3(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setArrKod4(List<String>? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setArrKod4');
    try {
      return super.setArrKod4(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setArrKod5(List<String>? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setArrKod5');
    try {
      return super.setArrKod5(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setCariTipi(String? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setCariTipi');
    try {
      return super.setCariTipi(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setTeslimatDurumuGroupValue(int? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(
          name: '_TalepTeklifListesiViewModelBase.setTeslimatDurumuGroupValue',
        );
    try {
      return super.setTeslimatDurumuGroupValue(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setKapaliBelgelerListelenmesin(bool? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(
          name:
              '_TalepTeklifListesiViewModelBase.setKapaliBelgelerListelenmesin',
        );
    try {
      return super.setKapaliBelgelerListelenmesin(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBaslamaTarihi(String? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setBaslamaTarihi');
    try {
      return super.setBaslamaTarihi(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setBitisTarihi');
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setParamData(Map<String, dynamic> paramData) {
    final _$actionInfo = _$_TalepTeklifListesiViewModelBaseActionController
        .startAction(name: '_TalepTeklifListesiViewModelBase.setParamData');
    try {
      return super.setParamData(paramData);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
teslimatDurumuValueList: ${teslimatDurumuValueList},
ekstraAlanlarMap: ${ekstraAlanlarMap},
grupKodlariGoster: ${grupKodlariGoster},
isSearchBarOpen: ${isSearchBarOpen},
searchText: ${searchText},
siparislerRequestModel: ${siparislerRequestModel},
observableList: ${observableList},
grupKodlariList: ${grupKodlariList},
isScrollDown: ${isScrollDown},
paramData: ${paramData},
getKdvHaric: ${getKdvHaric},
getKdv: ${getKdv},
getKdvDahilToplam: ${getKdvDahilToplam},
getGrupKodlari0: ${getGrupKodlari0},
getGrupKodlari1: ${getGrupKodlari1},
getGrupKodlari2: ${getGrupKodlari2},
getGrupKodlari3: ${getGrupKodlari3},
getGrupKodlari4: ${getGrupKodlari4},
getGrupKodlari5: ${getGrupKodlari5},
hasFilter: ${hasFilter}
    ''';
  }
}
