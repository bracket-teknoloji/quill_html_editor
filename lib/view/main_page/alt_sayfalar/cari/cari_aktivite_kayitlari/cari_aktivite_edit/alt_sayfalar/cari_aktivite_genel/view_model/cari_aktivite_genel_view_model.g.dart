// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_genel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariAktiviteGenelViewModel on CariAktiviteGenelViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: 'CariAktiviteGenelViewModelBase.model',
    context: context,
  );

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

  late final _$baseEditEnumAtom = Atom(
    name: 'CariAktiviteGenelViewModelBase.baseEditEnum',
    context: context,
  );

  @override
  BaseEditEnum? get baseEditEnum {
    _$baseEditEnumAtom.reportRead();
    return super.baseEditEnum;
  }

  @override
  set baseEditEnum(BaseEditEnum? value) {
    _$baseEditEnumAtom.reportWrite(value, super.baseEditEnum, () {
      super.baseEditEnum = value;
    });
  }

  late final _$aktiviteBitirilsinMiAtom = Atom(
    name: 'CariAktiviteGenelViewModelBase.aktiviteBitirilsinMi',
    context: context,
  );

  @override
  bool get aktiviteBitirilsinMi {
    _$aktiviteBitirilsinMiAtom.reportRead();
    return super.aktiviteBitirilsinMi;
  }

  @override
  set aktiviteBitirilsinMi(bool value) {
    _$aktiviteBitirilsinMiAtom.reportWrite(
      value,
      super.aktiviteBitirilsinMi,
      () {
        super.aktiviteBitirilsinMi = value;
      },
    );
  }

  late final _$saveCariAktiviteAsyncAction = AsyncAction(
    'CariAktiviteGenelViewModelBase.saveCariAktivite',
    context: context,
  );

  @override
  Future<GenericResponseModel<CariAktiviteListesiModel>> saveCariAktivite() {
    return _$saveCariAktiviteAsyncAction.run(() => super.saveCariAktivite());
  }

  late final _$CariAktiviteGenelViewModelBaseActionController = ActionController(
    name: 'CariAktiviteGenelViewModelBase',
    context: context,
  );

  @override
  void setBaseEditEnum(BaseEditEnum? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setBaseEditEnum',
    );
    try {
      return super.setBaseEditEnum(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAktiviteBitirilsinMi(bool value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setAktiviteBitirilsinMi',
    );
    try {
      return super.setAktiviteBitirilsinMi(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModel(CariAktiviteListesiModel value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setModel',
    );
    try {
      return super.setModel(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslangicTarihi(DateTime? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setBaslangicTarihi',
    );
    try {
      return super.setBaslangicTarihi(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSaat(DateTime? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setSaat',
    );
    try {
      return super.setSaat(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCari(CariListesiModel? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setCari',
    );
    try {
      return super.setCari(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBolum(String? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setBolum',
    );
    try {
      return super.setBolum(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIlgiliKisi(String? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setIlgiliKisi',
    );
    try {
      return super.setIlgiliKisi(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKullanici(KullanicilarModel? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setKullanici',
    );
    try {
      return super.setKullanici(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAktiviteTipi(CariAktiviteTipleri? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setAktiviteTipi',
    );
    try {
      return super.setAktiviteTipi(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSonucAciklama(String? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setSonucAciklama',
    );
    try {
      return super.setSonucAciklama(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSure(double? value) {
    final _$actionInfo = _$CariAktiviteGenelViewModelBaseActionController.startAction(
      name: 'CariAktiviteGenelViewModelBase.setSure',
    );
    try {
      return super.setSure(value);
    } finally {
      _$CariAktiviteGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
baseEditEnum: ${baseEditEnum},
aktiviteBitirilsinMi: ${aktiviteBitirilsinMi}
    ''';
  }
}
