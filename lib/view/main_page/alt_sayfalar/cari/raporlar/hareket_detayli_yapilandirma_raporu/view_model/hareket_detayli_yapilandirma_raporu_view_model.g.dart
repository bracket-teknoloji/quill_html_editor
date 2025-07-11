// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hareket_detayli_yapilandirma_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HareketDetayliYaslandirmaRaporuViewModel on _HareketDetayliYaslandirmaRaporuViewModelBase, Store {
  late final _$bakiyeDurumuGroupValueAtom = Atom(
    name: '_HareketDetayliYaslandirmaRaporuViewModelBase.bakiyeDurumuGroupValue',
    context: context,
  );

  @override
  String? get bakiyeDurumuGroupValue {
    _$bakiyeDurumuGroupValueAtom.reportRead();
    return super.bakiyeDurumuGroupValue;
  }

  @override
  set bakiyeDurumuGroupValue(String? value) {
    _$bakiyeDurumuGroupValueAtom.reportWrite(
      value,
      super.bakiyeDurumuGroupValue,
      () {
        super.bakiyeDurumuGroupValue = value;
      },
    );
  }

  late final _$pdfModelAtom = Atom(
    name: '_HareketDetayliYaslandirmaRaporuViewModelBase.pdfModel',
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
    name: '_HareketDetayliYaslandirmaRaporuViewModelBase.futureController',
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

  late final _$_HareketDetayliYaslandirmaRaporuViewModelBaseActionController = ActionController(
    name: '_HareketDetayliYaslandirmaRaporuViewModelBase',
    context: context,
  );

  @override
  void changeBakiyeDurumu(int? index) {
    final _$actionInfo = _$_HareketDetayliYaslandirmaRaporuViewModelBaseActionController.startAction(
      name: '_HareketDetayliYaslandirmaRaporuViewModelBase.changeBakiyeDurumu',
    );
    try {
      return super.changeBakiyeDurumu(index);
    } finally {
      _$_HareketDetayliYaslandirmaRaporuViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_HareketDetayliYaslandirmaRaporuViewModelBaseActionController.startAction(
      name: '_HareketDetayliYaslandirmaRaporuViewModelBase.setFuture',
    );
    try {
      return super.setFuture();
    } finally {
      _$_HareketDetayliYaslandirmaRaporuViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_HareketDetayliYaslandirmaRaporuViewModelBaseActionController.startAction(
      name: '_HareketDetayliYaslandirmaRaporuViewModelBase.resetFuture',
    );
    try {
      return super.resetFuture();
    } finally {
      _$_HareketDetayliYaslandirmaRaporuViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
bakiyeDurumuGroupValue: ${bakiyeDurumuGroupValue},
pdfModel: ${pdfModel},
futureController: ${futureController}
    ''';
  }
}
