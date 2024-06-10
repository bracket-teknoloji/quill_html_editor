// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayim_girisi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SayimGirisiViewModel on _SayimGirisiViewModelBase, Store {
  late final _$filtreModelAtom =
      Atom(name: '_SayimGirisiViewModelBase.filtreModel', context: context);

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

  late final _$stokModelAtom =
      Atom(name: '_SayimGirisiViewModelBase.stokModel', context: context);

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
      name: '_SayimGirisiViewModelBase.hemenKaydetsinMi', context: context);

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
      name: '_SayimGirisiViewModelBase.otomatikEtiketYazdir', context: context);

  @override
  bool get otomatikEtiketYazdir {
    _$otomatikEtiketYazdirAtom.reportRead();
    return super.otomatikEtiketYazdir;
  }

  @override
  set otomatikEtiketYazdir(bool value) {
    _$otomatikEtiketYazdirAtom.reportWrite(value, super.otomatikEtiketYazdir,
        () {
      super.otomatikEtiketYazdir = value;
    });
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('_SayimGirisiViewModelBase.deleteItem', context: context);

  @override
  Future<bool?> deleteItem() {
    return _$deleteItemAsyncAction.run(() => super.deleteItem());
  }

  late final _$_SayimGirisiViewModelBaseActionController =
      ActionController(name: '_SayimGirisiViewModelBase', context: context);

  @override
  void setHemenKaydet(bool value) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setHemenKaydet');
    try {
      return super.setHemenKaydet(value);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOtomatikEtiketYazdir(bool value) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setOtomatikEtiketYazdir');
    try {
      return super.setOtomatikEtiketYazdir(value);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokModel(StokListesiModel? model) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setStokModel');
    try {
      return super.setStokModel(model);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjeKodu(BaseProjeModel? value) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setProjeKodu');
    try {
      return super.setProjeKodu(value);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOlcuBirimi(int? value) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setOlcuBirimi');
    try {
      return super.setOlcuBirimi(value);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan1(String? value) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setEkAlan1');
    try {
      return super.setEkAlan1(value);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan2(String? value) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setEkAlan2');
    try {
      return super.setEkAlan2(value);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan3(String? value) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setEkAlan3');
    try {
      return super.setEkAlan3(value);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan4(String? value) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setEkAlan4');
    try {
      return super.setEkAlan4(value);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlan5(String? value) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setEkAlan5');
    try {
      return super.setEkAlan5(value);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeriler(List<SeriList>? list) {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.setSeriler');
    try {
      return super.setSeriler(list);
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseMiktar() {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.increaseMiktar');
    try {
      return super.increaseMiktar();
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseMiktar() {
    final _$actionInfo = _$_SayimGirisiViewModelBaseActionController
        .startAction(name: '_SayimGirisiViewModelBase.decreaseMiktar');
    try {
      return super.decreaseMiktar();
    } finally {
      _$_SayimGirisiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filtreModel: ${filtreModel},
stokModel: ${stokModel},
hemenKaydetsinMi: ${hemenKaydetsinMi},
otomatikEtiketYazdir: ${otomatikEtiketYazdir}
    ''';
  }
}
