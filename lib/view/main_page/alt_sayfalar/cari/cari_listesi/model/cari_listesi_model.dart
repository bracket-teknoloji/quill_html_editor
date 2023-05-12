import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'cari_listesi_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true)
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

  String? cariKodu;
  String? cariAdi;
  String? bagliCari;
  String? bagliCariAdi;
  String? cariTip;
  String? cariTipAciklama;
  String? kilit;
  int? vadeGunu;
  String? odemeTipi;
  String? hesaptutmasekli;
  String? plasiyerKodu;
  String? plasiyerAciklama;
  double? borcToplami;
  double? alacakToplami;
  int? genisk1Orani;
  String? ulkeKodu;
  String? ulkeAdi;
  String? cariIl;
  String? cariIlce;
  String? cariTel;
  String? postakodu;
  String? email;
  String? web;
  String? cariAdres;
  String? vergiDairesi;
  String? vergiNumarasi;
  String? grupKodu;
  String? grupTanimi;
  String? bilgi;
  String? aciklama1;
  String? aciklama2;
  String? aciklama3;
  String? kodu;
  String? kod1;
  String? kod1Tanimi;
  String? kod2;
  String? kod2Tanimi;
  String? kod3;
  String? kod3Tanimi;
  String? kod4;
  String? kod4Tanimi;
  String? kod5;
  String? kod5Tanimi;
  String? kayityapankul;
  String? kayittarihi;
  String? duzeltmeyapankul;
  String? duzeltmetarihi;
  bool? efaturaMi;
  String? efaturaTipi;
  String? efatGecisTarihi;
  bool? efatAktif;
  String? riskTakibi;
  String? efaturaCarisi;
  double? bakiye;
  double? enlem;
  double? boylam;
  String? kull1s;
  String? kull2s;
  String? kull3s;
  String? kull4s;
  String? kull5s;
  String? kull6s;
  String? kull7s;
  String? kull8s;
  double? kull1n;
  double? kull2n;
  double? kull3n;
  double? kull4n;
  double? kull5n;
  double? kull6n;
  double? kull7n;
  double? kull8n;
  String? fax;
  bool? sahisFirmasiMi;
  bool? dovizli;
  int? dovizKodu;
  String? dovizAdi;
  int? subeKodu;
  String? kosulKodu;
  String? fiyatGrubu;
  @override
  fromJson(Map<String, dynamic> json) {
    return _$CariListesiModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CariListesiModelToJson(this);
  }
}
