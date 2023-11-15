// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stok_ihtiyac_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StokIhtiyacRaporuViewModel on _StokIhtiyacRaporuViewModelBase, Store {
  late final _$sadeceIhtiyaclarMiAtom = Atom(name: '_StokIhtiyacRaporuViewModelBase.sadeceIhtiyaclarMi', context: context);

  @override
  bool get sadeceIhtiyaclarMi {
    _$sadeceIhtiyaclarMiAtom.reportRead();
    return super.sadeceIhtiyaclarMi;
  }

  @override
  set sadeceIhtiyaclarMi(bool value) {
    _$sadeceIhtiyaclarMiAtom.reportWrite(value, super.sadeceIhtiyaclarMi, () {
      super.sadeceIhtiyaclarMi = value;
    });
  }

  late final _$pdfModelAtom = Atom(name: '_StokIhtiyacRaporuViewModelBase.pdfModel', context: context);

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

  late final _$futureControllerAtom = Atom(name: '_StokIhtiyacRaporuViewModelBase.futureController', context: context);

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

  late final _$_StokIhtiyacRaporuViewModelBaseActionController = ActionController(name: '_StokIhtiyacRaporuViewModelBase', context: context);

  @override
  void setSadeceIhtiyaclarMi(bool value) {
    final _$actionInfo = _$_StokIhtiyacRaporuViewModelBaseActionController.startAction(name: '_StokIhtiyacRaporuViewModelBase.setSadeceIhtiyaclarMi');
    try {
      return super.setSadeceIhtiyaclarMi(value);
    } finally {
      _$_StokIhtiyacRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSirala(String? value) {
    final _$actionInfo = _$_StokIhtiyacRaporuViewModelBaseActionController.startAction(name: '_StokIhtiyacRaporuViewModelBase.setSirala');
    try {
      return super.setSirala(value);
    } finally {
      _$_StokIhtiyacRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokKodu(String? value) {
    final _$actionInfo = _$_StokIhtiyacRaporuViewModelBaseActionController.startAction(name: '_StokIhtiyacRaporuViewModelBase.setStokKodu');
    try {
      return super.setStokKodu(value);
    } finally {
      _$_StokIhtiyacRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_StokIhtiyacRaporuViewModelBaseActionController.startAction(name: '_StokIhtiyacRaporuViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_StokIhtiyacRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_StokIhtiyacRaporuViewModelBaseActionController.startAction(name: '_StokIhtiyacRaporuViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_StokIhtiyacRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_StokIhtiyacRaporuViewModelBaseActionController.startAction(name: '_StokIhtiyacRaporuViewModelBase.setFuture');
    try {
      return super.setFuture();
    } finally {
      _$_StokIhtiyacRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_StokIhtiyacRaporuViewModelBaseActionController.startAction(name: '_StokIhtiyacRaporuViewModelBase.resetFuture');
    try {
      return super.resetFuture();
    } finally {
      _$_StokIhtiyacRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sadeceIhtiyaclarMi: ${sadeceIhtiyaclarMi},
pdfModel: ${pdfModel},
futureController: ${futureController}
    ''';
  }
}
