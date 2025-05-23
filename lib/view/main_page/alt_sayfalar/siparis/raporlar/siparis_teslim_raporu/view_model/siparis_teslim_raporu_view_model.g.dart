// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siparis_teslim_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SiparisTeslimRaporuViewModel on _SiparisTeslimRaporuViewModelBase, Store {
  late final _$pdfModelAtom = Atom(name: '_SiparisTeslimRaporuViewModelBase.pdfModel', context: context);

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

  late final _$kapaliMiAtom = Atom(name: '_SiparisTeslimRaporuViewModelBase.kapaliMi', context: context);

  @override
  bool get kapaliMi {
    _$kapaliMiAtom.reportRead();
    return super.kapaliMi;
  }

  @override
  set kapaliMi(bool value) {
    _$kapaliMiAtom.reportWrite(value, super.kapaliMi, () {
      super.kapaliMi = value;
    });
  }

  late final _$durumAtom = Atom(name: '_SiparisTeslimRaporuViewModelBase.durum', context: context);

  @override
  bool get durum {
    _$durumAtom.reportRead();
    return super.durum;
  }

  @override
  set durum(bool value) {
    _$durumAtom.reportWrite(value, super.durum, () {
      super.durum = value;
    });
  }

  late final _$futureControllerAtom = Atom(
    name: '_SiparisTeslimRaporuViewModelBase.futureController',
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

  late final _$_SiparisTeslimRaporuViewModelBaseActionController = ActionController(
    name: '_SiparisTeslimRaporuViewModelBase',
    context: context,
  );

  @override
  void setStokKodu(String? value) {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setStokKodu',
    );
    try {
      return super.setStokKodu(value);
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setCariKodu',
    );
    try {
      return super.setCariKodu(value);
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTeslimCariKodu(String? value) {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setTeslimCariKodu',
    );
    try {
      return super.setTeslimCariKodu(value);
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String value) {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setBelgeNo',
    );
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVergiNo(String? value) {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setVergiNo',
    );
    try {
      return super.setVergiNo(value);
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKapali(String? value) {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setKapali',
    );
    try {
      return super.setKapali(value);
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDurum(String? value) {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setDurum',
    );
    try {
      return super.setDurum(value);
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslangicTarihi(String? value) {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setBaslangicTarihi',
    );
    try {
      return super.setBaslangicTarihi(value);
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setBitisTarihi',
    );
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.setFuture',
    );
    try {
      return super.setFuture();
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_SiparisTeslimRaporuViewModelBaseActionController.startAction(
      name: '_SiparisTeslimRaporuViewModelBase.resetFuture',
    );
    try {
      return super.resetFuture();
    } finally {
      _$_SiparisTeslimRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pdfModel: ${pdfModel},
kapaliMi: ${kapaliMi},
durum: ${durum},
futureController: ${futureController}
    ''';
  }
}
