// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ozel_hesap_kapatma_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OzelHesapKapatmaViewModel on _OzelHesapKapatmaViewModelBase, Store {
  late final _$observableListAtom = Atom(
      name: '_OzelHesapKapatmaViewModelBase.observableList', context: context);

  @override
  ObservableList<CariHareketleriModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<CariHareketleriModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$selectedListAtom = Atom(
      name: '_OzelHesapKapatmaViewModelBase.selectedList', context: context);

  @override
  ObservableList<CariHareketleriModel> get selectedList {
    _$selectedListAtom.reportRead();
    return super.selectedList;
  }

  @override
  set selectedList(ObservableList<CariHareketleriModel> value) {
    _$selectedListAtom.reportWrite(value, super.selectedList, () {
      super.selectedList = value;
    });
  }

  late final _$cariHareketleriRequestModelAtom = Atom(
      name: '_OzelHesapKapatmaViewModelBase.cariHareketleriRequestModel',
      context: context);

  @override
  CariHareketleriRequestModel get cariHareketleriRequestModel {
    _$cariHareketleriRequestModelAtom.reportRead();
    return super.cariHareketleriRequestModel;
  }

  @override
  set cariHareketleriRequestModel(CariHareketleriRequestModel value) {
    _$cariHareketleriRequestModelAtom
        .reportWrite(value, super.cariHareketleriRequestModel, () {
      super.cariHareketleriRequestModel = value;
    });
  }

  late final _$ozelHesapKapatmaSaveModelAtom = Atom(
      name: '_OzelHesapKapatmaViewModelBase.ozelHesapKapatmaSaveModel',
      context: context);

  @override
  OzelHesapKapatmaSaveModel get ozelHesapKapatmaSaveModel {
    _$ozelHesapKapatmaSaveModelAtom.reportRead();
    return super.ozelHesapKapatmaSaveModel;
  }

  @override
  set ozelHesapKapatmaSaveModel(OzelHesapKapatmaSaveModel value) {
    _$ozelHesapKapatmaSaveModelAtom
        .reportWrite(value, super.ozelHesapKapatmaSaveModel, () {
      super.ozelHesapKapatmaSaveModel = value;
    });
  }

  late final _$getDataAsyncAction =
      AsyncAction('_OzelHesapKapatmaViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_OzelHesapKapatmaViewModelBaseActionController =
      ActionController(
          name: '_OzelHesapKapatmaViewModelBase', context: context);

  @override
  void checkSelectedList(bool value, CariHareketleriModel model) {
    final _$actionInfo = _$_OzelHesapKapatmaViewModelBaseActionController
        .startAction(name: '_OzelHesapKapatmaViewModelBase.checkSelectedList');
    try {
      return super.checkSelectedList(value, model);
    } finally {
      _$_OzelHesapKapatmaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<CariHareketleriModel>? list) {
    final _$actionInfo = _$_OzelHesapKapatmaViewModelBaseActionController
        .startAction(name: '_OzelHesapKapatmaViewModelBase.setObservableList');
    try {
      return super.setObservableList(list);
    } finally {
      _$_OzelHesapKapatmaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
selectedList: ${selectedList},
cariHareketleriRequestModel: ${cariHareketleriRequestModel},
ozelHesapKapatmaSaveModel: ${ozelHesapKapatmaSaveModel}
    ''';
  }
}
