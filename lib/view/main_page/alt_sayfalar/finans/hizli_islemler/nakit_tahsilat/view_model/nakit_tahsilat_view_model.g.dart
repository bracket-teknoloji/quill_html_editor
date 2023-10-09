// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nakit_tahsilat_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NakitTahsilatViewModel on _NakitTahsilatViewModelBase, Store {
  Computed<TahsilatRequestModel>? _$getStokYeniKayitModelComputed;

  @override
  TahsilatRequestModel get getStokYeniKayitModel =>
      (_$getStokYeniKayitModelComputed ??= Computed<TahsilatRequestModel>(
              () => super.getStokYeniKayitModel,
              name: '_NakitTahsilatViewModelBase.getStokYeniKayitModel'))
          .value;

  late final _$modelAtom =
      Atom(name: '_NakitTahsilatViewModelBase.model', context: context);

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
      name: '_NakitTahsilatViewModelBase.dovizKurlariListesi',
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

  late final _$muhaRefListAtom =
      Atom(name: '_NakitTahsilatViewModelBase.muhaRefList', context: context);

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

  late final _$getSiradakiKodAsyncAction = AsyncAction(
      '_NakitTahsilatViewModelBase.getSiradakiKod',
      context: context);

  @override
  Future<void> getSiradakiKod() {
    return _$getSiradakiKodAsyncAction.run(() => super.getSiradakiKod());
  }

  late final _$getKasalarAsyncAction =
      AsyncAction('_NakitTahsilatViewModelBase.getKasalar', context: context);

  @override
  Future<KasaList?> getKasalar(String? kasaKodu) {
    return _$getKasalarAsyncAction.run(() => super.getKasalar(kasaKodu));
  }

  late final _$getMuhaRefListAsyncAction = AsyncAction(
      '_NakitTahsilatViewModelBase.getMuhaRefList',
      context: context);

  @override
  Future<void> getMuhaRefList() {
    return _$getMuhaRefListAsyncAction.run(() => super.getMuhaRefList());
  }

  late final _$getDovizlerAsyncAction =
      AsyncAction('_NakitTahsilatViewModelBase.getDovizler', context: context);

  @override
  Future<void> getDovizler() {
    return _$getDovizlerAsyncAction.run(() => super.getDovizler());
  }

  late final _$postDataAsyncAction =
      AsyncAction('_NakitTahsilatViewModelBase.postData', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
  }

  late final _$_NakitTahsilatViewModelBaseActionController =
      ActionController(name: '_NakitTahsilatViewModelBase', context: context);

  @override
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    final _$actionInfo =
        _$_NakitTahsilatViewModelBaseActionController.startAction(
            name: '_NakitTahsilatViewModelBase.setDovizKurlariListesi');
    try {
      return super.setDovizKurlariListesi(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setTarih');
    try {
      return super.setTarih(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasa(KasaList? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setKasa');
    try {
      return super.setKasa(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setAciklama');
    try {
      return super.setAciklama(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setTutar');
    try {
      return super.setTutar(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTutari(double? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setDovizTutari');
    try {
      return super.setDovizTutari(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjekodu(String? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setProjekodu');
    try {
      return super.setProjekodu(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(PlasiyerList? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaKodu(String? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setKasaKodu');
    try {
      return super.setKasaKodu(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(int? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setDovizTipi');
    try {
      return super.setDovizTipi(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapKodu(String? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setHesapKodu');
    try {
      return super.setHesapKodu(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHedefAciklama(String? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setHedefAciklama');
    try {
      return super.setHedefAciklama(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMuhaRefList(List<MuhasebeReferansModel>? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setMuhaRefList');
    try {
      return super.setMuhaRefList(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReferansKodu(String? value) {
    final _$actionInfo = _$_NakitTahsilatViewModelBaseActionController
        .startAction(name: '_NakitTahsilatViewModelBase.setReferansKodu');
    try {
      return super.setReferansKodu(value);
    } finally {
      _$_NakitTahsilatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
dovizKurlariListesi: ${dovizKurlariListesi},
muhaRefList: ${muhaRefList},
getStokYeniKayitModel: ${getStokYeniKayitModel}
    ''';
  }
}
