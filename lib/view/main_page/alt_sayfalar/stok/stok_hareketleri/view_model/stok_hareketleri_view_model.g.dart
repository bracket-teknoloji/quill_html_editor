// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokHareketleriViewModel on _StokHareketleriViewModelBase, Store {
  late final _$searchBarAtom =
      Atom(name: '_StokHareketleriViewModelBase.searchBar', context: context);

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

  late final _$stokHareketleriAtom = Atom(
      name: '_StokHareketleriViewModelBase.stokHareketleri', context: context);

  @override
  List<StokHareketleriModel>? get stokHareketleri {
    _$stokHareketleriAtom.reportRead();
    return super.stokHareketleri;
  }

  @override
  set stokHareketleri(List<StokHareketleriModel>? value) {
    _$stokHareketleriAtom.reportWrite(value, super.stokHareketleri, () {
      super.stokHareketleri = value;
    });
  }

  late final _$_StokHareketleriViewModelBaseActionController =
      ActionController(name: '_StokHareketleriViewModelBase', context: context);

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokHareketleri(List<StokHareketleriModel> value) {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.setStokHareketleri');
    try {
      return super.setStokHareketleri(value);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addStokHareketleri(StokHareketleriModel value) {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.addStokHareketleri');
    try {
      return super.addStokHareketleri(value);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
stokHareketleri: ${stokHareketleri}
    ''';
  }
}
