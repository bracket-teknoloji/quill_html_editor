// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_odeme_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaykerOdemeListesiViewModel on _PaykerOdemeListesiViewModelBase, Store {
  Computed<ObservableList<PaykerOdemeListesiModel>?>? _$filteredListComputed;

  @override
  ObservableList<PaykerOdemeListesiModel>? get filteredList =>
      (_$filteredListComputed ??=
              Computed<ObservableList<PaykerOdemeListesiModel>?>(
                () => super.filteredList,
                name: '_PaykerOdemeListesiViewModelBase.filteredList',
              ))
          .value;

  late final _$filterModelAtom = Atom(
    name: '_PaykerOdemeListesiViewModelBase.filterModel',
    context: context,
  );

  @override
  PaykerFilterModel get filterModel {
    _$filterModelAtom.reportRead();
    return super.filterModel;
  }

  @override
  set filterModel(PaykerFilterModel value) {
    _$filterModelAtom.reportWrite(value, super.filterModel, () {
      super.filterModel = value;
    });
  }

  late final _$isSearchBarOpenAtom = Atom(
    name: '_PaykerOdemeListesiViewModelBase.isSearchBarOpen',
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
    name: '_PaykerOdemeListesiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<PaykerOdemeListesiModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<PaykerOdemeListesiModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$searchTextAtom = Atom(
    name: '_PaykerOdemeListesiViewModelBase.searchText',
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

  late final _$isScrollDownAtom = Atom(
    name: '_PaykerOdemeListesiViewModelBase.isScrollDown',
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

  late final _$resetListAsyncAction = AsyncAction(
    '_PaykerOdemeListesiViewModelBase.resetList',
    context: context,
  );

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_PaykerOdemeListesiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$checkPermissionsAsyncAction = AsyncAction(
    '_PaykerOdemeListesiViewModelBase.checkPermissions',
    context: context,
  );

  @override
  Future<ModuleInfoModel?> checkPermissions() {
    return _$checkPermissionsAsyncAction.run(() => super.checkPermissions());
  }

  late final _$_PaykerOdemeListesiViewModelBaseActionController =
      ActionController(
        name: '_PaykerOdemeListesiViewModelBase',
        context: context,
      );

  @override
  void changeSearchBarStatus() {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(
          name: '_PaykerOdemeListesiViewModelBase.changeSearchBarStatus',
        );
    try {
      return super.changeSearchBarStatus();
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setDurum(bool? durum) {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(name: '_PaykerOdemeListesiViewModelBase.setDurum');
    try {
      return super.setDurum(durum);
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBasTar(DateTime? basTar) {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(name: '_PaykerOdemeListesiViewModelBase.setBasTar');
    try {
      return super.setBasTar(basTar);
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBitTar(DateTime? bitTar) {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(name: '_PaykerOdemeListesiViewModelBase.setBitTar');
    try {
      return super.setBitTar(bitTar);
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBankaId(int? bankaId) {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(name: '_PaykerOdemeListesiViewModelBase.setBankaId');
    try {
      return super.setBankaId(bankaId);
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setFirmaId(int? firmaId) {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(name: '_PaykerOdemeListesiViewModelBase.setFirmaId');
    try {
      return super.setFirmaId(firmaId);
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setOrder(Order newOrder) {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(name: '_PaykerOdemeListesiViewModelBase.setOrder');
    try {
      return super.setOrder(newOrder);
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setObservableList(List<PaykerOdemeListesiModel>? list) {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(
          name: '_PaykerOdemeListesiViewModelBase.setObservableList',
        );
    try {
      return super.setObservableList(list);
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(name: '_PaykerOdemeListesiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void addObservableList(List<PaykerOdemeListesiModel>? list) {
    final _$actionInfo = _$_PaykerOdemeListesiViewModelBaseActionController
        .startAction(
          name: '_PaykerOdemeListesiViewModelBase.addObservableList',
        );
    try {
      return super.addObservableList(list);
    } finally {
      _$_PaykerOdemeListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
filterModel: ${filterModel},
isSearchBarOpen: ${isSearchBarOpen},
observableList: ${observableList},
searchText: ${searchText},
isScrollDown: ${isScrollDown},
filteredList: ${filteredList}
    ''';
  }
}
