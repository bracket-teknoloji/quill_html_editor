// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_detayi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriDetayiViewModel on _SeriDetayiViewModelBase, Store {
  late final _$seriEtiketiYazdirAtom = Atom(
    name: '_SeriDetayiViewModelBase.seriEtiketiYazdir',
    context: context,
  );

  @override
  bool get seriEtiketiYazdir {
    _$seriEtiketiYazdirAtom.reportRead();
    return super.seriEtiketiYazdir;
  }

  @override
  set seriEtiketiYazdir(bool value) {
    _$seriEtiketiYazdirAtom.reportWrite(value, super.seriEtiketiYazdir, () {
      super.seriEtiketiYazdir = value;
    });
  }

  late final _$seriModelAtom = Atom(
    name: '_SeriDetayiViewModelBase.seriModel',
    context: context,
  );

  @override
  SeriList get seriModel {
    _$seriModelAtom.reportRead();
    return super.seriModel;
  }

  @override
  set seriModel(SeriList value) {
    _$seriModelAtom.reportWrite(value, super.seriModel, () {
      super.seriModel = value;
    });
  }

  late final _$_SeriDetayiViewModelBaseActionController = ActionController(
    name: '_SeriDetayiViewModelBase',
    context: context,
  );

  @override
  void setSeriModel(SeriList model) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setSeriModel',
    );
    try {
      return super.setSeriModel(model);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSeriEtiketYazdir() {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.changeSeriEtiketYazdir',
    );
    try {
      return super.changeSeriEtiketYazdir();
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeri1(String? value) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setSeri1',
    );
    try {
      return super.setSeri1(value);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeri2(String? value) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setSeri2',
    );
    try {
      return super.setSeri2(value);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeri3(String? value) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setSeri3',
    );
    try {
      return super.setSeri3(value);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeri4(String? value) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setSeri4',
    );
    try {
      return super.setSeri4(value);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSonKullanmaTarihi(DateTime? datetime) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setSonKullanmaTarihi',
    );
    try {
      return super.setSonKullanmaTarihi(datetime);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar(double miktar) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setMiktar',
    );
    try {
      return super.setMiktar(miktar);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAcik1(String? value) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setAcik1',
    );
    try {
      return super.setAcik1(value);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAcik2(String? value) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setAcik2',
    );
    try {
      return super.setAcik2(value);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAcik3(String? value) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setAcik3',
    );
    try {
      return super.setAcik3(value);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAcik4(String? value) {
    final _$actionInfo = _$_SeriDetayiViewModelBaseActionController.startAction(
      name: '_SeriDetayiViewModelBase.setAcik4',
    );
    try {
      return super.setAcik4(value);
    } finally {
      _$_SeriDetayiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seriEtiketiYazdir: ${seriEtiketiYazdir},
seriModel: ${seriModel}
    ''';
  }
}
