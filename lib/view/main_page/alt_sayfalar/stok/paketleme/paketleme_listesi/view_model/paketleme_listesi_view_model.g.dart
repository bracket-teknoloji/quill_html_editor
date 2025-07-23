// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paketleme_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaketlemeListesiViewModel on _PaketlemeListesiViewModelBase, Store {
  Computed<List<PaketlemeListesiModel>?>? _$filteredPaketlemeListesiComputed;

  @override
  List<PaketlemeListesiModel>? get filteredPaketlemeListesi =>
      (_$filteredPaketlemeListesiComputed ??=
              Computed<List<PaketlemeListesiModel>?>(
                () => super.filteredPaketlemeListesi,
                name: '_PaketlemeListesiViewModelBase.filteredPaketlemeListesi',
              ))
          .value;

  late final _$observableListAtom = Atom(
    name: '_PaketlemeListesiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<PaketlemeListesiModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<PaketlemeListesiModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$searchTextAtom = Atom(
    name: '_PaketlemeListesiViewModelBase.searchText',
    context: context,
  );

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(
    name: '_PaketlemeListesiViewModelBase.isSearchBarOpen',
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

  late final _$requestModelAtom = Atom(
    name: '_PaketlemeListesiViewModelBase.requestModel',
    context: context,
  );

  @override
  PaketlemeListesiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(PaketlemeListesiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_PaketlemeListesiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$deleteItemAsyncAction = AsyncAction(
    '_PaketlemeListesiViewModelBase.deleteItem',
    context: context,
  );

  @override
  Future<GenericResponseModel<PaketlemeListesiModel>> deleteItem(int? paketID) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(paketID));
  }

  late final _$_PaketlemeListesiViewModelBaseActionController =
      ActionController(
        name: '_PaketlemeListesiViewModelBase',
        context: context,
      );

  @override
  void setObservableList(List<PaketlemeListesiModel>? value) {
    final _$actionInfo = _$_PaketlemeListesiViewModelBaseActionController
        .startAction(name: '_PaketlemeListesiViewModelBase.setObservableList');
    try {
      return super.setObservableList(value);
    } finally {
      _$_PaketlemeListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_PaketlemeListesiViewModelBaseActionController
        .startAction(name: '_PaketlemeListesiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_PaketlemeListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_PaketlemeListesiViewModelBaseActionController
        .startAction(
          name: '_PaketlemeListesiViewModelBase.changeSearchBarStatus',
        );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_PaketlemeListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
searchText: ${searchText},
isSearchBarOpen: ${isSearchBarOpen},
requestModel: ${requestModel},
filteredPaketlemeListesi: ${filteredPaketlemeListesi}
    ''';
  }
}
