// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriHareketleriViewModel on _SeriHareketleriViewModelBase, Store {
  Computed<ObservableList<SeriHareketleriModel>?>? _$filteredListComputed;

  @override
  ObservableList<SeriHareketleriModel>? get filteredList =>
      (_$filteredListComputed ??= Computed<ObservableList<SeriHareketleriModel>?>(
        () => super.filteredList,
        name: '_SeriHareketleriViewModelBase.filteredList',
      )).value;

  late final _$isSearchBarOpenedAtom = Atom(name: '_SeriHareketleriViewModelBase.isSearchBarOpened', context: context);

  @override
  bool get isSearchBarOpened {
    _$isSearchBarOpenedAtom.reportRead();
    return super.isSearchBarOpened;
  }

  @override
  set isSearchBarOpened(bool value) {
    _$isSearchBarOpenedAtom.reportWrite(value, super.isSearchBarOpened, () {
      super.isSearchBarOpened = value;
    });
  }

  late final _$selectedActionTypeAtom = Atom(
    name: '_SeriHareketleriViewModelBase.selectedActionType',
    context: context,
  );

  @override
  ObservableList<bool> get selectedActionType {
    _$selectedActionTypeAtom.reportRead();
    return super.selectedActionType;
  }

  @override
  set selectedActionType(ObservableList<bool> value) {
    _$selectedActionTypeAtom.reportWrite(value, super.selectedActionType, () {
      super.selectedActionType = value;
    });
  }

  late final _$searchQueryAtom = Atom(name: '_SeriHareketleriViewModelBase.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$stokListesiModelAtom = Atom(name: '_SeriHareketleriViewModelBase.stokListesiModel', context: context);

  @override
  StokListesiModel? get stokListesiModel {
    _$stokListesiModelAtom.reportRead();
    return super.stokListesiModel;
  }

  @override
  set stokListesiModel(StokListesiModel? value) {
    _$stokListesiModelAtom.reportWrite(value, super.stokListesiModel, () {
      super.stokListesiModel = value;
    });
  }

  late final _$requestModelAtom = Atom(name: '_SeriHareketleriViewModelBase.requestModel', context: context);

  @override
  SeriHareketleriRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(SeriHareketleriRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$seriHareketleriListAtom = Atom(
    name: '_SeriHareketleriViewModelBase.seriHareketleriList',
    context: context,
  );

  @override
  ObservableList<SeriHareketleriModel>? get seriHareketleriList {
    _$seriHareketleriListAtom.reportRead();
    return super.seriHareketleriList;
  }

  @override
  set seriHareketleriList(ObservableList<SeriHareketleriModel>? value) {
    _$seriHareketleriListAtom.reportWrite(value, super.seriHareketleriList, () {
      super.seriHareketleriList = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction('_SeriHareketleriViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$deleteSeriHareketAsyncAction = AsyncAction(
    '_SeriHareketleriViewModelBase.deleteSeriHareket',
    context: context,
  );

  @override
  Future<bool> deleteSeriHareket(SeriHareketleriModel? model) {
    return _$deleteSeriHareketAsyncAction.run(() => super.deleteSeriHareket(model));
  }

  late final _$_SeriHareketleriViewModelBaseActionController = ActionController(
    name: '_SeriHareketleriViewModelBase',
    context: context,
  );

  @override
  void setRequestModel(SeriHareketleriRequestModel model) {
    final _$actionInfo = _$_SeriHareketleriViewModelBaseActionController.startAction(
      name: '_SeriHareketleriViewModelBase.setRequestModel',
    );
    try {
      return super.setRequestModel(model);
    } finally {
      _$_SeriHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$_SeriHareketleriViewModelBaseActionController.startAction(
      name: '_SeriHareketleriViewModelBase.setSearchQuery',
    );
    try {
      return super.setSearchQuery(query);
    } finally {
      _$_SeriHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onActionTypeChanged(int? index) {
    final _$actionInfo = _$_SeriHareketleriViewModelBaseActionController.startAction(
      name: '_SeriHareketleriViewModelBase.onActionTypeChanged',
    );
    try {
      return super.onActionTypeChanged(index);
    } finally {
      _$_SeriHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSearchBarOpened() {
    final _$actionInfo = _$_SeriHareketleriViewModelBaseActionController.startAction(
      name: '_SeriHareketleriViewModelBase.setIsSearchBarOpened',
    );
    try {
      return super.setIsSearchBarOpened();
    } finally {
      _$_SeriHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokListesiModel(StokListesiModel model) {
    final _$actionInfo = _$_SeriHareketleriViewModelBaseActionController.startAction(
      name: '_SeriHareketleriViewModelBase.setStokListesiModel',
    );
    try {
      return super.setStokListesiModel(model);
    } finally {
      _$_SeriHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSirala(String sirala) {
    final _$actionInfo = _$_SeriHareketleriViewModelBaseActionController.startAction(
      name: '_SeriHareketleriViewModelBase.setSirala',
    );
    try {
      return super.setSirala(sirala);
    } finally {
      _$_SeriHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokKodu(String? stokKodu) {
    final _$actionInfo = _$_SeriHareketleriViewModelBaseActionController.startAction(
      name: '_SeriHareketleriViewModelBase.setStokKodu',
    );
    try {
      return super.setStokKodu(stokKodu);
    } finally {
      _$_SeriHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeriNo(String? seriNo) {
    final _$actionInfo = _$_SeriHareketleriViewModelBaseActionController.startAction(
      name: '_SeriHareketleriViewModelBase.setSeriNo',
    );
    try {
      return super.setSeriNo(seriNo);
    } finally {
      _$_SeriHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSerihareketleriList(List<SeriHareketleriModel>? list) {
    final _$actionInfo = _$_SeriHareketleriViewModelBaseActionController.startAction(
      name: '_SeriHareketleriViewModelBase.setSerihareketleriList',
    );
    try {
      return super.setSerihareketleriList(list);
    } finally {
      _$_SeriHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearchBarOpened: ${isSearchBarOpened},
selectedActionType: ${selectedActionType},
searchQuery: ${searchQuery},
stokListesiModel: ${stokListesiModel},
requestModel: ${requestModel},
seriHareketleriList: ${seriHareketleriList},
filteredList: ${filteredList}
    ''';
  }
}
