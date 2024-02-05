// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IsEmriRehberiViewModel on _IsEmriRehberiViewModelBase, Store {
  late final _$isScrollDownAtom =
      Atom(name: '_IsEmriRehberiViewModelBase.isScrollDown', context: context);

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

  late final _$searchBarAtom =
      Atom(name: '_IsEmriRehberiViewModelBase.searchBar', context: context);

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

  late final _$dahaVarMiAtom =
      Atom(name: '_IsEmriRehberiViewModelBase.dahaVarMi', context: context);

  @override
  bool get dahaVarMi {
    _$dahaVarMiAtom.reportRead();
    return super.dahaVarMi;
  }

  @override
  set dahaVarMi(bool value) {
    _$dahaVarMiAtom.reportWrite(value, super.dahaVarMi, () {
      super.dahaVarMi = value;
    });
  }

  late final _$isEmriListAtom =
      Atom(name: '_IsEmriRehberiViewModelBase.isEmriList', context: context);

  @override
  ObservableList<IsEmirleriModel>? get isEmriList {
    _$isEmriListAtom.reportRead();
    return super.isEmriList;
  }

  @override
  set isEmriList(ObservableList<IsEmirleriModel>? value) {
    _$isEmriListAtom.reportWrite(value, super.isEmriList, () {
      super.isEmriList = value;
    });
  }

  late final _$requestModelAtom =
      Atom(name: '_IsEmriRehberiViewModelBase.requestModel', context: context);

  @override
  SiparislerRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(SiparislerRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$changeSearchBarAsyncAction = AsyncAction(
      '_IsEmriRehberiViewModelBase.changeSearchBar',
      context: context);

  @override
  Future<void> changeSearchBar() {
    return _$changeSearchBarAsyncAction.run(() => super.changeSearchBar());
  }

  late final _$resetPageAsyncAction =
      AsyncAction('_IsEmriRehberiViewModelBase.resetPage', context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_IsEmriRehberiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_IsEmriRehberiViewModelBaseActionController =
      ActionController(name: '_IsEmriRehberiViewModelBase', context: context);

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController
        .startAction(name: '_IsEmriRehberiViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController
        .startAction(name: '_IsEmriRehberiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsScrollDown(bool value) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController
        .startAction(name: '_IsEmriRehberiViewModelBase.setIsScrollDown');
    try {
      return super.setIsScrollDown(value);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEmirleriList(List<IsEmirleriModel>? list) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController
        .startAction(name: '_IsEmriRehberiViewModelBase.setIsEmirleriList');
    try {
      return super.setIsEmirleriList(list);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addIsEmirleriList(List<IsEmirleriModel>? list) {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController
        .startAction(name: '_IsEmriRehberiViewModelBase.addIsEmirleriList');
    try {
      return super.addIsEmirleriList(list);
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController
        .startAction(name: '_IsEmriRehberiViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_IsEmriRehberiViewModelBaseActionController
        .startAction(name: '_IsEmriRehberiViewModelBase.increaseSayfa');
    try {
      return super.increaseSayfa();
    } finally {
      _$_IsEmriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isScrollDown: ${isScrollDown},
searchBar: ${searchBar},
dahaVarMi: ${dahaVarMi},
isEmriList: ${isEmriList},
requestModel: ${requestModel}
    ''';
  }
}
