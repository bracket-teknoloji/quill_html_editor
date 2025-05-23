// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nakit_odeme_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NakitOdemeViewModel on _NakitOdemeViewModelBase, Store {
  Computed<String>? _$formTipiComputed;

  @override
  String get formTipi =>
      (_$formTipiComputed ??= Computed<String>(() => super.formTipi, name: '_NakitOdemeViewModelBase.formTipi')).value;
  Computed<TahsilatRequestModel>? _$getStokYeniKayitModelComputed;

  @override
  TahsilatRequestModel get getStokYeniKayitModel => (_$getStokYeniKayitModelComputed ??= Computed<TahsilatRequestModel>(
    () => super.getStokYeniKayitModel,
    name: '_NakitOdemeViewModelBase.getStokYeniKayitModel',
  )).value;
  Computed<String?>? _$getCariBakiyeComputed;

  @override
  String? get getCariBakiye => (_$getCariBakiyeComputed ??= Computed<String?>(
    () => super.getCariBakiye,
    name: '_NakitOdemeViewModelBase.getCariBakiye',
  )).value;

  late final _$cariBakiyeAtom = Atom(name: '_NakitOdemeViewModelBase.cariBakiye', context: context);

  @override
  double? get cariBakiye {
    _$cariBakiyeAtom.reportRead();
    return super.cariBakiye;
  }

  @override
  set cariBakiye(double? value) {
    _$cariBakiyeAtom.reportWrite(value, super.cariBakiye, () {
      super.cariBakiye = value;
    });
  }

  late final _$cariModelAtom = Atom(name: '_NakitOdemeViewModelBase.cariModel', context: context);

  @override
  CariListesiModel? get cariModel {
    _$cariModelAtom.reportRead();
    return super.cariModel;
  }

  @override
  set cariModel(CariListesiModel? value) {
    _$cariModelAtom.reportWrite(value, super.cariModel, () {
      super.cariModel = value;
    });
  }

  late final _$modelAtom = Atom(name: '_NakitOdemeViewModelBase.model', context: context);

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

  late final _$dovizKurlariListesiAtom = Atom(name: '_NakitOdemeViewModelBase.dovizKurlariListesi', context: context);

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

  late final _$muhaRefListAtom = Atom(name: '_NakitOdemeViewModelBase.muhaRefList', context: context);

  @override
  ObservableList<MuhasebeReferansModel>? get muhaRefList {
    _$muhaRefListAtom.reportRead();
    return super.muhaRefList;
  }

  @override
  set muhaRefList(ObservableList<MuhasebeReferansModel>? value) {
    _$muhaRefListAtom.reportWrite(value, super.muhaRefList, () {
      super.muhaRefList = value;
    });
  }

  late final _$kasaAtom = Atom(name: '_NakitOdemeViewModelBase.kasa', context: context);

  @override
  KasaList? get kasa {
    _$kasaAtom.reportRead();
    return super.kasa;
  }

  @override
  set kasa(KasaList? value) {
    _$kasaAtom.reportWrite(value, super.kasa, () {
      super.kasa = value;
    });
  }

  late final _$showReferansKoduAtom = Atom(name: '_NakitOdemeViewModelBase.showReferansKodu', context: context);

  @override
  bool? get showReferansKodu {
    _$showReferansKoduAtom.reportRead();
    return super.showReferansKodu;
  }

  @override
  set showReferansKodu(bool? value) {
    _$showReferansKoduAtom.reportWrite(value, super.showReferansKodu, () {
      super.showReferansKodu = value;
    });
  }

  late final _$getSiradakiKodAsyncAction = AsyncAction('_NakitOdemeViewModelBase.getSiradakiKod', context: context);

  @override
  Future<void> getSiradakiKod() {
    return _$getSiradakiKodAsyncAction.run(() => super.getSiradakiKod());
  }

  late final _$getKasalarAsyncAction = AsyncAction('_NakitOdemeViewModelBase.getKasalar', context: context);

  @override
  Future<KasaList?> getKasalar(String? kasaKodu) {
    return _$getKasalarAsyncAction.run(() => super.getKasalar(kasaKodu));
  }

  late final _$getMuhaRefListAsyncAction = AsyncAction('_NakitOdemeViewModelBase.getMuhaRefList', context: context);

  @override
  Future<void> getMuhaRefList() {
    return _$getMuhaRefListAsyncAction.run(() => super.getMuhaRefList());
  }

  late final _$getDovizlerAsyncAction = AsyncAction('_NakitOdemeViewModelBase.getDovizler', context: context);

  @override
  Future<void> getDovizler() {
    return _$getDovizlerAsyncAction.run(() => super.getDovizler());
  }

  late final _$postDataAsyncAction = AsyncAction('_NakitOdemeViewModelBase.postData', context: context);

  @override
  Future<GenericResponseModel<DovizKurlariModel>> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
  }

  late final _$_NakitOdemeViewModelBaseActionController = ActionController(
    name: '_NakitOdemeViewModelBase',
    context: context,
  );

  @override
  void setCariModel(CariListesiModel? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setCariModel',
    );
    try {
      return super.setCariModel(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariBakiye(double? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setCariBakiye',
    );
    try {
      return super.setCariBakiye(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowReferansKodu(bool? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setShowReferansKodu',
    );
    try {
      return super.setShowReferansKodu(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setDovizKurlariListesi',
    );
    try {
      return super.setDovizKurlariListesi(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTahsilatmi(bool? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setTahsilatmi',
    );
    try {
      return super.setTahsilatmi(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setBelgeNo',
    );
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setTarih',
    );
    try {
      return super.setTarih(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasa(KasaList? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setKasa',
    );
    try {
      return super.setKasa(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setTutar',
    );
    try {
      return super.setTutar(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTutari(double? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setDovizTutari',
    );
    try {
      return super.setDovizTutari(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjekodu(String? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setProjekodu',
    );
    try {
      return super.setProjekodu(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(PlasiyerList? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setPlasiyerKodu',
    );
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaKodu(String? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setKasaKodu',
    );
    try {
      return super.setKasaKodu(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(int? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setDovizTipi',
    );
    try {
      return super.setDovizTipi(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setCariKodu',
    );
    try {
      return super.setCariKodu(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapKodu(String? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setHesapKodu',
    );
    try {
      return super.setHesapKodu(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHedefAciklama(String? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setHedefAciklama',
    );
    try {
      return super.setHedefAciklama(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMuhaRefList(List<MuhasebeReferansModel>? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setMuhaRefList',
    );
    try {
      return super.setMuhaRefList(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReferansKodu(String? value) {
    final _$actionInfo = _$_NakitOdemeViewModelBaseActionController.startAction(
      name: '_NakitOdemeViewModelBase.setReferansKodu',
    );
    try {
      return super.setReferansKodu(value);
    } finally {
      _$_NakitOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cariBakiye: ${cariBakiye},
cariModel: ${cariModel},
model: ${model},
dovizKurlariListesi: ${dovizKurlariListesi},
muhaRefList: ${muhaRefList},
kasa: ${kasa},
showReferansKodu: ${showReferansKodu},
formTipi: ${formTipi},
getStokYeniKayitModel: ${getStokYeniKayitModel},
getCariBakiye: ${getCariBakiye}
    ''';
  }
}
