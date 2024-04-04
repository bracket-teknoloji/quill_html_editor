// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lokal_depo_bakiye_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LokalDepoBakiyeRaporuViewModel
    on _LokalDepoBakiyeRaporuViewModelBase, Store {
  late final _$pdfModelAtom = Atom(
      name: '_LokalDepoBakiyeRaporuViewModelBase.pdfModel', context: context);

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

  late final _$sifirHaricValueAtom = Atom(
      name: '_LokalDepoBakiyeRaporuViewModelBase.sifirHaricValue',
      context: context);

  @override
  bool get sifirHaricValue {
    _$sifirHaricValueAtom.reportRead();
    return super.sifirHaricValue;
  }

  @override
  set sifirHaricValue(bool value) {
    _$sifirHaricValueAtom.reportWrite(value, super.sifirHaricValue, () {
      super.sifirHaricValue = value;
    });
  }

  late final _$futureControllerAtom = Atom(
      name: '_LokalDepoBakiyeRaporuViewModelBase.futureController',
      context: context);

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

  late final _$_LokalDepoBakiyeRaporuViewModelBaseActionController =
      ActionController(
          name: '_LokalDepoBakiyeRaporuViewModelBase', context: context);

  @override
  void setSifirHaric(bool value) {
    final _$actionInfo = _$_LokalDepoBakiyeRaporuViewModelBaseActionController
        .startAction(name: '_LokalDepoBakiyeRaporuViewModelBase.setSifirHaric');
    try {
      return super.setSifirHaric(value);
    } finally {
      _$_LokalDepoBakiyeRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_LokalDepoBakiyeRaporuViewModelBaseActionController
        .startAction(name: '_LokalDepoBakiyeRaporuViewModelBase.setFuture');
    try {
      return super.setFuture();
    } finally {
      _$_LokalDepoBakiyeRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_LokalDepoBakiyeRaporuViewModelBaseActionController
        .startAction(name: '_LokalDepoBakiyeRaporuViewModelBase.resetFuture');
    try {
      return super.resetFuture();
    } finally {
      _$_LokalDepoBakiyeRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pdfModel: ${pdfModel},
sifirHaricValue: ${sifirHaricValue},
futureController: ${futureController}
    ''';
  }
}
