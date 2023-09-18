// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doviz_bakiye_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DovizBakiyeRaporuViewModel on _DovizBakiyeRaporuViewModelBase, Store {
  Computed<String>? _$bakiyeDurumuGroupValueComputed;

  @override
  String get bakiyeDurumuGroupValue => (_$bakiyeDurumuGroupValueComputed ??=
          Computed<String>(() => super.bakiyeDurumuGroupValue,
              name: '_DovizBakiyeRaporuViewModelBase.bakiyeDurumuGroupValue'))
      .value;

  late final _$_bakiyeDurumuGroupValueAtom = Atom(
      name: '_DovizBakiyeRaporuViewModelBase._bakiyeDurumuGroupValue',
      context: context);

  @override
  String get _bakiyeDurumuGroupValue {
    _$_bakiyeDurumuGroupValueAtom.reportRead();
    return super._bakiyeDurumuGroupValue;
  }

  @override
  set _bakiyeDurumuGroupValue(String value) {
    _$_bakiyeDurumuGroupValueAtom
        .reportWrite(value, super._bakiyeDurumuGroupValue, () {
      super._bakiyeDurumuGroupValue = value;
    });
  }

  late final _$pdfModelAtom =
      Atom(name: '_DovizBakiyeRaporuViewModelBase.pdfModel', context: context);

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
      name: '_DovizBakiyeRaporuViewModelBase.futureController',
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

  late final _$_DovizBakiyeRaporuViewModelBaseActionController =
      ActionController(
          name: '_DovizBakiyeRaporuViewModelBase', context: context);

  @override
  void changeBakiyeDurumu(int? index) {
    final _$actionInfo =
        _$_DovizBakiyeRaporuViewModelBaseActionController.startAction(
            name: '_DovizBakiyeRaporuViewModelBase.changeBakiyeDurumu');
    try {
      return super.changeBakiyeDurumu(index);
    } finally {
      _$_DovizBakiyeRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_DovizBakiyeRaporuViewModelBaseActionController
        .startAction(name: '_DovizBakiyeRaporuViewModelBase.setFuture');
    try {
      return super.setFuture();
    } finally {
      _$_DovizBakiyeRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_DovizBakiyeRaporuViewModelBaseActionController
        .startAction(name: '_DovizBakiyeRaporuViewModelBase.resetFuture');
    try {
      return super.resetFuture();
    } finally {
      _$_DovizBakiyeRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pdfModel: ${pdfModel},
futureController: ${futureController},
bakiyeDurumuGroupValue: ${bakiyeDurumuGroupValue}
    ''';
  }
}
