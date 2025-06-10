// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kasa_transferi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KasaTransferiViewModel on _KasaTransferiViewModelBase, Store {
  Computed<String>? _$aciklamaStringComputed;

  @override
  String get aciklamaString => (_$aciklamaStringComputed ??= Computed<String>(
    () => super.aciklamaString,
    name: '_KasaTransferiViewModelBase.aciklamaString',
  )).value;
  Computed<TahsilatRequestModel>? _$getStokYeniKayitModelComputed;

  @override
  TahsilatRequestModel get getStokYeniKayitModel =>
      (_$getStokYeniKayitModelComputed ??= Computed<TahsilatRequestModel>(
        () => super.getStokYeniKayitModel,
        name: '_KasaTransferiViewModelBase.getStokYeniKayitModel',
      )).value;

  late final _$modelAtom = Atom(
    name: '_KasaTransferiViewModelBase.model',
    context: context,
  );

  @override
  TahsilatRequestModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(TahsilatRequestModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$girisKasaAtom = Atom(
    name: '_KasaTransferiViewModelBase.girisKasa',
    context: context,
  );

  @override
  KasaList? get girisKasa {
    _$girisKasaAtom.reportRead();
    return super.girisKasa;
  }

  @override
  set girisKasa(KasaList? value) {
    _$girisKasaAtom.reportWrite(value, super.girisKasa, () {
      super.girisKasa = value;
    });
  }

  late final _$cikisKasaAtom = Atom(
    name: '_KasaTransferiViewModelBase.cikisKasa',
    context: context,
  );

  @override
  KasaList? get cikisKasa {
    _$cikisKasaAtom.reportRead();
    return super.cikisKasa;
  }

  @override
  set cikisKasa(KasaList? value) {
    _$cikisKasaAtom.reportWrite(value, super.cikisKasa, () {
      super.cikisKasa = value;
    });
  }

  late final _$dovizKurlariListesiAtom = Atom(
    name: '_KasaTransferiViewModelBase.dovizKurlariListesi',
    context: context,
  );

  @override
  ObservableList<DovizKurlariModel>? get dovizKurlariListesi {
    _$dovizKurlariListesiAtom.reportRead();
    return super.dovizKurlariListesi;
  }

  @override
  set dovizKurlariListesi(ObservableList<DovizKurlariModel>? value) {
    _$dovizKurlariListesiAtom.reportWrite(value, super.dovizKurlariListesi, () {
      super.dovizKurlariListesi = value;
    });
  }

  late final _$setGirisKasaAsyncAction = AsyncAction(
    '_KasaTransferiViewModelBase.setGirisKasa',
    context: context,
  );

  @override
  Future<void> setGirisKasa(KasaList value) {
    return _$setGirisKasaAsyncAction.run(() => super.setGirisKasa(value));
  }

  late final _$setCikisKasaAsyncAction = AsyncAction(
    '_KasaTransferiViewModelBase.setCikisKasa',
    context: context,
  );

  @override
  Future<void> setCikisKasa(KasaList value) {
    return _$setCikisKasaAsyncAction.run(() => super.setCikisKasa(value));
  }

  late final _$getSiradakiKodAsyncAction = AsyncAction(
    '_KasaTransferiViewModelBase.getSiradakiKod',
    context: context,
  );

  @override
  Future<void> getSiradakiKod() {
    return _$getSiradakiKodAsyncAction.run(() => super.getSiradakiKod());
  }

  late final _$getKasalarAsyncAction = AsyncAction(
    '_KasaTransferiViewModelBase.getKasalar',
    context: context,
  );

  @override
  Future<KasaList?> getKasalar(String? kasaKodu) {
    return _$getKasalarAsyncAction.run(() => super.getKasalar(kasaKodu));
  }

  late final _$getDovizlerAsyncAction = AsyncAction(
    '_KasaTransferiViewModelBase.getDovizler',
    context: context,
  );

  @override
  Future<void> getDovizler() {
    return _$getDovizlerAsyncAction.run(() => super.getDovizler());
  }

  late final _$postDataAsyncAction = AsyncAction(
    '_KasaTransferiViewModelBase.postData',
    context: context,
  );

  @override
  Future<GenericResponseModel<DovizKurlariModel>> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
  }

  late final _$_KasaTransferiViewModelBaseActionController = ActionController(
    name: '_KasaTransferiViewModelBase',
    context: context,
  );

  @override
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    final _$actionInfo = _$_KasaTransferiViewModelBaseActionController
        .startAction(
          name: '_KasaTransferiViewModelBase.setDovizKurlariListesi',
        );
    try {
      return super.setDovizKurlariListesi(value);
    } finally {
      _$_KasaTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_KasaTransferiViewModelBaseActionController
        .startAction(name: '_KasaTransferiViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_KasaTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_KasaTransferiViewModelBaseActionController
        .startAction(name: '_KasaTransferiViewModelBase.setTarih');
    try {
      return super.setTarih(value);
    } finally {
      _$_KasaTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_KasaTransferiViewModelBaseActionController
        .startAction(name: '_KasaTransferiViewModelBase.setAciklama');
    try {
      return super.setAciklama(value);
    } finally {
      _$_KasaTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? value) {
    final _$actionInfo = _$_KasaTransferiViewModelBaseActionController
        .startAction(name: '_KasaTransferiViewModelBase.setTutar');
    try {
      return super.setTutar(value);
    } finally {
      _$_KasaTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTutari(double? value) {
    final _$actionInfo = _$_KasaTransferiViewModelBaseActionController
        .startAction(name: '_KasaTransferiViewModelBase.setDovizTutari');
    try {
      return super.setDovizTutari(value);
    } finally {
      _$_KasaTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjekodu(String? value) {
    final _$actionInfo = _$_KasaTransferiViewModelBaseActionController
        .startAction(name: '_KasaTransferiViewModelBase.setProjekodu');
    try {
      return super.setProjekodu(value);
    } finally {
      _$_KasaTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(PlasiyerList? value) {
    final _$actionInfo = _$_KasaTransferiViewModelBaseActionController
        .startAction(name: '_KasaTransferiViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_KasaTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(int? value) {
    final _$actionInfo = _$_KasaTransferiViewModelBaseActionController
        .startAction(name: '_KasaTransferiViewModelBase.setDovizTipi');
    try {
      return super.setDovizTipi(value);
    } finally {
      _$_KasaTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
girisKasa: ${girisKasa},
cikisKasa: ${cikisKasa},
dovizKurlariListesi: ${dovizKurlariListesi},
aciklamaString: ${aciklamaString},
getStokYeniKayitModel: ${getStokYeniKayitModel}
    ''';
  }
}
