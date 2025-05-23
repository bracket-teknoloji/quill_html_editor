// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_kontrol_kalemler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BelgeKontrolKalemlerViewModel on _BelgeKontrolKalemlerViewModelBase, Store {
  Computed<ObservableList<BelgeKontrolKalemlerModel>?>? _$filteredListComputed;

  @override
  ObservableList<BelgeKontrolKalemlerModel>? get filteredList =>
      (_$filteredListComputed ??= Computed<ObservableList<BelgeKontrolKalemlerModel>?>(
        () => super.filteredList,
        name: '_BelgeKontrolKalemlerViewModelBase.filteredList',
      )).value;

  late final _$requestModelAtom = Atom(name: '_BelgeKontrolKalemlerViewModelBase.requestModel', context: context);

  @override
  BelgeKontrolModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(BelgeKontrolModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$observableListAtom = Atom(name: '_BelgeKontrolKalemlerViewModelBase.observableList', context: context);

  @override
  ObservableList<BelgeKontrolKalemlerModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<BelgeKontrolKalemlerModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(name: '_BelgeKontrolKalemlerViewModelBase.isSearchBarOpen', context: context);

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

  late final _$searchTextAtom = Atom(name: '_BelgeKontrolKalemlerViewModelBase.searchText', context: context);

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

  late final _$resetListAsyncAction = AsyncAction('_BelgeKontrolKalemlerViewModelBase.resetList', context: context);

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getDataAsyncAction = AsyncAction('_BelgeKontrolKalemlerViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$deleteKalemAsyncAction = AsyncAction('_BelgeKontrolKalemlerViewModelBase.deleteKalem', context: context);

  @override
  Future<void> deleteKalem(BelgeKontrolKalemlerModel model) {
    return _$deleteKalemAsyncAction.run(() => super.deleteKalem(model));
  }

  late final _$_BelgeKontrolKalemlerViewModelBaseActionController = ActionController(
    name: '_BelgeKontrolKalemlerViewModelBase',
    context: context,
  );

  @override
  void setObservableList(List<BelgeKontrolKalemlerModel>? list) {
    final _$actionInfo = _$_BelgeKontrolKalemlerViewModelBaseActionController.startAction(
      name: '_BelgeKontrolKalemlerViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_BelgeKontrolKalemlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_BelgeKontrolKalemlerViewModelBaseActionController.startAction(
      name: '_BelgeKontrolKalemlerViewModelBase.changeSearchBarStatus',
    );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_BelgeKontrolKalemlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_BelgeKontrolKalemlerViewModelBaseActionController.startAction(
      name: '_BelgeKontrolKalemlerViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_BelgeKontrolKalemlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
observableList: ${observableList},
isSearchBarOpen: ${isSearchBarOpen},
searchText: ${searchText},
filteredList: ${filteredList}
    ''';
  }
}
