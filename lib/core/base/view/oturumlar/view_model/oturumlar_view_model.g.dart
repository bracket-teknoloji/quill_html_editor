// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oturumlar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OturumlarViewModel on _OturumlarViewModelBase, Store {
  Computed<ObservableList<AccountModel>?>? _$filteredListComputed;

  @override
  ObservableList<AccountModel>? get filteredList => (_$filteredListComputed ??=
          Computed<ObservableList<AccountModel>?>(() => super.filteredList,
              name: '_OturumlarViewModelBase.filteredList'))
      .value;

  late final _$accountListAtom =
      Atom(name: '_OturumlarViewModelBase.accountList', context: context);

  @override
  ObservableList<AccountModel>? get accountList {
    _$accountListAtom.reportRead();
    return super.accountList;
  }

  @override
  set accountList(ObservableList<AccountModel>? value) {
    _$accountListAtom.reportWrite(value, super.accountList, () {
      super.accountList = value;
    });
  }

  late final _$searchValueAtom =
      Atom(name: '_OturumlarViewModelBase.searchValue', context: context);

  @override
  String? get searchValue {
    _$searchValueAtom.reportRead();
    return super.searchValue;
  }

  @override
  set searchValue(String? value) {
    _$searchValueAtom.reportWrite(value, super.searchValue, () {
      super.searchValue = value;
    });
  }

  late final _$isSearchBarOpenAtom =
      Atom(name: '_OturumlarViewModelBase.isSearchBarOpen', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('_OturumlarViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_OturumlarViewModelBase.logout', context: context);

  @override
  Future<void> logout(AccountModel user) {
    return _$logoutAsyncAction.run(() => super.logout(user));
  }

  late final _$_OturumlarViewModelBaseActionController =
      ActionController(name: '_OturumlarViewModelBase', context: context);

  @override
  void setIsSearchBarOpen() {
    final _$actionInfo = _$_OturumlarViewModelBaseActionController.startAction(
        name: '_OturumlarViewModelBase.setIsSearchBarOpen');
    try {
      return super.setIsSearchBarOpen();
    } finally {
      _$_OturumlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchValue(String? value) {
    final _$actionInfo = _$_OturumlarViewModelBaseActionController.startAction(
        name: '_OturumlarViewModelBase.setSearchValue');
    try {
      return super.setSearchValue(value);
    } finally {
      _$_OturumlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccountList(List<AccountModel>? value) {
    final _$actionInfo = _$_OturumlarViewModelBaseActionController.startAction(
        name: '_OturumlarViewModelBase.setAccountList');
    try {
      return super.setAccountList(value);
    } finally {
      _$_OturumlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accountList: ${accountList},
searchValue: ${searchValue},
isSearchBarOpen: ${isSearchBarOpen},
filteredList: ${filteredList}
    ''';
  }
}
