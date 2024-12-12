// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siparis_durum_raporu_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SiparisDurumRaporuViewModel on _SiparisDurumRaporuViewModelBase, Store {
  Computed<String>? _$pickerBelgeTuruComputed;

  @override
  String get pickerBelgeTuru => (_$pickerBelgeTuruComputed ??= Computed<String>(
          () => super.pickerBelgeTuru,
          name: '_SiparisDurumRaporuViewModelBase.pickerBelgeTuru'))
      .value;
  Computed<ObservableList<KalemModel?>?>? _$kalemListComputedComputed;

  @override
  ObservableList<KalemModel?>? get kalemListComputed =>
      (_$kalemListComputedComputed ??= Computed<ObservableList<KalemModel?>?>(
              () => super.kalemListComputed,
              name: '_SiparisDurumRaporuViewModelBase.kalemListComputed'))
          .value;

  late final _$searchBarAtom = Atom(
      name: '_SiparisDurumRaporuViewModelBase.searchBar', context: context);

  @override
  bool get searchBar {
    _$searchBarAtom.reportRead();
    return super.searchBar;
  }

  @override
  set searchBar(bool value) {
    _$searchBarAtom.reportWrite(value, super.searchBar, () {
      super.searchBar = value;
    });
  }

  late final _$searchKeyAtom = Atom(
      name: '_SiparisDurumRaporuViewModelBase.searchKey', context: context);

  @override
  String? get searchKey {
    _$searchKeyAtom.reportRead();
    return super.searchKey;
  }

  @override
  set searchKey(String? value) {
    _$searchKeyAtom.reportWrite(value, super.searchKey, () {
      super.searchKey = value;
    });
  }

  late final _$dahaVarMiAtom = Atom(
      name: '_SiparisDurumRaporuViewModelBase.dahaVarMi', context: context);

  @override
  bool get dahaVarMi {
    _$dahaVarMiAtom.reportRead();
    return super.dahaVarMi;
  }

  @override
  set dahaVarMi(bool value) {
    _$dahaVarMiAtom.reportWrite(value, super.dahaVarMi, () {
      super.dahaVarMi = value;
    });
  }

  late final _$karsilanmaGroupValueAtom = Atom(
      name: '_SiparisDurumRaporuViewModelBase.karsilanmaGroupValue',
      context: context);

  @override
  int get karsilanmaGroupValue {
    _$karsilanmaGroupValueAtom.reportRead();
    return super.karsilanmaGroupValue;
  }

  @override
  set karsilanmaGroupValue(int value) {
    _$karsilanmaGroupValueAtom.reportWrite(value, super.karsilanmaGroupValue,
        () {
      super.karsilanmaGroupValue = value;
    });
  }

  late final _$durumGroupValueAtom = Atom(
      name: '_SiparisDurumRaporuViewModelBase.durumGroupValue',
      context: context);

  @override
  int get durumGroupValue {
    _$durumGroupValueAtom.reportRead();
    return super.durumGroupValue;
  }

  @override
  set durumGroupValue(int value) {
    _$durumGroupValueAtom.reportWrite(value, super.durumGroupValue, () {
      super.durumGroupValue = value;
    });
  }

  late final _$siparislerRequestModelAtom = Atom(
      name: '_SiparisDurumRaporuViewModelBase.siparislerRequestModel',
      context: context);

  @override
  SiparislerRequestModel get siparislerRequestModel {
    _$siparislerRequestModelAtom.reportRead();
    return super.siparislerRequestModel;
  }

  @override
  set siparislerRequestModel(SiparislerRequestModel value) {
    _$siparislerRequestModelAtom
        .reportWrite(value, super.siparislerRequestModel, () {
      super.siparislerRequestModel = value;
    });
  }

  late final _$kalemListAtom = Atom(
      name: '_SiparisDurumRaporuViewModelBase.kalemList', context: context);

  @override
  ObservableList<KalemModel?>? get kalemList {
    _$kalemListAtom.reportRead();
    return super.kalemList;
  }

  @override
  set kalemList(ObservableList<KalemModel?>? value) {
    _$kalemListAtom.reportWrite(value, super.kalemList, () {
      super.kalemList = value;
    });
  }

  late final _$_SiparisDurumRaporuViewModelBaseActionController =
      ActionController(
          name: '_SiparisDurumRaporuViewModelBase', context: context);

  @override
  void setSearchBar() {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setSearchBar');
    try {
      return super.setSearchBar();
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSearchKey(String? value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setSearchKey');
    try {
      return super.setSearchKey(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDahaVarMi(bool value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setDahaVarMi');
    try {
      return super.setDahaVarMi(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setKarsilanmaGroupValue(int value) {
    final _$actionInfo =
        _$_SiparisDurumRaporuViewModelBaseActionController.startAction(
            name: '_SiparisDurumRaporuViewModelBase.setKarsilanmaGroupValue');
    try {
      return super.setKarsilanmaGroupValue(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDurumGroupValue(int value) {
    final _$actionInfo =
        _$_SiparisDurumRaporuViewModelBaseActionController.startAction(
            name: '_SiparisDurumRaporuViewModelBase.setDurumGroupValue');
    try {
      return super.setDurumGroupValue(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setKalemList(List<KalemModel?>? value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setKalemList');
    try {
      return super.setKalemList(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addKalemList(List<KalemModel?>? value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.addKalemList');
    try {
      return super.addKalemList(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String? value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setStokKodu(String? value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setStokKodu');
    try {
      return super.setStokKodu(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTeslimCariKodu(String? value) {
    final _$actionInfo =
        _$_SiparisDurumRaporuViewModelBaseActionController.startAction(
            name: '_SiparisDurumRaporuViewModelBase.setTeslimCariKodu');
    try {
      return super.setTeslimCariKodu(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBaslamaTarihi(String? value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setBaslamaTarihi');
    try {
      return super.setBaslamaTarihi(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(String? value) {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.setBitisTarihi');
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void increaseSayfa() {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.increaseSayfa');
    try {
      return super.increaseSayfa();
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void resetSayfa() {
    final _$actionInfo = _$_SiparisDurumRaporuViewModelBaseActionController
        .startAction(name: '_SiparisDurumRaporuViewModelBase.resetSayfa');
    try {
      return super.resetSayfa();
    } finally {
      _$_SiparisDurumRaporuViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
searchKey: ${searchKey},
dahaVarMi: ${dahaVarMi},
karsilanmaGroupValue: ${karsilanmaGroupValue},
durumGroupValue: ${durumGroupValue},
siparislerRequestModel: ${siparislerRequestModel},
kalemList: ${kalemList},
pickerBelgeTuru: ${pickerBelgeTuru},
kalemListComputed: ${kalemListComputed}
    ''';
  }
}
