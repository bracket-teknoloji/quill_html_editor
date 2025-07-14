// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_firma_bayi_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaykerFirmaBayiListesiViewModel on _PaykerFirmaBayiListesiViewModelBase, Store {
  late final _$isSearchBarOpenAtom = Atom(
    name: '_PaykerFirmaBayiListesiViewModelBase.isSearchBarOpen',
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

  late final _$observableListAtom = Atom(
    name: '_PaykerFirmaBayiListesiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<PaykerFirmaModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<PaykerFirmaModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$searchTextAtom = Atom(
    name: '_PaykerFirmaBayiListesiViewModelBase.searchText',
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
    '_PaykerFirmaBayiListesiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_PaykerFirmaBayiListesiViewModelBaseActionController = ActionController(
    name: '_PaykerFirmaBayiListesiViewModelBase',
    context: context,
  );

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_PaykerFirmaBayiListesiViewModelBaseActionController.startAction(
      name: '_PaykerFirmaBayiListesiViewModelBase.changeSearchBarStatus',
    );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_PaykerFirmaBayiListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setObservableList(List<PaykerFirmaModel>? list) {
    final _$actionInfo = _$_PaykerFirmaBayiListesiViewModelBaseActionController.startAction(
      name: '_PaykerFirmaBayiListesiViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_PaykerFirmaBayiListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_PaykerFirmaBayiListesiViewModelBaseActionController.startAction(
      name: '_PaykerFirmaBayiListesiViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_PaykerFirmaBayiListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
isSearchBarOpen: ${isSearchBarOpen},
observableList: ${observableList},
searchText: ${searchText}
    ''';
  }
}
