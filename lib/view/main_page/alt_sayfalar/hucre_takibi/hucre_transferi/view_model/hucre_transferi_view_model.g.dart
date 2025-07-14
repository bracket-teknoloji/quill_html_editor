// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_transferi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HucreTransferiViewModel on _HucreTransferiViewModelBase, Store {
  Computed<List<bool>>? _$isStokListComputed;

  @override
  List<bool> get isStokList => (_$isStokListComputed ??= Computed<List<bool>>(
    () => super.isStokList,
    name: '_HucreTransferiViewModelBase.isStokList',
  )).value;

  late final _$modelAtom = Atom(
    name: '_HucreTransferiViewModelBase.model',
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

  late final _$isStokAtom = Atom(
    name: '_HucreTransferiViewModelBase.isStok',
    context: context,
  );

  @override
  bool get isStok {
    _$isStokAtom.reportRead();
    return super.isStok;
  }

  @override
  set isStok(bool value) {
    _$isStokAtom.reportWrite(value, super.isStok, () {
      super.isStok = value;
    });
  }

  late final _$paketRequestModelAtom = Atom(
    name: '_HucreTransferiViewModelBase.paketRequestModel',
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
    '_HucreTransferiViewModelBase.getPaket',
    context: context,
  );

  @override
  Future<String?> getPaket(String? paketKodu) {
    return _$getPaketAsyncAction.run(() => super.getPaket(paketKodu));
  }

  late final _$sendDataAsyncAction = AsyncAction(
    '_HucreTransferiViewModelBase.sendData',
    context: context,
  );

  @override
  Future<bool> sendData() {
    return _$sendDataAsyncAction.run(() => super.sendData());
  }

  late final _$_HucreTransferiViewModelBaseActionController = ActionController(
    name: '_HucreTransferiViewModelBase',
    context: context,
  );

  @override
  void setIsStok(bool value) {
    final _$actionInfo = _$_HucreTransferiViewModelBaseActionController.startAction(
      name: '_HucreTransferiViewModelBase.setIsStok',
    );
    try {
      return super.setIsStok(value);
    } finally {
      _$_HucreTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDepoKodu(int? value) {
    final _$actionInfo = _$_HucreTransferiViewModelBaseActionController.startAction(
      name: '_HucreTransferiViewModelBase.setDepoKodu',
    );
    try {
      return super.setDepoKodu(value);
    } finally {
      _$_HucreTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMiktar(double? value) {
    final _$actionInfo = _$_HucreTransferiViewModelBaseActionController.startAction(
      name: '_HucreTransferiViewModelBase.setMiktar',
    );
    try {
      return super.setMiktar(value);
    } finally {
      _$_HucreTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStokKodu(String? value) {
    final _$actionInfo = _$_HucreTransferiViewModelBaseActionController.startAction(
      name: '_HucreTransferiViewModelBase.setStokKodu',
    );
    try {
      return super.setStokKodu(value);
    } finally {
      _$_HucreTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHucreKodu(String? value) {
    final _$actionInfo = _$_HucreTransferiViewModelBaseActionController.startAction(
      name: '_HucreTransferiViewModelBase.setHucreKodu',
    );
    try {
      return super.setHucreKodu(value);
    } finally {
      _$_HucreTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHedefHucre(String? value) {
    final _$actionInfo = _$_HucreTransferiViewModelBaseActionController.startAction(
      name: '_HucreTransferiViewModelBase.setHedefHucre',
    );
    try {
      return super.setHedefHucre(value);
    } finally {
      _$_HucreTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPaketKodu(String? value) {
    final _$actionInfo = _$_HucreTransferiViewModelBaseActionController.startAction(
      name: '_HucreTransferiViewModelBase.setPaketKodu',
    );
    try {
      return super.setPaketKodu(value);
    } finally {
      _$_HucreTransferiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
isStok: ${isStok},
paketRequestModel: ${paketRequestModel},
isStokList: ${isStokList}
    ''';
  }
}
