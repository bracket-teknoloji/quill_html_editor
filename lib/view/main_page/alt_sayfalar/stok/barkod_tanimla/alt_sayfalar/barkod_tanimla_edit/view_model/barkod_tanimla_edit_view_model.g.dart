// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barkod_tanimla_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BarkodTanimlaEditViewModel on _BarkodTanimlaEditViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: '_BarkodTanimlaEditViewModelBase.model',
    context: context,
  );

  @override
  BarkodTanimlaKayitlariModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(BarkodTanimlaKayitlariModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$sendDataAsyncAction = AsyncAction(
    '_BarkodTanimlaEditViewModelBase.sendData',
    context: context,
  );

  @override
  Future<GenericResponseModel<BarkodTanimlaKayitlariModel>> sendData() {
    return _$sendDataAsyncAction.run(() => super.sendData());
  }

  late final _$getBarkodAsyncAction = AsyncAction(
    '_BarkodTanimlaEditViewModelBase.getBarkod',
    context: context,
  );

  @override
  Future<GenericResponseModel<StokOlcuBirimleriModel>> getBarkod() {
    return _$getBarkodAsyncAction.run(() => super.getBarkod());
  }

  late final _$_BarkodTanimlaEditViewModelBaseActionController =
      ActionController(
        name: '_BarkodTanimlaEditViewModelBase',
        context: context,
      );

  @override
  void setStokKodu(String? value) {
    final _$actionInfo = _$_BarkodTanimlaEditViewModelBaseActionController
        .startAction(name: '_BarkodTanimlaEditViewModelBase.setStokKodu');
    try {
      return super.setStokKodu(value);
    } finally {
      _$_BarkodTanimlaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBarkod(String? value) {
    final _$actionInfo = _$_BarkodTanimlaEditViewModelBaseActionController
        .startAction(name: '_BarkodTanimlaEditViewModelBase.setBarkod');
    try {
      return super.setBarkod(value);
    } finally {
      _$_BarkodTanimlaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBarkodTipi(BarkodTipiEnum? value) {
    final _$actionInfo = _$_BarkodTanimlaEditViewModelBaseActionController
        .startAction(name: '_BarkodTanimlaEditViewModelBase.setBarkodTipi');
    try {
      return super.setBarkodTipi(value);
    } finally {
      _$_BarkodTanimlaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirim(int? value) {
    final _$actionInfo = _$_BarkodTanimlaEditViewModelBaseActionController
        .startAction(name: '_BarkodTanimlaEditViewModelBase.setBirim');
    try {
      return super.setBirim(value);
    } finally {
      _$_BarkodTanimlaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_BarkodTanimlaEditViewModelBaseActionController
        .startAction(name: '_BarkodTanimlaEditViewModelBase.setAciklama');
    try {
      return super.setAciklama(value);
    } finally {
      _$_BarkodTanimlaEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
