// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_tahsilat_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CekSenetTahsilatEkleViewModel
    on _CekSenetTahsilatEkleViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_CekSenetTahsilatEkleViewModelBase.model', context: context);

  @override
  CekSenetkalemlerModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CekSenetkalemlerModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$_CekSenetTahsilatEkleViewModelBaseActionController =
      ActionController(
          name: '_CekSenetTahsilatEkleViewModelBase', context: context);

  @override
  void setCiroTipi(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setCiroTipi');
    try {
      return super.setCiroTipi(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setVadeTarihi(DateTime? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setVadeTarihi');
    try {
      return super.setVadeTarihi(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDovizTipi(String? value) {
    final _$actionInfo = _$_CekSenetTahsilatEkleViewModelBaseActionController
        .startAction(name: '_CekSenetTahsilatEkleViewModelBase.setDovizTipi');
    try {
      return super.setDovizTipi(value);
    } finally {
      _$_CekSenetTahsilatEkleViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
