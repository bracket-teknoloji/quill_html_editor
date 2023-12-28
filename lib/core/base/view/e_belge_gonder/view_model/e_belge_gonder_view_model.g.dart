// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_belge_gonder_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EBelgeGonderViewModel on _EBelgeGonderViewModelBase, Store {
  Computed<Future<CariListesiModel?>>? _$getCariModelComputed;

  @override
  Future<CariListesiModel?> get getCariModel => (_$getCariModelComputed ??=
          Computed<Future<CariListesiModel?>>(() => super.getCariModel,
              name: '_EBelgeGonderViewModelBase.getCariModel'))
      .value;

  late final _$modelAtom =
      Atom(name: '_EBelgeGonderViewModelBase.model', context: context);

  @override
  EBelgeListesiModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(EBelgeListesiModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$cariModelAtom =
      Atom(name: '_EBelgeGonderViewModelBase.cariModel', context: context);

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

  late final _$siparisEditModelAtom = Atom(
      name: '_EBelgeGonderViewModelBase.siparisEditModel', context: context);

  @override
  BaseSiparisEditModel get siparisEditModel {
    _$siparisEditModelAtom.reportRead();
    return super.siparisEditModel;
  }

  @override
  set siparisEditModel(BaseSiparisEditModel value) {
    _$siparisEditModelAtom.reportWrite(value, super.siparisEditModel, () {
      super.siparisEditModel = value;
    });
  }

  late final _$getDizaynAsyncAction =
      AsyncAction('_EBelgeGonderViewModelBase.getDizayn', context: context);

  @override
  Future<List<DizaynModel>> getDizayn() {
    return _$getDizaynAsyncAction.run(() => super.getDizayn());
  }

  late final _$getCariAsyncAction =
      AsyncAction('_EBelgeGonderViewModelBase.getCari', context: context);

  @override
  Future<CariListesiModel?> getCari() {
    return _$getCariAsyncAction.run(() => super.getCari());
  }

  late final _$sendTaslakAsyncAction =
      AsyncAction('_EBelgeGonderViewModelBase.sendTaslak', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> sendTaslak() {
    return _$sendTaslakAsyncAction.run(() => super.sendTaslak());
  }

  late final _$sendEBelgeAsyncAction =
      AsyncAction('_EBelgeGonderViewModelBase.sendEBelge', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> sendEBelge() {
    return _$sendEBelgeAsyncAction.run(() => super.sendEBelge());
  }

  late final _$deleteTaslakAsyncAction =
      AsyncAction('_EBelgeGonderViewModelBase.deleteTaslak', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> deleteTaslak() {
    return _$deleteTaslakAsyncAction.run(() => super.deleteTaslak());
  }

  late final _$_EBelgeGonderViewModelBaseActionController =
      ActionController(name: '_EBelgeGonderViewModelBase', context: context);

  @override
  void setModel(EBelgeListesiModel value) {
    final _$actionInfo = _$_EBelgeGonderViewModelBaseActionController
        .startAction(name: '_EBelgeGonderViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_EBelgeGonderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenaryo(String value) {
    final _$actionInfo = _$_EBelgeGonderViewModelBaseActionController
        .startAction(name: '_EBelgeGonderViewModelBase.setSenaryo');
    try {
      return super.setSenaryo(value);
    } finally {
      _$_EBelgeGonderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDizaynNo(int value) {
    final _$actionInfo = _$_EBelgeGonderViewModelBaseActionController
        .startAction(name: '_EBelgeGonderViewModelBase.setDizaynNo');
    try {
      return super.setDizaynNo(value);
    } finally {
      _$_EBelgeGonderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizOlustur(bool value) {
    final _$actionInfo = _$_EBelgeGonderViewModelBaseActionController
        .startAction(name: '_EBelgeGonderViewModelBase.setDovizOlustur');
    try {
      return super.setDovizOlustur(value);
    } finally {
      _$_EBelgeGonderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInternetFaturasi(bool value) {
    final _$actionInfo = _$_EBelgeGonderViewModelBaseActionController
        .startAction(name: '_EBelgeGonderViewModelBase.setInternetFaturasi');
    try {
      return super.setInternetFaturasi(value);
    } finally {
      _$_EBelgeGonderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGonderimSekliEposta(bool value) {
    final _$actionInfo = _$_EBelgeGonderViewModelBaseActionController
        .startAction(name: '_EBelgeGonderViewModelBase.setGonderimSekliEposta');
    try {
      return super.setGonderimSekliEposta(value);
    } finally {
      _$_EBelgeGonderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEPosta(String? value) {
    final _$actionInfo = _$_EBelgeGonderViewModelBaseActionController
        .startAction(name: '_EBelgeGonderViewModelBase.setEPosta');
    try {
      return super.setEPosta(value);
    } finally {
      _$_EBelgeGonderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiparisModel(BaseSiparisEditModel value) {
    final _$actionInfo = _$_EBelgeGonderViewModelBaseActionController
        .startAction(name: '_EBelgeGonderViewModelBase.setSiparisModel');
    try {
      return super.setSiparisModel(value);
    } finally {
      _$_EBelgeGonderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
cariModel: ${cariModel},
siparisEditModel: ${siparisEditModel},
getCariModel: ${getCariModel}
    ''';
  }
}
