// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surum_yenilikleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SurumYenilikleriViewModel on _SurumYenilikleriViewModelBase, Store {
  Computed<ObservableList<SurumYenilikleriModel>?>? _$getSurumYenilikleriModelListComputed;

  @override
  ObservableList<SurumYenilikleriModel>? get getSurumYenilikleriModelList =>
      (_$getSurumYenilikleriModelListComputed ??= Computed<ObservableList<SurumYenilikleriModel>?>(
        () => super.getSurumYenilikleriModelList,
        name: '_SurumYenilikleriViewModelBase.getSurumYenilikleriModelList',
      )).value;

  late final _$searchBarAtom = Atom(
    name: '_SurumYenilikleriViewModelBase.searchBar',
    context: context,
  );

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

  late final _$searchTextAtom = Atom(
    name: '_SurumYenilikleriViewModelBase.searchText',
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

  late final _$observableListAtom = Atom(
    name: '_SurumYenilikleriViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<SurumYenilikleriModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<SurumYenilikleriModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_SurumYenilikleriViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_SurumYenilikleriViewModelBaseActionController = ActionController(
    name: '_SurumYenilikleriViewModelBase',
    context: context,
  );

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_SurumYenilikleriViewModelBaseActionController.startAction(
      name: '_SurumYenilikleriViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_SurumYenilikleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_SurumYenilikleriViewModelBaseActionController.startAction(
      name: '_SurumYenilikleriViewModelBase.changeSearchBar',
    );
    try {
      return super.changeSearchBar();
    } finally {
      _$_SurumYenilikleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<SurumYenilikleriModel>? value) {
    final _$actionInfo = _$_SurumYenilikleriViewModelBaseActionController.startAction(
      name: '_SurumYenilikleriViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(value);
    } finally {
      _$_SurumYenilikleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
searchText: ${searchText},
observableList: ${observableList},
getSurumYenilikleriModelList: ${getSurumYenilikleriModelList}
    ''';
  }
}
