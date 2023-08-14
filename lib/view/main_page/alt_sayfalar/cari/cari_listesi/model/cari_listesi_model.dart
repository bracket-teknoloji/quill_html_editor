import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_listesi_model.g.dart";


@HiveType(typeId: 195)
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true, includeIfNull: false)
class CariListesiModel with NetworkManagerMixin {
  //singleton
  static CariListesiModel? _instance;
  static CariListesiModel get instance {
    _instance ??= CariListesiModel._init();
    return _instance!;
  }

  CariListesiModel._init();

  //setter for singleton
  static void setInstance(CariListesiModel? instance) => _instance = instance;

  CariListesiModel();

  @HiveField(0)
  String? cariKodu;
  @HiveField(1)
  String? cariAdi;
  @HiveField(2)
  String? bagliCari;
  @HiveField(3)
  String? bagliCariAdi;
  @HiveField(4)
  String? cariTip;
  @HiveField(5)
  String? cariTipAciklama;
  @HiveField(6)
  String? kilit;
  @HiveField(7)
  int? vadeGunu;
  @HiveField(8)
  String? odemeTipi;
  @HiveField(9)
  String? hesaptutmasekli;
  @HiveField(10)
  String? plasiyerKodu;
  @HiveField(11)
  String? plasiyerAciklama;
  @HiveField(12)
  double? borcToplami;
  @HiveField(13)
  @JsonKey(name: "BakiyeList", includeFromJson: false)
  @HiveField(14)
  List? bakiyeList;
  @HiveField(15)
  double? alacakToplami;
  @HiveField(16)
  int? genisk1Orani;
  @HiveField(17)
  String? ulkeKodu;
  @HiveField(18)
  String? ulkeAdi;
  @HiveField(19)
  String? cariIl;
  @HiveField(20)
  String? cariIlce;
  @HiveField(21)
  String? cariTel;
  @HiveField(22)
  String? postakodu;
  @HiveField(23)
  String? email;
  @HiveField(24)
  String? web;
  @HiveField(25)
  String? cariAdres;
  @HiveField(26)
  String? vergiDairesi;
  @HiveField(27)
  String? vergiNumarasi;
  @HiveField(28)
  String? grupKodu;
  @HiveField(29)
  String? grupTanimi;
  @HiveField(30)
  String? bilgi;
  @HiveField(31)
  String? aciklama1;
  @HiveField(32)
  String? aciklama2;
  @HiveField(33)
  String? aciklama3;
  @HiveField(34)
  String? kodu;
  @HiveField(35)
  String? kod1;
  @HiveField(36)
  String? kod1Tanimi;
  @HiveField(37)
  String? kod2;
  @HiveField(38)
  String? kod2Tanimi;
  @HiveField(39)
  String? kod3;
  @HiveField(40)
  String? kod3Tanimi;
  @HiveField(41)
  String? kod4;
  @HiveField(42)
  String? kod4Tanimi;
  @HiveField(43)
  String? kod5;
  @HiveField(44)
  String? kod5Tanimi;
  @HiveField(45)
  String? kayityapankul;
  @HiveField(46)
  String? kayittarihi;
  @HiveField(47)
  String? duzeltmeyapankul;
  @HiveField(48)
  String? duzeltmetarihi;
  @HiveField(49)
  bool? efaturaMi;
  @HiveField(50)
  String? efaturaTipi;
  @HiveField(51)
  String? efatGecisTarihi;
  @HiveField(52)
  bool? efatAktif;
  @HiveField(53)
  String? riskTakibi;
  @HiveField(54)
  String? efaturaCarisi;
  @HiveField(55)
  double? bakiye;
  @HiveField(56)
  double? enlem;
  @HiveField(57)
  double? boylam;
  @HiveField(58)
  String? kull1s;
  @HiveField(59)
  String? kull2s;
  @HiveField(60)
  String? kull3s;
  @HiveField(61)
  String? kull4s;
  @HiveField(62)
  String? kull5s;
  @HiveField(63)
  String? kull6s;
  @HiveField(64)
  String? kull7s;
  @HiveField(65)
  String? kull8s;
  @HiveField(66)
  double? kull1n;
  @HiveField(67)
  double? kull2n;
  @HiveField(68)
  double? kull3n;
  @HiveField(69)
  double? kull4n;
  @HiveField(70)
  double? kull5n;
  @HiveField(71)
  double? kull6n;
  @HiveField(72)
  double? kull7n;
  @HiveField(73)
  double? kull8n;
  @HiveField(74)
  String? fax;
  @HiveField(75)
  bool? sahisFirmasiMi;
  @HiveField(76)
  bool? dovizli;
  @HiveField(77)
  int? dovizKodu;
  @HiveField(78)
  String? dovizAdi;
  @HiveField(79)
  int? subeKodu;
  @HiveField(80)
  String? kosulKodu;
  @HiveField(81)
  String? fiyatGrubu;
  @HiveField(82)
  String? kull1S;
  @HiveField(83)
  String? kull2S;

  factory CariListesiModel.fromJson(Map<String, dynamic> json) => _$CariListesiModelFromJson(json);
  @override
  fromJson(Map<String, dynamic> json) {
    // bakiyeList = json['BAKIYE_LIST'] != null ? (json['BAKIYE_LIST'] as List).map((i) => BakiyeModel.fromJson(i)).toList() : null;
    return _$CariListesiModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CariListesiModelToJson(this);
  }
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true)
class BakiyeModel {
  String? cariKodu;
  int? dovizTipi;
  double? borcToplami;
  int? alacakToplami;
  double? bakiye;
  String? dovizAdi;

  static fromJson(Map<String, dynamic> json) {
    return _$BakiyeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BakiyeModelToJson(this);
  }
}
