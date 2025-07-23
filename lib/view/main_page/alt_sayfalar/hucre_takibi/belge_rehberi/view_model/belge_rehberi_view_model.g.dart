// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belge_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BelgeRehberiViewModel on _BelgeRehberiViewModelBase, Store {
  late final _$belgeRehberiListAtom = Atom(
    name: '_BelgeRehberiViewModelBase.belgeRehberiList',
    context: context,
  );

  @override
  ObservableList<BelgeRehberiModel>? get belgeRehberiList {
    _$belgeRehberiListAtom.reportRead();
    return super.belgeRehberiList;
  }

  @override
  set belgeRehberiList(ObservableList<BelgeRehberiModel>? value) {
    _$belgeRehberiListAtom.reportWrite(value, super.belgeRehberiList, () {
      super.belgeRehberiList = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_BelgeRehberiViewModelBase.requestModel',
    context: context,
  );

  @override
  BelgeRehberiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(BelgeRehberiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_BelgeRehberiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_BelgeRehberiViewModelBaseActionController = ActionController(
    name: '_BelgeRehberiViewModelBase',
    context: context,
  );

  @override
  void setHucreTransferiModel(BelgeRehberiRequestModel model) {
    final _$actionInfo = _$_BelgeRehberiViewModelBaseActionController
        .startAction(name: '_BelgeRehberiViewModelBase.setHucreTransferiModel');
    try {
      return super.setHucreTransferiModel(model);
    } finally {
      _$_BelgeRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_BelgeRehberiViewModelBaseActionController
        .startAction(name: '_BelgeRehberiViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_BelgeRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeRehberiList(List<BelgeRehberiModel>? list) {
    final _$actionInfo = _$_BelgeRehberiViewModelBaseActionController
        .startAction(name: '_BelgeRehberiViewModelBase.setBelgeRehberiList');
    try {
      return super.setBelgeRehberiList(list);
    } finally {
      _$_BelgeRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
belgeRehberiList: ${belgeRehberiList},
requestModel: ${requestModel}
    ''';
  }
}
