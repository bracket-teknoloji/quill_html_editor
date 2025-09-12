// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_talep_teklif_genel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseTalepTeklifGenelViewModel
    on _BaseTalepTeklifGenelViewModelBase, Store {
  late final _$kdvDahilAtom = Atom(
    name: '_BaseTalepTeklifGenelViewModelBase.kdvDahil',
    context: context,
  );

  @override
  bool get kdvDahil {
    _$kdvDahilAtom.reportRead();
    return super.kdvDahil;
  }

  @override
  set kdvDahil(bool value) {
    _$kdvDahilAtom.reportWrite(value, super.kdvDahil, () {
      super.kdvDahil = value;
    });
  }

  late final _$modelAtom = Atom(
    name: '_BaseTalepTeklifGenelViewModelBase.model',
    context: context,
  );

  @override
  BaseSiparisEditModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(BaseSiparisEditModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$fiyatGuncelleAsyncAction = AsyncAction(
    '_BaseTalepTeklifGenelViewModelBase.fiyatGuncelle',
    context: context,
  );

  @override
  Future<bool> fiyatGuncelle() {
    return _$fiyatGuncelleAsyncAction.run(() => super.fiyatGuncelle());
  }

  late final _$_BaseTalepTeklifGenelViewModelBaseActionController =
      ActionController(
        name: '_BaseTalepTeklifGenelViewModelBase',
        context: context,
      );

  @override
  void setCariAdi(String? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setCariAdi');
    try {
      return super.setCariAdi(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setExportTipi(MapEntry<String, int>? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setExportTipi');
    try {
      return super.setExportTipi(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setExportRefNo(String? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setExportRefNo');
    try {
      return super.setExportRefNo(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setTeslimCariAdi(String? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(
          name: '_BaseTalepTeklifGenelViewModelBase.setTeslimCariAdi',
        );
    try {
      return super.setTeslimCariAdi(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setTeslimCariKodu(String? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(
          name: '_BaseTalepTeklifGenelViewModelBase.setTeslimCariKodu',
        );
    try {
      return super.setTeslimCariKodu(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setDepoKodu(DepoList? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setDepoKodu');
    try {
      return super.setDepoKodu(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setOdemeKodu(String? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setOdemeKodu');
    try {
      return super.setOdemeKodu(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setKosulKodu(CariKosullarModel? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setKosulKodu');
    try {
      return super.setKosulKodu(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setOzelKod1(String? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setOzelKod1');
    try {
      return super.setOzelKod1(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void changeKdvDahil(bool value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.changeKdvDahil');
    try {
      return super.changeKdvDahil(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBelgeTipi(int? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setBelgeTipi');
    try {
      return super.setBelgeTipi(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setOzelKod2(String? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setOzelKod2');
    try {
      return super.setOzelKod2(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setPlasiyer(PlasiyerList? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setPlasiyer');
    try {
      return super.setPlasiyer(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setProje(BaseProjeModel? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setProje');
    try {
      return super.setProje(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setTarih');
    try {
      return super.setTarih(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setTopluDepoKodu(int? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(
          name: '_BaseTalepTeklifGenelViewModelBase.setTopluDepoKodu',
        );
    try {
      return super.setTopluDepoKodu(value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setAciklama(int index, GenelRehberModel? value) {
    final _$actionInfo = _$_BaseTalepTeklifGenelViewModelBaseActionController
        .startAction(name: '_BaseTalepTeklifGenelViewModelBase.setAciklama');
    try {
      return super.setAciklama(index, value);
    } finally {
      _$_BaseTalepTeklifGenelViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
kdvDahil: ${kdvDahil},
model: ${model}
    ''';
  }
}
