// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hucre_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HucreHareketleriViewModel on _HucreHareketleriViewModelBase, Store {
  Computed<int>? _$toplamGirisComputed;

  @override
  int get toplamGiris => (_$toplamGirisComputed ??= Computed<int>(
    () => super.toplamGiris,
    name: '_HucreHareketleriViewModelBase.toplamGiris',
  )).value;
  Computed<int>? _$toplamCikisComputed;

  @override
  int get toplamCikis => (_$toplamCikisComputed ??= Computed<int>(
    () => super.toplamCikis,
    name: '_HucreHareketleriViewModelBase.toplamCikis',
  )).value;
  Computed<int>? _$bakiyeComputed;

  @override
  int get bakiye => (_$bakiyeComputed ??= Computed<int>(
    () => super.bakiye,
    name: '_HucreHareketleriViewModelBase.bakiye',
  )).value;

  late final _$hucreHareketleriListesiAtom = Atom(
    name: '_HucreHareketleriViewModelBase.hucreHareketleriListesi',
    context: context,
  );

  @override
  ObservableList<HucreHareketleriModel>? get hucreHareketleriListesi {
    _$hucreHareketleriListesiAtom.reportRead();
    return super.hucreHareketleriListesi;
  }

  @override
  set hucreHareketleriListesi(ObservableList<HucreHareketleriModel>? value) {
    _$hucreHareketleriListesiAtom.reportWrite(
      value,
      super.hucreHareketleriListesi,
      () {
        super.hucreHareketleriListesi = value;
      },
    );
  }

  late final _$requestModelAtom = Atom(
    name: '_HucreHareketleriViewModelBase.requestModel',
    context: context,
  );

  @override
  HucreHareketleriRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(HucreHareketleriRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_HucreHareketleriViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_HucreHareketleriViewModelBaseActionController = ActionController(
    name: '_HucreHareketleriViewModelBase',
    context: context,
  );

  @override
  void setStokKodu(String? value) {
    final _$actionInfo = _$_HucreHareketleriViewModelBaseActionController.startAction(
      name: '_HucreHareketleriViewModelBase.setStokKodu',
    );
    try {
      return super.setStokKodu(value);
    } finally {
      _$_HucreHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHucreHareketleriListesi(List<HucreHareketleriModel>? value) {
    final _$actionInfo = _$_HucreHareketleriViewModelBaseActionController.startAction(
      name: '_HucreHareketleriViewModelBase.setHucreHareketleriListesi',
    );
    try {
      return super.setHucreHareketleriListesi(value);
    } finally {
      _$_HucreHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hucreHareketleriListesi: ${hucreHareketleriListesi},
requestModel: ${requestModel},
toplamGiris: ${toplamGiris},
toplamCikis: ${toplamCikis},
bakiye: ${bakiye}
    ''';
  }
}
