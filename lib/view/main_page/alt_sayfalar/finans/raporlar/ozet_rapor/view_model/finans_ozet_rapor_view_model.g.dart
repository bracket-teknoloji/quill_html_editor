// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finans_ozet_rapor_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FinansOzetRaporViewModel on _FinansOzetRaporViewModelBase, Store {
  Computed<double?>? _$toplamSatisFaturasiComputed;

  @override
  double? get toplamSatisFaturasi => (_$toplamSatisFaturasiComputed ??=
          Computed<double?>(() => super.toplamSatisFaturasi,
              name: '_FinansOzetRaporViewModelBase.toplamSatisFaturasi'))
      .value;
  Computed<double?>? _$toplamAlisFaturasiComputed;

  @override
  double? get toplamAlisFaturasi => (_$toplamAlisFaturasiComputed ??=
          Computed<double?>(() => super.toplamAlisFaturasi,
              name: '_FinansOzetRaporViewModelBase.toplamAlisFaturasi'))
      .value;

  late final _$requestModelAtom = Atom(
      name: '_FinansOzetRaporViewModelBase.requestModel', context: context);

  @override
  FinansOzetRaporRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(FinansOzetRaporRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$gunSonuRaporuListAtom = Atom(
      name: '_FinansOzetRaporViewModelBase.gunSonuRaporuList',
      context: context);

  @override
  ObservableList<FinansOzetRaporModel>? get gunSonuRaporuList {
    _$gunSonuRaporuListAtom.reportRead();
    return super.gunSonuRaporuList;
  }

  @override
  set gunSonuRaporuList(ObservableList<FinansOzetRaporModel>? value) {
    _$gunSonuRaporuListAtom.reportWrite(value, super.gunSonuRaporuList, () {
      super.gunSonuRaporuList = value;
    });
  }

  late final _$aylikTutarlarListAtom = Atom(
      name: '_FinansOzetRaporViewModelBase.aylikTutarlarList',
      context: context);

  @override
  ObservableList<FinansOzetRaporModel>? get aylikTutarlarList {
    _$aylikTutarlarListAtom.reportRead();
    return super.aylikTutarlarList;
  }

  @override
  set aylikTutarlarList(ObservableList<FinansOzetRaporModel>? value) {
    _$aylikTutarlarListAtom.reportWrite(value, super.aylikTutarlarList, () {
      super.aylikTutarlarList = value;
    });
  }

  late final _$getGunSonuRaporuAsyncAction = AsyncAction(
      '_FinansOzetRaporViewModelBase.getGunSonuRaporu',
      context: context);

  @override
  Future<void> getGunSonuRaporu() {
    return _$getGunSonuRaporuAsyncAction.run(() => super.getGunSonuRaporu());
  }

  late final _$_FinansOzetRaporViewModelBaseActionController =
      ActionController(name: '_FinansOzetRaporViewModelBase', context: context);

  @override
  void setBaslangicTarihi(String? value) {
    final _$actionInfo = _$_FinansOzetRaporViewModelBaseActionController
        .startAction(name: '_FinansOzetRaporViewModelBase.setBaslangicTarihi');
    try {
      return super.setBaslangicTarihi(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_FinansOzetRaporViewModelBaseActionController
        .startAction(name: '_FinansOzetRaporViewModelBase.setBitisTarihi');
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(String? value) {
    final _$actionInfo = _$_FinansOzetRaporViewModelBaseActionController
        .startAction(name: '_FinansOzetRaporViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_FinansOzetRaporViewModelBaseActionController
        .startAction(name: '_FinansOzetRaporViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKoduIleBaslar(String? value) {
    final _$actionInfo =
        _$_FinansOzetRaporViewModelBaseActionController.startAction(
            name: '_FinansOzetRaporViewModelBase.setCariKoduIleBaslar');
    try {
      return super.setCariKoduIleBaslar(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKdvDahil(bool? value) {
    final _$actionInfo = _$_FinansOzetRaporViewModelBaseActionController
        .startAction(name: '_FinansOzetRaporViewModelBase.setKdvDahil');
    try {
      return super.setKdvDahil(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIadeDurumu(String? value) {
    final _$actionInfo = _$_FinansOzetRaporViewModelBaseActionController
        .startAction(name: '_FinansOzetRaporViewModelBase.setIadeDurumu');
    try {
      return super.setIadeDurumu(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarihTipi(String? value) {
    final _$actionInfo = _$_FinansOzetRaporViewModelBaseActionController
        .startAction(name: '_FinansOzetRaporViewModelBase.setTarihTipi');
    try {
      return super.setTarihTipi(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGunSonuRaporuList(List<FinansOzetRaporModel>? value) {
    final _$actionInfo =
        _$_FinansOzetRaporViewModelBaseActionController.startAction(
            name: '_FinansOzetRaporViewModelBase.setGunSonuRaporuList');
    try {
      return super.setGunSonuRaporuList(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAylikTutarlarList(List<FinansOzetRaporModel>? value) {
    final _$actionInfo =
        _$_FinansOzetRaporViewModelBaseActionController.startAction(
            name: '_FinansOzetRaporViewModelBase.setAylikTutarlarList');
    try {
      return super.setAylikTutarlarList(value);
    } finally {
      _$_FinansOzetRaporViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
gunSonuRaporuList: ${gunSonuRaporuList},
aylikTutarlarList: ${aylikTutarlarList},
toplamSatisFaturasi: ${toplamSatisFaturasi},
toplamAlisFaturasi: ${toplamAlisFaturasi}
    ''';
  }
}
