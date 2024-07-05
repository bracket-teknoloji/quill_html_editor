// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uretim_sonu_kaydi_edit_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UretimSonuKaydiEditViewModel
    on _UretimSonuKaydiEditViewModelBase, Store {
  Computed<UretimSonuKaydiListesiRequestModel>? _$kalemlerRequestModelComputed;

  @override
  UretimSonuKaydiListesiRequestModel get kalemlerRequestModel =>
      (_$kalemlerRequestModelComputed ??=
              Computed<UretimSonuKaydiListesiRequestModel>(
                  () => super.kalemlerRequestModel,
                  name:
                      '_UretimSonuKaydiEditViewModelBase.kalemlerRequestModel'))
          .value;

  late final _$requestModelAtom = Atom(
      name: '_UretimSonuKaydiEditViewModelBase.requestModel', context: context);

  @override
  UretimSonuKaydiEditModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(UretimSonuKaydiEditModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$kalemListAtom = Atom(
      name: '_UretimSonuKaydiEditViewModelBase.kalemList', context: context);

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

  late final _$saveUSKAsyncAction = AsyncAction(
      '_UretimSonuKaydiEditViewModelBase.saveUSK',
      context: context);

  @override
  Future<GenericResponseModel<NetworkManagerMixin>> saveUSK() {
    return _$saveUSKAsyncAction.run(() => super.saveUSK());
  }

  late final _$_UretimSonuKaydiEditViewModelBaseActionController =
      ActionController(
          name: '_UretimSonuKaydiEditViewModelBase', context: context);

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
  void setKalemList(List<KalemModel>? list) {
    final _$actionInfo = _$_UretimSonuKaydiEditViewModelBaseActionController
        .startAction(name: '_UretimSonuKaydiEditViewModelBase.setKalemList');
    try {
      return super.setKalemList(list);
    } finally {
      _$_UretimSonuKaydiEditViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
kalemList: ${kalemList},
kalemlerRequestModel: ${kalemlerRequestModel}
    ''';
  }
}
