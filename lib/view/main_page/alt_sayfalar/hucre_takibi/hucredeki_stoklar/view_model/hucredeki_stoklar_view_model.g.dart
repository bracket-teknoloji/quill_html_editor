// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucredeki_stoklar_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HucredekiStoklarViewModel on _HucredekiStoklarViewModelBase, Store {
  Computed<List<HucredekiStoklarModel>?>? _$filteredStoklarListesiComputed;

  @override
  List<HucredekiStoklarModel>? get filteredStoklarListesi =>
      (_$filteredStoklarListesiComputed ??= Computed<List<HucredekiStoklarModel>?>(
        () => super.filteredStoklarListesi,
        name: '_HucredekiStoklarViewModelBase.filteredStoklarListesi',
      )).value;

  late final _$observableListAtom = Atom(
    name: '_HucredekiStoklarViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<HucredekiStoklarModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<HucredekiStoklarModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_HucredekiStoklarViewModelBase.requestModel',
    context: context,
  );

  @override
  HucreListesiRequestModel? get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(HucreListesiRequestModel? value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$searchTextAtom = Atom(
    name: '_HucredekiStoklarViewModelBase.searchText',
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

  late final _$getDataAsyncAction = AsyncAction(
    '_HucredekiStoklarViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_HucredekiStoklarViewModelBaseActionController = ActionController(
    name: '_HucredekiStoklarViewModelBase',
    context: context,
  );

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_HucredekiStoklarViewModelBaseActionController.startAction(
      name: '_HucredekiStoklarViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_HucredekiStoklarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRequestModel(HucreListesiRequestModel model) {
    final _$actionInfo = _$_HucredekiStoklarViewModelBaseActionController.startAction(
      name: '_HucredekiStoklarViewModelBase.setRequestModel',
    );
    try {
      return super.setRequestModel(model);
    } finally {
      _$_HucredekiStoklarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<HucredekiStoklarModel>? list) {
    final _$actionInfo = _$_HucredekiStoklarViewModelBaseActionController.startAction(
      name: '_HucredekiStoklarViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_HucredekiStoklarViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
requestModel: ${requestModel},
searchText: ${searchText},
filteredStoklarListesi: ${filteredStoklarListesi}
    ''';
  }
}
