// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ortalama_vade_tarihi_hesaplama_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrtalamaVadeTarihiHesaplamaViewModel on _OrtalamaVadeTarihiHesaplamaViewModelBase, Store {
  Computed<int>? _$toplamKayitSayisiComputed;

  @override
  int get toplamKayitSayisi => (_$toplamKayitSayisiComputed ??= Computed<int>(
    () => super.toplamKayitSayisi,
    name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.toplamKayitSayisi',
  )).value;
  Computed<double>? _$toplamTutarComputed;

  @override
  double get toplamTutar => (_$toplamTutarComputed ??= Computed<double>(
    () => super.toplamTutar,
    name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.toplamTutar',
  )).value;
  Computed<double>? _$ortalamaVadeTarihiComputed;

  @override
  double get ortalamaVadeTarihi => (_$ortalamaVadeTarihiComputed ??= Computed<double>(
    () => super.ortalamaVadeTarihi,
    name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.ortalamaVadeTarihi',
  )).value;
  Computed<double>? _$ortalamaVadeTarihi2Computed;

  @override
  double get ortalamaVadeTarihi2 => (_$ortalamaVadeTarihi2Computed ??= Computed<double>(
    () => super.ortalamaVadeTarihi2,
    name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.ortalamaVadeTarihi2',
  )).value;
  Computed<DateTime>? _$ortalamaVadeTarihiDateTimeComputed;

  @override
  DateTime get ortalamaVadeTarihiDateTime => (_$ortalamaVadeTarihiDateTimeComputed ??= Computed<DateTime>(
    () => super.ortalamaVadeTarihiDateTime,
    name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.ortalamaVadeTarihiDateTime',
  )).value;
  Computed<String>? _$ortalamaVadeTarihiStringComputed;

  @override
  String get ortalamaVadeTarihiString => (_$ortalamaVadeTarihiStringComputed ??= Computed<String>(
    () => super.ortalamaVadeTarihiString,
    name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.ortalamaVadeTarihiString',
  )).value;

  late final _$ortalamaVadeTarihiListesiAtom = Atom(
    name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.ortalamaVadeTarihiListesi',
    context: context,
  );

  @override
  ObservableList<OrtalamaVadeTarihiModel> get ortalamaVadeTarihiListesi {
    _$ortalamaVadeTarihiListesiAtom.reportRead();
    return super.ortalamaVadeTarihiListesi;
  }

  @override
  set ortalamaVadeTarihiListesi(ObservableList<OrtalamaVadeTarihiModel> value) {
    _$ortalamaVadeTarihiListesiAtom.reportWrite(value, super.ortalamaVadeTarihiListesi, () {
      super.ortalamaVadeTarihiListesi = value;
    });
  }

  late final _$_OrtalamaVadeTarihiHesaplamaViewModelBaseActionController = ActionController(
    name: '_OrtalamaVadeTarihiHesaplamaViewModelBase',
    context: context,
  );

  @override
  void addOrtalamaVadeTarihiListesi(OrtalamaVadeTarihiModel value) {
    final _$actionInfo = _$_OrtalamaVadeTarihiHesaplamaViewModelBaseActionController.startAction(
      name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.addOrtalamaVadeTarihiListesi',
    );
    try {
      return super.addOrtalamaVadeTarihiListesi(value);
    } finally {
      _$_OrtalamaVadeTarihiHesaplamaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeOrtalamaVadeTarihiListesi(int index) {
    final _$actionInfo = _$_OrtalamaVadeTarihiHesaplamaViewModelBaseActionController.startAction(
      name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.removeOrtalamaVadeTarihiListesi',
    );
    try {
      return super.removeOrtalamaVadeTarihiListesi(index);
    } finally {
      _$_OrtalamaVadeTarihiHesaplamaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearOrtalamaVadeTarihiListesi() {
    final _$actionInfo = _$_OrtalamaVadeTarihiHesaplamaViewModelBaseActionController.startAction(
      name: '_OrtalamaVadeTarihiHesaplamaViewModelBase.clearOrtalamaVadeTarihiListesi',
    );
    try {
      return super.clearOrtalamaVadeTarihiListesi();
    } finally {
      _$_OrtalamaVadeTarihiHesaplamaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ortalamaVadeTarihiListesi: ${ortalamaVadeTarihiListesi},
toplamKayitSayisi: ${toplamKayitSayisi},
toplamTutar: ${toplamTutar},
ortalamaVadeTarihi: ${ortalamaVadeTarihi},
ortalamaVadeTarihi2: ${ortalamaVadeTarihi2},
ortalamaVadeTarihiDateTime: ${ortalamaVadeTarihiDateTime},
ortalamaVadeTarihiString: ${ortalamaVadeTarihiString}
    ''';
  }
}
