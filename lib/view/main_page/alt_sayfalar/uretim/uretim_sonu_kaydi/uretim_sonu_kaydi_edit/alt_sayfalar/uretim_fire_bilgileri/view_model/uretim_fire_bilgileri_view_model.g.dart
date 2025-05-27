// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_fire_bilgileri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimFireBilgileriViewModel
    on _UretimFireBilgileriViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_UretimFireBilgileriViewModelBase.model', context: context);

  @override
  KalemModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  bool _modelIsInitialized = false;

  @override
  set model(KalemModel value) {
    _$modelAtom.reportWrite(value, _modelIsInitialized ? super.model : null,
        () {
      super.model = value;
      _modelIsInitialized = true;
    });
  }

  late final _$fireModelAtom = Atom(
      name: '_UretimFireBilgileriViewModelBase.fireModel', context: context);

  @override
  KalemFireModel get fireModel {
    _$fireModelAtom.reportRead();
    return super.fireModel;
  }

  @override
  set fireModel(KalemFireModel value) {
    _$fireModelAtom.reportWrite(value, super.fireModel, () {
      super.fireModel = value;
    });
  }

  late final _$observableListAtom = Atom(
      name: '_UretimFireBilgileriViewModelBase.observableList',
      context: context);

  @override
  ObservableList<KalemFireModel>? get observableList {
    _$observableListAtom.reportRead();
    return super.observableList;
  }

  @override
  set observableList(ObservableList<KalemFireModel>? value) {
    _$observableListAtom.reportWrite(value, super.observableList, () {
      super.observableList = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
      '_UretimFireBilgileriViewModelBase.getData',
      context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_UretimFireBilgileriViewModelBaseActionController =
      ActionController(
          name: '_UretimFireBilgileriViewModelBase', context: context);

  @override
  void addFireModel(KalemFireModel value) {
    final _$actionInfo = _$_UretimFireBilgileriViewModelBaseActionController
        .startAction(name: '_UretimFireBilgileriViewModelBase.addFireModel');
    try {
      return super.addFireModel(value);
    } finally {
      _$_UretimFireBilgileriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void removeFireModel(KalemFireModel value) {
    final _$actionInfo = _$_UretimFireBilgileriViewModelBaseActionController
        .startAction(name: '_UretimFireBilgileriViewModelBase.removeFireModel');
    try {
      return super.removeFireModel(value);
    } finally {
      _$_UretimFireBilgileriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setFireModel(KalemFireModel value) {
    final _$actionInfo = _$_UretimFireBilgileriViewModelBaseActionController
        .startAction(name: '_UretimFireBilgileriViewModelBase.setFireModel');
    try {
      return super.setFireModel(value);
    } finally {
      _$_UretimFireBilgileriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void clearFireModel() {
    final _$actionInfo = _$_UretimFireBilgileriViewModelBaseActionController
        .startAction(name: '_UretimFireBilgileriViewModelBase.clearFireModel');
    try {
      return super.clearFireModel();
    } finally {
      _$_UretimFireBilgileriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setObservableList(List<KalemFireModel>? list) {
    final _$actionInfo =
        _$_UretimFireBilgileriViewModelBaseActionController.startAction(
            name: '_UretimFireBilgileriViewModelBase.setObservableList');
    try {
      return super.setObservableList(list);
    } finally {
      _$_UretimFireBilgileriViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
fireModel: ${fireModel},
observableList: ${observableList}
    ''';
  }
}
