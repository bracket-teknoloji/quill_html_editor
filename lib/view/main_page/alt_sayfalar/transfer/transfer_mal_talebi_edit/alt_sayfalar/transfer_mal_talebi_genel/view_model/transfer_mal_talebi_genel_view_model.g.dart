// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_mal_talebi_genel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransferMalTalebiGenelViewModel on _TransferMalTalebiGenelViewModelBase, Store {
  late final _$modelAtom = Atom(name: '_TransferMalTalebiGenelViewModelBase.model', context: context);

  @override
  BaseSiparisEditModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(BaseSiparisEditModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$_TransferMalTalebiGenelViewModelBaseActionController = ActionController(
    name: '_TransferMalTalebiGenelViewModelBase',
    context: context,
  );

  @override
  void setModel(BaseSiparisEditModel value) {
    final _$actionInfo = _$_TransferMalTalebiGenelViewModelBaseActionController.startAction(
      name: '_TransferMalTalebiGenelViewModelBase.setModel',
    );
    try {
      return super.setModel(value);
    } finally {
      _$_TransferMalTalebiGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_TransferMalTalebiGenelViewModelBaseActionController.startAction(
      name: '_TransferMalTalebiGenelViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(value);
    } finally {
      _$_TransferMalTalebiGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHedefSube(SubeList? value) {
    final _$actionInfo = _$_TransferMalTalebiGenelViewModelBaseActionController.startAction(
      name: '_TransferMalTalebiGenelViewModelBase.setHedefSube',
    );
    try {
      return super.setHedefSube(value);
    } finally {
      _$_TransferMalTalebiGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepoKodu(DepoList? value) {
    final _$actionInfo = _$_TransferMalTalebiGenelViewModelBaseActionController.startAction(
      name: '_TransferMalTalebiGenelViewModelBase.setDepoKodu',
    );
    try {
      return super.setDepoKodu(value);
    } finally {
      _$_TransferMalTalebiGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEmri(IsEmirleriModel? value) {
    final _$actionInfo = _$_TransferMalTalebiGenelViewModelBaseActionController.startAction(
      name: '_TransferMalTalebiGenelViewModelBase.setIsEmri',
    );
    try {
      return super.setIsEmri(value);
    } finally {
      _$_TransferMalTalebiGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
