// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depo_talep_kalem_detay_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DepoTalepKalemDetayViewModel on _DepoTalepKalemDetayViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: '_DepoTalepKalemDetayViewModelBase.model',
    context: context,
  );

  @override
  KalemModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(KalemModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$saveAsyncAction = AsyncAction(
    '_DepoTalepKalemDetayViewModelBase.save',
    context: context,
  );

  @override
  Future<bool> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_DepoTalepKalemDetayViewModelBaseActionController = ActionController(
    name: '_DepoTalepKalemDetayViewModelBase',
    context: context,
  );

  @override
  void setModel(KalemModel value) {
    final _$actionInfo = _$_DepoTalepKalemDetayViewModelBaseActionController.startAction(
      name: '_DepoTalepKalemDetayViewModelBase.setModel',
    );
    try {
      return super.setModel(value);
    } finally {
      _$_DepoTalepKalemDetayViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setOlcuBirimi(({String? adi, int? kodu}) value) {
    final _$actionInfo = _$_DepoTalepKalemDetayViewModelBaseActionController.startAction(
      name: '_DepoTalepKalemDetayViewModelBase.setOlcuBirimi',
    );
    try {
      return super.setOlcuBirimi(value);
    } finally {
      _$_DepoTalepKalemDetayViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setMiktar(double? value) {
    final _$actionInfo = _$_DepoTalepKalemDetayViewModelBaseActionController.startAction(
      name: '_DepoTalepKalemDetayViewModelBase.setMiktar',
    );
    try {
      return super.setMiktar(value);
    } finally {
      _$_DepoTalepKalemDetayViewModelBaseActionController.endAction(
        _$actionInfo,
      );
    }
  }

  @override
  void setAciklama(String value) {
    final _$actionInfo = _$_DepoTalepKalemDetayViewModelBaseActionController.startAction(
      name: '_DepoTalepKalemDetayViewModelBase.setAciklama',
    );
    try {
      return super.setAciklama(value);
    } finally {
      _$_DepoTalepKalemDetayViewModelBaseActionController.endAction(
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
