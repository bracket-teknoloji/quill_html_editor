// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_mal_talebi_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransferMalTalebiListesiViewModel on _TransferMalTalebiListesiViewModelBase, Store {
  Computed<List<BaseSiparisEditModel>?>? _$filteredObservableListComputed;

  @override
  List<BaseSiparisEditModel>? get filteredObservableList =>
      (_$filteredObservableListComputed ??= Computed<List<BaseSiparisEditModel>?>(
        () => super.filteredObservableList,
        name: '_TransferMalTalebiListesiViewModelBase.filteredObservableList',
      )).value;

  late final _$observableListAtom = Atom(
    name: '_TransferMalTalebiListesiViewModelBase.observableList',
    context: context,
  );

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

  late final _$requestModelAtom = Atom(name: '_TransferMalTalebiListesiViewModelBase.requestModel', context: context);

  @override
  TransferMalTalebiListesiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(TransferMalTalebiListesiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(
    name: '_TransferMalTalebiListesiViewModelBase.isSearchBarOpen',
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

  late final _$searchTextAtom = Atom(name: '_TransferMalTalebiListesiViewModelBase.searchText', context: context);

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

  late final _$selectedDepoMalToplamaEnumAtom = Atom(
    name: '_TransferMalTalebiListesiViewModelBase.selectedDepoMalToplamaEnum',
    context: context,
  );

  @override
  DepoMalToplamaEnum get selectedDepoMalToplamaEnum {
    _$selectedDepoMalToplamaEnumAtom.reportRead();
    return super.selectedDepoMalToplamaEnum;
  }

  @override
  set selectedDepoMalToplamaEnum(DepoMalToplamaEnum value) {
    _$selectedDepoMalToplamaEnumAtom.reportWrite(value, super.selectedDepoMalToplamaEnum, () {
      super.selectedDepoMalToplamaEnum = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction('_TransferMalTalebiListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$setSelectedDepoMalToplamaEnumAsyncAction = AsyncAction(
    '_TransferMalTalebiListesiViewModelBase.setSelectedDepoMalToplamaEnum',
    context: context,
  );

  @override
  Future<void> setSelectedDepoMalToplamaEnum(DepoMalToplamaEnum value) {
    return _$setSelectedDepoMalToplamaEnumAsyncAction.run(() => super.setSelectedDepoMalToplamaEnum(value));
  }

  late final _$resetListAsyncAction = AsyncAction('_TransferMalTalebiListesiViewModelBase.resetList', context: context);

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$_TransferMalTalebiListesiViewModelBaseActionController = ActionController(
    name: '_TransferMalTalebiListesiViewModelBase',
    context: context,
  );

  @override
  void setObservableList(List<BaseSiparisEditModel>? list) {
    final _$actionInfo = _$_TransferMalTalebiListesiViewModelBaseActionController.startAction(
      name: '_TransferMalTalebiListesiViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_TransferMalTalebiListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
requestModel: ${requestModel},
isSearchBarOpen: ${isSearchBarOpen},
searchText: ${searchText},
selectedDepoMalToplamaEnum: ${selectedDepoMalToplamaEnum},
filteredObservableList: ${filteredObservableList}
    ''';
  }
}
