// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barkod_tanimla_kayitlari_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BarkodTanimlaKayitlariViewModel
    on _BarkodTanimlaKayitlariViewModelBase, Store {
  late final _$barkodTanimlaKayitlariAtom = Atom(
      name: '_BarkodTanimlaKayitlariViewModelBase.barkodTanimlaKayitlari',
      context: context);

  @override
  ObservableList<BarkodTanimlaKayitlariModel>? get barkodTanimlaKayitlari {
    _$barkodTanimlaKayitlariAtom.reportRead();
    return super.barkodTanimlaKayitlari;
  }

  @override
  set barkodTanimlaKayitlari(
      ObservableList<BarkodTanimlaKayitlariModel>? value) {
    _$barkodTanimlaKayitlariAtom
        .reportWrite(value, super.barkodTanimlaKayitlari, () {
      super.barkodTanimlaKayitlari = value;
    });
  }

  late final _$requestModelAtom = Atom(
      name: '_BarkodTanimlaKayitlariViewModelBase.requestModel',
      context: context);

  @override
  BarkodTanimlaKayitlariRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(BarkodTanimlaKayitlariRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$deleteItemAsyncAction = AsyncAction(
      '_BarkodTanimlaKayitlariViewModelBase.deleteItem',
      context: context);

  @override
  Future<void> deleteItem(BarkodTanimlaKayitlariModel model) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(model));
  }

  late final _$getDataAsyncAction = AsyncAction(
      '_BarkodTanimlaKayitlariViewModelBase.getData',
      context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_BarkodTanimlaKayitlariViewModelBaseActionController =
      ActionController(
          name: '_BarkodTanimlaKayitlariViewModelBase', context: context);

  @override
  void setStokKodu(String? stokKodu) {
    final _$actionInfo = _$_BarkodTanimlaKayitlariViewModelBaseActionController
        .startAction(name: '_BarkodTanimlaKayitlariViewModelBase.setStokKodu');
    try {
      return super.setStokKodu(stokKodu);
    } finally {
      _$_BarkodTanimlaKayitlariViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBarkodTanimlaKayitlari(List<BarkodTanimlaKayitlariModel>? list) {
    final _$actionInfo =
        _$_BarkodTanimlaKayitlariViewModelBaseActionController.startAction(
            name:
                '_BarkodTanimlaKayitlariViewModelBase.setBarkodTanimlaKayitlari');
    try {
      return super.setBarkodTanimlaKayitlari(list);
    } finally {
      _$_BarkodTanimlaKayitlariViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
barkodTanimlaKayitlari: ${barkodTanimlaKayitlari},
requestModel: ${requestModel}
    ''';
  }
}
