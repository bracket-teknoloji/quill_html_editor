// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yaslandirma_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$YaslandirmaRaporuViewModel on _YaslandirmaRaporuViewModelBase, Store {
  Computed<String>? _$sureAraligiGroupValueComputed;

  @override
  String get sureAraligiGroupValue => (_$sureAraligiGroupValueComputed ??=
          Computed<String>(() => super.sureAraligiGroupValue,
              name: '_YaslandirmaRaporuViewModelBase.sureAraligiGroupValue'))
      .value;
  Computed<String>? _$odemeTipiGroupValueComputed;

  @override
  String get odemeTipiGroupValue => (_$odemeTipiGroupValueComputed ??=
          Computed<String>(() => super.odemeTipiGroupValue,
              name: '_YaslandirmaRaporuViewModelBase.odemeTipiGroupValue'))
      .value;

  late final _$_sureAraligiGroupValueAtom = Atom(
      name: '_YaslandirmaRaporuViewModelBase._sureAraligiGroupValue',
      context: context);

  @override
  String get _sureAraligiGroupValue {
    _$_sureAraligiGroupValueAtom.reportRead();
    return super._sureAraligiGroupValue;
  }

  @override
  set _sureAraligiGroupValue(String value) {
    _$_sureAraligiGroupValueAtom
        .reportWrite(value, super._sureAraligiGroupValue, () {
      super._sureAraligiGroupValue = value;
    });
  }

  late final _$_odemeTipiGroupValueAtom = Atom(
      name: '_YaslandirmaRaporuViewModelBase._odemeTipiGroupValue',
      context: context);

  @override
  String get _odemeTipiGroupValue {
    _$_odemeTipiGroupValueAtom.reportRead();
    return super._odemeTipiGroupValue;
  }

  @override
  set _odemeTipiGroupValue(String value) {
    _$_odemeTipiGroupValueAtom.reportWrite(value, super._odemeTipiGroupValue,
        () {
      super._odemeTipiGroupValue = value;
    });
  }

  late final _$odemeTipiValueAtom = Atom(
      name: '_YaslandirmaRaporuViewModelBase.odemeTipiValue', context: context);

  @override
  ObservableList<String> get odemeTipiValue {
    _$odemeTipiValueAtom.reportRead();
    return super.odemeTipiValue;
  }

  @override
  set odemeTipiValue(ObservableList<String> value) {
    _$odemeTipiValueAtom.reportWrite(value, super.odemeTipiValue, () {
      super.odemeTipiValue = value;
    });
  }

  late final _$pdfModelAtom =
      Atom(name: '_YaslandirmaRaporuViewModelBase.pdfModel', context: context);

  @override
  PdfModel get pdfModel {
    _$pdfModelAtom.reportRead();
    return super.pdfModel;
  }

  @override
  set pdfModel(PdfModel value) {
    _$pdfModelAtom.reportWrite(value, super.pdfModel, () {
      super.pdfModel = value;
    });
  }

  late final _$futureControllerAtom = Atom(
      name: '_YaslandirmaRaporuViewModelBase.futureController',
      context: context);

  @override
  ObservableFuture<bool?> get futureController {
    _$futureControllerAtom.reportRead();
    return super.futureController;
  }

  @override
  set futureController(ObservableFuture<bool?> value) {
    _$futureControllerAtom.reportWrite(value, super.futureController, () {
      super.futureController = value;
    });
  }

  late final _$_YaslandirmaRaporuViewModelBaseActionController =
      ActionController(
          name: '_YaslandirmaRaporuViewModelBase', context: context);

  @override
  void changeSureAraligi(int? index) {
    final _$actionInfo = _$_YaslandirmaRaporuViewModelBaseActionController
        .startAction(name: '_YaslandirmaRaporuViewModelBase.changeSureAraligi');
    try {
      return super.changeSureAraligi(index);
    } finally {
      _$_YaslandirmaRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeOdemeTipi(int? index) {
    final _$actionInfo = _$_YaslandirmaRaporuViewModelBaseActionController
        .startAction(name: '_YaslandirmaRaporuViewModelBase.changeOdemeTipi');
    try {
      return super.changeOdemeTipi(index);
    } finally {
      _$_YaslandirmaRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_YaslandirmaRaporuViewModelBaseActionController
        .startAction(name: '_YaslandirmaRaporuViewModelBase.setFuture');
    try {
      return super.setFuture();
    } finally {
      _$_YaslandirmaRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_YaslandirmaRaporuViewModelBaseActionController
        .startAction(name: '_YaslandirmaRaporuViewModelBase.resetFuture');
    try {
      return super.resetFuture();
    } finally {
      _$_YaslandirmaRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
odemeTipiValue: ${odemeTipiValue},
pdfModel: ${pdfModel},
futureController: ${futureController},
sureAraligiGroupValue: ${sureAraligiGroupValue},
odemeTipiGroupValue: ${odemeTipiGroupValue}
    ''';
  }
}
