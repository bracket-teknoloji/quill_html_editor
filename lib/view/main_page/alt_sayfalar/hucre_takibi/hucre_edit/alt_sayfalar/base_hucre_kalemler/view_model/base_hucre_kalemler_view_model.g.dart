// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_hucre_kalemler_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseHucreKalemlerViewModel on _BaseHucreKalemlerViewModelBase, Store {
  late final _$modelAtom = Atom(
    name: '_BaseHucreKalemlerViewModelBase.model',
    context: context,
  );

  @override
  HucreTransferiModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(HucreTransferiModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$paketRequestModelAtom = Atom(
    name: '_BaseHucreKalemlerViewModelBase.paketRequestModel',
    context: context,
  );

  @override
  PaketlemeListesiRequestModel get paketRequestModel {
    _$paketRequestModelAtom.reportRead();
    return super.paketRequestModel;
  }

  @override
  set paketRequestModel(PaketlemeListesiRequestModel value) {
    _$paketRequestModelAtom.reportWrite(value, super.paketRequestModel, () {
      super.paketRequestModel = value;
    });
  }

  late final _$getPaketAsyncAction = AsyncAction(
    '_BaseHucreKalemlerViewModelBase.getPaket',
    context: context,
  );

  @override
  Future<String?> getPaket(String? paketKodu) {
    return _$getPaketAsyncAction.run(() => super.getPaket(paketKodu));
  }

  late final _$_BaseHucreKalemlerViewModelBaseActionController = ActionController(
    name: '_BaseHucreKalemlerViewModelBase',
    context: context,
  );

  @override
  void setStok(BaseStokMixin? stok) {
    final _$actionInfo = _$_BaseHucreKalemlerViewModelBaseActionController.startAction(
      name: '_BaseHucreKalemlerViewModelBase.setStok',
    );
    try {
      return super.setStok(stok);
    } finally {
      _$_BaseHucreKalemlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHucre(String? hucre) {
    final _$actionInfo = _$_BaseHucreKalemlerViewModelBaseActionController.startAction(
      name: '_BaseHucreKalemlerViewModelBase.setHucre',
    );
    try {
      return super.setHucre(hucre);
    } finally {
      _$_BaseHucreKalemlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar(double? miktar) {
    final _$actionInfo = _$_BaseHucreKalemlerViewModelBaseActionController.startAction(
      name: '_BaseHucreKalemlerViewModelBase.setMiktar',
    );
    try {
      return super.setMiktar(miktar);
    } finally {
      _$_BaseHucreKalemlerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
paketRequestModel: ${paketRequestModel}
    ''';
  }
}
