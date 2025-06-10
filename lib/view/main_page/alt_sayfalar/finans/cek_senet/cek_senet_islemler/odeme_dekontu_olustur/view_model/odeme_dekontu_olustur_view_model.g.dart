// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odeme_dekontu_olustur_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OdemeDekontuOlusturViewModel
    on _OdemeDekontuOlusturViewModelBase, Store {
  Computed<String>? _$aciklamaComputed;

  @override
  String get aciklama => (_$aciklamaComputed ??= Computed<String>(
    () => super.aciklama,
    name: '_OdemeDekontuOlusturViewModelBase.aciklama',
  )).value;

  late final _$modelAtom = Atom(
    name: '_OdemeDekontuOlusturViewModelBase.model',
    context: context,
  );

  @override
  TahsilatRequestModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  bool _modelIsInitialized = false;

  @override
  set model(TahsilatRequestModel value) {
    _$modelAtom.reportWrite(
      value,
      _modelIsInitialized ? super.model : null,
      () {
        super.model = value;
        _modelIsInitialized = true;
      },
    );
  }

  late final _$_OdemeDekontuOlusturViewModelBaseActionController =
      ActionController(
        name: '_OdemeDekontuOlusturViewModelBase',
        context: context,
      );

  @override
  void setTarih(DateTime? tarih) {
    final _$actionInfo = _$_OdemeDekontuOlusturViewModelBaseActionController
        .startAction(name: '_OdemeDekontuOlusturViewModelBase.setTarih');
    try {
      return super.setTarih(tarih);
    } finally {
      _$_OdemeDekontuOlusturViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSerino(String? serino) {
    final _$actionInfo = _$_OdemeDekontuOlusturViewModelBaseActionController
        .startAction(name: '_OdemeDekontuOlusturViewModelBase.setSerino');
    try {
      return super.setSerino(serino);
    } finally {
      _$_OdemeDekontuOlusturViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setOdemeHesabi(String? odemeHesabi) {
    final _$actionInfo = _$_OdemeDekontuOlusturViewModelBaseActionController
        .startAction(name: '_OdemeDekontuOlusturViewModelBase.setOdemeHesabi');
    try {
      return super.setOdemeHesabi(odemeHesabi);
    } finally {
      _$_OdemeDekontuOlusturViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setProjeKodu(String? projeKodu) {
    final _$actionInfo = _$_OdemeDekontuOlusturViewModelBaseActionController
        .startAction(name: '_OdemeDekontuOlusturViewModelBase.setProjeKodu');
    try {
      return super.setProjeKodu(projeKodu);
    } finally {
      _$_OdemeDekontuOlusturViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setPlasiyerKodu(String? plasiyerKodu) {
    final _$actionInfo = _$_OdemeDekontuOlusturViewModelBaseActionController
        .startAction(name: '_OdemeDekontuOlusturViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(plasiyerKodu);
    } finally {
      _$_OdemeDekontuOlusturViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setAciklama(String? aciklama) {
    final _$actionInfo = _$_OdemeDekontuOlusturViewModelBaseActionController
        .startAction(name: '_OdemeDekontuOlusturViewModelBase.setAciklama');
    try {
      return super.setAciklama(aciklama);
    } finally {
      _$_OdemeDekontuOlusturViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
aciklama: ${aciklama}
    ''';
  }
}
