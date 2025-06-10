// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SayimEditViewModel on _SayimEditViewModelBase, Store {
  Computed<bool>? _$indexSifirMiComputed;

  @override
  bool get indexSifirMi => (_$indexSifirMiComputed ??= Computed<bool>(
    () => super.indexSifirMi,
    name: '_SayimEditViewModelBase.indexSifirMi',
  )).value;
  Computed<ObservableList<SayimFiltreModel>?>? _$sayimListesiComputed;

  @override
  ObservableList<SayimFiltreModel>? get sayimListesi =>
      (_$sayimListesiComputed ??= Computed<ObservableList<SayimFiltreModel>?>(
        () => super.sayimListesi,
        name: '_SayimEditViewModelBase.sayimListesi',
      )).value;

  late final _$tabIndexAtom = Atom(
    name: '_SayimEditViewModelBase.tabIndex',
    context: context,
  );

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  late final _$faturaRequestModelAtom = Atom(
    name: '_SayimEditViewModelBase.faturaRequestModel',
    context: context,
  );

  @override
  SiparislerRequestModel get faturaRequestModel {
    _$faturaRequestModelAtom.reportRead();
    return super.faturaRequestModel;
  }

  @override
  set faturaRequestModel(SiparislerRequestModel value) {
    _$faturaRequestModelAtom.reportWrite(value, super.faturaRequestModel, () {
      super.faturaRequestModel = value;
    });
  }

  late final _$sayimListesiModelAtom = Atom(
    name: '_SayimEditViewModelBase.sayimListesiModel',
    context: context,
  );

  @override
  SayimListesiModel? get sayimListesiModel {
    _$sayimListesiModelAtom.reportRead();
    return super.sayimListesiModel;
  }

  @override
  set sayimListesiModel(SayimListesiModel? value) {
    _$sayimListesiModelAtom.reportWrite(value, super.sayimListesiModel, () {
      super.sayimListesiModel = value;
    });
  }

  late final _$filtreModelAtom = Atom(
    name: '_SayimEditViewModelBase.filtreModel',
    context: context,
  );

  @override
  SayimFiltreModel get filtreModel {
    _$filtreModelAtom.reportRead();
    return super.filtreModel;
  }

  @override
  set filtreModel(SayimFiltreModel value) {
    _$filtreModelAtom.reportWrite(value, super.filtreModel, () {
      super.filtreModel = value;
    });
  }

  late final _$stokModelAtom = Atom(
    name: '_SayimEditViewModelBase.stokModel',
    context: context,
  );

  @override
  StokListesiModel? get stokModel {
    _$stokModelAtom.reportRead();
    return super.stokModel;
  }

  @override
  set stokModel(StokListesiModel? value) {
    _$stokModelAtom.reportWrite(value, super.stokModel, () {
      super.stokModel = value;
    });
  }

  late final _$hemenKaydetsinMiAtom = Atom(
    name: '_SayimEditViewModelBase.hemenKaydetsinMi',
    context: context,
  );

  @override
  bool get hemenKaydetsinMi {
    _$hemenKaydetsinMiAtom.reportRead();
    return super.hemenKaydetsinMi;
  }

  @override
  set hemenKaydetsinMi(bool value) {
    _$hemenKaydetsinMiAtom.reportWrite(value, super.hemenKaydetsinMi, () {
      super.hemenKaydetsinMi = value;
    });
  }

  late final _$otomatikEtiketYazdirAtom = Atom(
    name: '_SayimEditViewModelBase.otomatikEtiketYazdir',
    context: context,
  );

  @override
  bool get otomatikEtiketYazdir {
    _$otomatikEtiketYazdirAtom.reportRead();
    return super.otomatikEtiketYazdir;
  }

  @override
  set otomatikEtiketYazdir(bool value) {
    _$otomatikEtiketYazdirAtom.reportWrite(
      value,
      super.otomatikEtiketYazdir,
      () {
        super.otomatikEtiketYazdir = value;
      },
    );
  }

  late final _$nqrOkutuldugundaQRAcAtom = Atom(
    name: '_SayimEditViewModelBase.nqrOkutuldugundaQRAc',
    context: context,
  );

  @override
  bool get nqrOkutuldugundaQRAc {
    _$nqrOkutuldugundaQRAcAtom.reportRead();
    return super.nqrOkutuldugundaQRAc;
  }

  @override
  set nqrOkutuldugundaQRAc(bool value) {
    _$nqrOkutuldugundaQRAcAtom.reportWrite(
      value,
      super.nqrOkutuldugundaQRAc,
      () {
        super.nqrOkutuldugundaQRAc = value;
      },
    );
  }

  late final _$printModelAtom = Atom(
    name: '_SayimEditViewModelBase.printModel',
    context: context,
  );

  @override
  PrintModel get printModel {
    _$printModelAtom.reportRead();
    return super.printModel;
  }

  @override
  set printModel(PrintModel value) {
    _$printModelAtom.reportWrite(value, super.printModel, () {
      super.printModel = value;
    });
  }

  late final _$_sayimListesiAtom = Atom(
    name: '_SayimEditViewModelBase._sayimListesi',
    context: context,
  );

  @override
  ObservableList<SayimFiltreModel>? get _sayimListesi {
    _$_sayimListesiAtom.reportRead();
    return super._sayimListesi;
  }

  @override
  set _sayimListesi(ObservableList<SayimFiltreModel>? value) {
    _$_sayimListesiAtom.reportWrite(value, super._sayimListesi, () {
      super._sayimListesi = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_SayimEditViewModelBase.requestModel',
    context: context,
  );

  @override
  SayilanKalemlerRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(SayilanKalemlerRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$filterTextAtom = Atom(
    name: '_SayimEditViewModelBase.filterText',
    context: context,
  );

  @override
  String get filterText {
    _$filterTextAtom.reportRead();
    return super.filterText;
  }

  @override
  set filterText(String value) {
    _$filterTextAtom.reportWrite(value, super.filterText, () {
      super.filterText = value;
    });
  }

  late final _$sendDataAsyncAction = AsyncAction(
    '_SayimEditViewModelBase.sendData',
    context: context,
  );

  @override
  Future<GenericResponseModel<SayimListesiModel>> sendData(int depoKodu) {
    return _$sendDataAsyncAction.run(() => super.sendData(depoKodu));
  }

  late final _$sayimiBitirAsyncAction = AsyncAction(
    '_SayimEditViewModelBase.sayimiBitir',
    context: context,
  );

  @override
  Future<bool> sayimiBitir() {
    return _$sayimiBitirAsyncAction.run(() => super.sayimiBitir());
  }

  late final _$deleteItemAsyncAction = AsyncAction(
    '_SayimEditViewModelBase.deleteItem',
    context: context,
  );

  @override
  Future<bool?> deleteItem(SayimFiltreModel model) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(model));
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_SayimEditViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$getSelectedItemAsyncAction = AsyncAction(
    '_SayimEditViewModelBase.getSelectedItem',
    context: context,
  );

  @override
  Future<SayimFiltreModel?> getSelectedItem(SayimFiltreModel? model) {
    return _$getSelectedItemAsyncAction.run(() => super.getSelectedItem(model));
  }

  late final _$_SayimEditViewModelBaseActionController = ActionController(
    name: '_SayimEditViewModelBase',
    context: context,
  );

  @override
  void setSayimListesiModel(SayimListesiModel? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setSayimListesiModel',
    );
    try {
      return super.setSayimListesiModel(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTabIndex(int value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setTabIndex',
    );
    try {
      return super.setTabIndex(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFiltreModel(SayimFiltreModel? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setFiltreModel',
    );
    try {
      return super.setFiltreModel(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokModel(StokListesiModel? model) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setStokModel',
    );
    try {
      return super.setStokModel(model);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHemenKaydet(bool value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setHemenKaydet',
    );
    try {
      return super.setHemenKaydet(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrintModel(PrintModel? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setPrintModel',
    );
    try {
      return super.setPrintModel(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOtomatikEtiketYazdir(bool value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setOtomatikEtiketYazdir',
    );
    try {
      return super.setOtomatikEtiketYazdir(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNqrOkutuldugundaQRAc(bool value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setNqrOkutuldugundaQRAc',
    );
    try {
      return super.setNqrOkutuldugundaQRAc(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjeKodu(BaseProjeModel? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setProjeKodu',
    );
    try {
      return super.setProjeKodu(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOlcuBirimi(int? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setOlcuBirimi',
    );
    try {
      return super.setOlcuBirimi(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan1(String? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setEkAlan1',
    );
    try {
      return super.setEkAlan1(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan2(String? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setEkAlan2',
    );
    try {
      return super.setEkAlan2(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan3(String? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setEkAlan3',
    );
    try {
      return super.setEkAlan3(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan4(String? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setEkAlan4',
    );
    try {
      return super.setEkAlan4(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan5(String? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setEkAlan5',
    );
    try {
      return super.setEkAlan5(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeriler(List<SeriList>? list) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setSeriler',
    );
    try {
      return super.setSeriler(list);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseMiktar() {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.increaseMiktar',
    );
    try {
      return super.increaseMiktar();
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar(double? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setMiktar',
    );
    try {
      return super.setMiktar(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseMiktar() {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.decreaseMiktar',
    );
    try {
      return super.decreaseMiktar();
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSayimListesi(List<SayimFiltreModel>? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setSayimListesi',
    );
    try {
      return super.setSayimListesi(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilterText(String? value) {
    final _$actionInfo = _$_SayimEditViewModelBaseActionController.startAction(
      name: '_SayimEditViewModelBase.setFilterText',
    );
    try {
      return super.setFilterText(value);
    } finally {
      _$_SayimEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabIndex: ${tabIndex},
faturaRequestModel: ${faturaRequestModel},
sayimListesiModel: ${sayimListesiModel},
filtreModel: ${filtreModel},
stokModel: ${stokModel},
hemenKaydetsinMi: ${hemenKaydetsinMi},
otomatikEtiketYazdir: ${otomatikEtiketYazdir},
nqrOkutuldugundaQRAc: ${nqrOkutuldugundaQRAc},
printModel: ${printModel},
requestModel: ${requestModel},
filterText: ${filterText},
indexSifirMi: ${indexSifirMi},
sayimListesi: ${sayimListesi}
    ''';
  }
}
