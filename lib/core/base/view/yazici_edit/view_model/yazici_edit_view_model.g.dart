// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yazici_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$YaziciEditViewModel on _YaziciEditViewModelBase, Store {
  late final _$yaziciModelAtom = Atom(
    name: '_YaziciEditViewModelBase.yaziciModel',
    context: context,
  );

  @override
  YaziciModel get yaziciModel {
    _$yaziciModelAtom.reportRead();
    return super.yaziciModel;
  }

  @override
  set yaziciModel(YaziciModel value) {
    _$yaziciModelAtom.reportWrite(value, super.yaziciModel, () {
      super.yaziciModel = value;
    });
  }

  late final _$_YaziciEditViewModelBaseActionController = ActionController(
    name: '_YaziciEditViewModelBase',
    context: context,
  );

  @override
  void setYaziciModel(YaziciModel value) {
    final _$actionInfo = _$_YaziciEditViewModelBaseActionController.startAction(
      name: '_YaziciEditViewModelBase.setYaziciModel',
    );
    try {
      return super.setYaziciModel(value);
    } finally {
      _$_YaziciEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYaziciAdi(String? value) {
    final _$actionInfo = _$_YaziciEditViewModelBaseActionController.startAction(
      name: '_YaziciEditViewModelBase.setYaziciAdi',
    );
    try {
      return super.setYaziciAdi(value);
    } finally {
      _$_YaziciEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMACAdresi(String value) {
    final _$actionInfo = _$_YaziciEditViewModelBaseActionController.startAction(
      name: '_YaziciEditViewModelBase.setMACAdresi',
    );
    try {
      return super.setMACAdresi(value);
    } finally {
      _$_YaziciEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_YaziciEditViewModelBaseActionController.startAction(
      name: '_YaziciEditViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(value);
    } finally {
      _$_YaziciEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYaziciTipi(YaziciTipi value) {
    final _$actionInfo = _$_YaziciEditViewModelBaseActionController.startAction(
      name: '_YaziciEditViewModelBase.setYaziciTipi',
    );
    try {
      return super.setYaziciTipi(value);
    } finally {
      _$_YaziciEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
yaziciModel: ${yaziciModel}
    ''';
  }
}
