// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimSonuKaydiEditViewModel
    on _UretimSonuKaydiEditViewModelBase, Store {
  Computed<UretimSonuKaydiListesiRequestModel>? _$requestModelComputed;

  @override
  UretimSonuKaydiListesiRequestModel get requestModel =>
      (_$requestModelComputed ??= Computed<UretimSonuKaydiListesiRequestModel>(
              () => super.requestModel,
              name: '_UretimSonuKaydiEditViewModelBase.requestModel'))
          .value;

  late final _$modelAtom =
      Atom(name: '_UretimSonuKaydiEditViewModelBase.model', context: context);

  @override
  UretimSonuKaydiListesiModel? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(UretimSonuKaydiListesiModel? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$ekAlanlarListAtom = Atom(
      name: '_UretimSonuKaydiEditViewModelBase.ekAlanlarList',
      context: context);

  @override
  ObservableList<EkAlanlarModel>? get ekAlanlarList {
    _$ekAlanlarListAtom.reportRead();
    return super.ekAlanlarList;
  }

  @override
  set ekAlanlarList(ObservableList<EkAlanlarModel>? value) {
    _$ekAlanlarListAtom.reportWrite(value, super.ekAlanlarList, () {
      super.ekAlanlarList = value;
    });
  }

  late final _$getKalemlerAsyncAction = AsyncAction(
      '_UretimSonuKaydiEditViewModelBase.getKalemler',
      context: context);

  @override
  Future<void> getKalemler() {
    return _$getKalemlerAsyncAction.run(() => super.getKalemler());
  }

  late final _$getEkAlanlarAsyncAction = AsyncAction(
      '_UretimSonuKaydiEditViewModelBase.getEkAlanlar',
      context: context);

  @override
  Future<void> getEkAlanlar() {
    return _$getEkAlanlarAsyncAction.run(() => super.getEkAlanlar());
  }

  late final _$getSiradakiKodAsyncAction = AsyncAction(
      '_UretimSonuKaydiEditViewModelBase.getSiradakiKod',
      context: context);

  @override
  Future<String?> getSiradakiKod(String? kod) {
    return _$getSiradakiKodAsyncAction.run(() => super.getSiradakiKod(kod));
  }

  late final _$_UretimSonuKaydiEditViewModelBaseActionController =
      ActionController(
          name: '_UretimSonuKaydiEditViewModelBase', context: context);

  @override
  void setSelectedItem(UretimSonuKaydiListesiModel? item) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setSelectedItem');
    try {
      return super.setSelectedItem(item);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBelgeNo(String? belgeNo) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setBelgeNo');
    try {
      return super.setBelgeNo(belgeNo);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTarih(DateTime? date) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setTarih');
    try {
      return super.setTarih(date);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCikisDepo(DepoList? depo) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setCikisDepo');
    try {
      return super.setCikisDepo(depo);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setGirisDepo(DepoList? depo) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setGirisDepo');
    try {
      return super.setGirisDepo(depo);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setProje(BaseProjeModel? proje) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setProje');
    try {
      return super.setProje(proje);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setMamulKodu(BaseStokMixin? stok) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setMamulKodu');
    try {
      return super.setMamulKodu(stok);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setModel(UretimSonuKaydiListesiModel? item) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setModel');
    try {
      return super.setModel(item);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEkAlanlarList(List<EkAlanlarModel>? list) {
    final _$actionInfo =
        _$_UretimSonuKaydiEditViewModelBaseActionController.startAction(
            name: '_UretimSonuKaydiEditViewModelBase.setEkAlanlarList');
    try {
      return super.setEkAlanlarList(list);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
ekAlanlarList: ${ekAlanlarList},
requestModel: ${requestModel}
    ''';
  }
}
