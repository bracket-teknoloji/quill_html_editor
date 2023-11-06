// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CekSenetListesiViewModel on _CekSenetListesiViewModelBase, Store {
  Computed<double>? _$toplamTutarComputed;

  @override
  double get toplamTutar =>
      (_$toplamTutarComputed ??= Computed<double>(() => super.toplamTutar,
              name: '_CekSenetListesiViewModelBase.toplamTutar'))
          .value;

  late final _$searchBarAtom =
      Atom(name: '_CekSenetListesiViewModelBase.searchBar', context: context);

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

  late final _$cekSenetListesiListesiAtom = Atom(
      name: '_CekSenetListesiViewModelBase.cekSenetListesiListesi',
      context: context);

  @override
  ObservableList<CekSenetListesiModel>? get cekSenetListesiListesi {
    _$cekSenetListesiListesiAtom.reportRead();
    return super.cekSenetListesiListesi;
  }

  @override
  set cekSenetListesiListesi(ObservableList<CekSenetListesiModel>? value) {
    _$cekSenetListesiListesiAtom
        .reportWrite(value, super.cekSenetListesiListesi, () {
      super.cekSenetListesiListesi = value;
    });
  }

  late final _$cekSenetListesiRequestModelAtom = Atom(
      name: '_CekSenetListesiViewModelBase.cekSenetListesiRequestModel',
      context: context);

  @override
  CekSenetListesiRequestModel get cekSenetListesiRequestModel {
    _$cekSenetListesiRequestModelAtom.reportRead();
    return super.cekSenetListesiRequestModel;
  }

  @override
  set cekSenetListesiRequestModel(CekSenetListesiRequestModel value) {
    _$cekSenetListesiRequestModelAtom
        .reportWrite(value, super.cekSenetListesiRequestModel, () {
      super.cekSenetListesiRequestModel = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_CekSenetListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_CekSenetListesiViewModelBaseActionController =
      ActionController(name: '_CekSenetListesiViewModelBase', context: context);

  @override
  void setSearchBar() {
    final _$actionInfo = _$_CekSenetListesiViewModelBaseActionController
        .startAction(name: '_CekSenetListesiViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_CekSenetListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_CekSenetListesiViewModelBaseActionController
        .startAction(name: '_CekSenetListesiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_CekSenetListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYeri(String? value) {
    final _$actionInfo = _$_CekSenetListesiViewModelBaseActionController
        .startAction(name: '_CekSenetListesiViewModelBase.setYeri');
    try {
      return super.setYeri(value);
    } finally {
      _$_CekSenetListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDurumu(String? value) {
    final _$actionInfo = _$_CekSenetListesiViewModelBaseActionController
        .startAction(name: '_CekSenetListesiViewModelBase.setDurumu');
    try {
      return super.setDurumu(value);
    } finally {
      _$_CekSenetListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSirala(String value) {
    final _$actionInfo = _$_CekSenetListesiViewModelBaseActionController
        .startAction(name: '_CekSenetListesiViewModelBase.setSirala');
    try {
      return super.setSirala(value);
    } finally {
      _$_CekSenetListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeTipi(String value) {
    final _$actionInfo = _$_CekSenetListesiViewModelBaseActionController
        .startAction(name: '_CekSenetListesiViewModelBase.setBelgeTipi');
    try {
      return super.setBelgeTipi(value);
    } finally {
      _$_CekSenetListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCekSenetListesiListesi(List<CekSenetListesiModel>? value) {
    final _$actionInfo =
        _$_CekSenetListesiViewModelBaseActionController.startAction(
            name: '_CekSenetListesiViewModelBase.setCekSenetListesiListesi');
    try {
      return super.setCekSenetListesiListesi(value);
    } finally {
      _$_CekSenetListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
cekSenetListesiListesi: ${cekSenetListesiListesi},
cekSenetListesiRequestModel: ${cekSenetListesiRequestModel},
toplamTutar: ${toplamTutar}
    ''';
  }
}
