// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_tahsilat_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CekSenetTahsilatEkleViewModel
    on _CekSenetTahsilatEkleViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_CekSenetTahsilatEkleViewModelBase.model', context: context);

  @override
  CekSenetKalemlerModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CekSenetKalemlerModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$dovizKurlariListesiAtom = Atom(
      name: '_CekSenetTahsilatEkleViewModelBase.dovizKurlariListesi',
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

  late final _$bankModelAtom = Atom(
      name: '_CekSenetTahsilatEkleViewModelBase.bankModel', context: context);

  @override
  BankaListesiModel? get bankModel {
    _$bankModelAtom.reportRead();
    return super.bankModel;
  }

  @override
  set bankModel(BankaListesiModel? value) {
    _$bankModelAtom.reportWrite(value, super.bankModel, () {
      super.bankModel = value;
    });
  }

  late final _$muhaRefListAtom = Atom(
      name: '_CekSenetTahsilatEkleViewModelBase.muhaRefList', context: context);

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

  late final _$getMuhaRefListAsyncAction = AsyncAction(
      '_CekSenetTahsilatEkleViewModelBase.getMuhaRefList',
      context: context);

  @override
  Future<void> getMuhaRefList() {
    return _$getMuhaRefListAsyncAction.run(() => super.getMuhaRefList());
  }

  late final _$getDovizlerAsyncAction = AsyncAction(
      '_CekSenetTahsilatEkleViewModelBase.getDovizler',
      context: context);

  @override
  Future<void> getDovizler() {
    return _$getDovizlerAsyncAction.run(() => super.getDovizler());
  }

  late final _$_CekSenetTahsilatEkleViewModelBaseActionController =
      ActionController(
          name: '_CekSenetTahsilatEkleViewModelBase', context: context);

  @override
  void setModel(CekSenetKalemlerModel value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBankModel(BankaListesiModel? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setBankModel');
    try {
      return super.setBankModel(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBankaHesapKodu(String? value) {
    final _$actionInfo =
        _$_CekSenetTahsilatEkleViewModelBaseActionController.startAction(
            name: '_CekSenetTahsilatEkleViewModelBase.setBankaHesapKodu');
    try {
      return super.setBankaHesapKodu(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAsilCari(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setAsilCari');
    try {
      return super.setAsilCari(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDuzenlendigiYer(String? value) {
    final _$actionInfo =
        _$_CekSenetTahsilatEkleViewModelBaseActionController.startAction(
            name: '_CekSenetTahsilatEkleViewModelBase.setDuzenlendigiYer');
    try {
      return super.setDuzenlendigiYer(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCiroTipi(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setCiroTipi');
    try {
      return super.setCiroTipi(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setVadeTarihi(DateTime? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setVadeTarihi');
    try {
      return super.setVadeTarihi(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(int? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setDovizTipi');
    try {
      return super.setDovizTipi(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizAdi(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setDovizAdi');
    try {
      return super.setDovizAdi(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTutari(double? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setDovizTutari');
    try {
      return super.setDovizTutari(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setTutar');
    try {
      return super.setTutar(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSeriNo(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setSeriNo');
    try {
      return super.setSeriNo(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBanka(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setBanka');
    try {
      return super.setBanka(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSube(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setSube');
    try {
      return super.setSube(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setHesapNo(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setHesapNo');
    try {
      return super.setHesapNo(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setIBAN(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setIBAN');
    try {
      return super.setIBAN(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setIl(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setIl');
    try {
      return super.setIl(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setIlce(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setIlce');
    try {
      return super.setIlce(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setRaporKodu(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setRaporKodu');
    try {
      return super.setRaporKodu(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCariRaporKodu(String? value) {
    final _$actionInfo =
        _$_CekSenetTahsilatEkleViewModelBaseActionController.startAction(
            name: '_CekSenetTahsilatEkleViewModelBase.setCariRaporKodu');
    try {
      return super.setCariRaporKodu(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    final _$actionInfo =
        _$_CekSenetTahsilatEkleViewModelBaseActionController.startAction(
            name: '_CekSenetTahsilatEkleViewModelBase.setDovizKurlariListesi');
    try {
      return super.setDovizKurlariListesi(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama1(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setAciklama1');
    try {
      return super.setAciklama1(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama2(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setAciklama2');
    try {
      return super.setAciklama2(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama3(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setAciklama3');
    try {
      return super.setAciklama3(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setReferans(MuhasebeReferansModel? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setReferans');
    try {
      return super.setReferans(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPhotoFront(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setPhotoFront');
    try {
      return super.setPhotoFront(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPhotoBack(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setPhotoBack');
    try {
      return super.setPhotoBack(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setMuhaRefList(List<MuhasebeReferansModel>? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setMuhaRefList');
    try {
      return super.setMuhaRefList(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
dovizKurlariListesi: ${dovizKurlariListesi},
bankModel: ${bankModel},
muhaRefList: ${muhaRefList}
    ''';
  }
}
