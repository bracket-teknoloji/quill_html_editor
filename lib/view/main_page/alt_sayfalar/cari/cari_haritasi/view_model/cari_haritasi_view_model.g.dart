// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cari_haritasi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CariHaritasiViewModel on _CariHaritasiViewModelBase, Store {
  late final _$cariListAtom =
      Atom(name: '_CariHaritasiViewModelBase.cariList', context: context);

  @override
  ObservableList<CariListesiModel>? get cariList {
    _$cariListAtom.reportRead();
    return super.cariList;
  }

  @override
  set cariList(ObservableList<CariListesiModel>? value) {
    _$cariListAtom.reportWrite(value, super.cariList, () {
      super.cariList = value;
    });
  }

  late final _$requestModelAtom =
      Atom(name: '_CariHaritasiViewModelBase.requestModel', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('_CariHaritasiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_CariHaritasiViewModelBaseActionController =
      ActionController(name: '_CariHaritasiViewModelBase', context: context);

  @override
  void setCariList(List<CariListesiModel>? list) {
    final _$actionInfo = _$_CariHaritasiViewModelBaseActionController
        .startAction(name: '_CariHaritasiViewModelBase.setCariList');
    try {
      return super.setCariList(list);
    } finally {
      _$_CariHaritasiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cariList: ${cariList},
requestModel: ${requestModel}
    ''';
  }
}
