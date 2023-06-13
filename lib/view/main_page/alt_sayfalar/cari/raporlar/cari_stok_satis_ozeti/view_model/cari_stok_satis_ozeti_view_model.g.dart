// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_stok_satis_ozeti_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariStokSatisOzetiViewModel on _CariStokSatisOzetiViewModelBase, Store {
  late final _$searchBarAtom = Atom(
      name: '_CariStokSatisOzetiViewModelBase.searchBar', context: context);

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

  late final _$modelListAtom = Atom(
      name: '_CariStokSatisOzetiViewModelBase.modelList', context: context);

  @override
  List<CariStokSatisOzetiModel>? get modelList {
    _$modelListAtom.reportRead();
    return super.modelList;
  }

  @override
  set modelList(List<CariStokSatisOzetiModel>? value) {
    _$modelListAtom.reportWrite(value, super.modelList, () {
      super.modelList = value;
    });
  }

  late final _$_CariStokSatisOzetiViewModelBaseActionController =
      ActionController(
          name: '_CariStokSatisOzetiViewModelBase', context: context);

  @override
  void setSearchBar() {
    final _$actionInfo = _$_CariStokSatisOzetiViewModelBaseActionController
        .startAction(name: '_CariStokSatisOzetiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_CariStokSatisOzetiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setModelList(List<CariStokSatisOzetiModel>? value) {
    final _$actionInfo = _$_CariStokSatisOzetiViewModelBaseActionController
        .startAction(name: '_CariStokSatisOzetiViewModelBase.setModelList');
    try {
      return super.setModelList(value);
    } finally {
      _$_CariStokSatisOzetiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
modelList: ${modelList}
    ''';
  }
}
