// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_transfer_editing_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseTransferEditingViewModel
    on _BaseTransferEditingViewModelBase, Store {
  Computed<BaseSiparisEditModel>? _$modelComputed;

  @override
  BaseSiparisEditModel get model =>
      (_$modelComputed ??= Computed<BaseSiparisEditModel>(() => super.model,
              name: '_BaseTransferEditingViewModelBase.model'))
          .value;
  Computed<int>? _$getKalemCountComputed;

  @override
  int get getKalemCount =>
      (_$getKalemCountComputed ??= Computed<int>(() => super.getKalemCount,
              name: '_BaseTransferEditingViewModelBase.getKalemCount'))
          .value;

  late final _$updateKalemlerAtom = Atom(
      name: '_BaseTransferEditingViewModelBase.updateKalemler',
      context: context);

  @override
  bool get updateKalemler {
    _$updateKalemlerAtom.reportRead();
    return super.updateKalemler;
  }

  @override
  set updateKalemler(bool value) {
    _$updateKalemlerAtom.reportWrite(value, super.updateKalemler, () {
      super.updateKalemler = value;
    });
  }

  late final _$pageIndexAtom = Atom(
      name: '_BaseTransferEditingViewModelBase.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  late final _$isValidAtom =
      Atom(name: '_BaseTransferEditingViewModelBase.isValid', context: context);

  @override
  bool get isValid {
    _$isValidAtom.reportRead();
    return super.isValid;
  }

  @override
  set isValid(bool value) {
    _$isValidAtom.reportWrite(value, super.isValid, () {
      super.isValid = value;
    });
  }

  late final _$isLastPageAtom = Atom(
      name: '_BaseTransferEditingViewModelBase.isLastPage', context: context);

  @override
  bool get isLastPage {
    _$isLastPageAtom.reportRead();
    return super.isLastPage;
  }

  @override
  set isLastPage(bool value) {
    _$isLastPageAtom.reportWrite(value, super.isLastPage, () {
      super.isLastPage = value;
    });
  }

  late final _$showLoadingAtom = Atom(
      name: '_BaseTransferEditingViewModelBase.showLoading', context: context);

  @override
  bool get showLoading {
    _$showLoadingAtom.reportRead();
    return super.showLoading;
  }

  @override
  set showLoading(bool value) {
    _$showLoadingAtom.reportWrite(value, super.showLoading, () {
      super.showLoading = value;
    });
  }

  late final _$yeniKaydaHazirlaMiAtom = Atom(
      name: '_BaseTransferEditingViewModelBase.yeniKaydaHazirlaMi',
      context: context);

  @override
  bool get yeniKaydaHazirlaMi {
    _$yeniKaydaHazirlaMiAtom.reportRead();
    return super.yeniKaydaHazirlaMi;
  }

  @override
  set yeniKaydaHazirlaMi(bool value) {
    _$yeniKaydaHazirlaMiAtom.reportWrite(value, super.yeniKaydaHazirlaMi, () {
      super.yeniKaydaHazirlaMi = value;
    });
  }

  late final _$baseSiparisEditModelAtom = Atom(
      name: '_BaseTransferEditingViewModelBase.baseSiparisEditModel',
      context: context);

  @override
  BaseSiparisEditModel get baseSiparisEditModel {
    _$baseSiparisEditModelAtom.reportRead();
    return super.baseSiparisEditModel;
  }

  @override
  set baseSiparisEditModel(BaseSiparisEditModel value) {
    _$baseSiparisEditModelAtom.reportWrite(value, super.baseSiparisEditModel,
        () {
      super.baseSiparisEditModel = value;
    });
  }

  late final _$_BaseTransferEditingViewModelBaseActionController =
      ActionController(
          name: '_BaseTransferEditingViewModelBase', context: context);

  @override
  void changeUpdateKalemler() {
    final _$actionInfo =
        _$_BaseTransferEditingViewModelBaseActionController.startAction(
            name: '_BaseTransferEditingViewModelBase.changeUpdateKalemler');
    try {
      return super.changeUpdateKalemler();
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsValid() {
    final _$actionInfo = _$_BaseTransferEditingViewModelBaseActionController
        .startAction(name: '_BaseTransferEditingViewModelBase.changeIsValid');
    try {
      return super.changeIsValid();
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changePageIndex(int value) {
    final _$actionInfo = _$_BaseTransferEditingViewModelBaseActionController
        .startAction(name: '_BaseTransferEditingViewModelBase.changePageIndex');
    try {
      return super.changePageIndex(value);
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLastPage(bool value) {
    final _$actionInfo =
        _$_BaseTransferEditingViewModelBaseActionController.startAction(
            name: '_BaseTransferEditingViewModelBase.changeIsLastPage');
    try {
      return super.changeIsLastPage(value);
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_BaseTransferEditingViewModelBaseActionController
        .startAction(name: '_BaseTransferEditingViewModelBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeFuture() {
    final _$actionInfo = _$_BaseTransferEditingViewModelBaseActionController
        .startAction(name: '_BaseTransferEditingViewModelBase.changeFuture');
    try {
      return super.changeFuture();
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeYeniKaydaHazirlaMi() {
    final _$actionInfo =
        _$_BaseTransferEditingViewModelBaseActionController.startAction(
            name: '_BaseTransferEditingViewModelBase.changeYeniKaydaHazirlaMi');
    try {
      return super.changeYeniKaydaHazirlaMi();
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(CariListesiModel? value) {
    final _$actionInfo = _$_BaseTransferEditingViewModelBaseActionController
        .startAction(name: '_BaseTransferEditingViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(List<BaseSiparisEditModel>? value) {
    final _$actionInfo = _$_BaseTransferEditingViewModelBaseActionController
        .startAction(name: '_BaseTransferEditingViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setKalemList(List<KalemModel>? value) {
    final _$actionInfo = _$_BaseTransferEditingViewModelBaseActionController
        .startAction(name: '_BaseTransferEditingViewModelBase.setKalemList');
    try {
      return super.setKalemList(value);
    } finally {
      _$_BaseTransferEditingViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
updateKalemler: ${updateKalemler},
pageIndex: ${pageIndex},
isValid: ${isValid},
isLastPage: ${isLastPage},
showLoading: ${showLoading},
yeniKaydaHazirlaMi: ${yeniKaydaHazirlaMi},
baseSiparisEditModel: ${baseSiparisEditModel},
model: ${model},
getKalemCount: ${getKalemCount}
    ''';
  }
}
