// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_stok_edit_genel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStokEditGenelViewModel on _BaseStokEditGenelViewModelBase, Store {
  late final _$stokListesiModelAtom = Atom(
      name: '_BaseStokEditGenelViewModelBase.stokListesiModel',
      context: context);

  @override
  StokListesiModel? get stokListesiModel {
    _$stokListesiModelAtom.reportRead();
    return super.stokListesiModel;
  }

  @override
  set stokListesiModel(StokListesiModel? value) {
    _$stokListesiModelAtom.reportWrite(value, super.stokListesiModel, () {
      super.stokListesiModel = value;
    });
  }

  late final _$stokDetayModelAtom = Atom(
      name: '_BaseStokEditGenelViewModelBase.stokDetayModel', context: context);

  @override
  StokDetayModel get stokDetayModel {
    _$stokDetayModelAtom.reportRead();
    return super.stokDetayModel;
  }

  @override
  set stokDetayModel(StokDetayModel value) {
    _$stokDetayModelAtom.reportWrite(value, super.stokDetayModel, () {
      super.stokDetayModel = value;
    });
  }

  late final _$grupKodlariMapAtom = Atom(
      name: '_BaseStokEditGenelViewModelBase.grupKodlariMap', context: context);

  @override
  ObservableMap<int, List<BaseGrupKoduModel>?>? get grupKodlariMap {
    _$grupKodlariMapAtom.reportRead();
    return super.grupKodlariMap;
  }

  @override
  set grupKodlariMap(ObservableMap<int, List<BaseGrupKoduModel>?>? value) {
    _$grupKodlariMapAtom.reportWrite(value, super.grupKodlariMap, () {
      super.grupKodlariMap = value;
    });
  }

  late final _$_BaseStokEditGenelViewModelBaseActionController =
      ActionController(
          name: '_BaseStokEditGenelViewModelBase', context: context);

  @override
  void changeGrupKoduListesi(int grupkodu, List<BaseGrupKoduModel>? value) {
    final _$actionInfo =
        _$_BaseStokEditGenelViewModelBaseActionController.startAction(
            name: '_BaseStokEditGenelViewModelBase.changeGrupKoduListesi');
    try {
      return super.changeGrupKoduListesi(grupkodu, value);
    } finally {
      _$_BaseStokEditGenelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stokListesiModel: ${stokListesiModel},
stokDetayModel: ${stokDetayModel},
grupKodlariMap: ${grupKodlariMap}
    ''';
  }
}
