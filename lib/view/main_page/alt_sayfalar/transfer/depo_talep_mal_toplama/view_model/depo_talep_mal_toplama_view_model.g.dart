// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depo_talep_mal_toplama_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DepoTalepMalToplamaViewModel
    on _DepoTalepMalToplamaViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: '_DepoTalepMalToplamaViewModelBase.model',
    context: context,
  );

  @override
  BaseSiparisEditModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(BaseSiparisEditModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$depoListAtom = Atom(
    name: '_DepoTalepMalToplamaViewModelBase.depoList',
    context: context,
  );

  @override
  DepoList? get depoList {
    _$depoListAtom.reportRead();
    return super.depoList;
  }

  @override
  set depoList(DepoList? value) {
    _$depoListAtom.reportWrite(value, super.depoList, () {
      super.depoList = value;
    });
  }

  late final _$getKalemlerAsyncAction = AsyncAction(
    '_DepoTalepMalToplamaViewModelBase.getKalemler',
    context: context,
  );

  @override
  Future<void> getKalemler() {
    return _$getKalemlerAsyncAction.run(() => super.getKalemler());
  }

  late final _$saveKalemAsyncAction = AsyncAction(
    '_DepoTalepMalToplamaViewModelBase.saveKalem',
    context: context,
  );

  @override
  Future<bool> saveKalem(KalemModel kalem) {
    return _$saveKalemAsyncAction.run(() => super.saveKalem(kalem));
  }

  late final _$_DepoTalepMalToplamaViewModelBaseActionController =
      ActionController(
        name: '_DepoTalepMalToplamaViewModelBase',
        context: context,
      );

  @override
  void setModel(BaseSiparisEditModel value) {
    final _$actionInfo = _$_DepoTalepMalToplamaViewModelBaseActionController
        .startAction(name: '_DepoTalepMalToplamaViewModelBase.setModel');
    try {
      return super.setModel(value);
    } finally {
      _$_DepoTalepMalToplamaViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setDepoList(DepoList value) {
    final _$actionInfo = _$_DepoTalepMalToplamaViewModelBaseActionController
        .startAction(name: '_DepoTalepMalToplamaViewModelBase.setDepoList');
    try {
      return super.setDepoList(value);
    } finally {
      _$_DepoTalepMalToplamaViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
depoList: ${depoList}
    ''';
  }
}
