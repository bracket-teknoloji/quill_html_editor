// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_fatura_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseFaturaEditViewModel on _BaseFaturaEditViewModelBase, Store {
  Computed<int>? _$getKalemCountComputed;

  @override
  int get getKalemCount =>
      (_$getKalemCountComputed ??= Computed<int>(() => super.getKalemCount,
              name: '_BaseFaturaEditViewModelBase.getKalemCount'))
          .value;

  late final _$baseSiparisEditModelAtom = Atom(
      name: '_BaseFaturaEditViewModelBase.baseSiparisEditModel',
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

  late final _$updateKalemlerAtom = Atom(
      name: '_BaseFaturaEditViewModelBase.updateKalemler', context: context);

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

  late final _$pageIndexAtom =
      Atom(name: '_BaseFaturaEditViewModelBase.pageIndex', context: context);

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
      Atom(name: '_BaseFaturaEditViewModelBase.isValid', context: context);

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

  late final _$isLastPageAtom =
      Atom(name: '_BaseFaturaEditViewModelBase.isLastPage', context: context);

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

  late final _$showLoadingAtom =
      Atom(name: '_BaseFaturaEditViewModelBase.showLoading', context: context);

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
      name: '_BaseFaturaEditViewModelBase.yeniKaydaHazirlaMi',
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

  late final _$_BaseFaturaEditViewModelBaseActionController =
      ActionController(name: '_BaseFaturaEditViewModelBase', context: context);

  @override
  void setCariKodu(CariListesiModel? value) {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController
        .startAction(name: '_BaseFaturaEditViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(List<BaseSiparisEditModel>? value) {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController
        .startAction(name: '_BaseFaturaEditViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKalemList(List<KalemModel>? value) {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController
        .startAction(name: '_BaseFaturaEditViewModelBase.setKalemList');
    try {
      return super.setKalemList(value);
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeUpdateKalemler() {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController
        .startAction(name: '_BaseFaturaEditViewModelBase.changeUpdateKalemler');
    try {
      return super.changeUpdateKalemler();
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsValid() {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController
        .startAction(name: '_BaseFaturaEditViewModelBase.changeIsValid');
    try {
      return super.changeIsValid();
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePageIndex(int value) {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController
        .startAction(name: '_BaseFaturaEditViewModelBase.changePageIndex');
    try {
      return super.changePageIndex(value);
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLastPage(bool value) {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController
        .startAction(name: '_BaseFaturaEditViewModelBase.changeIsLastPage');
    try {
      return super.changeIsLastPage(value);
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController
        .startAction(name: '_BaseFaturaEditViewModelBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFuture() {
    final _$actionInfo = _$_BaseFaturaEditViewModelBaseActionController
        .startAction(name: '_BaseFaturaEditViewModelBase.changeFuture');
    try {
      return super.changeFuture();
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeYeniKaydaHazirlaMi() {
    final _$actionInfo =
        _$_BaseFaturaEditViewModelBaseActionController.startAction(
            name: '_BaseFaturaEditViewModelBase.changeYeniKaydaHazirlaMi');
    try {
      return super.changeYeniKaydaHazirlaMi();
    } finally {
      _$_BaseFaturaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
baseSiparisEditModel: ${baseSiparisEditModel},
updateKalemler: ${updateKalemler},
pageIndex: ${pageIndex},
isValid: ${isValid},
isLastPage: ${isLastPage},
showLoading: ${showLoading},
yeniKaydaHazirlaMi: ${yeniKaydaHazirlaMi},
getKalemCount: ${getKalemCount}
    ''';
  }
}
