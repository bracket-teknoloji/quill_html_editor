import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'stok_listesi_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.screamingSnake, createToJson: true)
class StokListesiModel with NetworkManagerMixin {
  String? stokKodu;
  String? stokAdi;
  int? depoKodu;
  double? bakiye;
  int? subeKodu;
  String? muhdetayAdi;
  String? resimUrl;
  String? resimUrlKucuk;
  double? alisFiat1;
  double? alisKdv;
  double? satisFiat1;
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
  double? satisFiat2;
  double? satisFiat3;
  double? satisFiat4;
  String? kod5;

  @override
  fromJson(Map<String, dynamic> json) {
    return _$StokListesiModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StokListesiModelToJson(this);
  }
}
