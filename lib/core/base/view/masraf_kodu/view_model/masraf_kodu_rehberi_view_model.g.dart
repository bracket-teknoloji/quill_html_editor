// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masraf_kodu_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MasrafKoduRehberiViewModel on _MasrafKoduRehberiViewModelBase, Store {
  late final _$observableListAtom = Atom(
    name: '_MasrafKoduRehberiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<MasrafKoduRehberiModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<MasrafKoduRehberiModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_MasrafKoduRehberiViewModelBase.requestModel',
    context: context,
  );

  @override
  SiparisEditRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(SiparisEditRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(
    name: '_MasrafKoduRehberiViewModelBase.isSearchBarOpen',
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

  late final _$changeScrollStatusAsyncAction = AsyncAction(
    '_MasrafKoduRehberiViewModelBase.changeScrollStatus',
    context: context,
  );

  @override
  Future<void> changeScrollStatus(ScrollPosition position) {
    return _$changeScrollStatusAsyncAction.run(
      () => super.changeScrollStatus(position),
    );
  }

  late final _$changeSearchBarStatusAsyncAction = AsyncAction(
    '_MasrafKoduRehberiViewModelBase.changeSearchBarStatus',
    context: context,
  );

  @override
  Future<void> changeSearchBarStatus() {
    return _$changeSearchBarStatusAsyncAction.run(
      () => super.changeSearchBarStatus(),
    );
  }

  late final _$resetListAsyncAction = AsyncAction(
    '_MasrafKoduRehberiViewModelBase.resetList',
    context: context,
  );

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_MasrafKoduRehberiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_MasrafKoduRehberiViewModelBaseActionController = ActionController(
    name: '_MasrafKoduRehberiViewModelBase',
    context: context,
  );

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_MasrafKoduRehberiViewModelBaseActionController.startAction(
      name: '_MasrafKoduRehberiViewModelBase.changeSearchBar',
    );
    try {
      return super.changeSearchBar();
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_MasrafKoduRehberiViewModelBaseActionController.startAction(
      name: '_MasrafKoduRehberiViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<MasrafKoduRehberiModel>? value) {
    final _$actionInfo = _$_MasrafKoduRehberiViewModelBaseActionController.startAction(
      name: '_MasrafKoduRehberiViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(value);
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addObservableList(List<MasrafKoduRehberiModel>? value) {
    final _$actionInfo = _$_MasrafKoduRehberiViewModelBaseActionController.startAction(
      name: '_MasrafKoduRehberiViewModelBase.addObservableList',
    );
    try {
      return super.addObservableList(value);
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
requestModel: ${requestModel},
isSearchBarOpen: ${isSearchBarOpen}
    ''';
  }
}
