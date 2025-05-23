// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yapilandirma_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$YapilandirmaRehberiViewModel on _YapilandirmaRehberiViewModelBase, Store {
  Computed<YapilandirmaProfilModel?>? _$yapilandirmaProfilModelComputed;

  @override
  YapilandirmaProfilModel? get yapilandirmaProfilModel =>
      (_$yapilandirmaProfilModelComputed ??= Computed<YapilandirmaProfilModel?>(
        () => super.yapilandirmaProfilModel,
        name: '_YapilandirmaRehberiViewModelBase.yapilandirmaProfilModel',
      )).value;
  Computed<Color>? _$colorComputed;

  @override
  Color get color =>
      (_$colorComputed ??= Computed<Color>(() => super.color, name: '_YapilandirmaRehberiViewModelBase.color')).value;
  Computed<int?>? _$countComputed;

  @override
  int? get count =>
      (_$countComputed ??= Computed<int?>(() => super.count, name: '_YapilandirmaRehberiViewModelBase.count')).value;
  Computed<bool>? _$isLastPageComputed;

  @override
  bool get isLastPage => (_$isLastPageComputed ??= Computed<bool>(
    () => super.isLastPage,
    name: '_YapilandirmaRehberiViewModelBase.isLastPage',
  )).value;
  Computed<YapilandirmaRehberiModel?>? _$yapilandirmaRehberiModelComputed;

  @override
  YapilandirmaRehberiModel? get yapilandirmaRehberiModel =>
      (_$yapilandirmaRehberiModelComputed ??= Computed<YapilandirmaRehberiModel?>(
        () => super.yapilandirmaRehberiModel,
        name: '_YapilandirmaRehberiViewModelBase.yapilandirmaRehberiModel',
      )).value;
  Computed<String>? _$titleComputed;

  @override
  String get title =>
      (_$titleComputed ??= Computed<String>(() => super.title, name: '_YapilandirmaRehberiViewModelBase.title')).value;

  late final _$pageAtom = Atom(name: '_YapilandirmaRehberiViewModelBase.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$stokListesiModelAtom = Atom(
    name: '_YapilandirmaRehberiViewModelBase.stokListesiModel',
    context: context,
  );

  @override
  StokListesiModel? get stokListesiModel {
    _$stokListesiModelAtom.reportRead();
    return super.stokListesiModel;
  }

  @override
  set stokListesiModel(StokListesiModel? value) {
    _$stokListesiModelAtom.reportWrite(value, super.stokListesiModel, () {
      super.stokListesiModel = value;
    });
  }

  late final _$yapilandirmaListAtom = Atom(
    name: '_YapilandirmaRehberiViewModelBase.yapilandirmaList',
    context: context,
  );

  @override
  ObservableList<YapilandirmaRehberiModel>? get yapilandirmaList {
    _$yapilandirmaListAtom.reportRead();
    return super.yapilandirmaList;
  }

  @override
  set yapilandirmaList(ObservableList<YapilandirmaRehberiModel>? value) {
    _$yapilandirmaListAtom.reportWrite(value, super.yapilandirmaList, () {
      super.yapilandirmaList = value;
    });
  }

  late final _$yapilandirmaProfilListAtom = Atom(
    name: '_YapilandirmaRehberiViewModelBase.yapilandirmaProfilList',
    context: context,
  );

  @override
  ObservableList<YapilandirmaProfilModel?>? get yapilandirmaProfilList {
    _$yapilandirmaProfilListAtom.reportRead();
    return super.yapilandirmaProfilList;
  }

  @override
  set yapilandirmaProfilList(ObservableList<YapilandirmaProfilModel?>? value) {
    _$yapilandirmaProfilListAtom.reportWrite(value, super.yapilandirmaProfilList, () {
      super.yapilandirmaProfilList = value;
    });
  }

  late final _$maxPageAtom = Atom(name: '_YapilandirmaRehberiViewModelBase.maxPage', context: context);

  @override
  int? get maxPage {
    _$maxPageAtom.reportRead();
    return super.maxPage;
  }

  @override
  set maxPage(int? value) {
    _$maxPageAtom.reportWrite(value, super.maxPage, () {
      super.maxPage = value;
    });
  }

  late final _$filteredListAtom = Atom(name: '_YapilandirmaRehberiViewModelBase.filteredList', context: context);

  @override
  ObservableList<YapilandirmaRehberiModel>? get filteredList {
    _$filteredListAtom.reportRead();
    return super.filteredList;
  }

  @override
  set filteredList(ObservableList<YapilandirmaRehberiModel>? value) {
    _$filteredListAtom.reportWrite(value, super.filteredList, () {
      super.filteredList = value;
    });
  }

  late final _$filteredList2Atom = Atom(name: '_YapilandirmaRehberiViewModelBase.filteredList2', context: context);

  @override
  ObservableList<YapilandirmaRehberiModel>? get filteredList2 {
    _$filteredList2Atom.reportRead();
    return super.filteredList2;
  }

  @override
  set filteredList2(ObservableList<YapilandirmaRehberiModel>? value) {
    _$filteredList2Atom.reportWrite(value, super.filteredList2, () {
      super.filteredList2 = value;
    });
  }

  late final _$altKodlariGetirAsyncAction = AsyncAction(
    '_YapilandirmaRehberiViewModelBase.altKodlariGetir',
    context: context,
  );

  @override
  Future<void> altKodlariGetir() {
    return _$altKodlariGetirAsyncAction.run(() => super.altKodlariGetir());
  }

  late final _$incrementPageAsyncAction = AsyncAction(
    '_YapilandirmaRehberiViewModelBase.incrementPage',
    context: context,
  );

  @override
  Future<void> incrementPage() {
    return _$incrementPageAsyncAction.run(() => super.incrementPage());
  }

  late final _$getDataAsyncAction = AsyncAction('_YapilandirmaRehberiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_YapilandirmaRehberiViewModelBaseActionController = ActionController(
    name: '_YapilandirmaRehberiViewModelBase',
    context: context,
  );

  @override
  void setMaxPage(int? value) {
    final _$actionInfo = _$_YapilandirmaRehberiViewModelBaseActionController.startAction(
      name: '_YapilandirmaRehberiViewModelBase.setMaxPage',
    );
    try {
      return super.setMaxPage(value);
    } finally {
      _$_YapilandirmaRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYapilandirmaRehberiModel(YapilandirmaRehberiModel? value) {
    final _$actionInfo = _$_YapilandirmaRehberiViewModelBaseActionController.startAction(
      name: '_YapilandirmaRehberiViewModelBase.setYapilandirmaRehberiModel',
    );
    try {
      return super.setYapilandirmaRehberiModel(value);
    } finally {
      _$_YapilandirmaRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementPage() {
    final _$actionInfo = _$_YapilandirmaRehberiViewModelBaseActionController.startAction(
      name: '_YapilandirmaRehberiViewModelBase.decrementPage',
    );
    try {
      return super.decrementPage();
    } finally {
      _$_YapilandirmaRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFilteredList() {
    final _$actionInfo = _$_YapilandirmaRehberiViewModelBaseActionController.startAction(
      name: '_YapilandirmaRehberiViewModelBase.resetFilteredList',
    );
    try {
      return super.resetFilteredList();
    } finally {
      _$_YapilandirmaRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokListesiModel(StokListesiModel? value) {
    final _$actionInfo = _$_YapilandirmaRehberiViewModelBaseActionController.startAction(
      name: '_YapilandirmaRehberiViewModelBase.setStokListesiModel',
    );
    try {
      return super.setStokListesiModel(value);
    } finally {
      _$_YapilandirmaRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
stokListesiModel: ${stokListesiModel},
yapilandirmaList: ${yapilandirmaList},
yapilandirmaProfilList: ${yapilandirmaProfilList},
maxPage: ${maxPage},
filteredList: ${filteredList},
filteredList2: ${filteredList2},
yapilandirmaProfilModel: ${yapilandirmaProfilModel},
color: ${color},
count: ${count},
isLastPage: ${isLastPage},
yapilandirmaRehberiModel: ${yapilandirmaRehberiModel},
title: ${title}
    ''';
  }
}
