// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BelgeKontrolViewModel on _BelgeKontrolViewModelBase, Store {
  Computed<ObservableList<BelgeKontrolModel>?>? _$filteredListComputed;

  @override
  ObservableList<BelgeKontrolModel>? get filteredList =>
      (_$filteredListComputed ??= Computed<ObservableList<BelgeKontrolModel>?>(
        () => super.filteredList,
        name: '_BelgeKontrolViewModelBase.filteredList',
      )).value;

  late final _$observableListAtom = Atom(name: '_BelgeKontrolViewModelBase.observableList', context: context);

  @override
  ObservableList<BelgeKontrolModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<BelgeKontrolModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$requestModelAtom = Atom(name: '_BelgeKontrolViewModelBase.requestModel', context: context);

  @override
  BelgeKontrolRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(BelgeKontrolRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(name: '_BelgeKontrolViewModelBase.isSearchBarOpen', context: context);

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

  late final _$searchTextAtom = Atom(name: '_BelgeKontrolViewModelBase.searchText', context: context);

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

  late final _$getDataAsyncAction = AsyncAction('_BelgeKontrolViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$deletekontrolAsyncAction = AsyncAction('_BelgeKontrolViewModelBase.deletekontrol', context: context);

  @override
  Future<GenericResponseModel<BelgeKontrolModel>> deletekontrol(int id) {
    return _$deletekontrolAsyncAction.run(() => super.deletekontrol(id));
  }

  late final _$_BelgeKontrolViewModelBaseActionController = ActionController(
    name: '_BelgeKontrolViewModelBase',
    context: context,
  );

  @override
  void setFilterValue(String value) {
    final _$actionInfo = _$_BelgeKontrolViewModelBaseActionController.startAction(
      name: '_BelgeKontrolViewModelBase.setFilterValue',
    );
    try {
      return super.setFilterValue(value);
    } finally {
      _$_BelgeKontrolViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslangicTarihi(String? value) {
    final _$actionInfo = _$_BelgeKontrolViewModelBaseActionController.startAction(
      name: '_BelgeKontrolViewModelBase.setBaslangicTarihi',
    );
    try {
      return super.setBaslangicTarihi(value);
    } finally {
      _$_BelgeKontrolViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_BelgeKontrolViewModelBaseActionController.startAction(
      name: '_BelgeKontrolViewModelBase.setBitisTarihi',
    );
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_BelgeKontrolViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<BelgeKontrolModel>? list) {
    final _$actionInfo = _$_BelgeKontrolViewModelBaseActionController.startAction(
      name: '_BelgeKontrolViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_BelgeKontrolViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_BelgeKontrolViewModelBaseActionController.startAction(
      name: '_BelgeKontrolViewModelBase.changeSearchBarStatus',
    );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_BelgeKontrolViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_BelgeKontrolViewModelBaseActionController.startAction(
      name: '_BelgeKontrolViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_BelgeKontrolViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
requestModel: ${requestModel},
isSearchBarOpen: ${isSearchBarOpen},
searchText: ${searchText},
filteredList: ${filteredList}
    ''';
  }
}
