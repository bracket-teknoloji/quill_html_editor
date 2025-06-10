// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_ekstre_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariEkstreViewModel on _CariEkstreViewModelBase, Store {
  late final _$dovizValueAtom = Atom(
    name: '_CariEkstreViewModelBase.dovizValue',
    context: context,
  );

  @override
  String? get dovizValue {
    _$dovizValueAtom.reportRead();
    return super.dovizValue;
  }

  @override
  set dovizValue(String? value) {
    _$dovizValueAtom.reportWrite(value, super.dovizValue, () {
      super.dovizValue = value;
    });
  }

  late final _$pdfModelAtom = Atom(
    name: '_CariEkstreViewModelBase.pdfModel',
    context: context,
  );

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
    name: '_CariEkstreViewModelBase.futureController',
    context: context,
  );

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

  late final _$_CariEkstreViewModelBaseActionController = ActionController(
    name: '_CariEkstreViewModelBase',
    context: context,
  );

  @override
  void changeDovizValue(String value) {
    final _$actionInfo = _$_CariEkstreViewModelBaseActionController.startAction(
      name: '_CariEkstreViewModelBase.changeDovizValue',
    );
    try {
      return super.changeDovizValue(value);
    } finally {
      _$_CariEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCariKodu(String? value) {
    final _$actionInfo = _$_CariEkstreViewModelBaseActionController.startAction(
      name: '_CariEkstreViewModelBase.changeCariKodu',
    );
    try {
      return super.changeCariKodu(value);
    } finally {
      _$_CariEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDovizTipi(int value) {
    final _$actionInfo = _$_CariEkstreViewModelBaseActionController.startAction(
      name: '_CariEkstreViewModelBase.changeDovizTipi',
    );
    try {
      return super.changeDovizTipi(value);
    } finally {
      _$_CariEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_CariEkstreViewModelBaseActionController.startAction(
      name: '_CariEkstreViewModelBase.setFuture',
    );
    try {
      return super.setFuture();
    } finally {
      _$_CariEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_CariEkstreViewModelBaseActionController.startAction(
      name: '_CariEkstreViewModelBase.resetFuture',
    );
    try {
      return super.resetFuture();
    } finally {
      _$_CariEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dovizValue: ${dovizValue},
pdfModel: ${pdfModel},
futureController: ${futureController}
    ''';
  }
}
