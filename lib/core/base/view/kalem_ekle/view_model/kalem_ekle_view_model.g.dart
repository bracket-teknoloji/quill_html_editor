// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kalem_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KalemEkleViewModel on _KalemEkleViewModelBase, Store {
  Computed<bool>? _$dovizliMiComputed;

  @override
  bool get dovizliMi =>
      (_$dovizliMiComputed ??= Computed<bool>(() => super.dovizliMi,
              name: '_KalemEkleViewModelBase.dovizliMi'))
          .value;
  Computed<List<String>>? _$olcuBirimiMapComputed;

  @override
  List<String> get olcuBirimiMap => (_$olcuBirimiMapComputed ??=
          Computed<List<String>>(() => super.olcuBirimiMap,
              name: '_KalemEkleViewModelBase.olcuBirimiMap'))
      .value;
  Computed<bool>? _$koliMiComputed;

  @override
  bool get koliMi => (_$koliMiComputed ??= Computed<bool>(() => super.koliMi,
          name: '_KalemEkleViewModelBase.koliMi'))
      .value;

  late final _$modelAtom =
      Atom(name: '_KalemEkleViewModelBase.model', context: context);

  @override
  StokListesiModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(StokListesiModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$kalemModelAtom =
      Atom(name: '_KalemEkleViewModelBase.kalemModel', context: context);

  @override
  KalemModel get kalemModel {
    _$kalemModelAtom.reportRead();
    return super.kalemModel;
  }

  @override
  set kalemModel(KalemModel value) {
    _$kalemModelAtom.reportWrite(value, super.kalemModel, () {
      super.kalemModel = value;
    });
  }

  late final _$_KalemEkleViewModelBaseActionController =
      ActionController(name: '_KalemEkleViewModelBase', context: context);

  @override
  void setModel(StokListesiModel? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKoliMi() {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setKoliMi');
    try {
      return super.setKoliMi();
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktarEnabled() {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setMiktarEnabled');
    try {
      return super.setMiktarEnabled();
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMuhasebeKodu(String? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setMuhasebeKodu');
    try {
      return super.setMuhasebeKodu(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKalemModel(KalemModel? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setKalemModel');
    try {
      return super.setKalemModel(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizAdi(String? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setDovizAdi');
    try {
      return super.setDovizAdi(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDovizFiyati(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setDovizFiyati');
    try {
      return super.setDovizFiyati(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOlcuBirimi(MapEntry<String, int>? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setOlcuBirimi');
    try {
      return super.setOlcuBirimi(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFiyat(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setFiyat');
    try {
      return super.setFiyat(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjeKodu(String? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setProjeKodu');
    try {
      return super.setProjeKodu(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepoKodu(int? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setDepoKodu');
    try {
      return super.setDepoKodu(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKosul(String? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setKosul');
    try {
      return super.setKosul(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar(int? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setMiktar');
    try {
      return super.setMiktar(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBrutFiyat(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setBrutFiyat');
    try {
      return super.setBrutFiyat(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMFTutari(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setMFTutari');
    try {
      return super.setMFTutari(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKdvOrani(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setKdvOrani');
    try {
      return super.setKdvOrani(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIskonto1(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setIskonto1');
    try {
      return super.setIskonto1(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIskonto2(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setIskonto2');
    try {
      return super.setIskonto2(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIskonto3(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setIskonto3');
    try {
      return super.setIskonto3(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIskonto4(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setIskonto4');
    try {
      return super.setIskonto4(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIskonto5(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setIskonto5');
    try {
      return super.setIskonto5(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIskonto6(double? value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setIskonto6');
    try {
      return super.setIskonto6(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKalemList(List<KalemModel>? list) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setKalemList');
    try {
      return super.setKalemList(list);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIskonto1OranMi() {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setIskonto1OranMi');
    try {
      return super.setIskonto1OranMi();
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseMiktar(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.increaseMiktar');
    try {
      return super.increaseMiktar(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseMiktar(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.decreaseMiktar');
    try {
      return super.decreaseMiktar(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseMiktar2(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.increaseMiktar2');
    try {
      return super.increaseMiktar2(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar2(int value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setMiktar2');
    try {
      return super.setMiktar2(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseMiktar2(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.decreaseMiktar2');
    try {
      return super.decreaseMiktar2(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseMFMiktar(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.increaseMFMiktar');
    try {
      return super.increaseMFMiktar(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMFMiktar(int value) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.setMFMiktar');
    try {
      return super.setMFMiktar(value);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseMFMiktar(TextEditingController controller) {
    final _$actionInfo = _$_KalemEkleViewModelBaseActionController.startAction(
        name: '_KalemEkleViewModelBase.decreaseMFMiktar');
    try {
      return super.decreaseMFMiktar(controller);
    } finally {
      _$_KalemEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
kalemModel: ${kalemModel},
dovizliMi: ${dovizliMi},
olcuBirimiMap: ${olcuBirimiMap},
koliMi: ${koliMi}
    ''';
  }
}
