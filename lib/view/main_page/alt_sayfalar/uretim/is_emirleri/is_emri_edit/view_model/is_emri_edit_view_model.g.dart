// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_emri_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IsEmriEditViewModel on _IsEmriEditViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_IsEmriEditViewModelBase.model', context: context);

  @override
  IsEmirleriModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(IsEmirleriModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$getBelgeNoAsyncAction =
      AsyncAction('_IsEmriEditViewModelBase.getBelgeNo', context: context);

  @override
  Future<void> getBelgeNo() {
    return _$getBelgeNoAsyncAction.run(() => super.getBelgeNo());
  }

  late final _$sendDataAsyncAction =
      AsyncAction('_IsEmriEditViewModelBase.sendData', context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> sendData() {
    return _$sendDataAsyncAction.run(() => super.sendData());
  }

  late final _$_IsEmriEditViewModelBaseActionController =
      ActionController(name: '_IsEmriEditViewModelBase', context: context);

  @override
  void setModel(IsEmirleriModel? isEmri) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setModel');
    try {
      return super.setModel(isEmri);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIslemKodu(int? islemKodu) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setIslemKodu');
    try {
      return super.setIslemKodu(islemKodu);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime date) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setTarih');
    try {
      return super.setTarih(date);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTeslimTarihi(DateTime date) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setTeslimTarihi');
    try {
      return super.setTeslimTarihi(date);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setKapaliMi(bool kapaliMi) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setKapaliMi');
    try {
      return super.setKapaliMi(kapaliMi);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String belgeNo) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(belgeNo);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStok(StokListesiModel? stok) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setStok');
    try {
      return super.setStok(stok);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReferansIsEmri(IsEmirleriModel? isEmri) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setReferansIsEmri');
    try {
      return super.setReferansIsEmri(isEmri);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReworkMu(bool reworkMu) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setReworkMu');
    try {
      return super.setReworkMu(reworkMu);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProje(BaseProjeModel? proje) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setProje');
    try {
      return super.setProje(proje);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGirisDepo(DepoList? depo) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setGirisDepo');
    try {
      return super.setGirisDepo(depo);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCikisDepo(DepoList? depo) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setCikisDepo');
    try {
      return super.setCikisDepo(depo);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAciklama(String? aciklama) {
    final _$actionInfo = _$_IsEmriEditViewModelBaseActionController.startAction(
        name: '_IsEmriEditViewModelBase.setAciklama');
    try {
      return super.setAciklama(aciklama);
    } finally {
      _$_IsEmriEditViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
