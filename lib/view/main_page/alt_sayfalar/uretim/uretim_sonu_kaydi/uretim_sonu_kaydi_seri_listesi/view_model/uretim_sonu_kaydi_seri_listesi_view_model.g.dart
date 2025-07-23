// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_seri_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimSonuKaydiSeriListesiViewModel
    on _UretimSonuKaydiSeriListesiViewModelBase, Store {
  late final _$observableListAtom = Atom(
    name: '_UretimSonuKaydiSeriListesiViewModelBase.observableList',
    context: context,
  );

  @override
  ObservableList<UskReceteModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<UskReceteModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$kalemModelAtom = Atom(
    name: '_UretimSonuKaydiSeriListesiViewModelBase.kalemModel',
    context: context,
  );

  @override
  KalemModel? get kalemModel {
    _$kalemModelAtom.reportRead();
    return super.kalemModel;
  }

  @override
  set kalemModel(KalemModel? value) {
    _$kalemModelAtom.reportWrite(value, super.kalemModel, () {
      super.kalemModel = value;
    });
  }

  late final _$requestModelAtom = Atom(
    name: '_UretimSonuKaydiSeriListesiViewModelBase.requestModel',
    context: context,
  );

  @override
  UretimSonuRaporuRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(UretimSonuRaporuRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$resetListAsyncAction = AsyncAction(
    '_UretimSonuKaydiSeriListesiViewModelBase.resetList',
    context: context,
  );

  @override
  Future<void> resetList() {
    return _$resetListAsyncAction.run(() => super.resetList());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_UretimSonuKaydiSeriListesiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_UretimSonuKaydiSeriListesiViewModelBaseActionController =
      ActionController(
        name: '_UretimSonuKaydiSeriListesiViewModelBase',
        context: context,
      );

  @override
  void setKalem(KalemModel? value) {
    final _$actionInfo =
        _$_UretimSonuKaydiSeriListesiViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiSeriListesiViewModelBase.setKalem',
        );
    try {
      return super.setKalem(value);
    } finally {
      _$_UretimSonuKaydiSeriListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setObservableList(List<UskReceteModel>? list) {
    final _$actionInfo =
        _$_UretimSonuKaydiSeriListesiViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiSeriListesiViewModelBase.setObservableList',
        );
    try {
      return super.setObservableList(list);
    } finally {
      _$_UretimSonuKaydiSeriListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void updateCard(UskReceteModel model) {
    final _$actionInfo =
        _$_UretimSonuKaydiSeriListesiViewModelBaseActionController.startAction(
          name: '_UretimSonuKaydiSeriListesiViewModelBase.updateCard',
        );
    try {
      return super.updateCard(model);
    } finally {
      _$_UretimSonuKaydiSeriListesiViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
observableList: ${observableList},
kalemModel: ${kalemModel},
requestModel: ${requestModel}
    ''';
  }
}
