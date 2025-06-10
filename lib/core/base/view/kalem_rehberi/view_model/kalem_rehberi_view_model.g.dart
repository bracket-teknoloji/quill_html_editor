// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kalem_rehberi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KalemRehberiViewModel on _KalemRehberiViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: '_KalemRehberiViewModelBase.model',
    context: context,
  );

  @override
  SiparislerRequestModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SiparislerRequestModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$kalemListAtom = Atom(
    name: '_KalemRehberiViewModelBase.kalemList',
    context: context,
  );

  @override
  ObservableList<KalemModel>? get kalemList {
    _$kalemListAtom.reportRead();
    return super.kalemList;
  }

  @override
  set kalemList(ObservableList<KalemModel>? value) {
    _$kalemListAtom.reportWrite(value, super.kalemList, () {
      super.kalemList = value;
    });
  }

  late final _$selectedKalemListAtom = Atom(
    name: '_KalemRehberiViewModelBase.selectedKalemList',
    context: context,
  );

  @override
  ObservableList<KalemModel> get selectedKalemList {
    _$selectedKalemListAtom.reportRead();
    return super.selectedKalemList;
  }

  @override
  set selectedKalemList(ObservableList<KalemModel> value) {
    _$selectedKalemListAtom.reportWrite(value, super.selectedKalemList, () {
      super.selectedKalemList = value;
    });
  }

  late final _$resetPageAsyncAction = AsyncAction(
    '_KalemRehberiViewModelBase.resetPage',
    context: context,
  );

  @override
  Future<void> resetPage() {
    return _$resetPageAsyncAction.run(() => super.resetPage());
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_KalemRehberiViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_KalemRehberiViewModelBaseActionController = ActionController(
    name: '_KalemRehberiViewModelBase',
    context: context,
  );

  @override
  void setModel(BaseSiparisEditModel value) {
    final _$actionInfo = _$_KalemRehberiViewModelBaseActionController
        .startAction(name: '_KalemRehberiViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_KalemRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRequestModel(SiparislerRequestModel value) {
    final _$actionInfo = _$_KalemRehberiViewModelBaseActionController
        .startAction(name: '_KalemRehberiViewModelBase.setRequestModel');
    try {
      return super.setRequestModel(value);
    } finally {
      _$_KalemRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKalemList(List<KalemModel>? value) {
    final _$actionInfo = _$_KalemRehberiViewModelBaseActionController
        .startAction(name: '_KalemRehberiViewModelBase.setKalemList');
    try {
      return super.setKalemList(value);
    } finally {
      _$_KalemRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSelectedKalem(KalemModel value) {
    final _$actionInfo = _$_KalemRehberiViewModelBaseActionController
        .startAction(name: '_KalemRehberiViewModelBase.addSelectedKalem');
    try {
      return super.addSelectedKalem(value);
    } finally {
      _$_KalemRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSelectedKalem(KalemModel value) {
    final _$actionInfo = _$_KalemRehberiViewModelBaseActionController
        .startAction(name: '_KalemRehberiViewModelBase.removeSelectedKalem');
    try {
      return super.removeSelectedKalem(value);
    } finally {
      _$_KalemRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAllSelectedKalem() {
    final _$actionInfo = _$_KalemRehberiViewModelBaseActionController
        .startAction(name: '_KalemRehberiViewModelBase.addAllSelectedKalem');
    try {
      return super.addAllSelectedKalem();
    } finally {
      _$_KalemRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAllSelectedKalem() {
    final _$actionInfo = _$_KalemRehberiViewModelBaseActionController
        .startAction(name: '_KalemRehberiViewModelBase.removeAllSelectedKalem');
    try {
      return super.removeAllSelectedKalem();
    } finally {
      _$_KalemRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSiralama(String? value) {
    final _$actionInfo = _$_KalemRehberiViewModelBaseActionController
        .startAction(name: '_KalemRehberiViewModelBase.setSiralama');
    try {
      return super.setSiralama(value);
    } finally {
      _$_KalemRehberiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
kalemList: ${kalemList},
selectedKalemList: ${selectedKalemList}
    ''';
  }
}
