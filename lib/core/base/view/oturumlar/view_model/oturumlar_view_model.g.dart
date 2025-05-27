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

  late final _$observableListAtom =
      Atom(name: '_OturumlarViewModelBase.observableList', context: context);

  @override
  ObservableList<AccountModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<AccountModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_OturumlarViewModelBase.searchText', context: context);

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
  void changeSearchBarStatus() {
    final _$actionInfo = _$_OturumlarViewModelBaseActionController.startAction(
        name: '_OturumlarViewModelBase.changeSearchBarStatus');
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_OturumlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_OturumlarViewModelBaseActionController.startAction(
        name: '_OturumlarViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_OturumlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<AccountModel>? value) {
    final _$actionInfo = _$_OturumlarViewModelBaseActionController.startAction(
        name: '_OturumlarViewModelBase.setObservableList');
    try {
      return super.setObservableList(value);
    } finally {
      _$_OturumlarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
searchText: ${searchText},
isSearchBarOpen: ${isSearchBarOpen},
filteredList: ${filteredList}
    ''';
  }
}
