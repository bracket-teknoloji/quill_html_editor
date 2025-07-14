// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_muhtelif_islemler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankaMuhtelifIslemlerViewModel on _BankaMuhtelifIslemlerViewModelBase, Store {
  late final _$dovizKurlariListesiAtom = Atom(
    name: '_BankaMuhtelifIslemlerViewModelBase.dovizKurlariListesi',
    context: context,
  );

  @override
  ObservableList<DovizKurlariModel>? get dovizKurlariListesi {
    _$dovizKurlariListesiAtom.reportRead();
    return super.dovizKurlariListesi;
  }

  @override
  set dovizKurlariListesi(ObservableList<DovizKurlariModel>? value) {
    _$dovizKurlariListesiAtom.reportWrite(value, super.dovizKurlariListesi, () {
      super.dovizKurlariListesi = value;
    });
  }

  late final _$modelAtom = Atom(
    name: '_BankaMuhtelifIslemlerViewModelBase.model',
    context: context,
  );

  @override
  TahsilatRequestModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(TahsilatRequestModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$bankaListesiRequestModelAtom = Atom(
    name: '_BankaMuhtelifIslemlerViewModelBase.bankaListesiRequestModel',
    context: context,
  );

  @override
  BankaListesiRequestModel get bankaListesiRequestModel {
    _$bankaListesiRequestModelAtom.reportRead();
    return super.bankaListesiRequestModel;
  }

  @override
  set bankaListesiRequestModel(BankaListesiRequestModel value) {
    _$bankaListesiRequestModelAtom.reportWrite(
      value,
      super.bankaListesiRequestModel,
      () {
        super.bankaListesiRequestModel = value;
      },
    );
  }

  late final _$seriListAtom = Atom(
    name: '_BankaMuhtelifIslemlerViewModelBase.seriList',
    context: context,
  );

  @override
  ObservableList<SeriModel>? get seriList {
    _$seriListAtom.reportRead();
    return super.seriList;
  }

  @override
  set seriList(ObservableList<SeriModel>? value) {
    _$seriListAtom.reportWrite(value, super.seriList, () {
      super.seriList = value;
    });
  }

  late final _$getSeriAsyncAction = AsyncAction(
    '_BankaMuhtelifIslemlerViewModelBase.getSeri',
    context: context,
  );

  @override
  Future<void> getSeri() {
    return _$getSeriAsyncAction.run(() => super.getSeri());
  }

  late final _$getDovizlerAsyncAction = AsyncAction(
    '_BankaMuhtelifIslemlerViewModelBase.getDovizler',
    context: context,
  );

  @override
  Future<void> getDovizler() {
    return _$getDovizlerAsyncAction.run(() => super.getDovizler());
  }

  late final _$_BankaMuhtelifIslemlerViewModelBaseActionController = ActionController(
    name: '_BankaMuhtelifIslemlerViewModelBase',
    context: context,
  );

  @override
  void setBelgeTuru(String? belgeTuru) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setBelgeTuru',
    );
    try {
      return super.setBelgeTuru(belgeTuru);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setTarih(DateTime? tarih) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setTarih',
    );
    try {
      return super.setTarih(tarih);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSeriNo(String? seriNo) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setSeriNo',
    );
    try {
      return super.setSeriNo(seriNo);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setHesapNo(String? hesapNo) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setHesapNo',
    );
    try {
      return super.setHesapNo(hesapNo);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setMuhasebeKodu(String? muhasebeKodu) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setMuhasebeKodu',
    );
    try {
      return super.setMuhasebeKodu(muhasebeKodu);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setDovizTipi(int? dovizTipi) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setDovizTipi',
    );
    try {
      return super.setDovizTipi(dovizTipi);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setTutar(double? tutar) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setTutar',
    );
    try {
      return super.setTutar(tutar);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setDovizTutari(double? dovizTutari) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setDovizTutari',
    );
    try {
      return super.setDovizTutari(dovizTutari);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setPlasiyerKodu(String? plasiyerKodu) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setPlasiyerKodu',
    );
    try {
      return super.setPlasiyerKodu(plasiyerKodu);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setProjeKodu(String? projeKodu) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setProjeKodu',
    );
    try {
      return super.setProjeKodu(projeKodu);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setAciklama(String? aciklama) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(aciklama);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setDovizKurlariListesi',
    );
    try {
      return super.setDovizKurlariListesi(value);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setSeriList(List<SeriModel>? value) {
    final _$actionInfo = _$_BankaMuhtelifIslemlerViewModelBaseActionController.startAction(
      name: '_BankaMuhtelifIslemlerViewModelBase.setSeriList',
    );
    try {
      return super.setSeriList(value);
    } finally {
      _$_BankaMuhtelifIslemlerViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
dovizKurlariListesi: ${dovizKurlariListesi},
model: ${model},
bankaListesiRequestModel: ${bankaListesiRequestModel},
seriList: ${seriList}
    ''';
  }
}
