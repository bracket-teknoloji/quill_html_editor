// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankaListesiViewModel on _BankaListesiViewModelBase, Store {
  late final _$searchBarAtom =
      Atom(name: '_BankaListesiViewModelBase.searchBar', context: context);

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

  late final _$_BankaListesiViewModelBaseActionController =
      ActionController(name: '_BankaListesiViewModelBase', context: context);

  @override
  void setSearchBar() {
    final _$actionInfo = _$_BankaListesiViewModelBaseActionController
        .startAction(name: '_BankaListesiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_BankaListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar}
    ''';
  }
}
