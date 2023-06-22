import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'stok_listesi_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true, includeIfNull: false)
class StokListesiModel with NetworkManagerMixin {
  static StokListesiModel? _instance;
  static StokListesiModel get instance {
    _instance ??= StokListesiModel._init();
    return _instance!;
  }

  StokListesiModel._init();
  StokListesiModel();
  static void setInstance(StokListesiModel? instance) => _instance = instance;

  String? stokKodu;
  String? stokAdi;
  int? depoKodu;
  double? bakiye;
  int? subeKodu;
  String? muhdetayAdi;
  String? resimUrl;
  String? resimUrlKucuk;
  String? resimBase64;
  double? alisFiat1;
  double? alisKdv;
  double? satisKdv;
  String? olcuBirimi;
  String? olcuBirimi2;
  double? olcuBirimi2Pay;
  double? olcuBirimi2Payda;
  String? olcuBirimi3;
  double? olcuBirimi3Pay;
  double? olcuBirimi3Payda;
  String? kayityapankul;
  String? kayittarihi;
  String? grupKodu;
  String? grupTanimi;
  DateTime? duzeltmetarihi;
  String? duzeltmeyapankul;
  List<dynamic>? stokFiyatList;
  List<dynamic>? stokList;
  int? fiatBirimi;
  String? kilitGenel;
  String? kilitSaticisip;
  String? kilitMussip;
  String? kilitAlis;
  String? kilitSatis;
  double? birimAgirlik;
  String? kod1;
  String? kod1Tanimi;
  String? barkod1;
  int? satDovTip;
  double? dovSatisFiat;
  String? satisDovizAdi;
  String? barkod2;
  String? barkod3;
  String? kod2;
  String? kod3;
  String? kod4;
  bool? seriCikistaOtomatikMi;
  bool? seriGiristeOtomatikMi;
  int? alisDovTip;
  String? alisDovizAdi;
  String? ureticiKodu;
  double? satisFiat1;
  double? satisFiat2;
  double? satisFiat3;
  double? satisFiat4;
  String? kod5;
  double? alisFiat2;
  double? alisFiat3;
  double? alisFiat4;
  String? kod2Tanimi;
  String? kod3Tanimi;
  String? kod4Tanimi;
  String? kod5Tanimi;
  bool? seriCikislardaAcik;
  bool? seriGirislerdeAcik;
  bool? seriMiktarKadarSor;
  bool? seriBakiyeKontrolu;
  int? muhdetayKodu;
  double? dovAlisFiat;

  @override
  fromJson(Map<String, dynamic> json) {
    return _$StokListesiModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StokListesiModelToJson(this);
  }
}
