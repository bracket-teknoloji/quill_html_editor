// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_hesaba_cirola_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariHesabaCirolaViewModel on _CariHesabaCirolaViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_CariHesabaCirolaViewModelBase.model', context: context);

  @override
  SaveCekSenetModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SaveCekSenetModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$cariListesiModelAtom = Atom(
      name: '_CariHesabaCirolaViewModelBase.cariListesiModel',
      context: context);

  @override
  CariListesiModel? get cariListesiModel {
    _$cariListesiModelAtom.reportRead();
    return super.cariListesiModel;
  }

  @override
  set cariListesiModel(CariListesiModel? value) {
    _$cariListesiModelAtom.reportWrite(value, super.cariListesiModel, () {
      super.cariListesiModel = value;
    });
  }

  late final _$saveDataAsyncAction =
      AsyncAction('_CariHesabaCirolaViewModelBase.saveData', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> saveData() {
    return _$saveDataAsyncAction.run(() => super.saveData());
  }

  late final _$_CariHesabaCirolaViewModelBaseActionController =
      ActionController(
          name: '_CariHesabaCirolaViewModelBase', context: context);

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_CariHesabaCirolaViewModelBaseActionController
        .startAction(name: '_CariHesabaCirolaViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_CariHesabaCirolaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIslemTarihi(DateTime? value) {
    final _$actionInfo = _$_CariHesabaCirolaViewModelBaseActionController
        .startAction(name: '_CariHesabaCirolaViewModelBase.setIslemTarihi');
    try {
      return super.setIslemTarihi(value);
    } finally {
      _$_CariHesabaCirolaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(CariListesiModel? value) {
    final _$actionInfo = _$_CariHesabaCirolaViewModelBaseActionController
        .startAction(name: '_CariHesabaCirolaViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_CariHesabaCirolaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjekodu(String? value) {
    final _$actionInfo = _$_CariHesabaCirolaViewModelBaseActionController
        .startAction(name: '_CariHesabaCirolaViewModelBase.setProjekodu');
    try {
      return super.setProjekodu(value);
    } finally {
      _$_CariHesabaCirolaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(String? value) {
    final _$actionInfo = _$_CariHesabaCirolaViewModelBaseActionController
        .startAction(name: '_CariHesabaCirolaViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_CariHesabaCirolaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
cariListesiModel: ${cariListesiModel}
    ''';
  }
}
