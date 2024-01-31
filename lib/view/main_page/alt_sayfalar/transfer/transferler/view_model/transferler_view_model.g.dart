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

  late final _$isScrolledDownAtom =
      Atom(name: '_TransferlerViewModelBase.isScrolledDown', context: context);

  @override
  bool get isScrolledDown {
    _$isScrolledDownAtom.reportRead();
    return super.isScrolledDown;
  }

  @override
  set isScrolledDown(bool value) {
    _$isScrolledDownAtom.reportWrite(value, super.isScrolledDown, () {
      super.isScrolledDown = value;
    });
  }

  late final _$searchBarAtom =
      Atom(name: '_TransferlerViewModelBase.searchBar', context: context);

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

  late final _$dahaVarMiAtom =
      Atom(name: '_TransferlerViewModelBase.dahaVarMi', context: context);

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

  late final _$transferListAtom =
      Atom(name: '_TransferlerViewModelBase.transferList', context: context);

  @override
  ObservableList<BaseSiparisEditModel>? get transferList {
    _$transferListAtom.reportRead();
    return super.transferList;
  }

  @override
  set transferList(ObservableList<BaseSiparisEditModel>? value) {
    _$transferListAtom.reportWrite(value, super.transferList, () {
      super.transferList = value;
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

  late final _$resetPageAsyncAction =
      AsyncAction('_TransferlerViewModelBase.resetPage', context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$changeSearchBarAsyncAction = AsyncAction(
      '_TransferlerViewModelBase.changeSearchBar',
      context: context);

  @override
  Future<void> changeSearchBar() {
    return _$changeSearchBarAsyncAction.run(() => super.changeSearchBar());
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
  void setTransferList(List<BaseSiparisEditModel>? list) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setTransferList');
    try {
      return super.setTransferList(list);
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
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
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
  void resetSayfa() {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
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
  void setFaturaList(List<BaseSiparisEditModel>? value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.setFaturaList');
    try {
      return super.setFaturaList(value);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFaturaList(List<BaseSiparisEditModel>? value) {
    final _$actionInfo = _$_TransferlerViewModelBaseActionController
        .startAction(name: '_TransferlerViewModelBase.addFaturaList');
    try {
      return super.addFaturaList(value);
    } finally {
      _$_TransferlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
editTipiEnum: ${editTipiEnum},
isScrolledDown: ${isScrolledDown},
searchBar: ${searchBar},
dahaVarMi: ${dahaVarMi},
ekstraAlanlarMap: ${ekstraAlanlarMap},
transferList: ${transferList},
faturaRequestModel: ${faturaRequestModel}
    ''';
  }
}
