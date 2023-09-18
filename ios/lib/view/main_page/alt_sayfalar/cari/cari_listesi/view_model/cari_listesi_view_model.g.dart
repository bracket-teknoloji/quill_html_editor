// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariListesiViewModel on _CariListesiViewModelBase, Store {
  late final _$dahaVarMiAtom =
      Atom(name: '_CariListesiViewModelBase.dahaVarMi', context: context);

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

  late final _$isScrolledDownAtom =
      Atom(name: '_CariListesiViewModelBase.isScrolledDown', context: context);

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

  late final _$sayfaAtom =
      Atom(name: '_CariListesiViewModelBase.sayfa', context: context);

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

  late final _$cariListesiAtom =
      Atom(name: '_CariListesiViewModelBase.cariListesi', context: context);

  @override
  List<dynamic>? get cariListesi {
    _$cariListesiAtom.reportRead();
    return super.cariListesi;
  }

  @override
  set cariListesi(List<dynamic>? value) {
    _$cariListesiAtom.reportWrite(value, super.cariListesi, () {
      super.cariListesi = value;
    });
  }

  late final _$_CariListesiViewModelBaseActionController =
      ActionController(name: '_CariListesiViewModelBase', context: context);

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
  void changeCariListesi(List<dynamic>? value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeCariListesi');
    try {
      return super.changeCariListesi(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCariListesi(List<dynamic> value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.addCariListesi');
    try {
      return super.addCariListesi(value);
    } finally {
      _$_CariListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsScrolledDown(bool value) {
    final _$actionInfo = _$_CariListesiViewModelBaseActionController
        .startAction(name: '_CariListesiViewModelBase.changeIsScrolledDown');
    try {
      return super.changeIsScrolledDown(value);
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
  String toString() {
    return '''
dahaVarMi: ${dahaVarMi},
isScrolledDown: ${isScrolledDown},
sayfa: ${sayfa},
searchBar: ${searchBar},
arama: ${arama},
cariListesi: ${cariListesi}
    ''';
  }
}
