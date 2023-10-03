import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_detay_model.g.dart";

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
  CariDetayModel();
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
  List<CariList>? cariList;
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

  factory BankaList.fromJson(Map<String, dynamic> json) => _$BankaListFromJson(json);
  Map<String, dynamic> toJson() => _$BankaListToJson(this);
}

@JsonSerializable(createFactory: true)
class CariList {
  CariList();
  String? cariKodu;
  String? cariAdi;
  String? cariTip;
  String? cariTipAciklama;
  String? kilit;
  int? vadeGunu;
  String? bilgi;
  String? odemeTipi;
  String? hesaptutmasekli;
  String? plasiyerKodu;
  String? plasiyerAciklama;
  String? muhKodu;
  double? borcToplami;
  double? alacakToplami;
  double? bakiye;
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
  String? kod1;
  String? kod1Tanimi;
  String? kod2;
  String? kod2Tanimi;
  String? kod3;
  String? kod3Tanimi;
  String? kayittarihi;
  String? duzeltmeyapankul;
  String? duzeltmetarihi;
  bool? efaturaMi;
  String? efaturaTipi;
  String? efatGecisTarihi;
  bool? efatAktif;
  double? enlem;
  double? boylam;
  String? riskTakibi;
  String? efaturaCarisi;
  List<int>? depoKodlari;

  factory CariList.fromJson(Map<String, dynamic> json) => _$CariListFromJson(json);
  Map<String, dynamic> toJson() => _$CariListToJson(this);
}

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
