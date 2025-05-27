// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransferlerViewModel on _TransferlerViewModelBase, Store {
  late final _$editTipiEnumAtom =
      Atom(name: '_TransferlerViewModelBase.editTipiEnum', context: context);

  @override
  EditTipiEnum get editTipiEnum {
    _$editTipiEnumAtom.reportRead();
    return super.editTipiEnum;
  }

  bool _editTipiEnumIsInitialized = false;

  @override
  set editTipiEnum(EditTipiEnum value) {
    _$editTipiEnumAtom.reportWrite(
        value, _editTipiEnumIsInitialized ? super.editTipiEnum : null, () {
      super.editTipiEnum = value;
      _editTipiEnumIsInitialized = true;
    });
  }

  late final _$isScrollDownAtom =
      Atom(name: '_TransferlerViewModelBase.isScrollDown', context: context);

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

  late final _$isSearchBarOpenAtom =
      Atom(name: '_TransferlerViewModelBase.isSearchBarOpen', context: context);

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

  late final _$ekstraAlanlarMapAtom = Atom(
      name: '_TransferlerViewModelBase.ekstraAlanlarMap', context: context);

  @override
  ObservableMap<String, bool> get ekstraAlanlarMap {
    _$ekstraAlanlarMapAtom.reportRead();
    return super.ekstraAlanlarMap;
  }

  @override
  set ekstraAlanlarMap(ObservableMap<String, bool> value) {
    _$ekstraAlanlarMapAtom.reportWrite(value, super.ekstraAlanlarMap, () {
      super.ekstraAlanlarMap = value;
    });
  }

  late final _$observableListAtom =
      Atom(name: '_TransferlerViewModelBase.observableList', context: context);

  @override
  ObservableList<BaseSiparisEditModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<BaseSiparisEditModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_TransferlerViewModelBase.searchText', context: context);

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

  late final _$faturaRequestModelAtom = Atom(
      name: '_TransferlerViewModelBase.faturaRequestModel', context: context);

  @override
  SiparislerRequestModel get faturaRequestModel {
    _$faturaRequestModelAtom.reportRead();
    return super.faturaRequestModel;
  }

  @override
  set faturaRequestModel(SiparislerRequestModel value) {
    _$faturaRequestModelAtom.reportWrite(value, super.faturaRequestModel, () {
      super.faturaRequestModel = value;
    });
  }

  late final _$changeSearchBarStatusAsyncAction = AsyncAction(
      '_TransferlerViewModelBase.changeSearchBarStatus',
      context: context);

  @override
  Future<void> changeSearchBarStatus() {
    return _$changeSearchBarStatusAsyncAction
        .run(() => super.changeSearchBarStatus());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_TransferlerViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_TransferlerViewModelBaseActionController =
      ActionController(name: '_TransferlerViewModelBase', context: context);

  @override
  void setObservableList(List<BaseSiparisEditModel>? list,
      [bool isFirst = false]) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setObservableList');
    try {
      return super.setObservableList(list, isFirst);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEkstraAlanlarMap(String key, bool value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.changeEkstraAlanlarMap');
    try {
      return super.changeEkstraAlanlarMap(key, value);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEkstraAlanlarMap() {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.resetEkstraAlanlarMap');
    try {
      return super.resetEkstraAlanlarMap();
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setIsScrollDown');
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.increaseSayfa');
    try {
      return super.increaseSayfa();
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addObservableList(List<BaseSiparisEditModel>? value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.addObservableList');
    try {
      return super.addObservableList(value);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLokalDAT(String? value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setLokalDAT');
    try {
      return super.setLokalDAT(value);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslangicTarihi(String? date) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setBaslangicTarihi');
    try {
      return super.setBaslangicTarihi(date);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(String? date) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setBitisTarihi');
    try {
      return super.setBitisTarihi(date);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOzelKod2(String? value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setOzelKod2');
    try {
      return super.setOzelKod2(value);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilter() {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.resetFilter');
    try {
      return super.resetFilter();
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editTipiEnum: ${editTipiEnum},
isScrollDown: ${isScrollDown},
isSearchBarOpen: ${isSearchBarOpen},
ekstraAlanlarMap: ${ekstraAlanlarMap},
observableList: ${observableList},
searchText: ${searchText},
faturaRequestModel: ${faturaRequestModel}
    ''';
  }
}
