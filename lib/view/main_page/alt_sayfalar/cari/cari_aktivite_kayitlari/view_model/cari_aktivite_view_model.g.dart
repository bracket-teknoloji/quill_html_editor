// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cari_aktivite_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariAktiviteViewModel on _CariAktiviteViewModelBase, Store {
  late final _$isSearchAtom =
      Atom(name: '_CariAktiviteViewModelBase.isSearch', context: context);

  @override
  bool get isSearch {
    _$isSearchAtom.reportRead();
    return super.isSearch;
  }

  @override
  set isSearch(bool value) {
    _$isSearchAtom.reportWrite(value, super.isSearch, () {
      super.isSearch = value;
    });
  }

  late final _$_CariAktiviteViewModelBaseActionController =
      ActionController(name: '_CariAktiviteViewModelBase', context: context);

  @override
  void changeSearch() {
    final _$actionInfo = _$_CariAktiviteViewModelBaseActionController
        .startAction(name: '_CariAktiviteViewModelBase.changeSearch');
    try {
      return super.changeSearch();
    } finally {
      _$_CariAktiviteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearch: ${isSearch}
    ''';
  }
}
