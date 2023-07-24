// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siparisler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SiparislerViewModel on _SiparislerViewModelBase, Store {
  Computed<String>? _$getQueryParamsComputed;

  @override
  String get getQueryParams =>
      (_$getQueryParamsComputed ??= Computed<String>(() => super.getQueryParams,
              name: '_SiparislerViewModelBase.getQueryParams'))
          .value;

  late final _$paramDataAtom =
      Atom(name: '_SiparislerViewModelBase.paramData', context: context);

  @override
  Map<String, String> get paramData {
    _$paramDataAtom.reportRead();
    return super.paramData;
  }

  @override
  set paramData(Map<String, String> value) {
    _$paramDataAtom.reportWrite(value, super.paramData, () {
      super.paramData = value;
    });
  }

  late final _$dahaVarMiAtom =
      Atom(name: '_SiparislerViewModelBase.dahaVarMi', context: context);

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

  late final _$grupKodlariGosterAtom = Atom(
      name: '_SiparislerViewModelBase.grupKodlariGoster', context: context);

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

  late final _$kapaliBelgelerListelenmesinAtom = Atom(
      name: '_SiparislerViewModelBase.kapaliBelgelerListelenmesin',
      context: context);

  @override
  bool get kapaliBelgelerListelenmesin {
    _$kapaliBelgelerListelenmesinAtom.reportRead();
    return super.kapaliBelgelerListelenmesin;
  }

  @override
  set kapaliBelgelerListelenmesin(bool value) {
    _$kapaliBelgelerListelenmesinAtom
        .reportWrite(value, super.kapaliBelgelerListelenmesin, () {
      super.kapaliBelgelerListelenmesin = value;
    });
  }

  late final _$sayfaAtom =
      Atom(name: '_SiparislerViewModelBase.sayfa', context: context);

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

  late final _$siralamaAtom =
      Atom(name: '_SiparislerViewModelBase.siralama', context: context);

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

  late final _$searchTextAtom =
      Atom(name: '_SiparislerViewModelBase.searchText', context: context);

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

  late final _$isScrolledDownAtom =
      Atom(name: '_SiparislerViewModelBase.isScrolledDown', context: context);

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

  late final _$searchBarAtom =
      Atom(name: '_SiparislerViewModelBase.searchBar', context: context);

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

  late final _$musteriSiparisleriListAtom = Atom(
      name: '_SiparislerViewModelBase.musteriSiparisleriList',
      context: context);

  @override
  List<SiparislerModel?>? get musteriSiparisleriList {
    _$musteriSiparisleriListAtom.reportRead();
    return super.musteriSiparisleriList;
  }

  @override
  set musteriSiparisleriList(List<SiparislerModel?>? value) {
    _$musteriSiparisleriListAtom
        .reportWrite(value, super.musteriSiparisleriList, () {
      super.musteriSiparisleriList = value;
    });
  }

  late final _$_SiparislerViewModelBaseActionController =
      ActionController(name: '_SiparislerViewModelBase', context: context);

  @override
  void setParamData(Map<String, String> value) {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.setParamData');
    try {
      return super.setParamData(value);
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeGrupKodlariGoster() {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.changeGrupKodlariGoster');
    try {
      return super.changeGrupKodlariGoster();
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.increaseSayfa');
    try {
      return super.increaseSayfa();
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKapaliBelgelerListelenmesin(bool value) {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.setKapaliBelgelerListelenmesin');
    try {
      return super.setKapaliBelgelerListelenmesin(value);
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsScrolledDown(bool value) {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.changeIsScrolledDown');
    try {
      return super.changeIsScrolledDown(value);
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiparislerList(List<SiparislerModel?>? value) {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.setSiparislerList');
    try {
      return super.setSiparislerList(value);
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSiparislerList(List<SiparislerModel?>? value) {
    final _$actionInfo = _$_SiparislerViewModelBaseActionController.startAction(
        name: '_SiparislerViewModelBase.addSiparislerList');
    try {
      return super.addSiparislerList(value);
    } finally {
      _$_SiparislerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paramData: ${paramData},
dahaVarMi: ${dahaVarMi},
grupKodlariGoster: ${grupKodlariGoster},
kapaliBelgelerListelenmesin: ${kapaliBelgelerListelenmesin},
sayfa: ${sayfa},
siralama: ${siralama},
searchText: ${searchText},
isScrolledDown: ${isScrolledDown},
searchBar: ${searchBar},
musteriSiparisleriList: ${musteriSiparisleriList},
getQueryParams: ${getQueryParams}
    ''';
  }
}
