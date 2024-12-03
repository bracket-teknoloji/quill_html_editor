// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_kasa_transferi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankaKasaTransferiViewModel on _BankaKasaTransferiViewModelBase, Store {
  Computed<String>? _$bankaHarAciklamaComputed;

  @override
  String get bankaHarAciklama => (_$bankaHarAciklamaComputed ??=
          Computed<String>(() => super.bankaHarAciklama,
              name: '_BankaKasaTransferiViewModelBase.bankaHarAciklama'))
      .value;

  late final _$modelAtom =
      Atom(name: '_BankaKasaTransferiViewModelBase.model', context: context);

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

  late final _$bankaDovizliMiAtom = Atom(
      name: '_BankaKasaTransferiViewModelBase.bankaDovizliMi',
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

  late final _$bankaListesiRequestModelAtom = Atom(
      name: '_BankaKasaTransferiViewModelBase.bankaListesiRequestModel',
      context: context);

  @override
  BankaListesiRequestModel get bankaListesiRequestModel {
    _$bankaListesiRequestModelAtom.reportRead();
    return super.bankaListesiRequestModel;
  }

  @override
  set bankaListesiRequestModel(BankaListesiRequestModel value) {
    _$bankaListesiRequestModelAtom
        .reportWrite(value, super.bankaListesiRequestModel, () {
      super.bankaListesiRequestModel = value;
    });
  }

  late final _$dovizKurlariListesiAtom = Atom(
      name: '_BankaKasaTransferiViewModelBase.dovizKurlariListesi',
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

  late final _$getSiradakiKodAsyncAction = AsyncAction(
      '_BankaKasaTransferiViewModelBase.getSiradakiKod',
      context: context);

  @override
  Future<void> getSiradakiKod() {
    return _$getSiradakiKodAsyncAction.run(() => super.getSiradakiKod());
  }

  late final _$getDovizlerAsyncAction = AsyncAction(
      '_BankaKasaTransferiViewModelBase.getDovizler',
      context: context);

  @override
  Future<void> getDovizler() {
    return _$getDovizlerAsyncAction.run(() => super.getDovizler());
  }

  late final _$saveTahsilatAsyncAction = AsyncAction(
      '_BankaKasaTransferiViewModelBase.saveTahsilat',
      context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> saveTahsilat() {
    return _$saveTahsilatAsyncAction.run(() => super.saveTahsilat());
  }

  late final _$_BankaKasaTransferiViewModelBaseActionController =
      ActionController(
          name: '_BankaKasaTransferiViewModelBase', context: context);

  @override
  void setBankaDovizliMi(bool value) {
    final _$actionInfo =
        _$_BankaKasaTransferiViewModelBaseActionController.startAction(
            name: '_BankaKasaTransferiViewModelBase.setBankaDovizliMi');
    try {
      return super.setBankaDovizliMi(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setGc(String? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setGc');
    try {
      return super.setGc(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setTarih');
    try {
      return super.setTarih(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setHesapKodu(BankaListesiModel? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setHesapKodu');
    try {
      return super.setHesapKodu(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setGuid(String? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setGuid');
    try {
      return super.setGuid(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setKasaKodu(String? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setKasaKodu');
    try {
      return super.setKasaKodu(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setTutar');
    try {
      return super.setTutar(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(int? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setDovizTipi');
    try {
      return super.setDovizTipi(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTutari(double? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setDovizTutari');
    try {
      return super.setDovizTutari(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(String? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setProjeKodu(String? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setProjeKodu');
    try {
      return super.setProjeKodu(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setVadeGunu(int? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setVadeGunu');
    try {
      return super.setVadeGunu(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setAciklama');
    try {
      return super.setAciklama(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setHedefAciklama(String? value) {
    final _$actionInfo = _$_BankaKasaTransferiViewModelBaseActionController
        .startAction(name: '_BankaKasaTransferiViewModelBase.setHedefAciklama');
    try {
      return super.setHedefAciklama(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    final _$actionInfo =
        _$_BankaKasaTransferiViewModelBaseActionController.startAction(
            name: '_BankaKasaTransferiViewModelBase.setDovizKurlariListesi');
    try {
      return super.setDovizKurlariListesi(value);
    } finally {
      _$_BankaKasaTransferiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
bankaDovizliMi: ${bankaDovizliMi},
bankaListesiRequestModel: ${bankaListesiRequestModel},
dovizKurlariListesi: ${dovizKurlariListesi},
bankaHarAciklama: ${bankaHarAciklama}
    ''';
  }
}
