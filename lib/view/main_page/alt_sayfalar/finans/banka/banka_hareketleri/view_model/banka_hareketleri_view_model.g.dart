// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankaHareketleriViewModel on _BankaHareketleriViewModelBase, Store {
  Computed<double>? _$gelenTutarComputed;

  @override
  double get gelenTutar => (_$gelenTutarComputed ??= Computed<double>(
    () => super.gelenTutar,
    name: '_BankaHareketleriViewModelBase.gelenTutar',
  )).value;
  Computed<double>? _$dovizGelenTutarComputed;

  @override
  double get dovizGelenTutar => (_$dovizGelenTutarComputed ??= Computed<double>(
    () => super.dovizGelenTutar,
    name: '_BankaHareketleriViewModelBase.dovizGelenTutar',
  )).value;
  Computed<double>? _$gidenTutarComputed;

  @override
  double get gidenTutar => (_$gidenTutarComputed ??= Computed<double>(
    () => super.gidenTutar,
    name: '_BankaHareketleriViewModelBase.gidenTutar',
  )).value;
  Computed<double>? _$dovizGidenTutarComputed;

  @override
  double get dovizGidenTutar => (_$dovizGidenTutarComputed ??= Computed<double>(
    () => super.dovizGidenTutar,
    name: '_BankaHareketleriViewModelBase.dovizGidenTutar',
  )).value;
  Computed<double>? _$bakiyeComputed;

  @override
  double get bakiye => (_$bakiyeComputed ??= Computed<double>(
    () => super.bakiye,
    name: '_BankaHareketleriViewModelBase.bakiye',
  )).value;
  Computed<double>? _$dovizBakiyeComputed;

  @override
  double get dovizBakiye => (_$dovizBakiyeComputed ??= Computed<double>(
    () => super.dovizBakiye,
    name: '_BankaHareketleriViewModelBase.dovizBakiye',
  )).value;

  late final _$requestModelAtom = Atom(
    name: '_BankaHareketleriViewModelBase.requestModel',
    context: context,
  );

  @override
  BankaIslemleriRequestModel get requestModel {
    _$requestModelAtom.reportRead();
    return super.requestModel;
  }

  @override
  set requestModel(BankaIslemleriRequestModel value) {
    _$requestModelAtom.reportWrite(value, super.requestModel, () {
      super.requestModel = value;
    });
  }

  late final _$bankaHareketleriListesiAtom = Atom(
    name: '_BankaHareketleriViewModelBase.bankaHareketleriListesi',
    context: context,
  );

  @override
  ObservableList<BankaHareketleriModel>? get bankaHareketleriListesi {
    _$bankaHareketleriListesiAtom.reportRead();
    return super.bankaHareketleriListesi;
  }

  @override
  set bankaHareketleriListesi(ObservableList<BankaHareketleriModel>? value) {
    _$bankaHareketleriListesiAtom.reportWrite(
      value,
      super.bankaHareketleriListesi,
      () {
        super.bankaHareketleriListesi = value;
      },
    );
  }

  late final _$getDataAsyncAction = AsyncAction(
    '_BankaHareketleriViewModelBase.getData',
    context: context,
  );

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$_BankaHareketleriViewModelBaseActionController =
      ActionController(
        name: '_BankaHareketleriViewModelBase',
        context: context,
      );

  @override
  void setHesapKodu(String? value) {
    final _$actionInfo = _$_BankaHareketleriViewModelBaseActionController
        .startAction(name: '_BankaHareketleriViewModelBase.setHesapKodu');
    try {
      return super.setHesapKodu(value);
    } finally {
      _$_BankaHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBankaHareketleriListesi(List<BankaHareketleriModel>? value) {
    final _$actionInfo = _$_BankaHareketleriViewModelBaseActionController
        .startAction(
          name: '_BankaHareketleriViewModelBase.setBankaHareketleriListesi',
        );
    try {
      return super.setBankaHareketleriListesi(value);
    } finally {
      _$_BankaHareketleriViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
bankaHareketleriListesi: ${bankaHareketleriListesi},
gelenTutar: ${gelenTutar},
dovizGelenTutar: ${dovizGelenTutar},
gidenTutar: ${gidenTutar},
dovizGidenTutar: ${dovizGidenTutar},
bakiye: ${bakiye},
dovizBakiye: ${dovizBakiye}
    ''';
  }
}
