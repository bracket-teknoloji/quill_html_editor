// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_detayi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariAktiviteDetayiViewModel on _CariAktiviteDetayiViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: '_CariAktiviteDetayiViewModelBase.model',
    context: context,
  );

  @override
  CariAktiviteListesiModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(CariAktiviteListesiModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_CariAktiviteDetayiViewModelBase.getData',
    context: context,
  );

  @override
  Future<GenericResponseModel<CariAktiviteListesiModel>> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_CariAktiviteDetayiViewModelBaseActionController = ActionController(
    name: '_CariAktiviteDetayiViewModelBase',
    context: context,
  );

  @override
  void setModel(CariAktiviteListesiModel value) {
    final _$actionInfo = _$_CariAktiviteDetayiViewModelBaseActionController.startAction(
      name: '_CariAktiviteDetayiViewModelBase.setModel',
    );
    try {
      return super.setModel(value);
    } finally {
      _$_CariAktiviteDetayiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setTarih(DateTime? value) {
    final _$actionInfo = _$_CariAktiviteDetayiViewModelBaseActionController.startAction(
      name: '_CariAktiviteDetayiViewModelBase.setTarih',
    );
    try {
      return super.setTarih(value);
    } finally {
      _$_CariAktiviteDetayiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setAktiviteTipi(CariAktiviteTipleri? value) {
    final _$actionInfo = _$_CariAktiviteDetayiViewModelBaseActionController.startAction(
      name: '_CariAktiviteDetayiViewModelBase.setAktiviteTipi',
    );
    try {
      return super.setAktiviteTipi(value);
    } finally {
      _$_CariAktiviteDetayiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setBolum(String? value) {
    final _$actionInfo = _$_CariAktiviteDetayiViewModelBaseActionController.startAction(
      name: '_CariAktiviteDetayiViewModelBase.setBolum',
    );
    try {
      return super.setBolum(value);
    } finally {
      _$_CariAktiviteDetayiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setIlgiliKisi(String? value) {
    final _$actionInfo = _$_CariAktiviteDetayiViewModelBaseActionController.startAction(
      name: '_CariAktiviteDetayiViewModelBase.setIlgiliKisi',
    );
    try {
      return super.setIlgiliKisi(value);
    } finally {
      _$_CariAktiviteDetayiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setAciklama(String? value) {
    final _$actionInfo = _$_CariAktiviteDetayiViewModelBaseActionController.startAction(
      name: '_CariAktiviteDetayiViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(value);
    } finally {
      _$_CariAktiviteDetayiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
