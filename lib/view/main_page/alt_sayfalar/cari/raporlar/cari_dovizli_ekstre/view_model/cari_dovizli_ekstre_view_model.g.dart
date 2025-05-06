// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_dovizli_ekstre_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariDovizliEkstreViewModel on _CariDovizliEkstreViewModelBase, Store {
  Computed<bool>? _$getTlHareketleriDokulsunComputed;

  @override
  bool get getTlHareketleriDokulsun => (_$getTlHareketleriDokulsunComputed ??=
          Computed<bool>(() => super.getTlHareketleriDokulsun,
              name: '_CariDovizliEkstreViewModelBase.getTlHareketleriDokulsun'))
      .value;

  late final _$tlHareketleriDokulsunAtom = Atom(
      name: '_CariDovizliEkstreViewModelBase.tlHareketleriDokulsun',
      context: context);

  @override
  bool get tlHareketleriDokulsun {
    _$tlHareketleriDokulsunAtom.reportRead();
    return super.tlHareketleriDokulsun;
  }

  @override
  set tlHareketleriDokulsun(bool value) {
    _$tlHareketleriDokulsunAtom.reportWrite(value, super.tlHareketleriDokulsun,
        () {
      super.tlHareketleriDokulsun = value;
    });
  }

  late final _$dovizValueAtom = Atom(
      name: '_CariDovizliEkstreViewModelBase.dovizValue', context: context);

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

  late final _$pdfModelAtom =
      Atom(name: '_CariDovizliEkstreViewModelBase.pdfModel', context: context);

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
      name: '_CariDovizliEkstreViewModelBase.futureController',
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

  late final _$_CariDovizliEkstreViewModelBaseActionController =
      ActionController(
          name: '_CariDovizliEkstreViewModelBase', context: context);

  @override
  void changeTlHareketleriDokulsun() {
    final _$actionInfo =
        _$_CariDovizliEkstreViewModelBaseActionController.startAction(
            name:
                '_CariDovizliEkstreViewModelBase.changeTlHareketleriDokulsun');
    try {
      return super.changeTlHareketleriDokulsun();
    } finally {
      _$_CariDovizliEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDovizValue(String? value) {
    final _$actionInfo = _$_CariDovizliEkstreViewModelBaseActionController
        .startAction(name: '_CariDovizliEkstreViewModelBase.changeDovizValue');
    try {
      return super.changeDovizValue(value);
    } finally {
      _$_CariDovizliEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCariKodu(String? value) {
    final _$actionInfo = _$_CariDovizliEkstreViewModelBaseActionController
        .startAction(name: '_CariDovizliEkstreViewModelBase.changeCariKodu');
    try {
      return super.changeCariKodu(value);
    } finally {
      _$_CariDovizliEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDovizTipi(int value) {
    final _$actionInfo = _$_CariDovizliEkstreViewModelBaseActionController
        .startAction(name: '_CariDovizliEkstreViewModelBase.changeDovizTipi');
    try {
      return super.changeDovizTipi(value);
    } finally {
      _$_CariDovizliEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFuture() {
    final _$actionInfo = _$_CariDovizliEkstreViewModelBaseActionController
        .startAction(name: '_CariDovizliEkstreViewModelBase.setFuture');
    try {
      return super.setFuture();
    } finally {
      _$_CariDovizliEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFuture() {
    final _$actionInfo = _$_CariDovizliEkstreViewModelBaseActionController
        .startAction(name: '_CariDovizliEkstreViewModelBase.resetFuture');
    try {
      return super.resetFuture();
    } finally {
      _$_CariDovizliEkstreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tlHareketleriDokulsun: ${tlHareketleriDokulsun},
dovizValue: ${dovizValue},
pdfModel: ${pdfModel},
futureController: ${futureController},
getTlHareketleriDokulsun: ${getTlHareketleriDokulsun}
    ''';
  }
}
