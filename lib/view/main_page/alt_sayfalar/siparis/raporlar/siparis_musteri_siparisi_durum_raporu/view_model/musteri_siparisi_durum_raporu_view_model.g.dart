// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musteri_siparisi_durum_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusteriSiparisiDurumRaporuViewModel
    on _MusteriSiparisiDurumRaporuViewModelBase, Store {
  late final _$pdfModelAtom = Atom(
      name: '_MusteriSiparisiDurumRaporuViewModelBase.pdfModel',
      context: context);

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
      name: '_MusteriSiparisiDurumRaporuViewModelBase.futureController',
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

  late final _$_MusteriSiparisiDurumRaporuViewModelBaseActionController =
      ActionController(
          name: '_MusteriSiparisiDurumRaporuViewModelBase', context: context);

  @override
  void setFuture() {
    final _$actionInfo =
        _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.startAction(
            name: '_MusteriSiparisiDurumRaporuViewModelBase.setFuture');
    try {
      return super.setFuture();
    } finally {
      _$_MusteriSiparisiDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo =
        _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.startAction(
            name: '_MusteriSiparisiDurumRaporuViewModelBase.resetFuture');
    try {
      return super.resetFuture();
    } finally {
      _$_MusteriSiparisiDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pdfModel: ${pdfModel},
futureController: ${futureController}
    ''';
  }
}
