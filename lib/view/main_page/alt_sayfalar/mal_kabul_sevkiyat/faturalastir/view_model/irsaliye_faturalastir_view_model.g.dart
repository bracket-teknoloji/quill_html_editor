// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'irsaliye_faturalastir_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IrsaliyeFaturalastirViewModel
    on _IrsaliyeFaturalastirViewModelBase, Store {
  late final _$requestModelAtom = Atom(
      name: '_IrsaliyeFaturalastirViewModelBase.requestModel',
      context: context);

  @override
  EditFaturaModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(EditFaturaModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$modelAtom =
      Atom(name: '_IrsaliyeFaturalastirViewModelBase.model', context: context);

  @override
  BaseSiparisEditModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(BaseSiparisEditModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$_IrsaliyeFaturalastirViewModelBaseActionController =
      ActionController(
          name: '_IrsaliyeFaturalastirViewModelBase', context: context);

  @override
  void setBasiSiparisEditModel(BaseSiparisEditModel? value) {
    final _$actionInfo =
        _$_IrsaliyeFaturalastirViewModelBaseActionController.startAction(
            name: '_IrsaliyeFaturalastirViewModelBase.setBasiSiparisEditModel');
    try {
      return super.setBasiSiparisEditModel(value);
    } finally {
      _$_IrsaliyeFaturalastirViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCari(String? value) {
    final _$actionInfo = _$_IrsaliyeFaturalastirViewModelBaseActionController
        .startAction(name: '_IrsaliyeFaturalastirViewModelBase.setCari');
    try {
      return super.setCari(value);
    } finally {
      _$_IrsaliyeFaturalastirViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setIrsaliyeNo(String? value) {
    final _$actionInfo = _$_IrsaliyeFaturalastirViewModelBaseActionController
        .startAction(name: '_IrsaliyeFaturalastirViewModelBase.setIrsaliyeNo');
    try {
      return super.setIrsaliyeNo(value);
    } finally {
      _$_IrsaliyeFaturalastirViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setFaturaTarihi(DateTime? value) {
    final _$actionInfo =
        _$_IrsaliyeFaturalastirViewModelBaseActionController.startAction(
            name: '_IrsaliyeFaturalastirViewModelBase.setFaturaTarihi');
    try {
      return super.setFaturaTarihi(value);
    } finally {
      _$_IrsaliyeFaturalastirViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setFaturaNo(String? value) {
    final _$actionInfo = _$_IrsaliyeFaturalastirViewModelBaseActionController
        .startAction(name: '_IrsaliyeFaturalastirViewModelBase.setFaturaNo');
    try {
      return super.setFaturaNo(value);
    } finally {
      _$_IrsaliyeFaturalastirViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setResmiFaturaNo(String? value) {
    final _$actionInfo =
        _$_IrsaliyeFaturalastirViewModelBaseActionController.startAction(
            name: '_IrsaliyeFaturalastirViewModelBase.setResmiFaturaNo');
    try {
      return super.setResmiFaturaNo(value);
    } finally {
      _$_IrsaliyeFaturalastirViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
model: ${model}
    ''';
  }
}
