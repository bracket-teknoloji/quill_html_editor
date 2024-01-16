// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seri_listesi_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SeriListesiViewModel on _SeriListesiViewModelBase, Store {
  Computed<int>? _$hareketMiktariComputed;

  @override
  int get hareketMiktari =>
      (_$hareketMiktariComputed ??= Computed<int>(() => super.hareketMiktari,
              name: '_SeriListesiViewModelBase.hareketMiktari'))
          .value;
  Computed<int>? _$kalanMiktarComputed;

  @override
  int get kalanMiktar =>
      (_$kalanMiktarComputed ??= Computed<int>(() => super.kalanMiktar,
              name: '_SeriListesiViewModelBase.kalanMiktar'))
          .value;

  late final _$kalemModelAtom =
      Atom(name: '_SeriListesiViewModelBase.kalemModel', context: context);

  @override
  KalemModel get kalemModel {
    _$kalemModelAtom.reportRead();
    return super.kalemModel;
  }

  bool _kalemModelIsInitialized = false;

  @override
  set kalemModel(KalemModel value) {
    _$kalemModelAtom.reportWrite(
        value, _kalemModelIsInitialized ? super.kalemModel : null, () {
      super.kalemModel = value;
      _kalemModelIsInitialized = true;
    });
  }

  late final _$stokModelAtom =
      Atom(name: '_SeriListesiViewModelBase.stokModel', context: context);

  @override
  StokListesiModel? get stokModel {
    _$stokModelAtom.reportRead();
    return super.stokModel;
  }

  @override
  set stokModel(StokListesiModel? value) {
    _$stokModelAtom.reportWrite(value, super.stokModel, () {
      super.stokModel = value;
    });
  }

  late final _$getStokAsyncAction =
      AsyncAction('_SeriListesiViewModelBase.getStok', context: context);

  @override
  Future<void> getStok() {
    return _$getStokAsyncAction.run(() => super.getStok());
  }

  late final _$_SeriListesiViewModelBaseActionController =
      ActionController(name: '_SeriListesiViewModelBase', context: context);

  @override
  void setKalemModel(KalemModel model) {
    final _$actionInfo = _$_SeriListesiViewModelBaseActionController
        .startAction(name: '_SeriListesiViewModelBase.setKalemModel');
    try {
      return super.setKalemModel(model);
    } finally {
      _$_SeriListesiViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
kalemModel: ${kalemModel},
stokModel: ${stokModel},
hareketMiktari: ${hareketMiktari},
kalanMiktar: ${kalanMiktar}
    ''';
  }
}
