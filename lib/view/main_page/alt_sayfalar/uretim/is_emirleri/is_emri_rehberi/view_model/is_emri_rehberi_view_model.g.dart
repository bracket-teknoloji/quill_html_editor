// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IsEmriRehberiViewModel on _IsEmriRehberiViewModelBase, Store {
  late final _$isSearchBarOpenAtom = Atom(
    name: '_IsEmriRehberiViewModelBase.isSearchBarOpen',
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

  late final _$isScrollDownAtom = Atom(
    name: '_IsEmriRehberiViewModelBase.isScrollDown',
    context: context,
  );

  @override
  bool get isScrollDown {
    _$isScrollDownAtom.reportRead();
    return super.isScrollDown;
  }

  @override
  set isScrollDown(bool value) {
    _$isScrollDownAtom.reportWrite(value, super.isScrollDown, () {
      super.isScrollDown = value;
    });
  }

  late final _$searchTextAtom = Atom(
    name: '_IsEmriRehberiViewModelBase.searchText',
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

  late final _$stokKoduAtom = Atom(
    name: '_IsEmriRehberiViewModelBase.stokKodu',
    context: context,
  );

  @override
  String? get stokKodu {
    _$stokKoduAtom.reportRead();
    return super.stokKodu;
  }

  @override
  set stokKodu(String? value) {
    _$stokKoduAtom.reportWrite(value, super.stokKodu, () {
      super.stokKodu = value;
    });
  }

  late final _$observableListAtom = Atom(
    name: '_IsEmriRehberiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<IsEmirleriModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<IsEmirleriModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$changeSearchBarStatusAsyncAction = AsyncAction(
    '_IsEmriRehberiViewModelBase.changeSearchBarStatus',
    context: context,
  );

  @override
  Future<void> changeSearchBarStatus() {
    return _$changeSearchBarStatusAsyncAction.run(
      () => super.changeSearchBarStatus(),
    );
  }

  late final _$resetListAsyncAction = AsyncAction(
    '_IsEmriRehberiViewModelBase.resetList',
    context: context,
  );

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_IsEmriRehberiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_IsEmriRehberiViewModelBaseActionController = ActionController(
    name: '_IsEmriRehberiViewModelBase',
    context: context,
  );

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController.startAction(
      name: '_IsEmriRehberiViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController.startAction(
      name: '_IsEmriRehberiViewModelBase.setIsScrollDown',
    );
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokKodu(String? value) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController.startAction(
      name: '_IsEmriRehberiViewModelBase.setStokKodu',
    );
    try {
      return super.setStokKodu(value);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<IsEmirleriModel>? list) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController.startAction(
      name: '_IsEmriRehberiViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addObservableList(List<IsEmirleriModel>? list) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController.startAction(
      name: '_IsEmriRehberiViewModelBase.addObservableList',
    );
    try {
      return super.addObservableList(list);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearchBarOpen: ${isSearchBarOpen},
isScrollDown: ${isScrollDown},
searchText: ${searchText},
stokKodu: ${stokKodu},
observableList: ${observableList}
    ''';
  }
}
