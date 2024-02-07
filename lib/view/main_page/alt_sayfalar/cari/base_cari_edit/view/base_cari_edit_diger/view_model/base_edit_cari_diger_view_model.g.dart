// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_edit_cari_diger_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseEditCariDigerViewModel on _BaseEditCariDigerViewModelBase, Store {
  Computed<String>? _$efaturaButonAciklamaComputed;

  @override
  String get efaturaButonAciklama => (_$efaturaButonAciklamaComputed ??=
          Computed<String>(() => super.efaturaButonAciklama,
              name: '_BaseEditCariDigerViewModelBase.efaturaButonAciklama'))
      .value;

  late final _$modelAtom =
      Atom(name: '_BaseEditCariDigerViewModelBase.model', context: context);

  @override
  CariSaveRequestModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CariSaveRequestModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$postFaturaTipiAsyncAction = AsyncAction(
      '_BaseEditCariDigerViewModelBase.postFaturaTipi',
      context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> postFaturaTipi() {
    return _$postFaturaTipiAsyncAction.run(() => super.postFaturaTipi());
  }

  late final _$_BaseEditCariDigerViewModelBaseActionController =
      ActionController(
          name: '_BaseEditCariDigerViewModelBase', context: context);

  @override
  void changeModel(CariSaveRequestModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeModel');
    try {
      return super.changeModel(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModel(CariSaveRequestModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBagliCari(CariListesiModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeBagliCari');
    try {
      return super.changeBagliCari(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeGrupKodu(String? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeGrupKodu');
    try {
      return super.changeGrupKodu(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMuhaseKodu(StokMuhasebeKoduModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeMuhaseKodu');
    try {
      return super.changeMuhaseKodu(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEfaturaMi() {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeEfaturaMi');
    try {
      return super.changeEfaturaMi();
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKurFarkiBorc(StokMuhasebeKoduModel? value) {
    final _$actionInfo =
        _$_BaseEditCariDigerViewModelBaseActionController.startAction(
            name: '_BaseEditCariDigerViewModelBase.changeKurFarkiBorc');
    try {
      return super.changeKurFarkiBorc(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKurFarkiAlacak(StokMuhasebeKoduModel? value) {
    final _$actionInfo =
        _$_BaseEditCariDigerViewModelBaseActionController.startAction(
            name: '_BaseEditCariDigerViewModelBase.changeKurFarkiAlacak');
    try {
      return super.changeKurFarkiAlacak(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAdi(String? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeAdi');
    try {
      return super.changeAdi(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBilgi(String? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeBilgi');
    try {
      return super.changeBilgi(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKosul(CariKosullarModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKosul');
    try {
      return super.changeKosul(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenaryo(String? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.setSenaryo');
    try {
      return super.setSenaryo(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKilit(String? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKilit');
    try {
      return super.changeKilit(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKonum((double, double)? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKonum');
    try {
      return super.changeKonum(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod1(BaseGrupKoduModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKod1');
    try {
      return super.changeKod1(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod2(BaseGrupKoduModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKod2');
    try {
      return super.changeKod2(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod3(BaseGrupKoduModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKod3');
    try {
      return super.changeKod3(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod4(BaseGrupKoduModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKod4');
    try {
      return super.changeKod4(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKod5(BaseGrupKoduModel? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKod5');
    try {
      return super.changeKod5(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSubeKodu(int? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeSubeKodu');
    try {
      return super.changeSubeKodu(value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAciklama(int index, String? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeAciklama');
    try {
      return super.changeAciklama(index, value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKullA(int index, String? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKullA');
    try {
      return super.changeKullA(index, value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKullN(int index, String? value) {
    final _$actionInfo = _$_BaseEditCariDigerViewModelBaseActionController
        .startAction(name: '_BaseEditCariDigerViewModelBase.changeKullN');
    try {
      return super.changeKullN(index, value);
    } finally {
      _$_BaseEditCariDigerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
efaturaButonAciklama: ${efaturaButonAciklama}
    ''';
  }
}
