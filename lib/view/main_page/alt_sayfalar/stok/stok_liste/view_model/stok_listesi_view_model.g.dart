// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokListesiViewModel on _StokListesiViewModelBase, Store {
  Computed<List<BaseGrupKoduModel>?>? _$grupKoduComputed;

  @override
  List<BaseGrupKoduModel>? get grupKodu => (_$grupKoduComputed ??= Computed<List<BaseGrupKoduModel>?>(() => super.grupKodu, name: '_StokListesiViewModelBase.grupKodu')).value;
  Computed<List<BaseGrupKoduModel>?>? _$kod1Computed;

  @override
  List<BaseGrupKoduModel>? get kod1 => (_$kod1Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod1, name: '_StokListesiViewModelBase.kod1')).value;
  Computed<List<BaseGrupKoduModel>?>? _$kod2Computed;

  @override
  List<BaseGrupKoduModel>? get kod2 => (_$kod2Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod2, name: '_StokListesiViewModelBase.kod2')).value;
  Computed<List<BaseGrupKoduModel>?>? _$kod3Computed;

  @override
  List<BaseGrupKoduModel>? get kod3 => (_$kod3Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod3, name: '_StokListesiViewModelBase.kod3')).value;
  Computed<List<BaseGrupKoduModel>?>? _$kod4Computed;

  @override
  List<BaseGrupKoduModel>? get kod4 => (_$kod4Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod4, name: '_StokListesiViewModelBase.kod4')).value;
  Computed<List<BaseGrupKoduModel>?>? _$kod5Computed;

  @override
  List<BaseGrupKoduModel>? get kod5 => (_$kod5Computed ??= Computed<List<BaseGrupKoduModel>?>(() => super.kod5, name: '_StokListesiViewModelBase.kod5')).value;
  Computed<String?>? _$bakiyeComputed;

  @override
  String? get bakiye => (_$bakiyeComputed ??= Computed<String?>(() => super.bakiye, name: '_StokListesiViewModelBase.bakiye')).value;

  late final _$bakiyeGroupValueAtom = Atom(name: '_StokListesiViewModelBase.bakiyeGroupValue', context: context);

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

  late final _$imageMapAtom = Atom(name: '_StokListesiViewModelBase.imageMap', context: context);

  @override
  ObservableMap<String, MemoryImage> get imageMap {
    _$imageMapAtom.reportRead();
    return super.imageMap;
  }

  @override
  set imageMap(ObservableMap<String, MemoryImage> value) {
    _$imageMapAtom.reportWrite(value, super.imageMap, () {
      super.imageMap = value;
    });
  }

  late final _$searchBarAtom = Atom(name: '_StokListesiViewModelBase.searchBar', context: context);

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

  late final _$searchValueAtom = Atom(name: '_StokListesiViewModelBase.searchValue', context: context);

  @override
  String get searchValue {
    _$searchValueAtom.reportRead();
    return super.searchValue;
  }

  @override
  set searchValue(String value) {
    _$searchValueAtom.reportWrite(value, super.searchValue, () {
      super.searchValue = value;
    });
  }

  late final _$bottomSheetModelAtom = Atom(name: '_StokListesiViewModelBase.bottomSheetModel', context: context);

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

  late final _$resimleriGosterAtom = Atom(name: '_StokListesiViewModelBase.resimleriGoster', context: context);

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

  late final _$grupKodlariAtom = Atom(name: '_StokListesiViewModelBase.grupKodlari', context: context);

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

  late final _$stokListesiAtom = Atom(name: '_StokListesiViewModelBase.stokListesi', context: context);

  @override
  ObservableList<StokListesiModel>? get stokListesi {
    _$stokListesiAtom.reportRead();
    return super.stokListesi;
  }

  @override
  set stokListesi(ObservableList<StokListesiModel>? value) {
    _$stokListesiAtom.reportWrite(value, super.stokListesi, () {
      super.stokListesi = value;
    });
  }

  late final _$isScrolledDownAtom = Atom(name: '_StokListesiViewModelBase.isScrolledDown', context: context);

  @override
  bool get isScrolledDown {
    _$isScrolledDownAtom.reportRead();
    return super.isScrolledDown;
  }

  @override
  set isScrolledDown(bool value) {
    _$isScrolledDownAtom.reportWrite(value, super.isScrolledDown, () {
      super.isScrolledDown = value;
    });
  }

  late final _$sayfaAtom = Atom(name: '_StokListesiViewModelBase.sayfa', context: context);

  @override
  int get sayfa {
    _$sayfaAtom.reportRead();
    return super.sayfa;
  }

  @override
  set sayfa(int value) {
    _$sayfaAtom.reportWrite(value, super.sayfa, () {
      super.sayfa = value;
    });
  }

  late final _$dahaVarMiAtom = Atom(name: '_StokListesiViewModelBase.dahaVarMi', context: context);

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

  late final _$siralamaAtom = Atom(name: '_StokListesiViewModelBase.siralama', context: context);

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

  late final _$selectedListAtom = Atom(name: '_StokListesiViewModelBase.selectedList', context: context);

  @override
  ObservableList<String> get selectedList {
    _$selectedListAtom.reportRead();
    return super.selectedList;
  }

  @override
  set selectedList(ObservableList<String> value) {
    _$selectedListAtom.reportWrite(value, super.selectedList, () {
      super.selectedList = value;
    });
  }

  late final _$_StokListesiViewModelBaseActionController = ActionController(name: '_StokListesiViewModelBase', context: context);

  @override
  void setImageMap(Map<String, MemoryImage> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.setImageMap');
    try {
      return super.setImageMap(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addImageMap(Map<String, MemoryImage> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.addImageMap');
    try {
      return super.addImageMap(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImageMap(String key) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.removeImageMap');
    try {
      return super.removeImageMap(key);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchBar() {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchValue(String value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.setSearchValue');
    try {
      return super.setSearchValue(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSelectedArr() {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.resetSelectedArr');
    try {
      return super.resetSelectedArr();
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrGrupKodu(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.changeArrGrupKodu');
    try {
      return super.changeArrGrupKodu(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod1(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.changeArrKod1');
    try {
      return super.changeArrKod1(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod2(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.changeArrKod2');
    try {
      return super.changeArrKod2(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod3(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.changeArrKod3');
    try {
      return super.changeArrKod3(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod4(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.changeArrKod4');
    try {
      return super.changeArrKod4(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrKod5(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.changeArrKod5');
    try {
      return super.changeArrKod5(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setResimleriGoster() {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.setResimleriGoster');
    try {
      return super.setResimleriGoster();
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGrupKodlari(List<BaseGrupKoduModel> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.setGrupKodlari');
    try {
      return super.setGrupKodlari(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokListesi(List<StokListesiModel>? value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.setStokListesi');
    try {
      return super.setStokListesi(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addStokListesi(List<StokListesiModel> value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.addStokListesi');
    try {
      return super.addStokListesi(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsScrolledDown(bool value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.changeIsScrolledDown');
    try {
      return super.changeIsScrolledDown(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.increaseSayfa');
    try {
      return super.increaseSayfa();
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedWithIndex(int index) {
    final _$actionInfo = _$_StokListesiViewModelBaseActionController.startAction(name: '_StokListesiViewModelBase.setSelectedWithIndex');
    try {
      return super.setSelectedWithIndex(index);
    } finally {
      _$_StokListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bakiyeGroupValue: ${bakiyeGroupValue},
imageMap: ${imageMap},
searchBar: ${searchBar},
searchValue: ${searchValue},
bottomSheetModel: ${bottomSheetModel},
resimleriGoster: ${resimleriGoster},
grupKodlari: ${grupKodlari},
stokListesi: ${stokListesi},
isScrolledDown: ${isScrolledDown},
sayfa: ${sayfa},
dahaVarMi: ${dahaVarMi},
siralama: ${siralama},
selectedList: ${selectedList},
grupKodu: ${grupKodu},
kod1: ${kod1},
kod2: ${kod2},
kod3: ${kod3},
kod4: ${kod4},
kod5: ${kod5},
bakiye: ${bakiye}
    ''';
  }
}
