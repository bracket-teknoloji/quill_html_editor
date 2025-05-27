// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_kalem_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DekontKalemEkleViewModel on _DekontKalemEkleViewModelBase, Store {
  Computed<List<bool>>? _$selectedBorcTipiComputed;

  @override
  List<bool> get selectedBorcTipi => (_$selectedBorcTipiComputed ??=
          Computed<List<bool>>(() => super.selectedBorcTipi,
              name: '_DekontKalemEkleViewModelBase.selectedBorcTipi'))
      .value;
  Computed<List<bool>>? _$selectedHesapTipiComputed;

  @override
  List<bool> get selectedHesapTipi => (_$selectedHesapTipiComputed ??=
          Computed<List<bool>>(() => super.selectedHesapTipi,
              name: '_DekontKalemEkleViewModelBase.selectedHesapTipi'))
      .value;

  late final _$modelAtom =
      Atom(name: '_DekontKalemEkleViewModelBase.model', context: context);

  @override
  DekontKalemler get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  bool _modelIsInitialized = false;

  @override
  set model(DekontKalemler value) {
    _$modelAtom.reportWrite(value, _modelIsInitialized ? super.model : null,
        () {
      super.model = value;
      _modelIsInitialized = true;
    });
  }

  late final _$dovizKurlariListesiAtom = Atom(
      name: '_DekontKalemEkleViewModelBase.dovizKurlariListesi',
      context: context);

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

  late final _$getDovizlerAsyncAction = AsyncAction(
      '_DekontKalemEkleViewModelBase.getDovizler',
      context: context);

  @override
  Future<void> getDovizler() {
    return _$getDovizlerAsyncAction.run(() => super.getDovizler());
  }

  late final _$_DekontKalemEkleViewModelBaseActionController =
      ActionController(name: '_DekontKalemEkleViewModelBase', context: context);

  @override
  void setModel(DekontKalemler value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBa(int value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setBa');
    try {
      return super.setBa(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapTipi(int value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setHesapTipi');
    try {
      return super.setHesapTipi(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepoKodu(DepoList? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setDepoKodu');
    try {
      return super.setDepoKodu(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHesapKodu(String? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setHesapKodu');
    try {
      return super.setHesapKodu(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKalemAdi(String? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setKalemAdi');
    try {
      return super.setKalemAdi(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(DovizList? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setDovizTipi');
    try {
      return super.setDovizTipi(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTutari(double? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setDovizTutari');
    try {
      return super.setDovizTutari(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTutar(double? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setTutar');
    try {
      return super.setTutar(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setAciklama');
    try {
      return super.setAciklama(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExportTipi(int? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setExportTipi');
    try {
      return super.setExportTipi(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExportRefNo(String? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setExportRefNo');
    try {
      return super.setExportRefNo(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(PlasiyerList? value) {
    final _$actionInfo = _$_DekontKalemEkleViewModelBaseActionController
        .startAction(name: '_DekontKalemEkleViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    final _$actionInfo =
        _$_DekontKalemEkleViewModelBaseActionController.startAction(
            name: '_DekontKalemEkleViewModelBase.setDovizKurlariListesi');
    try {
      return super.setDovizKurlariListesi(value);
    } finally {
      _$_DekontKalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
dovizKurlariListesi: ${dovizKurlariListesi},
selectedBorcTipi: ${selectedBorcTipi},
selectedHesapTipi: ${selectedHesapTipi}
    ''';
  }
}
