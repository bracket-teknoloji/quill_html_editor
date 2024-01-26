// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_bakiyeleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriBakiyeleriViewModel on _SeriBakiyeleriViewModelBase, Store {
  late final _$seriListAtom =
      Atom(name: '_SeriBakiyeleriViewModelBase.seriList', context: context);

  @override
  ObservableList<SeriList>? get seriList {
    _$seriListAtom.reportRead();
    return super.seriList;
  }

  @override
  set seriList(ObservableList<SeriList>? value) {
    _$seriListAtom.reportWrite(value, super.seriList, () {
      super.seriList = value;
    });
  }

  late final _$requestModelAtom =
      Atom(name: '_SeriBakiyeleriViewModelBase.requestModel', context: context);

  @override
  SiparisEditRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(SiparisEditRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_SeriBakiyeleriViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_SeriBakiyeleriViewModelBaseActionController =
      ActionController(name: '_SeriBakiyeleriViewModelBase', context: context);

  @override
  void setSeriList(List<SeriList>? listOfSeri) {
    final _$actionInfo = _$_SeriBakiyeleriViewModelBaseActionController
        .startAction(name: '_SeriBakiyeleriViewModelBase.setSeriList');
    try {
      return super.setSeriList(listOfSeri);
    } finally {
      _$_SeriBakiyeleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokKodu(String stokKodu) {
    final _$actionInfo = _$_SeriBakiyeleriViewModelBaseActionController
        .startAction(name: '_SeriBakiyeleriViewModelBase.setStokKodu');
    try {
      return super.setStokKodu(stokKodu);
    } finally {
      _$_SeriBakiyeleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBakiyeDurumu(String? bakiyeDurumu) {
    final _$actionInfo = _$_SeriBakiyeleriViewModelBaseActionController
        .startAction(name: '_SeriBakiyeleriViewModelBase.setBakiyeDurumu');
    try {
      return super.setBakiyeDurumu(bakiyeDurumu);
    } finally {
      _$_SeriBakiyeleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seriList: ${seriList},
requestModel: ${requestModel}
    ''';
  }
}
