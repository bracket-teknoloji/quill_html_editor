// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_hammadde_takibi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IsEmriHammaddeTakibiViewModel on _IsEmriHammaddeTakibiViewModelBase, Store {
  Computed<ObservableList<IsEmriHammaddeTakibiListesiModel>?>? _$getListComputed;

  @override
  ObservableList<IsEmriHammaddeTakibiListesiModel>? get getList =>
      (_$getListComputed ??= Computed<ObservableList<IsEmriHammaddeTakibiListesiModel>?>(
        () => super.getList,
        name: '_IsEmriHammaddeTakibiViewModelBase.getList',
      )).value;

  late final _$searchTextAtom = Atom(
    name: '_IsEmriHammaddeTakibiViewModelBase.searchText',
    context: context,
  );

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

  late final _$isSearchBarOpenAtom = Atom(
    name: '_IsEmriHammaddeTakibiViewModelBase.isSearchBarOpen',
    context: context,
  );

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

  late final _$observableListAtom = Atom(
    name: '_IsEmriHammaddeTakibiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<IsEmriHammaddeTakibiListesiModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<IsEmriHammaddeTakibiListesiModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_IsEmriHammaddeTakibiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_IsEmriHammaddeTakibiViewModelBaseActionController = ActionController(
    name: '_IsEmriHammaddeTakibiViewModelBase',
    context: context,
  );

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_IsEmriHammaddeTakibiViewModelBaseActionController.startAction(
      name: '_IsEmriHammaddeTakibiViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_IsEmriHammaddeTakibiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_IsEmriHammaddeTakibiViewModelBaseActionController.startAction(
      name: '_IsEmriHammaddeTakibiViewModelBase.changeSearchBarStatus',
    );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_IsEmriHammaddeTakibiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setObservableList(List<IsEmriHammaddeTakibiListesiModel>? list) {
    final _$actionInfo = _$_IsEmriHammaddeTakibiViewModelBaseActionController.startAction(
      name: '_IsEmriHammaddeTakibiViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_IsEmriHammaddeTakibiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
searchText: ${searchText},
isSearchBarOpen: ${isSearchBarOpen},
observableList: ${observableList},
getList: ${getList}
    ''';
  }
}
