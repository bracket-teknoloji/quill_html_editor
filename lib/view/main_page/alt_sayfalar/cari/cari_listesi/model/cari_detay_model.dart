import "package:copy_with_extension/copy_with_extension.dart";
import "package:json_annotation/json_annotation.dart";
import "cari_listesi_model.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_detay_model.g.dart";

@CopyWith()
@JsonSerializable()
class CariDetayModel with NetworkManagerMixin {
  //singleton
  static CariDetayModel? _instance;
  static CariDetayModel get instance {
    _instance ??= CariDetayModel._init();
    return _instance!;
  }

  CariDetayModel._init();
  //setter singleton
  static void setInstance(CariDetayModel? instance) => _instance = instance;
  CariDetayModel({
    this.cariKodu,
    this.cariAdi,
    this.riskBorcToplami,
    this.riskAlacakToplami,
    this.riskBakiye,
    this.teminatRiski,
    this.cekAsilRiski,
    this.cekCiroRiski,
    this.senetAsilRiski,
    this.senetCiroRiski,
    this.irsaliyeRiski,
    this.siparisRiski,
    this.sevkRiski,
    this.yuklemeRiski,
    this.bilinmeyenRiskField,
    this.brutRiskToplami,
    this.hareketBakiyeRiskO,
    this.teminatRiskO,
    this.senetAsilRiskO,
    this.senetCiroRiskO,
    this.cekAsilRiskO,
    this.cekCiroRiskO,
    this.siparisRiskO,
    this.sevkRiskO,
    this.yuklemeRiskO,
    this.irsaliyeRiskO,
    this.riskLimiti,
    this.teminatTutari,
    this.irtibatList,
    this.bankaList,
    this.cariList,
    this.bakiyeList,
  });
  String? cariKodu;
  String? cariAdi;
  double? riskBorcToplami;
  double? riskAlacakToplami;
  double? riskBakiye;
  double? teminatRiski;
  double? cekAsilRiski;
  double? cekCiroRiski;
  double? senetAsilRiski;
  double? senetCiroRiski;
  double? irsaliyeRiski;
  double? siparisRiski;
  double? sevkRiski;
  double? yuklemeRiski;
  double? bilinmeyenRiskField;
  double? brutRiskToplami;
  double? hareketBakiyeRiskO;
  double? teminatRiskO;
  double? senetAsilRiskO;
  double? senetCiroRiskO;
  double? cekAsilRiskO;
  double? cekCiroRiskO;
  double? siparisRiskO;
  double? sevkRiskO;
  double? yuklemeRiskO;
  double? irsaliyeRiskO;
  double? riskLimiti;
  double? teminatTutari;
  @JsonKey(name: "IrtibatList")
  List<IrtibatList>? irtibatList;
  @JsonKey(name: "BankaList")
  List<BankaList>? bankaList;
  @JsonKey(name: "CariList")
  List<CariListesiModel>? cariList;
  @JsonKey(name: "BakiyeList")
  List<BakiyeList>? bakiyeList;

  factory CariDetayModel.fromJson(Map<String, dynamic> json) => _$CariDetayModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CariDetayModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return CariDetayModel.fromJson(json);
  }
}

@JsonSerializable(createFactory: true)
class BakiyeList {
  BakiyeList();
  String? cariKodu;
  int? dovizTipi;
  double? borcToplami;
  double? alacakToplami;
  double? bakiye;
  String? dovizAdi;

  factory BakiyeList.fromJson(Map<String, dynamic> json) => _$BakiyeListFromJson(json);
  Map<String, dynamic> toJson() => _$BakiyeListToJson(this);
}

@JsonSerializable(createFactory: true)
class BankaList {
  BankaList();
  String? cariKodu;
  String? ibanno;
  String? bankakodu;
  String? subekodu;
  String? bankahesno;
  String? bankaAdi;
  String? subeAdi;
  int? dovizTipi;
  String? dovizAdi;
  int? borcToplami;
  double? alacakToplami;
  double? bakiye;

  factory BankaList.fromJson(Map<String, dynamic> json) => _$BankaListFromJson(json);
  Map<String, dynamic> toJson() => _$BankaListToJson(this);
}

// @JsonSerializable(createFactory: true)
// class CariList {
//   CariList();
//   String? cariKodu;
//   String? cariAdi;
//   String? cariTip;
//   String? cariTipAciklama;
//   String? kilit;
//   int? vadeGunu;
//   String? bilgi;
//   String? odemeTipi;
//   String? hesaptutmasekli;
//   String? plasiyerKodu;
//   String? plasiyerAciklama;
//   String? muhKodu;
//   double? borcToplami;
//   double? alacakToplami;
//   double? bakiye;
//   String? ulkeKodu;
//   String? ulkeAdi;
//   String? cariIl;
//   String? cariIlce;
//   String? cariTel;
//   String? postakodu;
//   String? email;
//   String? web;
//   String? cariAdres;
//   String? vergiDairesi;
//   String? vergiNumarasi;
//   String? grupKodu;
//   String? grupTanimi;
//   String? kod1;
//   String? kod1Tanimi;
//   String? kod2;
//   String? kod2Tanimi;
//   String? kod3;
//   String? kod3Tanimi;
//   String? kayittarihi;
//   String? duzeltmeyapankul;
//   String? duzeltmetarihi;
//   bool? efaturaMi;
//   String? efaturaTipi;
//   String? efatGecisTarihi;
//   bool? efatAktif;
//   double? enlem;
//   double? boylam;
//   String? riskTakibi;
//   String? efaturaCarisi;
//   List<int>? depoKodlari;
//   int? idx;
//   int? subeKodu;
//   String? muhHesapTipi;
//   String? kurfarkiborcKodu;
//   bool? dovizli;
//   String? kosulKodu;
//   String? kod4;
//   String? kod4Tanimi;
//   String? kod5;
//   String? kod5Tanimi;
//   String? kull1s;
//   String? kull2s;
//   String? kull3s;
//   String? kull4s;
//   String? kull5s;
//   String? kull6s;
//   String? kull7s;
//   String? kull8s;
//   String? kull1n;
//   String? kull2n;
//   String? kull3n;
//   String? kull4n;
//   String? kull5n;
//   String? kull6n;
//   String? kull7n;
//   String? kull8n;
//   DateTime? sunucuTarihi;

//   factory CariList.fromJson(Map<String, dynamic> json) => _$CariListFromJson(json);
//   Map<String, dynamic> toJson() => _$CariListToJson(this);
// }

@JsonSerializable(createFactory: true)
class IrtibatList {
  IrtibatList();
  String? cariKodu;
  String? yetkiliKisi;
  String? gorev;
  String? sabitTel1;
  String? emailSplit;
  bool? aktif;

  factory IrtibatList.fromJson(Map<String, dynamic> json) => _$IrtibatListFromJson(json);
  Map<String, dynamic> toJson() => _$IrtibatListToJson(this);
}
