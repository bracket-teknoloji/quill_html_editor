// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_edit_genel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimSonuKaydiEditGenelViewModel on _UretimSonuKaydiEditViewModelBase, Store {
  late final _$stokModelAtom = Atom(
    name: '_UretimSonuKaydiEditViewModelBase.stokModel',
    context: context,
  );

  @override
  StokListesiModel? get stokModel {
    _$stokModelAtom.reportRead();
    return super.stokModel;
  }

  @override
  set stokModel(StokListesiModel? value) {
    _$stokModelAtom.reportWrite(value, super.stokModel, () {
      super.stokModel = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_UretimSonuKaydiEditViewModelBase.requestModel',
    context: context,
  );

  @override
  UretimSonuKaydiEditModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(UretimSonuKaydiEditModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$ekAlanlarListAtom = Atom(
    name: '_UretimSonuKaydiEditViewModelBase.ekAlanlarList',
    context: context,
  );

  @override
  ObservableList<EkAlanlarModel>? get ekAlanlarList {
    _$ekAlanlarListAtom.reportRead();
    return super.ekAlanlarList;
  }

  @override
  set ekAlanlarList(ObservableList<EkAlanlarModel>? value) {
    _$ekAlanlarListAtom.reportWrite(value, super.ekAlanlarList, () {
      super.ekAlanlarList = value;
    });
  }

  late final _$kalemAtom = Atom(
    name: '_UretimSonuKaydiEditViewModelBase.kalem',
    context: context,
  );

  @override
  KalemModel? get kalem {
    _$kalemAtom.reportRead();
    return super.kalem;
  }

  @override
  set kalem(KalemModel? value) {
    _$kalemAtom.reportWrite(value, super.kalem, () {
      super.kalem = value;
    });
  }

  late final _$getSiradakiKodAsyncAction = AsyncAction(
    '_UretimSonuKaydiEditViewModelBase.getSiradakiKod',
    context: context,
  );

  @override
  Future<String?> getSiradakiKod(String? kod) {
    return _$getSiradakiKodAsyncAction.run(() => super.getSiradakiKod(kod));
  }

  late final _$_UretimSonuKaydiEditViewModelBaseActionController = ActionController(
    name: '_UretimSonuKaydiEditViewModelBase',
    context: context,
  );

  @override
  void setOnSave(void Function(UretimSonuKaydiEditModel) onSave) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setOnSave',
    );
    try {
      return super.setOnSave(onSave);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBelgeNo(String? belgeNo) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setBelgeNo',
    );
    try {
      return super.setBelgeNo(belgeNo);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setTarih(DateTime? date) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setTarih',
    );
    try {
      return super.setTarih(date);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setCikisDepo(DepoList? depo) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setCikisDepo',
    );
    try {
      return super.setCikisDepo(depo);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setGirisDepo(DepoList? depo) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setGirisDepo',
    );
    try {
      return super.setGirisDepo(depo);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setRequestModel(UretimSonuKaydiEditModel model) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setRequestModel',
    );
    try {
      return super.setRequestModel(model);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setMiktar(double? miktar) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setMiktar',
    );
    try {
      return super.setMiktar(miktar);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setKalemFireList(List<KalemFireModel>? list) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setKalemFireList',
    );
    try {
      return super.setKalemFireList(list);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setHurdaMiktari(double? miktar) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setHurdaMiktari',
    );
    try {
      return super.setHurdaMiktari(miktar);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setMaliyetFiyati(double? maliyet) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setMaliyetFiyati',
    );
    try {
      return super.setMaliyetFiyati(maliyet);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setAciklama(String? aciklama) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(aciklama);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setEkAlan1(String? aciklama) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setEkAlan1',
    );
    try {
      return super.setEkAlan1(aciklama);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSeriList(List<SeriList>? seri) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setSeriList',
    );
    try {
      return super.setSeriList(seri);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setEkAlan2(String? aciklama) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setEkAlan2',
    );
    try {
      return super.setEkAlan2(aciklama);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setEkAlanlar(int index, String? value) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setEkAlanlar',
    );
    try {
      return super.setEkAlanlar(index, value);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setStokModel(StokListesiModel? stok) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setStokModel',
    );
    try {
      return super.setStokModel(stok);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setOlcuBirimi(({String? adi, int? kodu})? olcuBirimi) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setOlcuBirimi',
    );
    try {
      return super.setOlcuBirimi(olcuBirimi);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setProje(BaseProjeModel? proje) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setProje',
    );
    try {
      return super.setProje(proje);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setDepoOnceligi(({String name, String value})? depoOnceligi) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setDepoOnceligi',
    );
    try {
      return super.setDepoOnceligi(depoOnceligi);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setMamulKodu(StokListesiModel? stok) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setMamulKodu',
    );
    try {
      return super.setMamulKodu(stok);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setModel(KalemModel? item) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setModel',
    );
    try {
      return super.setModel(item);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setEkAlanlarList(List<EkAlanlarModel>? list) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
      name: '_UretimSonuKaydiEditViewModelBase.setEkAlanlarList',
    );
    try {
      return super.setEkAlanlarList(list);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
stokModel: ${stokModel},
requestModel: ${requestModel},
ekAlanlarList: ${ekAlanlarList},
kalem: ${kalem}
    ''';
  }
}
