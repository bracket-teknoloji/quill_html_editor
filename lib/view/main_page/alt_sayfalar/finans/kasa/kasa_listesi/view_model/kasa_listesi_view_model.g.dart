// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KasaListesiViewModel on _KasaListesiViewModelBase, Store {
  late final _$dahaVarMiAtom =
      Atom(name: '_KasaListesiViewModelBase.dahaVarMi', context: context);

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

  late final _$searchBarAtom =
      Atom(name: '_KasaListesiViewModelBase.searchBar', context: context);

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

  late final _$isScrollDownAtom =
      Atom(name: '_KasaListesiViewModelBase.isScrollDown', context: context);

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

  late final _$_KasaListesiViewModelBaseActionController =
      ActionController(name: '_KasaListesiViewModelBase', context: context);

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_KasaListesiViewModelBaseActionController
        .startAction(name: '_KasaListesiViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_KasaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchBar() {
    final _$actionInfo = _$_KasaListesiViewModelBaseActionController
        .startAction(name: '_KasaListesiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_KasaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_KasaListesiViewModelBaseActionController
        .startAction(name: '_KasaListesiViewModelBase.setIsScrollDown');
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_KasaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dahaVarMi: ${dahaVarMi},
searchBar: ${searchBar},
isScrollDown: ${isScrollDown}
    ''';
  }
}
