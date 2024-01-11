// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_borc_alacak_dokumu_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariBorcAlacakDokumuRaporuViewModel
    on _CariBorcAlacakDokumuRaporuViewModelBase, Store {
  late final _$pdfModelAtom = Atom(
      name: '_CariBorcAlacakDokumuRaporuViewModelBase.pdfModel',
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
      name: '_CariBorcAlacakDokumuRaporuViewModelBase.futureController',
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

  late final _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController =
      ActionController(
          name: '_CariBorcAlacakDokumuRaporuViewModelBase', context: context);

  @override
  void setFuture() {
    final _$actionInfo =
        _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController.startAction(
            name: '_CariBorcAlacakDokumuRaporuViewModelBase.setFuture');
    try {
      return super.setFuture();
    } finally {
      _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo =
        _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController.startAction(
            name: '_CariBorcAlacakDokumuRaporuViewModelBase.resetFuture');
    try {
      return super.resetFuture();
    } finally {
      _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSirala(String? value) {
    final _$actionInfo =
        _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController.startAction(
            name: '_CariBorcAlacakDokumuRaporuViewModelBase.setSirala');
    try {
      return super.setSirala(value);
    } finally {
      _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBastar(String? value) {
    final _$actionInfo =
        _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController.startAction(
            name: '_CariBorcAlacakDokumuRaporuViewModelBase.setBastar');
    try {
      return super.setBastar(value);
    } finally {
      _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBittar(String? value) {
    final _$actionInfo =
        _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController.startAction(
            name: '_CariBorcAlacakDokumuRaporuViewModelBase.setBittar');
    try {
      return super.setBittar(value);
    } finally {
      _$_CariBorcAlacakDokumuRaporuViewModelBaseActionController
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
