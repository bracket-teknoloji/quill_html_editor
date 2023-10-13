// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muhtelif_odeme_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MuhtelifOdemeViewModel on _MuhtelifOdemeViewModelBase, Store {
  Computed<String?>? _$getCariBakiyeComputed;

  @override
  String? get getCariBakiye =>
      (_$getCariBakiyeComputed ??= Computed<String?>(() => super.getCariBakiye,
              name: '_MuhtelifOdemeViewModelBase.getCariBakiye'))
          .value;

  late final _$cariBakiyeAtom =
      Atom(name: '_MuhtelifOdemeViewModelBase.cariBakiye', context: context);

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

  late final _$appBarSubTitleAtom = Atom(
      name: '_MuhtelifOdemeViewModelBase.appBarSubTitle', context: context);

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

  late final _$seriListAtom =
      Atom(name: '_MuhtelifOdemeViewModelBase.seriList', context: context);

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

  late final _$bankaSozlesmesiListAtom = Atom(
      name: '_MuhtelifOdemeViewModelBase.bankaSozlesmesiList',
      context: context);

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
      name: '_MuhtelifOdemeViewModelBase.bankaHesaplariList', context: context);

  @override
  ObservableList<BankaHesaplariModel>? get bankaHesaplariList {
    _$bankaHesaplariListAtom.reportRead();
    return super.bankaHesaplariList;
  }

  @override
  set bankaHesaplariList(ObservableList<BankaHesaplariModel>? value) {
    _$bankaHesaplariListAtom.reportWrite(value, super.bankaHesaplariList, () {
      super.bankaHesaplariList = value;
    });
  }

  late final _$muhaRefListAtom =
      Atom(name: '_MuhtelifOdemeViewModelBase.muhaRefList', context: context);

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

  late final _$modelAtom =
      Atom(name: '_MuhtelifOdemeViewModelBase.model', context: context);

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

  late final _$showReferansKoduAtom = Atom(
      name: '_MuhtelifOdemeViewModelBase.showReferansKodu', context: context);

  @override
  String? get showReferansKodu {
    _$showReferansKoduAtom.reportRead();
    return super.showReferansKodu;
  }

  @override
  set showReferansKodu(String? value) {
    _$showReferansKoduAtom.reportWrite(value, super.showReferansKodu, () {
      super.showReferansKodu = value;
    });
  }

  late final _$getMuhaRefListAsyncAction = AsyncAction(
      '_MuhtelifOdemeViewModelBase.getMuhaRefList',
      context: context);

  @override
  Future<void> getMuhaRefList() {
    return _$getMuhaRefListAsyncAction.run(() => super.getMuhaRefList());
  }

  late final _$getSiradakiKodAsyncAction = AsyncAction(
      '_MuhtelifOdemeViewModelBase.getSiradakiKod',
      context: context);

  @override
  Future<void> getSiradakiKod() {
    return _$getSiradakiKodAsyncAction.run(() => super.getSiradakiKod());
  }

  late final _$postDataAsyncAction =
      AsyncAction('_MuhtelifOdemeViewModelBase.postData', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> postData() {
    return _$postDataAsyncAction.run(() => super.postData());
  }

  late final _$_MuhtelifOdemeViewModelBaseActionController =
      ActionController(name: '_MuhtelifOdemeViewModelBase', context: context);

  @override
  void setShowReferansKodu(String? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setShowReferansKodu');
    try {
      return super.setShowReferansKodu(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariBakiye(double? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setCariBakiye');
    try {
      return super.setCariBakiye(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAppBarSubTitle(String? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setAppBarSubTitle');
    try {
      return super.setAppBarSubTitle(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setTarih');
    try {
      return super.setTarih(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setAciklama');
    try {
      return super.setAciklama(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKasaKodu(String? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setKasaKodu');
    try {
      return super.setKasaKodu(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapKodu(String? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setHesapKodu');
    try {
      return super.setHesapKodu(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setTutar');
    try {
      return super.setTutar(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTahsilatMi(bool? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setTahsilatMi');
    try {
      return super.setTahsilatMi(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(PlasiyerList? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapTipi(String? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setHesapTipi');
    try {
      return super.setHesapTipi(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReferansKodu(String? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setReferansKodu');
    try {
      return super.setReferansKodu(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMuhaRefList(List<MuhasebeReferansModel>? value) {
    final _$actionInfo = _$_MuhtelifOdemeViewModelBaseActionController
        .startAction(name: '_MuhtelifOdemeViewModelBase.setMuhaRefList');
    try {
      return super.setMuhaRefList(value);
    } finally {
      _$_MuhtelifOdemeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cariBakiye: ${cariBakiye},
appBarSubTitle: ${appBarSubTitle},
seriList: ${seriList},
bankaSozlesmesiList: ${bankaSozlesmesiList},
bankaHesaplariList: ${bankaHesaplariList},
muhaRefList: ${muhaRefList},
model: ${model},
showReferansKodu: ${showReferansKodu},
getCariBakiye: ${getCariBakiye}
    ''';
  }
}
