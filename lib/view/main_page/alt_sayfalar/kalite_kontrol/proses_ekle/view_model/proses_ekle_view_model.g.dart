// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proses_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProsesEkleViewModel on _ProsesEkleViewModelBase, Store {
  Computed<double>? _$ortalamaDegerComputed;

  @override
  double get ortalamaDeger => (_$ortalamaDegerComputed ??= Computed<double>(
    () => super.ortalamaDeger,
    name: '_ProsesEkleViewModelBase.ortalamaDeger',
  )).value;
  Computed<double>? _$enKucukDegerComputed;

  @override
  double get enKucukDeger => (_$enKucukDegerComputed ??= Computed<double>(
    () => super.enKucukDeger,
    name: '_ProsesEkleViewModelBase.enKucukDeger',
  )).value;
  Computed<double>? _$enBuyukDegerComputed;

  @override
  double get enBuyukDeger => (_$enBuyukDegerComputed ??= Computed<double>(
    () => super.enBuyukDeger,
    name: '_ProsesEkleViewModelBase.enBuyukDeger',
  )).value;
  Computed<ObservableList<OlcumEkleDetayModel>?>? _$olcumlerComputed;

  @override
  ObservableList<OlcumEkleDetayModel>? get olcumler =>
      (_$olcumlerComputed ??= Computed<ObservableList<OlcumEkleDetayModel>?>(
        () => super.olcumler,
        name: '_ProsesEkleViewModelBase.olcumler',
      )).value;
  Computed<bool>? _$sartliKabulMuComputed;

  @override
  bool get sartliKabulMu => (_$sartliKabulMuComputed ??= Computed<bool>(
    () => super.sartliKabulMu,
    name: '_ProsesEkleViewModelBase.sartliKabulMu',
  )).value;

  late final _$sonucTuruValueListAtom = Atom(name: '_ProsesEkleViewModelBase.sonucTuruValueList', context: context);

  @override
  ObservableList<String> get sonucTuruValueList {
    _$sonucTuruValueListAtom.reportRead();
    return super.sonucTuruValueList;
  }

  @override
  set sonucTuruValueList(ObservableList<String> value) {
    _$sonucTuruValueListAtom.reportWrite(value, super.sonucTuruValueList, () {
      super.sonucTuruValueList = value;
    });
  }

  late final _$sonucTuruGroupValueAtom = Atom(name: '_ProsesEkleViewModelBase.sonucTuruGroupValue', context: context);

  @override
  String get sonucTuruGroupValue {
    _$sonucTuruGroupValueAtom.reportRead();
    return super.sonucTuruGroupValue;
  }

  @override
  set sonucTuruGroupValue(String value) {
    _$sonucTuruGroupValueAtom.reportWrite(value, super.sonucTuruGroupValue, () {
      super.sonucTuruGroupValue = value;
    });
  }

  late final _$ekleModelAtom = Atom(name: '_ProsesEkleViewModelBase.ekleModel', context: context);

  @override
  OlcumProsesModel get ekleModel {
    _$ekleModelAtom.reportRead();
    return super.ekleModel;
  }

  @override
  set ekleModel(OlcumProsesModel value) {
    _$ekleModelAtom.reportWrite(value, super.ekleModel, () {
      super.ekleModel = value;
    });
  }

  late final _$_ProsesEkleViewModelBaseActionController = ActionController(
    name: '_ProsesEkleViewModelBase',
    context: context,
  );

  @override
  void setEkleModel(OlcumProsesModel model) {
    final _$actionInfo = _$_ProsesEkleViewModelBaseActionController.startAction(
      name: '_ProsesEkleViewModelBase.setEkleModel',
    );
    try {
      return super.setEkleModel(model);
    } finally {
      _$_ProsesEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSonucTuruGroupValue(int index) {
    final _$actionInfo = _$_ProsesEkleViewModelBaseActionController.startAction(
      name: '_ProsesEkleViewModelBase.setSonucTuruGroupValue',
    );
    try {
      return super.setSonucTuruGroupValue(index);
    } finally {
      _$_ProsesEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_ProsesEkleViewModelBaseActionController.startAction(
      name: '_ProsesEkleViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(value);
    } finally {
      _$_ProsesEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOperator(String? value) {
    final _$actionInfo = _$_ProsesEkleViewModelBaseActionController.startAction(
      name: '_ProsesEkleViewModelBase.setOperator',
    );
    try {
      return super.setOperator(value);
    } finally {
      _$_ProsesEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSartliKabul(String? value) {
    final _$actionInfo = _$_ProsesEkleViewModelBaseActionController.startAction(
      name: '_ProsesEkleViewModelBase.setSartliKabul',
    );
    try {
      return super.setSartliKabul(value);
    } finally {
      _$_ProsesEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProsesDetayListesi(int index) {
    final _$actionInfo = _$_ProsesEkleViewModelBaseActionController.startAction(
      name: '_ProsesEkleViewModelBase.setProsesDetayListesi',
    );
    try {
      return super.setProsesDetayListesi(index);
    } finally {
      _$_ProsesEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexedItem(int index, OlcumEkleDetayModel item) {
    final _$actionInfo = _$_ProsesEkleViewModelBaseActionController.startAction(
      name: '_ProsesEkleViewModelBase.setIndexedItem',
    );
    try {
      return super.setIndexedItem(index, item);
    } finally {
      _$_ProsesEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sonucTuruValueList: ${sonucTuruValueList},
sonucTuruGroupValue: ${sonucTuruGroupValue},
ekleModel: ${ekleModel},
ortalamaDeger: ${ortalamaDeger},
enKucukDeger: ${enKucukDeger},
enBuyukDeger: ${enBuyukDeger},
olcumler: ${olcumler},
sartliKabulMu: ${sartliKabulMu}
    ''';
  }
}
