// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_havale_eft_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariHavaleEftViewModel on _CariHavaleEftViewModelBase, Store {
  late final _$modelAtom = Atom(name: '_CariHavaleEftViewModelBase.model', context: context);

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

  late final _$dovizKurlariListesiAtom = Atom(
    name: '_CariHavaleEftViewModelBase.dovizKurlariListesi',
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

  late final _$bankaListesiRequestModelAtom = Atom(
    name: '_CariHavaleEftViewModelBase.bankaListesiRequestModel',
    context: context,
  );

  @override
  BankaListesiRequestModel get bankaListesiRequestModel {
    _$bankaListesiRequestModelAtom.reportRead();
    return super.bankaListesiRequestModel;
  }

  @override
  set bankaListesiRequestModel(BankaListesiRequestModel value) {
    _$bankaListesiRequestModelAtom.reportWrite(value, super.bankaListesiRequestModel, () {
      super.bankaListesiRequestModel = value;
    });
  }

  late final _$cariModelAtom = Atom(name: '_CariHavaleEftViewModelBase.cariModel', context: context);

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

  late final _$bankaModelAtom = Atom(name: '_CariHavaleEftViewModelBase.bankaModel', context: context);

  @override
  BankaListesiModel? get bankaModel {
    _$bankaModelAtom.reportRead();
    return super.bankaModel;
  }

  @override
  set bankaModel(BankaListesiModel? value) {
    _$bankaModelAtom.reportWrite(value, super.bankaModel, () {
      super.bankaModel = value;
    });
  }

  late final _$bankaDovizliMiAtom = Atom(name: '_CariHavaleEftViewModelBase.bankaDovizliMi', context: context);

  @override
  bool get bankaDovizliMi {
    _$bankaDovizliMiAtom.reportRead();
    return super.bankaDovizliMi;
  }

  @override
  set bankaDovizliMi(bool value) {
    _$bankaDovizliMiAtom.reportWrite(value, super.bankaDovizliMi, () {
      super.bankaDovizliMi = value;
    });
  }

  late final _$getDovizlerAsyncAction = AsyncAction('_CariHavaleEftViewModelBase.getDovizler', context: context);

  @override
  Future<void> getDovizler() {
    return _$getDovizlerAsyncAction.run(() => super.getDovizler());
  }

  late final _$_CariHavaleEftViewModelBaseActionController = ActionController(
    name: '_CariHavaleEftViewModelBase',
    context: context,
  );

  @override
  void setCariModel(CariListesiModel? model) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setCariModel',
    );
    try {
      return super.setCariModel(model);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankaDovizliMi(bool value) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setBankaDovizliMi',
    );
    try {
      return super.setBankaDovizliMi(value);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGc(bool? gc) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setGc',
    );
    try {
      return super.setGc(gc);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBSMV(double? bsmv) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setBSMV',
    );
    try {
      return super.setBSMV(bsmv);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? tarih) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setTarih',
    );
    try {
      return super.setTarih(tarih);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDekontNo(String? dekontNo) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setDekontNo',
    );
    try {
      return super.setDekontNo(dekontNo);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapNo(BankaListesiModel? hesapNo) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setHesapNo',
    );
    try {
      return super.setHesapNo(hesapNo);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? cariKodu) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setCariKodu',
    );
    try {
      return super.setCariKodu(cariKodu);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(int? dovizTipi) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setDovizTipi',
    );
    try {
      return super.setDovizTipi(dovizTipi);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? tutar) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setTutar',
    );
    try {
      return super.setTutar(tutar);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTutari(double? dovizTutari) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setDovizTutari',
    );
    try {
      return super.setDovizTutari(dovizTutari);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMasrafTutari(double? masrafTutari) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setMasrafTutari',
    );
    try {
      return super.setMasrafTutari(masrafTutari);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMasrafMuhKodu(String? masrafMuhKodu) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setMasrafMuhKodu',
    );
    try {
      return super.setMasrafMuhKodu(masrafMuhKodu);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(String? plasiyerKodu) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setPlasiyerKodu',
    );
    try {
      return super.setPlasiyerKodu(plasiyerKodu);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjeKodu(String? projeKodu) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setProjeKodu',
    );
    try {
      return super.setProjeKodu(projeKodu);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? aciklama) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(aciklama);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTCMBBankaKodu(String? tcmbBankaKodu) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setTCMBBankaKodu',
    );
    try {
      return super.setTCMBBankaKodu(tcmbBankaKodu);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTCMBSubeKodu(String? tcmbSubeKodu) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setTCMBSubeKodu',
    );
    try {
      return super.setTCMBSubeKodu(tcmbSubeKodu);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIBAN(String? iban) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setIBAN',
    );
    try {
      return super.setIBAN(iban);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankaHesapNo(String? hesapNo) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setBankaHesapNo',
    );
    try {
      return super.setBankaHesapNo(hesapNo);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setDovizKurlariListesi',
    );
    try {
      return super.setDovizKurlariListesi(value);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReferansKodu(String? referansKodu) {
    final _$actionInfo = _$_CariHavaleEftViewModelBaseActionController.startAction(
      name: '_CariHavaleEftViewModelBase.setReferansKodu',
    );
    try {
      return super.setReferansKodu(referansKodu);
    } finally {
      _$_CariHavaleEftViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
dovizKurlariListesi: ${dovizKurlariListesi},
bankaListesiRequestModel: ${bankaListesiRequestModel},
cariModel: ${cariModel},
bankaModel: ${bankaModel},
bankaDovizliMi: ${bankaDovizliMi}
    ''';
  }
}
