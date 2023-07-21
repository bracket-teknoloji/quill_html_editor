// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musteri_siparisleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusteriSiparisleriViewModel on _MusteriSiparisleriViewModelBase, Store {
  Computed<String>? _$getQueryParamsComputed;

  @override
  String get getQueryParams =>
      (_$getQueryParamsComputed ??= Computed<String>(() => super.getQueryParams,
              name: '_MusteriSiparisleriViewModelBase.getQueryParams'))
          .value;

  late final _$dahaVarMiAtom = Atom(
      name: '_MusteriSiparisleriViewModelBase.dahaVarMi', context: context);

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

  late final _$sayfaAtom =
      Atom(name: '_MusteriSiparisleriViewModelBase.sayfa', context: context);

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
      Atom(name: '_MusteriSiparisleriViewModelBase.siralama', context: context);

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

  late final _$searchTextAtom = Atom(
      name: '_MusteriSiparisleriViewModelBase.searchText', context: context);

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

  late final _$isScrolledDownAtom = Atom(
      name: '_MusteriSiparisleriViewModelBase.isScrolledDown',
      context: context);

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

  late final _$searchBarAtom = Atom(
      name: '_MusteriSiparisleriViewModelBase.searchBar', context: context);

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
      name: '_MusteriSiparisleriViewModelBase.musteriSiparisleriList',
      context: context);

  @override
  List<MusteriSiparisleriModel?>? get musteriSiparisleriList {
    _$musteriSiparisleriListAtom.reportRead();
    return super.musteriSiparisleriList;
  }

  @override
  set musteriSiparisleriList(List<MusteriSiparisleriModel?>? value) {
    _$musteriSiparisleriListAtom
        .reportWrite(value, super.musteriSiparisleriList, () {
      super.musteriSiparisleriList = value;
    });
  }

  late final _$_MusteriSiparisleriViewModelBaseActionController =
      ActionController(
          name: '_MusteriSiparisleriViewModelBase', context: context);

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_MusteriSiparisleriViewModelBaseActionController
        .startAction(name: '_MusteriSiparisleriViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_MusteriSiparisleriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_MusteriSiparisleriViewModelBaseActionController
        .startAction(name: '_MusteriSiparisleriViewModelBase.increaseSayfa');
    try {
      return super.increaseSayfa();
    } finally {
      _$_MusteriSiparisleriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_MusteriSiparisleriViewModelBaseActionController
        .startAction(name: '_MusteriSiparisleriViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
    } finally {
      _$_MusteriSiparisleriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_MusteriSiparisleriViewModelBaseActionController
        .startAction(name: '_MusteriSiparisleriViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_MusteriSiparisleriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_MusteriSiparisleriViewModelBaseActionController
        .startAction(name: '_MusteriSiparisleriViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_MusteriSiparisleriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsScrolledDown(bool value) {
    final _$actionInfo =
        _$_MusteriSiparisleriViewModelBaseActionController.startAction(
            name: '_MusteriSiparisleriViewModelBase.changeIsScrolledDown');
    try {
      return super.changeIsScrolledDown(value);
    } finally {
      _$_MusteriSiparisleriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_MusteriSiparisleriViewModelBaseActionController
        .startAction(name: '_MusteriSiparisleriViewModelBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$_MusteriSiparisleriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setMusteriSiparisleriList(List<MusteriSiparisleriModel?>? value) {
    final _$actionInfo =
        _$_MusteriSiparisleriViewModelBaseActionController.startAction(
            name: '_MusteriSiparisleriViewModelBase.setMusteriSiparisleriList');
    try {
      return super.setMusteriSiparisleriList(value);
    } finally {
      _$_MusteriSiparisleriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addMusteriSiparisleriList(List<MusteriSiparisleriModel?>? value) {
    final _$actionInfo =
        _$_MusteriSiparisleriViewModelBaseActionController.startAction(
            name: '_MusteriSiparisleriViewModelBase.addMusteriSiparisleriList');
    try {
      return super.addMusteriSiparisleriList(value);
    } finally {
      _$_MusteriSiparisleriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dahaVarMi: ${dahaVarMi},
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
