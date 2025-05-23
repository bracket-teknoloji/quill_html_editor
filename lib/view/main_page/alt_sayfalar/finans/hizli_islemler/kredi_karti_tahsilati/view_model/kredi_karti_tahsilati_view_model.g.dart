// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kredi_karti_tahsilati_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KrediKartiTahsilatiViewModel on _KrediKartiTahsilatiViewModelBase, Store {
  Computed<String?>? _$getCariBakiyeComputed;

  @override
  String? get getCariBakiye => (_$getCariBakiyeComputed ??= Computed<String?>(
    () => super.getCariBakiye,
    name: '_KrediKartiTahsilatiViewModelBase.getCariBakiye',
  )).value;

  late final _$cariBakiyeAtom = Atom(name: '_KrediKartiTahsilatiViewModelBase.cariBakiye', context: context);

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

  late final _$appBarSubTitleAtom = Atom(name: '_KrediKartiTahsilatiViewModelBase.appBarSubTitle', context: context);

  @override
  String? get appBarSubTitle {
    _$appBarSubTitleAtom.reportRead();
    return super.appBarSubTitle;
  }

  @override
  set appBarSubTitle(String? value) {
    _$appBarSubTitleAtom.reportWrite(value, super.appBarSubTitle, () {
      super.appBarSubTitle = value;
    });
  }

  late final _$seriListAtom = Atom(name: '_KrediKartiTahsilatiViewModelBase.seriList', context: context);

  @override
  ObservableList<SeriModel>? get seriList {
    _$seriListAtom.reportRead();
    return super.seriList;
  }

  @override
  set seriList(ObservableList<SeriModel>? value) {
    _$seriListAtom.reportWrite(value, super.seriList, () {
      super.seriList = value;
    });
  }

  late final _$cariModelAtom = Atom(name: '_KrediKartiTahsilatiViewModelBase.cariModel', context: context);

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

  late final _$bankModelAtom = Atom(name: '_KrediKartiTahsilatiViewModelBase.bankModel', context: context);

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

  late final _$sozlesmeModelAtom = Atom(name: '_KrediKartiTahsilatiViewModelBase.sozlesmeModel', context: context);

  @override
  BankaSozlesmesiModel? get sozlesmeModel {
    _$sozlesmeModelAtom.reportRead();
    return super.sozlesmeModel;
  }

  @override
  set sozlesmeModel(BankaSozlesmesiModel? value) {
    _$sozlesmeModelAtom.reportWrite(value, super.sozlesmeModel, () {
      super.sozlesmeModel = value;
    });
  }

  late final _$bankaSozlesmesiListAtom = Atom(
    name: '_KrediKartiTahsilatiViewModelBase.bankaSozlesmesiList',
    context: context,
  );

  @override
  ObservableList<BankaSozlesmesiModel>? get bankaSozlesmesiList {
    _$bankaSozlesmesiListAtom.reportRead();
    return super.bankaSozlesmesiList;
  }

  @override
  set bankaSozlesmesiList(ObservableList<BankaSozlesmesiModel>? value) {
    _$bankaSozlesmesiListAtom.reportWrite(value, super.bankaSozlesmesiList, () {
      super.bankaSozlesmesiList = value;
    });
  }

  late final _$bankaHesaplariListAtom = Atom(
    name: '_KrediKartiTahsilatiViewModelBase.bankaHesaplariList',
    context: context,
  );

  @override
  ObservableList<BankaListesiModel>? get bankaHesaplariList {
    _$bankaHesaplariListAtom.reportRead();
    return super.bankaHesaplariList;
  }

  @override
  set bankaHesaplariList(ObservableList<BankaListesiModel>? value) {
    _$bankaHesaplariListAtom.reportWrite(value, super.bankaHesaplariList, () {
      super.bankaHesaplariList = value;
    });
  }

  late final _$muhaRefListAtom = Atom(name: '_KrediKartiTahsilatiViewModelBase.muhaRefList', context: context);

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

  late final _$showReferansKoduAtom = Atom(
    name: '_KrediKartiTahsilatiViewModelBase.showReferansKodu',
    context: context,
  );

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

  late final _$modelAtom = Atom(name: '_KrediKartiTahsilatiViewModelBase.model', context: context);

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

  late final _$getSiradakiKodAsyncAction = AsyncAction(
    '_KrediKartiTahsilatiViewModelBase.getSiradakiKod',
    context: context,
  );

  @override
  Future<void> getSiradakiKod() {
    return _$getSiradakiKodAsyncAction.run(() => super.getSiradakiKod());
  }

  late final _$getBankaSozlesmesiAsyncAction = AsyncAction(
    '_KrediKartiTahsilatiViewModelBase.getBankaSozlesmesi',
    context: context,
  );

  @override
  Future<void> getBankaSozlesmesi() {
    return _$getBankaSozlesmesiAsyncAction.run(() => super.getBankaSozlesmesi());
  }

  late final _$getMuhaRefListAsyncAction = AsyncAction(
    '_KrediKartiTahsilatiViewModelBase.getMuhaRefList',
    context: context,
  );

  @override
  Future<void> getMuhaRefList() {
    return _$getMuhaRefListAsyncAction.run(() => super.getMuhaRefList());
  }

  late final _$getSeriAsyncAction = AsyncAction('_KrediKartiTahsilatiViewModelBase.getSeri', context: context);

  @override
  Future<void> getSeri() {
    return _$getSeriAsyncAction.run(() => super.getSeri());
  }

  late final _$getBankaHesaplariAsyncAction = AsyncAction(
    '_KrediKartiTahsilatiViewModelBase.getBankaHesaplari',
    context: context,
  );

  @override
  Future<void> getBankaHesaplari() {
    return _$getBankaHesaplariAsyncAction.run(() => super.getBankaHesaplari());
  }

  late final _$getKasalarAsyncAction = AsyncAction('_KrediKartiTahsilatiViewModelBase.getKasalar', context: context);

  @override
  Future<KasaList?> getKasalar(String? kasaKodu) {
    return _$getKasalarAsyncAction.run(() => super.getKasalar(kasaKodu));
  }

  late final _$postDataAsyncAction = AsyncAction('_KrediKartiTahsilatiViewModelBase.postData', context: context);

  @override
  Future<GenericResponseModel<DovizKurlariModel>> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
  }

  late final _$_KrediKartiTahsilatiViewModelBaseActionController = ActionController(
    name: '_KrediKartiTahsilatiViewModelBase',
    context: context,
  );

  @override
  void setCariModel(CariListesiModel? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setCariModel',
    );
    try {
      return super.setCariModel(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankModel(BankaListesiModel? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setBankModel',
    );
    try {
      return super.setBankModel(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariBakiye(double? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setCariBakiye',
    );
    try {
      return super.setCariBakiye(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowReferansKodu(bool? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setShowReferansKodu',
    );
    try {
      return super.setShowReferansKodu(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAppBarSubTitle(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setAppBarSubTitle',
    );
    try {
      return super.setAppBarSubTitle(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setBelgeNo',
    );
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setTarih',
    );
    try {
      return super.setTarih(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaKodu(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setKasaKodu',
    );
    try {
      return super.setKasaKodu(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapKodu(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setHesapKodu',
    );
    try {
      return super.setHesapKodu(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHedefAciklama(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setHedefAciklama',
    );
    try {
      return super.setHedefAciklama(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPickerBelgeTuru(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setPickerBelgeTuru',
    );
    try {
      return super.setPickerBelgeTuru(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKrediKartiNo(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setKrediKartiNo',
    );
    try {
      return super.setKrediKartiNo(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setTutar',
    );
    try {
      return super.setTutar(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTaksitSayisi(int? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setTaksitSayisi',
    );
    try {
      return super.setTaksitSayisi(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseTaksitSayisi() {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.increaseTaksitSayisi',
    );
    try {
      return super.increaseTaksitSayisi();
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseTaksitSayisi() {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.decreaseTaksitSayisi',
    );
    try {
      return super.decreaseTaksitSayisi();
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeriList(List<SeriModel>? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setSeriList',
    );
    try {
      return super.setSeriList(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setCariKodu',
    );
    try {
      return super.setCariKodu(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeri(SeriModel? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setSeri',
    );
    try {
      return super.setSeri(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTutari(double? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setDovizTutari',
    );
    try {
      return super.setDovizTutari(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjekodu(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setProjekodu',
    );
    try {
      return super.setProjekodu(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankaSozlesmesiList(List<BankaSozlesmesiModel>? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setBankaSozlesmesiList',
    );
    try {
      return super.setBankaSozlesmesiList(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMuhaRefList(List<MuhasebeReferansModel>? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setMuhaRefList',
    );
    try {
      return super.setMuhaRefList(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankaHesaplariList(List<BankaListesiModel>? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setBankaHesaplariList',
    );
    try {
      return super.setBankaHesaplariList(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(PlasiyerList? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setPlasiyerKodu',
    );
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKktYontemi(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setKktYontemi',
    );
    try {
      return super.setKktYontemi(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapTipi(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setHesapTipi',
    );
    try {
      return super.setHesapTipi(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSozlesme(BankaSozlesmesiModel? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setSozlesme',
    );
    try {
      return super.setSozlesme(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReferansKodu(String? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setReferansKodu',
    );
    try {
      return super.setReferansKodu(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(int? value) {
    final _$actionInfo = _$_KrediKartiTahsilatiViewModelBaseActionController.startAction(
      name: '_KrediKartiTahsilatiViewModelBase.setDovizTipi',
    );
    try {
      return super.setDovizTipi(value);
    } finally {
      _$_KrediKartiTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cariBakiye: ${cariBakiye},
appBarSubTitle: ${appBarSubTitle},
seriList: ${seriList},
cariModel: ${cariModel},
bankModel: ${bankModel},
sozlesmeModel: ${sozlesmeModel},
bankaSozlesmesiList: ${bankaSozlesmesiList},
bankaHesaplariList: ${bankaHesaplariList},
muhaRefList: ${muhaRefList},
showReferansKodu: ${showReferansKodu},
model: ${model},
getCariBakiye: ${getCariBakiye}
    ''';
  }
}
