// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_ekstre_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokEkstreViewModel on _StokEkstreViewModelBase, Store {
  late final _$pdfModelAtom =
      Atom(name: '_StokEkstreViewModelBase.pdfModel', context: context);

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

  late final _$futureControllerAtom =
      Atom(name: '_StokEkstreViewModelBase.futureController', context: context);

  @override
  InvalidType get futureController {
    _$futureControllerAtom.reportRead();
    return super.futureController;
  }

  @override
  set futureController(InvalidType value) {
    _$futureControllerAtom.reportWrite(value, super.futureController, () {
      super.futureController = value;
    });
  }

  late final _$_StokEkstreViewModelBaseActionController =
      ActionController(name: '_StokEkstreViewModelBase', context: context);

  @override
  void changeCariKodu(String? value) {
    final _$actionInfo = _$_StokEkstreViewModelBaseActionController.startAction(
        name: '_StokEkstreViewModelBase.changeCariKodu');
    try {
      return super.changeCariKodu(value);
    } finally {
      _$_StokEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDovizTipi(int value) {
    final _$actionInfo = _$_StokEkstreViewModelBaseActionController.startAction(
        name: '_StokEkstreViewModelBase.changeDovizTipi');
    try {
      return super.changeDovizTipi(value);
    } finally {
      _$_StokEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_StokEkstreViewModelBaseActionController.startAction(
        name: '_StokEkstreViewModelBase.setFuture');
    try {
      return super.setFuture();
    } finally {
      _$_StokEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_StokEkstreViewModelBaseActionController.startAction(
        name: '_StokEkstreViewModelBase.resetFuture');
    try {
      return super.resetFuture();
    } finally {
      _$_StokEkstreViewModelBaseActionController.endAction(_$actionInfo);
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
