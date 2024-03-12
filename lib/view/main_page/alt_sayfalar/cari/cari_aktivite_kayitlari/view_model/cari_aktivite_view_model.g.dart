// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_aktivite_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariAktiviteViewModel on _CariAktiviteViewModelBase, Store {
  late final _$requestModelAtom =
      Atom(name: '_CariAktiviteViewModelBase.requestModel', context: context);

  @override
  CariListesiRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(CariListesiRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$aktiviteListAtom =
      Atom(name: '_CariAktiviteViewModelBase.aktiviteList', context: context);

  @override
  ObservableList<CariAktiviteListesiModel>? get aktiviteList {
    _$aktiviteListAtom.reportRead();
    return super.aktiviteList;
  }

  @override
  set aktiviteList(ObservableList<CariAktiviteListesiModel>? value) {
    _$aktiviteListAtom.reportWrite(value, super.aktiviteList, () {
      super.aktiviteList = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_CariAktiviteViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_CariAktiviteViewModelBaseActionController =
      ActionController(name: '_CariAktiviteViewModelBase', context: context);

  @override
  void setCariKodu(String? value) {
    final _$actionInfo = _$_CariAktiviteViewModelBaseActionController
        .startAction(name: '_CariAktiviteViewModelBase.setCariKodu');
    try {
      return super.setCariKodu(value);
    } finally {
      _$_CariAktiviteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKullanici(String? value) {
    final _$actionInfo = _$_CariAktiviteViewModelBaseActionController
        .startAction(name: '_CariAktiviteViewModelBase.setKullanici');
    try {
      return super.setKullanici(value);
    } finally {
      _$_CariAktiviteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAktiviteList(List<CariAktiviteListesiModel>? value) {
    final _$actionInfo = _$_CariAktiviteViewModelBaseActionController
        .startAction(name: '_CariAktiviteViewModelBase.setAktiviteList');
    try {
      return super.setAktiviteList(value);
    } finally {
      _$_CariAktiviteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBaslangicTarihi(DateTime? value) {
    final _$actionInfo = _$_CariAktiviteViewModelBaseActionController
        .startAction(name: '_CariAktiviteViewModelBase.setBaslangicTarihi');
    try {
      return super.setBaslangicTarihi(value);
    } finally {
      _$_CariAktiviteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBitisTarihi(DateTime? value) {
    final _$actionInfo = _$_CariAktiviteViewModelBaseActionController
        .startAction(name: '_CariAktiviteViewModelBase.setBitisTarihi');
    try {
      return super.setBitisTarihi(value);
    } finally {
      _$_CariAktiviteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String? value) {
    final _$actionInfo = _$_CariAktiviteViewModelBaseActionController
        .startAction(name: '_CariAktiviteViewModelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_CariAktiviteViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
aktiviteList: ${aktiviteList}
    ''';
  }
}
