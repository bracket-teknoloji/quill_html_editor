// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musteri_siparisi_durum_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusteriSiparisiDurumRaporuViewModel on _MusteriSiparisiDurumRaporuViewModelBase, Store {
  Computed<PdfModel>? _$pdfModelComputed;

  @override
  PdfModel get pdfModel => (_$pdfModelComputed ??= Computed<PdfModel>(
    () => super.pdfModel,
    name: '_MusteriSiparisiDurumRaporuViewModelBase.pdfModel',
  )).value;

  late final _$dicParamsAtom = Atom(name: '_MusteriSiparisiDurumRaporuViewModelBase.dicParams', context: context);

  @override
  DicParams get dicParams {
    _$dicParamsAtom.reportRead();
    return super.dicParams;
  }

  @override
  set dicParams(DicParams value) {
    _$dicParamsAtom.reportWrite(value, super.dicParams, () {
      super.dicParams = value;
    });
  }

  late final _$futureControllerAtom = Atom(
    name: '_MusteriSiparisiDurumRaporuViewModelBase.futureController',
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

  late final _$_MusteriSiparisiDurumRaporuViewModelBaseActionController = ActionController(
    name: '_MusteriSiparisiDurumRaporuViewModelBase',
    context: context,
  );

  @override
  void setStokKodu(String? value) {
    final _$actionInfo = _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.startAction(
      name: '_MusteriSiparisiDurumRaporuViewModelBase.setStokKodu',
    );
    try {
      return super.setStokKodu(value);
    } finally {
      _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.startAction(
      name: '_MusteriSiparisiDurumRaporuViewModelBase.setCariKodu',
    );
    try {
      return super.setCariKodu(value);
    } finally {
      _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.startAction(
      name: '_MusteriSiparisiDurumRaporuViewModelBase.setBelgeNo',
    );
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.startAction(
      name: '_MusteriSiparisiDurumRaporuViewModelBase.setFuture',
    );
    try {
      return super.setFuture();
    } finally {
      _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.startAction(
      name: '_MusteriSiparisiDurumRaporuViewModelBase.resetFuture',
    );
    try {
      return super.resetFuture();
    } finally {
      _$_MusteriSiparisiDurumRaporuViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dicParams: ${dicParams},
futureController: ${futureController},
pdfModel: ${pdfModel}
    ''';
  }
}
