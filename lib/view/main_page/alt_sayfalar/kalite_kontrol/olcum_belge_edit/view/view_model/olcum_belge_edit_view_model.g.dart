// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_belge_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OlcumBelgeEditViewModel on _OlcumBelgeEditViewModelBase, Store {
  Computed<OlcumBelgeModel?>? _$belgeModelComputed;

  @override
  OlcumBelgeModel? get belgeModel => (_$belgeModelComputed ??=
          Computed<OlcumBelgeModel?>(() => super.belgeModel,
              name: '_OlcumBelgeEditViewModelBase.belgeModel'))
      .value;
  Computed<bool>? _$depolarValidationComputed;

  @override
  bool get depolarValidation => (_$depolarValidationComputed ??= Computed<bool>(
          () => super.depolarValidation,
          name: '_OlcumBelgeEditViewModelBase.depolarValidation'))
      .value;

  late final _$requestModelAtom =
      Atom(name: '_OlcumBelgeEditViewModelBase.requestModel', context: context);

  @override
  OlcumBelgeModel? get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(OlcumBelgeModel? value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_OlcumBelgeEditViewModelBase.model', context: context);

  @override
  OlcumBelgeEditModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(OlcumBelgeEditModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$olcumDatListesiAtom = Atom(
      name: '_OlcumBelgeEditViewModelBase.olcumDatListesi', context: context);

  @override
  ObservableList<OlcumBelgeModel>? get olcumDatListesi {
    _$olcumDatListesiAtom.reportRead();
    return super.olcumDatListesi;
  }

  @override
  set olcumDatListesi(ObservableList<OlcumBelgeModel>? value) {
    _$olcumDatListesiAtom.reportWrite(value, super.olcumDatListesi, () {
      super.olcumDatListesi = value;
    });
  }

  late final _$seriRequestModelAtom = Atom(
      name: '_OlcumBelgeEditViewModelBase.seriRequestModel', context: context);

  @override
  OlcumSeriRequestModel get seriRequestModel {
    _$seriRequestModelAtom.reportRead();
    return super.seriRequestModel;
  }

  @override
  set seriRequestModel(OlcumSeriRequestModel value) {
    _$seriRequestModelAtom.reportWrite(value, super.seriRequestModel, () {
      super.seriRequestModel = value;
    });
  }

  late final _$olcumDatResponseListesiAtom = Atom(
      name: '_OlcumBelgeEditViewModelBase.olcumDatResponseListesi',
      context: context);

  @override
  ObservableList<SeriList>? get olcumDatResponseListesi {
    _$olcumDatResponseListesiAtom.reportRead();
    return super.olcumDatResponseListesi;
  }

  @override
  set olcumDatResponseListesi(ObservableList<SeriList>? value) {
    _$olcumDatResponseListesiAtom
        .reportWrite(value, super.olcumDatResponseListesi, () {
      super.olcumDatResponseListesi = value;
    });
  }

  late final _$getDatMiktarAsyncAction = AsyncAction(
      '_OlcumBelgeEditViewModelBase.getDatMiktar',
      context: context);

  @override
  Future<void> getDatMiktar() {
    return _$getDatMiktarAsyncAction.run(() => super.getDatMiktar());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_OlcumBelgeEditViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$getOlcumlerAsyncAction =
      AsyncAction('_OlcumBelgeEditViewModelBase.getOlcumler', context: context);

  @override
  Future<List<OlcumOlcumlerModel>?> getOlcumler() {
    return _$getOlcumlerAsyncAction.run(() => super.getOlcumler());
  }

  late final _$getProseslerAsyncAction = AsyncAction(
      '_OlcumBelgeEditViewModelBase.getProsesler',
      context: context);

  @override
  Future<List<OlcumProsesModel>?> getProsesler(int? id) {
    return _$getProseslerAsyncAction.run(() => super.getProsesler(id));
  }

  late final _$getOlcumDatListesiAsyncAction = AsyncAction(
      '_OlcumBelgeEditViewModelBase.getOlcumDatListesi',
      context: context);

  @override
  Future<bool> getOlcumDatListesi() {
    return _$getOlcumDatListesiAsyncAction
        .run(() => super.getOlcumDatListesi());
  }

  late final _$deleteOlcumAsyncAction =
      AsyncAction('_OlcumBelgeEditViewModelBase.deleteOlcum', context: context);

  @override
  Future<GenericResponseModel<OlcumBelgeEditModel>> deleteOlcum(int? id) {
    return _$deleteOlcumAsyncAction.run(() => super.deleteOlcum(id));
  }

  late final _$_OlcumBelgeEditViewModelBaseActionController =
      ActionController(name: '_OlcumBelgeEditViewModelBase', context: context);

  @override
  void setGirisDepo(DepoList? value) {
    final _$actionInfo = _$_OlcumBelgeEditViewModelBaseActionController
        .startAction(name: '_OlcumBelgeEditViewModelBase.setGirisDepo');
    try {
      return super.setGirisDepo(value);
    } finally {
      _$_OlcumBelgeEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKabulGirisDepo(DepoList? value) {
    final _$actionInfo = _$_OlcumBelgeEditViewModelBaseActionController
        .startAction(name: '_OlcumBelgeEditViewModelBase.setKabulGirisDepo');
    try {
      return super.setKabulGirisDepo(value);
    } finally {
      _$_OlcumBelgeEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRedGirisDepo(DepoList? value) {
    final _$actionInfo = _$_OlcumBelgeEditViewModelBaseActionController
        .startAction(name: '_OlcumBelgeEditViewModelBase.setRedGirisDepo');
    try {
      return super.setRedGirisDepo(value);
    } finally {
      _$_OlcumBelgeEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCikisDepo(DepoList? value) {
    final _$actionInfo = _$_OlcumBelgeEditViewModelBaseActionController
        .startAction(name: '_OlcumBelgeEditViewModelBase.setCikisDepo');
    try {
      return super.setCikisDepo(value);
    } finally {
      _$_OlcumBelgeEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOlcumDatResponseListesi(List<SeriList>? list) {
    final _$actionInfo =
        _$_OlcumBelgeEditViewModelBaseActionController.startAction(
            name: '_OlcumBelgeEditViewModelBase.setOlcumDatResponseListesi');
    try {
      return super.setOlcumDatResponseListesi(list);
    } finally {
      _$_OlcumBelgeEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRequestModel(OlcumBelgeModel reqModel) {
    final _$actionInfo = _$_OlcumBelgeEditViewModelBaseActionController
        .startAction(name: '_OlcumBelgeEditViewModelBase.setRequestModel');
    try {
      return super.setRequestModel(reqModel);
    } finally {
      _$_OlcumBelgeEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOlcumDatListesi(List<OlcumBelgeModel>? list) {
    final _$actionInfo = _$_OlcumBelgeEditViewModelBaseActionController
        .startAction(name: '_OlcumBelgeEditViewModelBase.setOlcumDatListesi');
    try {
      return super.setOlcumDatListesi(list);
    } finally {
      _$_OlcumBelgeEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOlcumlerList(List<OlcumOlcumlerModel>? list) {
    final _$actionInfo = _$_OlcumBelgeEditViewModelBaseActionController
        .startAction(name: '_OlcumBelgeEditViewModelBase.setOlcumlerList');
    try {
      return super.setOlcumlerList(list);
    } finally {
      _$_OlcumBelgeEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
model: ${model},
olcumDatListesi: ${olcumDatListesi},
seriRequestModel: ${seriRequestModel},
olcumDatResponseListesi: ${olcumDatResponseListesi},
belgeModel: ${belgeModel},
depolarValidation: ${depolarValidation}
    ''';
  }
}
