// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'olcum_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OlcumEkleViewModel on _OlcumEkleViewModelBase, Store {
  late final _$requestModelAtom =
      Atom(name: '_OlcumEkleViewModelBase.requestModel', context: context);

  @override
  OlcumEkleModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(OlcumEkleModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$sendDataAsyncAction =
      AsyncAction('_OlcumEkleViewModelBase.sendData', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>?> sendData(
      BaseEditEnum baseEditEnum) {
    return _$sendDataAsyncAction.run(() => super.sendData(baseEditEnum));
  }

  late final _$_OlcumEkleViewModelBaseActionController =
      ActionController(name: '_OlcumEkleViewModelBase', context: context);

  @override
  void setRequestModel(OlcumEkleModel model) {
    final _$actionInfo = _$_OlcumEkleViewModelBaseActionController.startAction(
        name: '_OlcumEkleViewModelBase.setRequestModel');
    try {
      return super.setRequestModel(model);
    } finally {
      _$_OlcumEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProsesModel(OlcumProsesModel model) {
    final _$actionInfo = _$_OlcumEkleViewModelBaseActionController.startAction(
        name: '_OlcumEkleViewModelBase.addProsesModel');
    try {
      return super.addProsesModel(model);
    } finally {
      _$_OlcumEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel}
    ''';
  }
}
