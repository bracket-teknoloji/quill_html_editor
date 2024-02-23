// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'masraf_kodu_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MasrafKoduRehberiViewModel on _MasrafKoduRehberiViewModelBase, Store {
  late final _$masrafKoduRehberiListAtom = Atom(
      name: '_MasrafKoduRehberiViewModelBase.masrafKoduRehberiList',
      context: context);

  @override
  ObservableList<MasrafKoduRehberiModel>? get masrafKoduRehberiList {
    _$masrafKoduRehberiListAtom.reportRead();
    return super.masrafKoduRehberiList;
  }

  @override
  set masrafKoduRehberiList(ObservableList<MasrafKoduRehberiModel>? value) {
    _$masrafKoduRehberiListAtom.reportWrite(value, super.masrafKoduRehberiList,
        () {
      super.masrafKoduRehberiList = value;
    });
  }

  late final _$requestModelAtom = Atom(
      name: '_MasrafKoduRehberiViewModelBase.requestModel', context: context);

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

  late final _$dahaVarMiAtom =
      Atom(name: '_MasrafKoduRehberiViewModelBase.dahaVarMi', context: context);

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

  late final _$searchBarAtom =
      Atom(name: '_MasrafKoduRehberiViewModelBase.searchBar', context: context);

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

  late final _$resetPageAsyncAction = AsyncAction(
      '_MasrafKoduRehberiViewModelBase.resetPage',
      context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_MasrafKoduRehberiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_MasrafKoduRehberiViewModelBaseActionController =
      ActionController(
          name: '_MasrafKoduRehberiViewModelBase', context: context);

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_MasrafKoduRehberiViewModelBaseActionController
        .startAction(name: '_MasrafKoduRehberiViewModelBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_MasrafKoduRehberiViewModelBaseActionController
        .startAction(name: '_MasrafKoduRehberiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_MasrafKoduRehberiViewModelBaseActionController
        .startAction(name: '_MasrafKoduRehberiViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMasrafKoduRehberiList(List<MasrafKoduRehberiModel>? value) {
    final _$actionInfo =
        _$_MasrafKoduRehberiViewModelBaseActionController.startAction(
            name: '_MasrafKoduRehberiViewModelBase.setMasrafKoduRehberiList');
    try {
      return super.setMasrafKoduRehberiList(value);
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMasrafKoduRehberiList(List<MasrafKoduRehberiModel> value) {
    final _$actionInfo =
        _$_MasrafKoduRehberiViewModelBaseActionController.startAction(
            name: '_MasrafKoduRehberiViewModelBase.addMasrafKoduRehberiList');
    try {
      return super.addMasrafKoduRehberiList(value);
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_MasrafKoduRehberiViewModelBaseActionController
        .startAction(name: '_MasrafKoduRehberiViewModelBase.increaseSayfa');
    try {
      return super.increaseSayfa();
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_MasrafKoduRehberiViewModelBaseActionController
        .startAction(name: '_MasrafKoduRehberiViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
    } finally {
      _$_MasrafKoduRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
masrafKoduRehberiList: ${masrafKoduRehberiList},
requestModel: ${requestModel},
dahaVarMi: ${dahaVarMi},
searchBar: ${searchBar}
    ''';
  }
}
