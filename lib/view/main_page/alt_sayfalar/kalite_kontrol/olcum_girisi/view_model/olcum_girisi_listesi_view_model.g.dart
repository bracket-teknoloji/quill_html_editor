// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_girisi_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OlcumGirisiViewModel on _OlcumGirisiViewModelBase, Store {
  Computed<List<OlcumGirisiListesiModel>?>? _$getListComputed;

  @override
  List<OlcumGirisiListesiModel>? get getList => (_$getListComputed ??=
          Computed<List<OlcumGirisiListesiModel>?>(() => super.getList,
              name: '_OlcumGirisiViewModelBase.getList'))
      .value;

  late final _$searchBarAtom =
      Atom(name: '_OlcumGirisiViewModelBase.searchBar', context: context);

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

  late final _$searchTextAtom =
      Atom(name: '_OlcumGirisiViewModelBase.searchText', context: context);

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

  late final _$requestModelAtom =
      Atom(name: '_OlcumGirisiViewModelBase.requestModel', context: context);

  @override
  OlcumGirisiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(OlcumGirisiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$olcumListAtom =
      Atom(name: '_OlcumGirisiViewModelBase.olcumList', context: context);

  @override
  ObservableList<OlcumGirisiListesiModel>? get olcumList {
    _$olcumListAtom.reportRead();
    return super.olcumList;
  }

  @override
  set olcumList(ObservableList<OlcumGirisiListesiModel>? value) {
    _$olcumListAtom.reportWrite(value, super.olcumList, () {
      super.olcumList = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_OlcumGirisiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_OlcumGirisiViewModelBaseActionController =
      ActionController(name: '_OlcumGirisiViewModelBase', context: context);

  @override
  void setSearchBar() {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController
        .startAction(name: '_OlcumGirisiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBastar(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController
        .startAction(name: '_OlcumGirisiViewModelBase.setBastar');
    try {
      return super.setBastar(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBittar(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController
        .startAction(name: '_OlcumGirisiViewModelBase.setBittar');
    try {
      return super.setBittar(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeTipi(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController
        .startAction(name: '_OlcumGirisiViewModelBase.setBelgeTipi');
    try {
      return super.setBelgeTipi(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDurum(int? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController
        .startAction(name: '_OlcumGirisiViewModelBase.setDurum');
    try {
      return super.setDurum(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOlcumList(List<OlcumGirisiListesiModel>? list) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController
        .startAction(name: '_OlcumGirisiViewModelBase.setOlcumList');
    try {
      return super.setOlcumList(list);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_OlcumGirisiViewModelBaseActionController
        .startAction(name: '_OlcumGirisiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_OlcumGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
searchText: ${searchText},
requestModel: ${requestModel},
olcumList: ${olcumList},
getList: ${getList}
    ''';
  }
}
