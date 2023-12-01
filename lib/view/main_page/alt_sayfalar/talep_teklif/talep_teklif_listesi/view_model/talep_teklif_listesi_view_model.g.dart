// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talep_teklif_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TalepTeklifListesiViewModel on _TalepTeklifListesiViewModelBase, Store {
  late final _$siparislerRequestModelAtom = Atom(
      name: '_TalepTeklifListesiViewModelBase.siparislerRequestModel',
      context: context);

  @override
  SiparislerRequestModel get siparislerRequestModel {
    _$siparislerRequestModelAtom.reportRead();
    return super.siparislerRequestModel;
  }

  @override
  set siparislerRequestModel(SiparislerRequestModel value) {
    _$siparislerRequestModelAtom
        .reportWrite(value, super.siparislerRequestModel, () {
      super.siparislerRequestModel = value;
    });
  }

  late final _$talepTeklifListesiModelListAtom = Atom(
      name: '_TalepTeklifListesiViewModelBase.talepTeklifListesiModelList',
      context: context);

  @override
  ObservableList<TalepTeklifListesiModel>? get talepTeklifListesiModelList {
    _$talepTeklifListesiModelListAtom.reportRead();
    return super.talepTeklifListesiModelList;
  }

  @override
  set talepTeklifListesiModelList(
      ObservableList<TalepTeklifListesiModel>? value) {
    _$talepTeklifListesiModelListAtom
        .reportWrite(value, super.talepTeklifListesiModelList, () {
      super.talepTeklifListesiModelList = value;
    });
  }

  late final _$isScrolledDownAtom = Atom(
      name: '_TalepTeklifListesiViewModelBase.isScrolledDown',
      context: context);

  @override
  bool get isScrolledDown {
    _$isScrolledDownAtom.reportRead();
    return super.isScrolledDown;
  }

  @override
  set isScrolledDown(bool value) {
    _$isScrolledDownAtom.reportWrite(value, super.isScrolledDown, () {
      super.isScrolledDown = value;
    });
  }

  late final _$dahaVarMiAtom = Atom(
      name: '_TalepTeklifListesiViewModelBase.dahaVarMi', context: context);

  @override
  bool get dahaVarMi {
    _$dahaVarMiAtom.reportRead();
    return super.dahaVarMi;
  }

  @override
  set dahaVarMi(bool value) {
    _$dahaVarMiAtom.reportWrite(value, super.dahaVarMi, () {
      super.dahaVarMi = value;
    });
  }

  late final _$resetPageAsyncAction = AsyncAction(
      '_TalepTeklifListesiViewModelBase.resetPage',
      context: context);

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction =
      AsyncAction('_TalepTeklifListesiViewModelBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_TalepTeklifListesiViewModelBaseActionController =
      ActionController(
          name: '_TalepTeklifListesiViewModelBase', context: context);

  @override
  void setIsScrolledDown(bool value) {
    final _$actionInfo =
        _$_TalepTeklifListesiViewModelBaseActionController.startAction(
            name: '_TalepTeklifListesiViewModelBase.setIsScrolledDown');
    try {
      return super.setIsScrolledDown(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPickerBelgeTuru(String value) {
    final _$actionInfo =
        _$_TalepTeklifListesiViewModelBaseActionController.startAction(
            name: '_TalepTeklifListesiViewModelBase.setPickerBelgeTuru');
    try {
      return super.setPickerBelgeTuru(value);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTalepTeklifiListesiModelList(List<TalepTeklifListesiModel> list) {
    final _$actionInfo =
        _$_TalepTeklifListesiViewModelBaseActionController.startAction(
            name:
                '_TalepTeklifListesiViewModelBase.setTalepTeklifiListesiModelList');
    try {
      return super.setTalepTeklifiListesiModelList(list);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addTalepTeklifiListesiModelList(List<TalepTeklifListesiModel> list) {
    final _$actionInfo =
        _$_TalepTeklifListesiViewModelBaseActionController.startAction(
            name:
                '_TalepTeklifListesiViewModelBase.addTalepTeklifiListesiModelList');
    try {
      return super.addTalepTeklifiListesiModelList(list);
    } finally {
      _$_TalepTeklifListesiViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
siparislerRequestModel: ${siparislerRequestModel},
talepTeklifListesiModelList: ${talepTeklifListesiModelList},
isScrolledDown: ${isScrolledDown},
dahaVarMi: ${dahaVarMi}
    ''';
  }
}
