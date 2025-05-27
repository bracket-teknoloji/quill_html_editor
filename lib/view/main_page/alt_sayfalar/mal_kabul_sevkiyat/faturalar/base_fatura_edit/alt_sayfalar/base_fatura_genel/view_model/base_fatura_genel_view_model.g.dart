// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_fatura_genel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseFaturaGenelViewModel on _BaseFaturaGenelViewModelBase, Store {
  late final _$kdvDahilAtom =
      Atom(name: '_BaseFaturaGenelViewModelBase.kdvDahil', context: context);

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

  late final _$ebelgeCheckboxAtom = Atom(
      name: '_BaseFaturaGenelViewModelBase.ebelgeCheckbox', context: context);

  @override
  bool get ebelgeCheckbox {
    _$ebelgeCheckboxAtom.reportRead();
    return super.ebelgeCheckbox;
  }

  @override
  set ebelgeCheckbox(bool value) {
    _$ebelgeCheckboxAtom.reportWrite(value, super.ebelgeCheckbox, () {
      super.ebelgeCheckbox = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_BaseFaturaGenelViewModelBase.model', context: context);

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
      '_BaseFaturaGenelViewModelBase.fiyatGuncelle',
      context: context);

  @override
  Future<bool> fiyatGuncelle() {
    return _$fiyatGuncelleAsyncAction.run(() => super.fiyatGuncelle());
  }

  late final _$_BaseFaturaGenelViewModelBaseActionController =
      ActionController(name: '_BaseFaturaGenelViewModelBase', context: context);

  @override
  void setCariAdi(String? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setCariAdi');
    try {
      return super.setCariAdi(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTeslimCariAdi(String? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setTeslimCariAdi');
    try {
      return super.setTeslimCariAdi(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTeslimCariKodu(String? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setTeslimCariKodu');
    try {
      return super.setTeslimCariKodu(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepoKodu(DepoList? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setDepoKodu');
    try {
      return super.setDepoKodu(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeKdvDahil(bool value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.changeKdvDahil');
    try {
      return super.changeKdvDahil(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEbelgeCheckBox(bool value) {
    final _$actionInfo =
        _$_BaseFaturaGenelViewModelBaseActionController.startAction(
            name: '_BaseFaturaGenelViewModelBase.changeEbelgeCheckBox');
    try {
      return super.changeEbelgeCheckBox(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeTipi(int? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setBelgeTipi');
    try {
      return super.setBelgeTipi(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOzelKod1(String? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setOzelKod1');
    try {
      return super.setOzelKod1(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOdemeKodu(String? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setOdemeKodu');
    try {
      return super.setOdemeKodu(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOzelKod2(String? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setOzelKod2');
    try {
      return super.setOzelKod2(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyer(PlasiyerList? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setPlasiyer');
    try {
      return super.setPlasiyer(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProje(BaseProjeModel? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setProje');
    try {
      return super.setProje(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKosulKodu(String? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setKosulKodu');
    try {
      return super.setKosulKodu(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setTarih');
    try {
      return super.setTarih(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value, bool? siparistenKopyalaMi) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value, siparistenKopyalaMi);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTopluDepoKodu(int? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setTopluDepoKodu');
    try {
      return super.setTopluDepoKodu(value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(int index, GenelRehberModel? value) {
    final _$actionInfo = _$_BaseFaturaGenelViewModelBaseActionController
        .startAction(name: '_BaseFaturaGenelViewModelBase.setAciklama');
    try {
      return super.setAciklama(index, value);
    } finally {
      _$_BaseFaturaGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kdvDahil: ${kdvDahil},
ebelgeCheckbox: ${ebelgeCheckbox},
model: ${model}
    ''';
  }
}
