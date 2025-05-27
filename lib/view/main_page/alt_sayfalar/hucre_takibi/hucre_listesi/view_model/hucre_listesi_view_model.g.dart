// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HucreListesiViewModel on _HucreListesiViewModelBase, Store {
  Computed<ObservableList<HucreListesiModel>?>? _$filteredHucreListesiComputed;

  @override
  ObservableList<HucreListesiModel>? get filteredHucreListesi =>
      (_$filteredHucreListesiComputed ??=
              Computed<ObservableList<HucreListesiModel>?>(
                  () => super.filteredHucreListesi,
                  name: '_HucreListesiViewModelBase.filteredHucreListesi'))
          .value;

  late final _$requestModelAtom =
      Atom(name: '_HucreListesiViewModelBase.requestModel', context: context);

  @override
  HucreListesiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(HucreListesiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$observableListAtom =
      Atom(name: '_HucreListesiViewModelBase.observableList', context: context);

  @override
  ObservableList<HucreListesiModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<HucreListesiModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_HucreListesiViewModelBase.searchText', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('_HucreListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_HucreListesiViewModelBaseActionController =
      ActionController(name: '_HucreListesiViewModelBase', context: context);

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_HucreListesiViewModelBaseActionController
        .startAction(name: '_HucreListesiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_HucreListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepoKodu(int? value) {
    final _$actionInfo = _$_HucreListesiViewModelBaseActionController
        .startAction(name: '_HucreListesiViewModelBase.setDepoKodu');
    try {
      return super.setDepoKodu(value);
    } finally {
      _$_HucreListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<HucreListesiModel>? list) {
    final _$actionInfo = _$_HucreListesiViewModelBaseActionController
        .startAction(name: '_HucreListesiViewModelBase.setObservableList');
    try {
      return super.setObservableList(list);
    } finally {
      _$_HucreListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
observableList: ${observableList},
searchText: ${searchText},
filteredHucreListesi: ${filteredHucreListesi}
    ''';
  }
}
