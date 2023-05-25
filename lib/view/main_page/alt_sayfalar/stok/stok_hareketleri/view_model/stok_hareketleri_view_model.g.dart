// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'stok_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokHareketleriViewModel on _StokHareketleriViewModelBase, Store {
  Computed<String>? _$getIsSelectedComputed;

  @override
  String get getIsSelected =>
      (_$getIsSelectedComputed ??= Computed<String>(() => super.getIsSelected,
              name: '_StokHareketleriViewModelBase.getIsSelected'))
          .value;
  Computed<String>? _$getArrHareketTuruComputed;

  @override
  String get getArrHareketTuru => (_$getArrHareketTuruComputed ??=
          Computed<String>(() => super.getArrHareketTuru,
              name: '_StokHareketleriViewModelBase.getArrHareketTuru'))
      .value;

  late final _$cariListesiModelAtom = Atom(
      name: '_StokHareketleriViewModelBase.cariListesiModel', context: context);

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

  late final _$isSelectedAtom =
      Atom(name: '_StokHareketleriViewModelBase.isSelected', context: context);

  @override
  ObservableList<bool> get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(ObservableList<bool> value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$hareketTuruMapAtom = Atom(
      name: '_StokHareketleriViewModelBase.hareketTuruMap', context: context);

  @override
  Map<String, String> get hareketTuruMap {
    _$hareketTuruMapAtom.reportRead();
    return super.hareketTuruMap;
  }

  @override
  set hareketTuruMap(Map<String, String> value) {
    _$hareketTuruMapAtom.reportWrite(value, super.hareketTuruMap, () {
      super.hareketTuruMap = value;
    });
  }

  late final _$hareketYonuListAtom = Atom(
      name: '_StokHareketleriViewModelBase.hareketYonuList', context: context);

  @override
  List<String> get hareketYonuList {
    _$hareketYonuListAtom.reportRead();
    return super.hareketYonuList;
  }

  @override
  set hareketYonuList(List<String> value) {
    _$hareketYonuListAtom.reportWrite(value, super.hareketYonuList, () {
      super.hareketYonuList = value;
    });
  }

  late final _$arrHareketTuruAtom = Atom(
      name: '_StokHareketleriViewModelBase.arrHareketTuru', context: context);

  @override
  List<String>? get arrHareketTuru {
    _$arrHareketTuruAtom.reportRead();
    return super.arrHareketTuru;
  }

  @override
  set arrHareketTuru(List<String>? value) {
    _$arrHareketTuruAtom.reportWrite(value, super.arrHareketTuru, () {
      super.arrHareketTuru = value;
    });
  }

  late final _$dovizliFiyatAtom = Atom(
      name: '_StokHareketleriViewModelBase.dovizliFiyat', context: context);

  @override
  bool get dovizliFiyat {
    _$dovizliFiyatAtom.reportRead();
    return super.dovizliFiyat;
  }

  @override
  set dovizliFiyat(bool value) {
    _$dovizliFiyatAtom.reportWrite(value, super.dovizliFiyat, () {
      super.dovizliFiyat = value;
    });
  }

  late final _$siralamaAtom =
      Atom(name: '_StokHareketleriViewModelBase.siralama', context: context);

  @override
  String? get siralama {
    _$siralamaAtom.reportRead();
    return super.siralama;
  }

  @override
  set siralama(String? value) {
    _$siralamaAtom.reportWrite(value, super.siralama, () {
      super.siralama = value;
    });
  }

  late final _$futureAtom =
      Atom(name: '_StokHareketleriViewModelBase.future', context: context);

  @override
  Future<dynamic>? get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<dynamic>? value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$searchBarAtom =
      Atom(name: '_StokHareketleriViewModelBase.searchBar', context: context);

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

  late final _$stokHareketleriAtom = Atom(
      name: '_StokHareketleriViewModelBase.stokHareketleri', context: context);

  @override
  List<StokHareketleriModel>? get stokHareketleri {
    _$stokHareketleriAtom.reportRead();
    return super.stokHareketleri;
  }

  @override
  set stokHareketleri(List<StokHareketleriModel>? value) {
    _$stokHareketleriAtom.reportWrite(value, super.stokHareketleri, () {
      super.stokHareketleri = value;
    });
  }

  late final _$filteredStokHareketleriAtom = Atom(
      name: '_StokHareketleriViewModelBase.filteredStokHareketleri',
      context: context);

  @override
  List<StokHareketleriModel>? get filteredStokHareketleri {
    _$filteredStokHareketleriAtom.reportRead();
    return super.filteredStokHareketleri;
  }

  @override
  set filteredStokHareketleri(List<StokHareketleriModel>? value) {
    _$filteredStokHareketleriAtom
        .reportWrite(value, super.filteredStokHareketleri, () {
      super.filteredStokHareketleri = value;
    });
  }

  late final _$_StokHareketleriViewModelBaseActionController =
      ActionController(name: '_StokHareketleriViewModelBase', context: context);

  @override
  void setCariListesiModel(CariListesiModel? model) {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.setCariListesiModel');
    try {
      return super.setCariListesiModel(model);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetIsSelected() {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.resetIsSelected');
    try {
      return super.resetIsSelected();
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsSelected(int index) {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.changeIsSelected');
    try {
      return super.changeIsSelected(index);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addArrHareketTuru(String value) {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.addArrHareketTuru');
    try {
      return super.addArrHareketTuru(value);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeArrHareketTuru(List<String> value) {
    final _$actionInfo =
        _$_StokHareketleriViewModelBaseActionController.startAction(
            name: '_StokHareketleriViewModelBase.changeArrHareketTuru');
    try {
      return super.changeArrHareketTuru(value);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearArrHareketTuru() {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.clearArrHareketTuru');
    try {
      return super.clearArrHareketTuru();
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDovizliFiyat() {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.changeDovizliFiyat');
    try {
      return super.changeDovizliFiyat();
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String value) {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture(Future<dynamic>? value) {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.setFuture');
    try {
      return super.setFuture(value);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSearchBar() {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.changeSearchBar');
    try {
      return super.changeSearchBar();
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokHareketleri(List<StokHareketleriModel> value) {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.setStokHareketleri');
    try {
      return super.setStokHareketleri(value);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addStokHareketleri(StokHareketleriModel value) {
    final _$actionInfo = _$_StokHareketleriViewModelBaseActionController
        .startAction(name: '_StokHareketleriViewModelBase.addStokHareketleri');
    try {
      return super.addStokHareketleri(value);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterStokHareketleri(String value) {
    final _$actionInfo =
        _$_StokHareketleriViewModelBaseActionController.startAction(
            name: '_StokHareketleriViewModelBase.filterStokHareketleri');
    try {
      return super.filterStokHareketleri(value);
    } finally {
      _$_StokHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cariListesiModel: ${cariListesiModel},
isSelected: ${isSelected},
hareketTuruMap: ${hareketTuruMap},
hareketYonuList: ${hareketYonuList},
arrHareketTuru: ${arrHareketTuru},
dovizliFiyat: ${dovizliFiyat},
siralama: ${siralama},
future: ${future},
searchBar: ${searchBar},
stokHareketleri: ${stokHareketleri},
filteredStokHareketleri: ${filteredStokHareketleri},
getIsSelected: ${getIsSelected},
getArrHareketTuru: ${getArrHareketTuru}
    ''';
  }
}
