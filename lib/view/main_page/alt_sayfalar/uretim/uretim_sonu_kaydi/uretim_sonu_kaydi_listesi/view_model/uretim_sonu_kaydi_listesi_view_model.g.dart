// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimSonuKaydiListesiViewModel on _UretimSonuKaydiListesiViewModelBase, Store {
  late final _$isSearchBarOpenAtom = Atom(
    name: '_UretimSonuKaydiListesiViewModelBase.isSearchBarOpen',
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

  late final _$isScrollDownAtom = Atom(
    name: '_UretimSonuKaydiListesiViewModelBase.isScrollDown',
    context: context,
  );

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

  late final _$searchTextAtom = Atom(
    name: '_UretimSonuKaydiListesiViewModelBase.searchText',
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

  late final _$observableListAtom = Atom(
    name: '_UretimSonuKaydiListesiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<KalemModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<KalemModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$resetListAsyncAction = AsyncAction(
    '_UretimSonuKaydiListesiViewModelBase.resetList',
    context: context,
  );

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$deleteItemAsyncAction = AsyncAction(
    '_UretimSonuKaydiListesiViewModelBase.deleteItem',
    context: context,
  );

  @override
  Future<GenericResponseModel<KalemModel>> deleteItem(KalemModel item) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(item));
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_UretimSonuKaydiListesiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_UretimSonuKaydiListesiViewModelBaseActionController = ActionController(
    name: '_UretimSonuKaydiListesiViewModelBase',
    context: context,
  );

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_UretimSonuKaydiListesiViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiListesiViewModelBase.changeSearchBarStatus',
    );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_UretimSonuKaydiListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_UretimSonuKaydiListesiViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiListesiViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_UretimSonuKaydiListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setObservableList(List<KalemModel>? list) {
    final _$actionInfo = _$_UretimSonuKaydiListesiViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiListesiViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_UretimSonuKaydiListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void addObservableList(List<KalemModel>? list) {
    final _$actionInfo = _$_UretimSonuKaydiListesiViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiListesiViewModelBase.addObservableList',
    );
    try {
      return super.addObservableList(list);
    } finally {
      _$_UretimSonuKaydiListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
isSearchBarOpen: ${isSearchBarOpen},
isScrollDown: ${isScrollDown},
searchText: ${searchText},
observableList: ${observableList}
    ''';
  }
}
