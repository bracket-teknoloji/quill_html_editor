// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariHareketleriViewModel on _CariHareketleriViewModelBase, Store {
  Computed<double>? _$borclarToplamiComputed;

  @override
  double get borclarToplami => (_$borclarToplamiComputed ??= Computed<double>(
    () => super.borclarToplami,
    name: '_CariHareketleriViewModelBase.borclarToplami',
  )).value;
  Computed<double>? _$alacaklarToplamiComputed;

  @override
  double get alacaklarToplami =>
      (_$alacaklarToplamiComputed ??= Computed<double>(
        () => super.alacaklarToplami,
        name: '_CariHareketleriViewModelBase.alacaklarToplami',
      )).value;
  Computed<double>? _$toplamBakiyeComputed;

  @override
  double get toplamBakiye => (_$toplamBakiyeComputed ??= Computed<double>(
    () => super.toplamBakiye,
    name: '_CariHareketleriViewModelBase.toplamBakiye',
  )).value;
  Computed<double>? _$dovizBorclarToplamiComputed;

  @override
  double get dovizBorclarToplami =>
      (_$dovizBorclarToplamiComputed ??= Computed<double>(
        () => super.dovizBorclarToplami,
        name: '_CariHareketleriViewModelBase.dovizBorclarToplami',
      )).value;
  Computed<double>? _$dovizAlacaklarToplamiComputed;

  @override
  double get dovizAlacaklarToplami =>
      (_$dovizAlacaklarToplamiComputed ??= Computed<double>(
        () => super.dovizAlacaklarToplami,
        name: '_CariHareketleriViewModelBase.dovizAlacaklarToplami',
      )).value;
  Computed<ObservableList<CariHareketleriModel>?>?
  _$filteredCariHareketleriListComputed;

  @override
  ObservableList<CariHareketleriModel>? get filteredCariHareketleriList =>
      (_$filteredCariHareketleriListComputed ??=
              Computed<ObservableList<CariHareketleriModel>?>(
                () => super.filteredCariHareketleriList,
                name:
                    '_CariHareketleriViewModelBase.filteredCariHareketleriList',
              ))
          .value;

  late final _$cariListesiModelAtom = Atom(
    name: '_CariHareketleriViewModelBase.cariListesiModel',
    context: context,
  );

  @override
  CariListesiModel? get cariListesiModel {
    _$cariListesiModelAtom.reportRead();
    return super.cariListesiModel;
  }

  @override
  set cariListesiModel(CariListesiModel? value) {
    _$cariListesiModelAtom.reportWrite(value, super.cariListesiModel, () {
      super.cariListesiModel = value;
    });
  }

  late final _$isScrollDownAtom = Atom(
    name: '_CariHareketleriViewModelBase.isScrollDown',
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

  late final _$observableListAtom = Atom(
    name: '_CariHareketleriViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<CariHareketleriModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<CariHareketleriModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$siralamaAtom = Atom(
    name: '_CariHareketleriViewModelBase.siralama',
    context: context,
  );

  @override
  String get siralama {
    _$siralamaAtom.reportRead();
    return super.siralama;
  }

  @override
  set siralama(String value) {
    _$siralamaAtom.reportWrite(value, super.siralama, () {
      super.siralama = value;
    });
  }

  late final _$searchTextAtom = Atom(
    name: '_CariHareketleriViewModelBase.searchText',
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

  late final _$isSearchBarOpenAtom = Atom(
    name: '_CariHareketleriViewModelBase.isSearchBarOpen',
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

  late final _$setSiralamaAsyncAction = AsyncAction(
    '_CariHareketleriViewModelBase.setSiralama',
    context: context,
  );

  @override
  Future<void> setSiralama(String value) {
    return _$setSiralamaAsyncAction.run(() => super.setSiralama(value));
  }

  late final _$changeSearchBarStatusAsyncAction = AsyncAction(
    '_CariHareketleriViewModelBase.changeSearchBarStatus',
    context: context,
  );

  @override
  Future<void> changeSearchBarStatus() {
    return _$changeSearchBarStatusAsyncAction.run(
      () => super.changeSearchBarStatus(),
    );
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_CariHareketleriViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_CariHareketleriViewModelBaseActionController = ActionController(
    name: '_CariHareketleriViewModelBase',
    context: context,
  );

  @override
  void changeScrollDown(bool value) {
    final _$actionInfo = _$_CariHareketleriViewModelBaseActionController
        .startAction(name: '_CariHareketleriViewModelBase.changeScrollDown');
    try {
      return super.changeScrollDown(value);
    } finally {
      _$_CariHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<CariHareketleriModel>? value) {
    final _$actionInfo = _$_CariHareketleriViewModelBaseActionController
        .startAction(name: '_CariHareketleriViewModelBase.setObservableList');
    try {
      return super.setObservableList(value);
    } finally {
      _$_CariHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_CariHareketleriViewModelBaseActionController
        .startAction(name: '_CariHareketleriViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_CariHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariListesiModel(CariListesiModel? value) {
    final _$actionInfo = _$_CariHareketleriViewModelBaseActionController
        .startAction(name: '_CariHareketleriViewModelBase.setCariListesiModel');
    try {
      return super.setCariListesiModel(value);
    } finally {
      _$_CariHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cariListesiModel: ${cariListesiModel},
isScrollDown: ${isScrollDown},
observableList: ${observableList},
siralama: ${siralama},
searchText: ${searchText},
isSearchBarOpen: ${isSearchBarOpen},
borclarToplami: ${borclarToplami},
alacaklarToplami: ${alacaklarToplami},
toplamBakiye: ${toplamBakiye},
dovizBorclarToplami: ${dovizBorclarToplami},
dovizAlacaklarToplami: ${dovizAlacaklarToplami},
filteredCariHareketleriList: ${filteredCariHareketleriList}
    ''';
  }
}
