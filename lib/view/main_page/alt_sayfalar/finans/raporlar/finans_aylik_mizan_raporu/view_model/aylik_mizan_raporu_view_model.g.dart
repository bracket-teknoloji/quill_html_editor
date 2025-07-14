// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aylik_mizan_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AylikMizanRaporuViewModel on _AylikMizanRaporuViewModelBase, Store {
  late final _$pdfModelAtom = Atom(
    name: '_AylikMizanRaporuViewModelBase.pdfModel',
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
    name: '_AylikMizanRaporuViewModelBase.futureController',
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

  late final _$_AylikMizanRaporuViewModelBaseActionController = ActionController(
    name: '_AylikMizanRaporuViewModelBase',
    context: context,
  );

  @override
  void setFuture() {
    final _$actionInfo = _$_AylikMizanRaporuViewModelBaseActionController.startAction(
      name: '_AylikMizanRaporuViewModelBase.setFuture',
    );
    try {
      return super.setFuture();
    } finally {
      _$_AylikMizanRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_AylikMizanRaporuViewModelBaseActionController.startAction(
      name: '_AylikMizanRaporuViewModelBase.resetFuture',
    );
    try {
      return super.resetFuture();
    } finally {
      _$_AylikMizanRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMuhasebeKodu(String? value) {
    final _$actionInfo = _$_AylikMizanRaporuViewModelBaseActionController.startAction(
      name: '_AylikMizanRaporuViewModelBase.changeMuhasebeKodu',
    );
    try {
      return super.changeMuhasebeKodu(value);
    } finally {
      _$_AylikMizanRaporuViewModelBaseActionController.endAction(_$actionInfo);
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
