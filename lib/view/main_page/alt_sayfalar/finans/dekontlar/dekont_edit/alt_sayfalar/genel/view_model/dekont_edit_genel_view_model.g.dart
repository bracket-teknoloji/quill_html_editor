// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dekont_edit_genel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DekontEditGenelViewModel on _DekontEditGenelViewModelBase, Store {
  late final _$dekontIslemlerRequestModelAtom = Atom(
    name: '_DekontEditGenelViewModelBase.dekontIslemlerRequestModel',
    context: context,
  );

  @override
  DekontIslemlerRequestModel get dekontIslemlerRequestModel {
    _$dekontIslemlerRequestModelAtom.reportRead();
    return super.dekontIslemlerRequestModel;
  }

  @override
  set dekontIslemlerRequestModel(DekontIslemlerRequestModel value) {
    _$dekontIslemlerRequestModelAtom.reportWrite(
      value,
      super.dekontIslemlerRequestModel,
      () {
        super.dekontIslemlerRequestModel = value;
      },
    );
  }

  late final _$_DekontEditGenelViewModelBaseActionController = ActionController(
    name: '_DekontEditGenelViewModelBase',
    context: context,
  );

  @override
  void setSingleton() {
    final _$actionInfo = _$_DekontEditGenelViewModelBaseActionController
        .startAction(name: '_DekontEditGenelViewModelBase.setSingleton');
    try {
      return super.setSingleton();
    } finally {
      _$_DekontEditGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_DekontEditGenelViewModelBaseActionController
        .startAction(name: '_DekontEditGenelViewModelBase.setTarih');
    try {
      return super.setTarih(value);
    } finally {
      _$_DekontEditGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeri(SeriModel? value) {
    final _$actionInfo = _$_DekontEditGenelViewModelBaseActionController
        .startAction(name: '_DekontEditGenelViewModelBase.setSeri');
    try {
      return super.setSeri(value);
    } finally {
      _$_DekontEditGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(PlasiyerList? value) {
    final _$actionInfo = _$_DekontEditGenelViewModelBaseActionController
        .startAction(name: '_DekontEditGenelViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_DekontEditGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProjeKodu(BaseProjeModel? value) {
    final _$actionInfo = _$_DekontEditGenelViewModelBaseActionController
        .startAction(name: '_DekontEditGenelViewModelBase.setProjeKodu');
    try {
      return super.setProjeKodu(value);
    } finally {
      _$_DekontEditGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dekontIslemlerRequestModel: ${dekontIslemlerRequestModel}
    ''';
  }
}
