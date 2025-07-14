// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasadan_tahsil_et_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KasadanTahsilEtViewModel on _KasadanTahsilEtViewModelBase, Store {
  Computed<String>? _$aciklamaComputed;

  @override
  String get aciklama => (_$aciklamaComputed ??= Computed<String>(
    () => super.aciklama,
    name: '_KasadanTahsilEtViewModelBase.aciklama',
  )).value;

  late final _$modelAtom = Atom(
    name: '_KasadanTahsilEtViewModelBase.model',
    context: context,
  );

  @override
  SaveCekSenetModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  bool _modelIsInitialized = false;

  @override
  set model(SaveCekSenetModel value) {
    _$modelAtom.reportWrite(
      value,
      _modelIsInitialized ? super.model : null,
      () {
        super.model = value;
        _modelIsInitialized = true;
      },
    );
  }

  late final _$postDataAsyncAction = AsyncAction(
    '_KasadanTahsilEtViewModelBase.postData',
    context: context,
  );

  @override
  Future<GenericResponseModel<SaveCekSenetModel>> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
  }

  late final _$_KasadanTahsilEtViewModelBaseActionController = ActionController(
    name: '_KasadanTahsilEtViewModelBase',
    context: context,
  );

  @override
  void setTarih(DateTime value) {
    final _$actionInfo = _$_KasadanTahsilEtViewModelBaseActionController.startAction(
      name: '_KasadanTahsilEtViewModelBase.setTarih',
    );
    try {
      return super.setTarih(value);
    } finally {
      _$_KasadanTahsilEtViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaKodu(String? value) {
    final _$actionInfo = _$_KasadanTahsilEtViewModelBaseActionController.startAction(
      name: '_KasadanTahsilEtViewModelBase.setKasaKodu',
    );
    try {
      return super.setKasaKodu(value);
    } finally {
      _$_KasadanTahsilEtViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMusteriCeki(String? value) {
    final _$actionInfo = _$_KasadanTahsilEtViewModelBaseActionController.startAction(
      name: '_KasadanTahsilEtViewModelBase.setMusteriCeki',
    );
    try {
      return super.setMusteriCeki(value);
    } finally {
      _$_KasadanTahsilEtViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(String? value) {
    final _$actionInfo = _$_KasadanTahsilEtViewModelBaseActionController.startAction(
      name: '_KasadanTahsilEtViewModelBase.setPlasiyerKodu',
    );
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_KasadanTahsilEtViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjeKodu(String? value) {
    final _$actionInfo = _$_KasadanTahsilEtViewModelBaseActionController.startAction(
      name: '_KasadanTahsilEtViewModelBase.setProjeKodu',
    );
    try {
      return super.setProjeKodu(value);
    } finally {
      _$_KasadanTahsilEtViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReferansKodu(String? value) {
    final _$actionInfo = _$_KasadanTahsilEtViewModelBaseActionController.startAction(
      name: '_KasadanTahsilEtViewModelBase.setReferansKodu',
    );
    try {
      return super.setReferansKodu(value);
    } finally {
      _$_KasadanTahsilEtViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaHarAciklama(String? value) {
    final _$actionInfo = _$_KasadanTahsilEtViewModelBaseActionController.startAction(
      name: '_KasadanTahsilEtViewModelBase.setKasaHarAciklama',
    );
    try {
      return super.setKasaHarAciklama(value);
    } finally {
      _$_KasadanTahsilEtViewModelBaseActionController.endAction(_$actionInfo);
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
