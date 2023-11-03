// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banka_hareketleri_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankaHareketleriViewModel on _BankaHareketleriViewModelBase, Store {
  late final _$requestModelAtom = Atom(
      name: '_BankaHareketleriViewModelBase.requestModel', context: context);

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
      context: context);

  @override
  ObservableList<BankaHareketleriModel>? get bankaHareketleriListesi {
    _$bankaHareketleriListesiAtom.reportRead();
    return super.bankaHareketleriListesi;
  }

  @override
  set bankaHareketleriListesi(ObservableList<BankaHareketleriModel>? value) {
    _$bankaHareketleriListesiAtom
        .reportWrite(value, super.bankaHareketleriListesi, () {
      super.bankaHareketleriListesi = value;
    });
  }

  @override
  String toString() {
    return '''
requestModel: ${requestModel},
bankaHareketleriListesi: ${bankaHareketleriListesi}
    ''';
  }
}
