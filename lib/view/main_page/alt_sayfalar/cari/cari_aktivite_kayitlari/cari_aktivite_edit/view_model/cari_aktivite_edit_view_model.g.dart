// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariAktiviteEditViewModel on _CariAktiviteEditViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_CariAktiviteEditViewModelBase.model', context: context);

  @override
  CariAktiviteListesiModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CariAktiviteListesiModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$aktiviteBitirilsinMiAtom = Atom(
      name: '_CariAktiviteEditViewModelBase.aktiviteBitirilsinMi',
      context: context);

  @override
  bool get aktiviteBitirilsinMi {
    _$aktiviteBitirilsinMiAtom.reportRead();
    return super.aktiviteBitirilsinMi;
  }

  @override
  set aktiviteBitirilsinMi(bool value) {
    _$aktiviteBitirilsinMiAtom.reportWrite(value, super.aktiviteBitirilsinMi,
        () {
      super.aktiviteBitirilsinMi = value;
    });
  }

  late final _$saveCariAktiviteAsyncAction = AsyncAction(
      '_CariAktiviteEditViewModelBase.saveCariAktivite',
      context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> saveCariAktivite() {
    return _$saveCariAktiviteAsyncAction.run(() => super.saveCariAktivite());
  }

  late final _$_CariAktiviteEditViewModelBaseActionController =
      ActionController(
          name: '_CariAktiviteEditViewModelBase', context: context);

  @override
  void setAktiviteBitirilsinMi(bool value) {
    final _$actionInfo =
        _$_CariAktiviteEditViewModelBaseActionController.startAction(
            name: '_CariAktiviteEditViewModelBase.setAktiviteBitirilsinMi');
    try {
      return super.setAktiviteBitirilsinMi(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModel(CariAktiviteListesiModel value) {
    final _$actionInfo = _$_CariAktiviteEditViewModelBaseActionController
        .startAction(name: '_CariAktiviteEditViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslangicTarihi(DateTime? value) {
    final _$actionInfo = _$_CariAktiviteEditViewModelBaseActionController
        .startAction(name: '_CariAktiviteEditViewModelBase.setBaslangicTarihi');
    try {
      return super.setBaslangicTarihi(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSaat(DateTime? value) {
    final _$actionInfo = _$_CariAktiviteEditViewModelBaseActionController
        .startAction(name: '_CariAktiviteEditViewModelBase.setSaat');
    try {
      return super.setSaat(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCari(String? value) {
    final _$actionInfo = _$_CariAktiviteEditViewModelBaseActionController
        .startAction(name: '_CariAktiviteEditViewModelBase.setCari');
    try {
      return super.setCari(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBolum(String? value) {
    final _$actionInfo = _$_CariAktiviteEditViewModelBaseActionController
        .startAction(name: '_CariAktiviteEditViewModelBase.setBolum');
    try {
      return super.setBolum(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIlgiliKisi(String? value) {
    final _$actionInfo = _$_CariAktiviteEditViewModelBaseActionController
        .startAction(name: '_CariAktiviteEditViewModelBase.setIlgiliKisi');
    try {
      return super.setIlgiliKisi(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKullanici(String? value) {
    final _$actionInfo = _$_CariAktiviteEditViewModelBaseActionController
        .startAction(name: '_CariAktiviteEditViewModelBase.setKullanici');
    try {
      return super.setKullanici(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAktiviteTipi(int? value) {
    final _$actionInfo = _$_CariAktiviteEditViewModelBaseActionController
        .startAction(name: '_CariAktiviteEditViewModelBase.setAktiviteTipi');
    try {
      return super.setAktiviteTipi(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_CariAktiviteEditViewModelBaseActionController
        .startAction(name: '_CariAktiviteEditViewModelBase.setAciklama');
    try {
      return super.setAciklama(value);
    } finally {
      _$_CariAktiviteEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
aktiviteBitirilsinMi: ${aktiviteBitirilsinMi}
    ''';
  }
}
