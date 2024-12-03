// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hesaplar_arasi_islem_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HesaplarArasiIslemViewModel on _HesaplarArasiIslemViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_HesaplarArasiIslemViewModelBase.model', context: context);

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

  late final _$cikisBankaListesiRequestModelAtom = Atom(
      name: '_HesaplarArasiIslemViewModelBase.cikisBankaListesiRequestModel',
      context: context);

  @override
  BankaListesiRequestModel get cikisBankaListesiRequestModel {
    _$cikisBankaListesiRequestModelAtom.reportRead();
    return super.cikisBankaListesiRequestModel;
  }

  @override
  set cikisBankaListesiRequestModel(BankaListesiRequestModel value) {
    _$cikisBankaListesiRequestModelAtom
        .reportWrite(value, super.cikisBankaListesiRequestModel, () {
      super.cikisBankaListesiRequestModel = value;
    });
  }

  late final _$girisBankaListesiRequestModelAtom = Atom(
      name: '_HesaplarArasiIslemViewModelBase.girisBankaListesiRequestModel',
      context: context);

  @override
  BankaListesiRequestModel get girisBankaListesiRequestModel {
    _$girisBankaListesiRequestModelAtom.reportRead();
    return super.girisBankaListesiRequestModel;
  }

  @override
  set girisBankaListesiRequestModel(BankaListesiRequestModel value) {
    _$girisBankaListesiRequestModelAtom
        .reportWrite(value, super.girisBankaListesiRequestModel, () {
      super.girisBankaListesiRequestModel = value;
    });
  }

  late final _$dovizKurlariListesiAtom = Atom(
      name: '_HesaplarArasiIslemViewModelBase.dovizKurlariListesi',
      context: context);

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

  late final _$bankaDovizliMiAtom = Atom(
      name: '_HesaplarArasiIslemViewModelBase.bankaDovizliMi',
      context: context);

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

  late final _$getDovizlerAsyncAction = AsyncAction(
      '_HesaplarArasiIslemViewModelBase.getDovizler',
      context: context);

  @override
  Future<void> getDovizler() {
    return _$getDovizlerAsyncAction.run(() => super.getDovizler());
  }

  late final _$saveTahsilatAsyncAction = AsyncAction(
      '_HesaplarArasiIslemViewModelBase.saveTahsilat',
      context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> saveTahsilat() {
    return _$saveTahsilatAsyncAction.run(() => super.saveTahsilat());
  }

  late final _$_HesaplarArasiIslemViewModelBaseActionController =
      ActionController(
          name: '_HesaplarArasiIslemViewModelBase', context: context);

  @override
  void setBankaDovizliMi(bool value) {
    final _$actionInfo =
        _$_HesaplarArasiIslemViewModelBaseActionController.startAction(
            name: '_HesaplarArasiIslemViewModelBase.setBankaDovizliMi');
    try {
      return super.setBankaDovizliMi(value);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeBelgeTipi(HesaplarArasiEnum value) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.changeBelgeTipi');
    try {
      return super.changeBelgeTipi(value);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? tarih) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setTarih');
    try {
      return super.setTarih(tarih);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDekontNo(String? dekontNo) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setDekontNo');
    try {
      return super.setDekontNo(dekontNo);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setGuid(String? value) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setGuid');
    try {
      return super.setGuid(value);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCikisHesabi(BankaListesiModel? bankaListesiModel) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setCikisHesabi');
    try {
      return super.setCikisHesabi(bankaListesiModel);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setGirisHesabi(BankaListesiModel? bankaListesiModel) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setGirisHesabi');
    try {
      return super.setGirisHesabi(bankaListesiModel);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(int? dovizTipi) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setDovizTipi');
    try {
      return super.setDovizTipi(dovizTipi);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTutari(double? dovizTutari) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setDovizTutari');
    try {
      return super.setDovizTutari(dovizTutari);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? tutar) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setTutar');
    try {
      return super.setTutar(tutar);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setMasrafCikisHesabindanMi(double? masraf) {
    final _$actionInfo =
        _$_HesaplarArasiIslemViewModelBaseActionController.startAction(
            name:
                '_HesaplarArasiIslemViewModelBase.setMasrafCikisHesabindanMi');
    try {
      return super.setMasrafCikisHesabindanMi(masraf);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBSMV(double? bsmv) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setBSMV');
    try {
      return super.setBSMV(bsmv);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setMasrafMuhKodu(String? masrafMuhKodu) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setMasrafMuhKodu');
    try {
      return super.setMasrafMuhKodu(masrafMuhKodu);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(String? plasiyerKodu) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(plasiyerKodu);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setProjeKodu(String? projeKodu) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setProjeKodu');
    try {
      return super.setProjeKodu(projeKodu);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? aciklama) {
    final _$actionInfo = _$_HesaplarArasiIslemViewModelBaseActionController
        .startAction(name: '_HesaplarArasiIslemViewModelBase.setAciklama');
    try {
      return super.setAciklama(aciklama);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    final _$actionInfo =
        _$_HesaplarArasiIslemViewModelBaseActionController.startAction(
            name: '_HesaplarArasiIslemViewModelBase.setDovizKurlariListesi');
    try {
      return super.setDovizKurlariListesi(value);
    } finally {
      _$_HesaplarArasiIslemViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
cikisBankaListesiRequestModel: ${cikisBankaListesiRequestModel},
girisBankaListesiRequestModel: ${girisBankaListesiRequestModel},
dovizKurlariListesi: ${dovizKurlariListesi},
bankaDovizliMi: ${bankaDovizliMi}
    ''';
  }
}
