// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriRehberiViewModel on _SeriRehberiViewModelBase, Store {
  Computed<ObservableList<SeriList>?>? _$filteredListComputed;

  @override
  ObservableList<SeriList>? get filteredList => (_$filteredListComputed ??=
          Computed<ObservableList<SeriList>?>(() => super.filteredList,
              name: '_SeriRehberiViewModelBase.filteredList'))
      .value;

  late final _$seriListAtom =
      Atom(name: '_SeriRehberiViewModelBase.seriList', context: context);

  @override
  ObservableList<SeriList>? get seriList {
    _$seriListAtom.reportRead();
    return super.seriList;
  }

  @override
  set seriList(ObservableList<SeriList>? value) {
    _$seriListAtom.reportWrite(value, super.seriList, () {
      super.seriList = value;
    });
  }

  late final _$requestModelAtom =
      Atom(name: '_SeriRehberiViewModelBase.requestModel', context: context);

  @override
  StokRehberiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(StokRehberiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: '_SeriRehberiViewModelBase.searchText', context: context);

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
      Atom(name: '_SeriRehberiViewModelBase.searchBar', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('_SeriRehberiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_SeriRehberiViewModelBaseActionController =
      ActionController(name: '_SeriRehberiViewModelBase', context: context);

  @override
  void setSeriList(List<SeriList>? list) {
    final _$actionInfo = _$_SeriRehberiViewModelBaseActionController
        .startAction(name: '_SeriRehberiViewModelBase.setSeriList');
    try {
      return super.setSeriList(list);
    } finally {
      _$_SeriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_SeriRehberiViewModelBaseActionController
        .startAction(name: '_SeriRehberiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_SeriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_SeriRehberiViewModelBaseActionController
        .startAction(name: '_SeriRehberiViewModelBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$_SeriRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seriList: ${seriList},
requestModel: ${requestModel},
searchText: ${searchText},
searchBar: ${searchBar},
filteredList: ${filteredList}
    ''';
  }
}
