// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cek_senet_evrak_ekle_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CekSenetEvrakEkleViewModel on _CekSenetEvrakEkleViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: '_CekSenetEvrakEkleViewModelBase.model',
    context: context,
  );

  @override
  CekSenetEvrakEkleModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  bool _modelIsInitialized = false;

  @override
  set model(CekSenetEvrakEkleModel value) {
    _$modelAtom.reportWrite(
      value,
      _modelIsInitialized ? super.model : null,
      () {
        super.model = value;
        _modelIsInitialized = true;
      },
    );
  }

  late final _$base64DataAtom = Atom(
    name: '_CekSenetEvrakEkleViewModelBase.base64Data',
    context: context,
  );

  @override
  String? get base64Data {
    _$base64DataAtom.reportRead();
    return super.base64Data;
  }

  @override
  set base64Data(String? value) {
    _$base64DataAtom.reportWrite(value, super.base64Data, () {
      super.base64Data = value;
    });
  }

  late final _$saveDataAsyncAction = AsyncAction(
    '_CekSenetEvrakEkleViewModelBase.saveData',
    context: context,
  );

  @override
  Future<GenericResponseModel<CekSenetListesiModel>> saveData() {
    return _$saveDataAsyncAction.run(() => super.saveData());
  }

  late final _$_CekSenetEvrakEkleViewModelBaseActionController = ActionController(
    name: '_CekSenetEvrakEkleViewModelBase',
    context: context,
  );

  @override
  void setBase64Data(String? base64Data) {
    final _$actionInfo = _$_CekSenetEvrakEkleViewModelBaseActionController.startAction(
      name: '_CekSenetEvrakEkleViewModelBase.setBase64Data',
    );
    try {
      return super.setBase64Data(base64Data);
    } finally {
      _$_CekSenetEvrakEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBoyutByte(int? boyutByte) {
    final _$actionInfo = _$_CekSenetEvrakEkleViewModelBaseActionController.startAction(
      name: '_CekSenetEvrakEkleViewModelBase.setBoyutByte',
    );
    try {
      return super.setBoyutByte(boyutByte);
    } finally {
      _$_CekSenetEvrakEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? aciklama) {
    final _$actionInfo = _$_CekSenetEvrakEkleViewModelBaseActionController.startAction(
      name: '_CekSenetEvrakEkleViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(aciklama);
    } finally {
      _$_CekSenetEvrakEkleViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
base64Data: ${base64Data}
    ''';
  }
}
