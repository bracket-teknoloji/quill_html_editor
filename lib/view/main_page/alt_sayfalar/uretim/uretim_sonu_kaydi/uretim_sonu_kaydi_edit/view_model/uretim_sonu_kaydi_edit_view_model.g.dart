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

  late final _$getKalemlerAsyncAction = AsyncAction(
      '_UretimSonuKaydiEditViewModelBase.getKalemler',
      context: context);

  @override
  Future<void> getKalemler() {
    return _$getKalemlerAsyncAction.run(() => super.getKalemler());
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
  String toString() {
    return '''
model: ${model},
requestModel: ${requestModel}
    ''';
  }
}
