// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_odeme_link_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaykerOdemeLinkListesiViewModel on _PaykerOdemeLinkListesiViewModelBase, Store {
  Computed<ObservableList<PaykerOdemeLinkListesiModel>?>? _$filteredListComputed;

  @override
  ObservableList<PaykerOdemeLinkListesiModel>? get filteredList =>
      (_$filteredListComputed ??= Computed<ObservableList<PaykerOdemeLinkListesiModel>?>(
        () => super.filteredList,
        name: '_PaykerOdemeLinkListesiViewModelBase.filteredList',
      )).value;

  late final _$observableListAtom = Atom(
    name: '_PaykerOdemeLinkListesiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<PaykerOdemeLinkListesiModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<PaykerOdemeLinkListesiModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(
    name: '_PaykerOdemeLinkListesiViewModelBase.isSearchBarOpen',
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
    name: '_PaykerOdemeLinkListesiViewModelBase.searchText',
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

  late final _$checkPermissionsAsyncAction = AsyncAction(
    '_PaykerOdemeLinkListesiViewModelBase.checkPermissions',
    context: context,
  );

  @override
  Future<ModuleInfoModel?> checkPermissions() {
    return _$checkPermissionsAsyncAction.run(() => super.checkPermissions());
  }

  late final _$resetListAsyncAction = AsyncAction(
    '_PaykerOdemeLinkListesiViewModelBase.resetList',
    context: context,
  );

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$deleteLinkAsyncAction = AsyncAction(
    '_PaykerOdemeLinkListesiViewModelBase.deleteLink',
    context: context,
  );

  @override
  Future<bool> deleteLink(String id) {
    return _$deleteLinkAsyncAction.run(() => super.deleteLink(id));
  }

  late final _$_PaykerOdemeLinkListesiViewModelBaseActionController = ActionController(
    name: '_PaykerOdemeLinkListesiViewModelBase',
    context: context,
  );

  @override
  void setObservableList(List<PaykerOdemeLinkListesiModel>? list) {
    final _$actionInfo = _$_PaykerOdemeLinkListesiViewModelBaseActionController.startAction(
      name: '_PaykerOdemeLinkListesiViewModelBase.setObservableList',
    );
    try {
      return super.setObservableList(list);
    } finally {
      _$_PaykerOdemeLinkListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_PaykerOdemeLinkListesiViewModelBaseActionController.startAction(
      name: '_PaykerOdemeLinkListesiViewModelBase.setSearchText',
    );
    try {
      return super.setSearchText(value);
    } finally {
      _$_PaykerOdemeLinkListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
isSearchBarOpen: ${isSearchBarOpen},
searchText: ${searchText},
filteredList: ${filteredList}
    ''';
  }
}
