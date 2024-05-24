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
      (_$filteredPaketlemeListesiComputed ??= Computed<
                  List<PaketlemeListesiModel>?>(
              () => super.filteredPaketlemeListesi,
              name: '_PaketlemeListesiViewModelBase.filteredPaketlemeListesi'))
          .value;

  late final _$paketlemeListesiAtom = Atom(
      name: '_PaketlemeListesiViewModelBase.paketlemeListesi',
      context: context);

  @override
  ObservableList<PaketlemeListesiModel>? get paketlemeListesi {
    _$paketlemeListesiAtom.reportRead();
    return super.paketlemeListesi;
  }

  @override
  set paketlemeListesi(ObservableList<PaketlemeListesiModel>? value) {
    _$paketlemeListesiAtom.reportWrite(value, super.paketlemeListesi, () {
      super.paketlemeListesi = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_PaketlemeListesiViewModelBase.searchText', context: context);

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

  late final _$searchBarAtom =
      Atom(name: '_PaketlemeListesiViewModelBase.searchBar', context: context);

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

  late final _$requestModelAtom = Atom(
      name: '_PaketlemeListesiViewModelBase.requestModel', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('_PaketlemeListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$deleteItemAsyncAction = AsyncAction(
      '_PaketlemeListesiViewModelBase.deleteItem',
      context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> deleteItem(int? paketID) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(paketID));
  }

  late final _$_PaketlemeListesiViewModelBaseActionController =
      ActionController(
          name: '_PaketlemeListesiViewModelBase', context: context);

  @override
  void setPaketlemeListesi(List<PaketlemeListesiModel>? value) {
    final _$actionInfo =
        _$_PaketlemeListesiViewModelBaseActionController.startAction(
            name: '_PaketlemeListesiViewModelBase.setPaketlemeListesi');
    try {
      return super.setPaketlemeListesi(value);
    } finally {
      _$_PaketlemeListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_PaketlemeListesiViewModelBaseActionController
        .startAction(name: '_PaketlemeListesiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_PaketlemeListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchBar() {
    final _$actionInfo = _$_PaketlemeListesiViewModelBaseActionController
        .startAction(name: '_PaketlemeListesiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_PaketlemeListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paketlemeListesi: ${paketlemeListesi},
searchText: ${searchText},
searchBar: ${searchBar},
requestModel: ${requestModel},
filteredPaketlemeListesi: ${filteredPaketlemeListesi}
    ''';
  }
}
