// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urun_grubuna_gore_satis_grafigi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UrunGrubunaGoreSatisGrafigiViewModel
    on _UrunGrubunaGoreSatisGrafigiViewModelBase, Store {
  Computed<String>? _$toplamMiktarComputed;

  @override
  String get toplamMiktar =>
      (_$toplamMiktarComputed ??= Computed<String>(() => super.toplamMiktar,
              name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.toplamMiktar'))
          .value;
  Computed<String>? _$toplamNetTutarComputed;

  @override
  String get toplamNetTutar =>
      (_$toplamNetTutarComputed ??= Computed<String>(() => super.toplamNetTutar,
              name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.toplamNetTutar'))
          .value;

  late final _$modelAtom = Atom(
      name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.model',
      context: context);

  @override
  UrunGrubunaGoreSatisGrafigiRequestModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(UrunGrubunaGoreSatisGrafigiRequestModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$projeListAtom = Atom(
      name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.projeList',
      context: context);

  @override
  List<BaseProjeModel>? get projeList {
    _$projeListAtom.reportRead();
    return super.projeList;
  }

  @override
  set projeList(List<BaseProjeModel>? value) {
    _$projeListAtom.reportWrite(value, super.projeList, () {
      super.projeList = value;
    });
  }

  late final _$irsDahilValueAtom = Atom(
      name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.irsDahilValue',
      context: context);

  @override
  bool get irsDahilValue {
    _$irsDahilValueAtom.reportRead();
    return super.irsDahilValue;
  }

  @override
  set irsDahilValue(bool value) {
    _$irsDahilValueAtom.reportWrite(value, super.irsDahilValue, () {
      super.irsDahilValue = value;
    });
  }

  late final _$gruplansinValueAtom = Atom(
      name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.gruplansinValue',
      context: context);

  @override
  bool get gruplansinValue {
    _$gruplansinValueAtom.reportRead();
    return super.gruplansinValue;
  }

  @override
  set gruplansinValue(bool value) {
    _$gruplansinValueAtom.reportWrite(value, super.gruplansinValue, () {
      super.gruplansinValue = value;
    });
  }

  late final _$donemTipiIndexAtom = Atom(
      name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.donemTipiIndex',
      context: context);

  @override
  int get donemTipiIndex {
    _$donemTipiIndexAtom.reportRead();
    return super.donemTipiIndex;
  }

  @override
  set donemTipiIndex(int value) {
    _$donemTipiIndexAtom.reportWrite(value, super.donemTipiIndex, () {
      super.donemTipiIndex = value;
    });
  }

  late final _$modelListAtom = Atom(
      name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.modelList',
      context: context);

  @override
  ObservableList<UrunGrubunaGoreSatisGrafigiModel>? get modelList {
    _$modelListAtom.reportRead();
    return super.modelList;
  }

  @override
  set modelList(ObservableList<UrunGrubunaGoreSatisGrafigiModel>? value) {
    _$modelListAtom.reportWrite(value, super.modelList, () {
      super.modelList = value;
    });
  }

  late final _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController =
      ActionController(
          name: '_UrunGrubunaGoreSatisGrafigiViewModelBase', context: context);

  @override
  void setProjeList(List<BaseProjeModel>? value) {
    final _$actionInfo =
        _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController.startAction(
            name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.setProjeList');
    try {
      return super.setProjeList(value);
    } finally {
      _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setRaporTipi(String value) {
    final _$actionInfo =
        _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController.startAction(
            name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.setRaporTipi');
    try {
      return super.setRaporTipi(value);
    } finally {
      _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setProje(BaseProjeModel? proje) {
    final _$actionInfo =
        _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController.startAction(
            name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.setProje');
    try {
      return super.setProje(proje);
    } finally {
      _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setIrsDahilValue(bool value) {
    final _$actionInfo =
        _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController.startAction(
            name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.setIrsDahilValue');
    try {
      return super.setIrsDahilValue(value);
    } finally {
      _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setGruplansinValue(bool value) {
    final _$actionInfo =
        _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController.startAction(
            name:
                '_UrunGrubunaGoreSatisGrafigiViewModelBase.setGruplansinValue');
    try {
      return super.setGruplansinValue(value);
    } finally {
      _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setModelList(List<UrunGrubunaGoreSatisGrafigiModel>? value) {
    final _$actionInfo =
        _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController.startAction(
            name: '_UrunGrubunaGoreSatisGrafigiViewModelBase.setModelList');
    try {
      return super.setModelList(value);
    } finally {
      _$_UrunGrubunaGoreSatisGrafigiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
projeList: ${projeList},
irsDahilValue: ${irsDahilValue},
gruplansinValue: ${gruplansinValue},
donemTipiIndex: ${donemTipiIndex},
modelList: ${modelList},
toplamMiktar: ${toplamMiktar},
toplamNetTutar: ${toplamNetTutar}
    ''';
  }
}
