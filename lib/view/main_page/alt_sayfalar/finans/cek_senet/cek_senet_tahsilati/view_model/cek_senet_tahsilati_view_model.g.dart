// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_tahsilati_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CekSenetTahsilatiViewModel on _CekSenetTahsilatiViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_CekSenetTahsilatiViewModelBase.model', context: context);

  @override
  SaveCekSenetModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SaveCekSenetModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$_CekSenetTahsilatiViewModelBaseActionController =
      ActionController(
          name: '_CekSenetTahsilatiViewModelBase', context: context);

  @override
  void setGirisTarihi(DateTime? value) {
    final _$actionInfo = _$_CekSenetTahsilatiViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatiViewModelBase.setGirisTarihi');
    try {
      return super.setGirisTarihi(value);
    } finally {
      _$_CekSenetTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatiViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatiViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_CekSenetTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlasiyerKodu(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatiViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatiViewModelBase.setPlasiyerKodu');
    try {
      return super.setPlasiyerKodu(value);
    } finally {
      _$_CekSenetTahsilatiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
