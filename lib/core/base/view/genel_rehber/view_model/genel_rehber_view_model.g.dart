// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genel_rehber_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GenelRehberViewModel on _GenelRehberViewModelBase, Store {
  Computed<ObservableList<GenelRehberModel>?>? _$filteredObservableListComputed;

  @override
  ObservableList<GenelRehberModel>? get filteredObservableList =>
      (_$filteredObservableListComputed ??=
              Computed<ObservableList<GenelRehberModel>?>(
                () => super.filteredObservableList,
                name: '_GenelRehberViewModelBase.filteredObservableList',
              ))
          .value;

  late final _$requestModelAtom = Atom(
    name: '_GenelRehberViewModelBase.requestModel',
    context: context,
  );

  @override
  EkRehberRequestModel? get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(EkRehberRequestModel? value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$observableListAtom = Atom(
    name: '_GenelRehberViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<GenelRehberModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<GenelRehberModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(
    name: '_GenelRehberViewModelBase.isSearchBarOpen',
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

  late final _$searchTextAtom = Atom(
    name: '_GenelRehberViewModelBase.searchText',
    context: context,
  );

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

  late final _$getDataAsyncAction = AsyncAction(
    '_GenelRehberViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_GenelRehberViewModelBaseActionController = ActionController(
    name: '_GenelRehberViewModelBase',
    context: context,
  );

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_GenelRehberViewModelBaseActionController
        .startAction(name: '_GenelRehberViewModelBase.changeSearchBarStatus');
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_GenelRehberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_GenelRehberViewModelBaseActionController
        .startAction(name: '_GenelRehberViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_GenelRehberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<GenelRehberModel>? list) {
    final _$actionInfo = _$_GenelRehberViewModelBaseActionController
        .startAction(name: '_GenelRehberViewModelBase.setObservableList');
    try {
      return super.setObservableList(list);
    } finally {
      _$_GenelRehberViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
observableList: ${observableList},
isSearchBarOpen: ${isSearchBarOpen},
searchText: ${searchText},
filteredObservableList: ${filteredObservableList}
    ''';
  }
}
