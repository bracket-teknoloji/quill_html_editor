// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariHareketleriViewModel on _CariHareketleriViewModelBase, Store {
  Computed<double>? _$borclarToplamiComputed;

  @override
  double get borclarToplami => (_$borclarToplamiComputed ??= Computed<double>(() => super.borclarToplami, name: '_CariHareketleriViewModelBase.borclarToplami')).value;
  Computed<double>? _$alacaklarToplamiComputed;

  @override
  double get alacaklarToplami => (_$alacaklarToplamiComputed ??= Computed<double>(() => super.alacaklarToplami, name: '_CariHareketleriViewModelBase.alacaklarToplami')).value;
  Computed<double>? _$toplamBakiyeComputed;

  @override
  double get toplamBakiye => (_$toplamBakiyeComputed ??= Computed<double>(() => super.toplamBakiye, name: '_CariHareketleriViewModelBase.toplamBakiye')).value;
  Computed<double>? _$dovizBorclarToplamiComputed;

  @override
  double get dovizBorclarToplami => (_$dovizBorclarToplamiComputed ??= Computed<double>(() => super.dovizBorclarToplami, name: '_CariHareketleriViewModelBase.dovizBorclarToplami')).value;
  Computed<double>? _$dovizAlacaklarToplamiComputed;

  @override
  double get dovizAlacaklarToplami => (_$dovizAlacaklarToplamiComputed ??= Computed<double>(() => super.dovizAlacaklarToplami, name: '_CariHareketleriViewModelBase.dovizAlacaklarToplami')).value;

  late final _$cariListesiModelAtom = Atom(name: '_CariHareketleriViewModelBase.cariListesiModel', context: context);

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

  late final _$isScrollDownAtom = Atom(name: '_CariHareketleriViewModelBase.isScrollDown', context: context);

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

  late final _$cariHareketleriListAtom = Atom(name: '_CariHareketleriViewModelBase.cariHareketleriList', context: context);

  @override
  ObservableList<CariHareketleriModel>? get cariHareketleriList {
    _$cariHareketleriListAtom.reportRead();
    return super.cariHareketleriList;
  }

  @override
  set cariHareketleriList(ObservableList<CariHareketleriModel>? value) {
    _$cariHareketleriListAtom.reportWrite(value, super.cariHareketleriList, () {
      super.cariHareketleriList = value;
    });
  }

  late final _$siralamaAtom = Atom(name: '_CariHareketleriViewModelBase.siralama', context: context);

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

  late final _$isSearchBarOpenedAtom = Atom(name: '_CariHareketleriViewModelBase.isSearchBarOpened', context: context);

  @override
  bool get isSearchBarOpened {
    _$isSearchBarOpenedAtom.reportRead();
    return super.isSearchBarOpened;
  }

  @override
  set isSearchBarOpened(bool value) {
    _$isSearchBarOpenedAtom.reportWrite(value, super.isSearchBarOpened, () {
      super.isSearchBarOpened = value;
    });
  }

  late final _$_CariHareketleriViewModelBaseActionController = ActionController(name: '_CariHareketleriViewModelBase', context: context);

  @override
  void changeScrollDown(bool value) {
    final _$actionInfo = _$_CariHareketleriViewModelBaseActionController.startAction(name: '_CariHareketleriViewModelBase.changeScrollDown');
    try {
      return super.changeScrollDown(value);
    } finally {
      _$_CariHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariHareketleri(List<CariHareketleriModel>? value) {
    final _$actionInfo = _$_CariHareketleriViewModelBaseActionController.startAction(name: '_CariHareketleriViewModelBase.setCariHareketleri');
    try {
      return super.setCariHareketleri(value);
    } finally {
      _$_CariHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_CariHareketleriViewModelBaseActionController.startAction(name: '_CariHareketleriViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_CariHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariListesiModel(CariListesiModel? value) {
    final _$actionInfo = _$_CariHareketleriViewModelBaseActionController.startAction(name: '_CariHareketleriViewModelBase.setCariListesiModel');
    try {
      return super.setCariListesiModel(value);
    } finally {
      _$_CariHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_CariHareketleriViewModelBaseActionController.startAction(name: '_CariHareketleriViewModelBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$_CariHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cariListesiModel: ${cariListesiModel},
isScrollDown: ${isScrollDown},
cariHareketleriList: ${cariHareketleriList},
siralama: ${siralama},
isSearchBarOpened: ${isSearchBarOpened},
borclarToplami: ${borclarToplami},
alacaklarToplami: ${alacaklarToplami},
toplamBakiye: ${toplamBakiye},
dovizBorclarToplami: ${dovizBorclarToplami},
dovizAlacaklarToplami: ${dovizAlacaklarToplami}
    ''';
  }
}
