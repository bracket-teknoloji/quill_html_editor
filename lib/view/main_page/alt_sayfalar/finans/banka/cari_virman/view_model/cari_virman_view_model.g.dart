// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_virman_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariVirmanViewModel on _CariVirmanViewModelBase, Store {
  Computed<DateTime?>? _$vadeGunuComputed;

  @override
  DateTime? get vadeGunu =>
      (_$vadeGunuComputed ??= Computed<DateTime?>(() => super.vadeGunu,
              name: '_CariVirmanViewModelBase.vadeGunu'))
          .value;

  late final _$requestModelAtom =
      Atom(name: '_CariVirmanViewModelBase.requestModel', context: context);

  @override
  TahsilatRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(TahsilatRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$sendDataAsyncAction =
      AsyncAction('_CariVirmanViewModelBase.sendData', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> sendData() {
    return _$sendDataAsyncAction.run(() => super.sendData());
  }

  late final _$_CariVirmanViewModelBaseActionController =
      ActionController(name: '_CariVirmanViewModelBase', context: context);

  @override
  void setTarih(DateTime? time) {
    final _$actionInfo = _$_CariVirmanViewModelBaseActionController.startAction(
        name: '_CariVirmanViewModelBase.setTarih');
    try {
      return super.setTarih(time);
    } finally {
      _$_CariVirmanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeri(String? seri) {
    final _$actionInfo = _$_CariVirmanViewModelBaseActionController.startAction(
        name: '_CariVirmanViewModelBase.setSeri');
    try {
      return super.setSeri(seri);
    } finally {
      _$_CariVirmanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTahsilatCari(String? cariKodu) {
    final _$actionInfo = _$_CariVirmanViewModelBaseActionController.startAction(
        name: '_CariVirmanViewModelBase.setTahsilatCari');
    try {
      return super.setTahsilatCari(cariKodu);
    } finally {
      _$_CariVirmanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOdemeCari(String? cariKodu) {
    final _$actionInfo = _$_CariVirmanViewModelBaseActionController.startAction(
        name: '_CariVirmanViewModelBase.setOdemeCari');
    try {
      return super.setOdemeCari(cariKodu);
    } finally {
      _$_CariVirmanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? tutar) {
    final _$actionInfo = _$_CariVirmanViewModelBaseActionController.startAction(
        name: '_CariVirmanViewModelBase.setTutar');
    try {
      return super.setTutar(tutar);
    } finally {
      _$_CariVirmanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVadeGunu(int? vade) {
    final _$actionInfo = _$_CariVirmanViewModelBaseActionController.startAction(
        name: '_CariVirmanViewModelBase.setVadeGunu');
    try {
      return super.setVadeGunu(vade);
    } finally {
      _$_CariVirmanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyer(String? plasiyer) {
    final _$actionInfo = _$_CariVirmanViewModelBaseActionController.startAction(
        name: '_CariVirmanViewModelBase.setPlasiyer');
    try {
      return super.setPlasiyer(plasiyer);
    } finally {
      _$_CariVirmanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? aciklama) {
    final _$actionInfo = _$_CariVirmanViewModelBaseActionController.startAction(
        name: '_CariVirmanViewModelBase.setAciklama');
    try {
      return super.setAciklama(aciklama);
    } finally {
      _$_CariVirmanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHedefAciklama(String? aciklama) {
    final _$actionInfo = _$_CariVirmanViewModelBaseActionController.startAction(
        name: '_CariVirmanViewModelBase.setHedefAciklama');
    try {
      return super.setHedefAciklama(aciklama);
    } finally {
      _$_CariVirmanViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
vadeGunu: ${vadeGunu}
    ''';
  }
}
