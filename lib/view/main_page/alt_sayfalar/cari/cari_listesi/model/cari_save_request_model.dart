import "package:copy_with_extension/copy_with_extension.dart";
import "package:json_annotation/json_annotation.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_save_request_model.g.dart";

@CopyWith()
@JsonSerializable()
class CariSaveRequestModel with NetworkManagerMixin {
  //singleton
  static CariSaveRequestModel? _instance;
  static CariSaveRequestModel get instance {
    _instance ??= CariSaveRequestModel._init();
    return _instance!;
  }

  //setter for singleton
  static void setInstance(CariSaveRequestModel? instance) => _instance = instance;

  CariSaveRequestModel._init();
  CariSaveRequestModel({
    this.requestVersion,
    this.islemKodu,
    this.yeniKayit,
    this.sahisFirmasi,
    this.subeKodu,
    this.kodu,
    this.tipi,
    this.adi,
    this.ulkeKodu,
    this.sehir,
    this.ilce,
    this.adres,
    this.telefon,
    this.eposta,
    this.enlem,
    this.boylam,
    this.postaKodu,
    this.website,
    this.vergiDairesi,
    this.vergiNo,
    this.plasiyerKodu,
    this.dovizli,
    this.dovizKodu,
    this.grupKodu,
    this.kod1,
    this.kod2,
    this.kod3,
    this.kod4,
    this.kod5,
    this.bilgi,
    this.kilit,
    this.bagliCari,
    this.kosulKodu,
    this.muhasebeKodu,
    this.kurfarkiborcKodu,
    this.kurfarkialacakKodu,
    this.vadeGunu,
    this.odemeTipi,
    this.muhtelifCari,
    this.muhtelifBelgeTipi,
    this.muhtelifBelgeNo,
    this.efaturaSenaryo,
    this.kull1s,
    this.kull2s,
    this.kull3s,
    this.kull4s,
    this.kull5s,
    this.kull6s,
    this.kull7s,
    this.kull8s,
    this.kull1n,
    this.kull2n,
    this.kull3n,
    this.kull4n,
    this.kull5n,
    this.kull6n,
    this.kull7n,
    this.kull8n,
    this.aciklama1,
    this.aciklama2,
    this.aciklama3,
    this.postakodu,
  });
  int? requestVersion;
  int? islemKodu;
  @JsonKey(name: "_YeniKayit")
  bool? yeniKayit;
  bool? sahisFirmasi;
  String? subeKodu;
  String? kodu;
  String? tipi;
  String? adi;
  String? ulkeKodu;
  String? sehir;
  String? ilce;
  String? adres;
  String? telefon;
  String? eposta;
  double? enlem;
  double? boylam;
  String? postaKodu;
  String? website;
  String? vergiDairesi;
  String? vergiNo;
  String? plasiyerKodu;
  String? dovizli;
  int? dovizKodu;
  String? grupKodu;
  String? kod1;
  String? kod2;
  String? kod3;
  String? kod4;
  String? kod5;
  String? bilgi;
  String? kilit;
  String? bagliCari;
  String? kosulKodu;
  String? muhasebeKodu;
  String? kurfarkiborcKodu;
  String? kurfarkialacakKodu;
  String? vadeGunu;
  String? odemeTipi;
  bool? muhtelifCari;
  String? muhtelifBelgeTipi;
  String? muhtelifBelgeNo;
  String? efaturaSenaryo;
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
  String? aciklama1;
  String? aciklama2;
  String? aciklama3;
  String? postakodu;

  @override
  fromJson(Map<String, dynamic> json) {
    return _$CariSaveRequestModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CariSaveRequestModelToJson(this);
  }

  fromCariListesiModel(CariListesiModel? model) {
    return CariSaveRequestModel(
      requestVersion: 6,
      sahisFirmasi: model?.sahisFirmasiMi,
      subeKodu: model?.subeKodu.toStringIfNotNull,
      kodu: model?.cariKodu,
      tipi: model?.cariTip,
      adi: model?.cariAdi,
      ulkeKodu: model?.ulkeKodu,
      sehir: model?.cariIl,
      ilce: model?.cariIlce,
      adres: model?.cariAdres,
      telefon: model?.cariTel,
      eposta: model?.email,
      enlem: model?.enlem,
      boylam: model?.boylam,
      postaKodu: model?.postakodu,
      website: model?.web,
      vergiDairesi: model?.vergiDairesi,
      vergiNo: model?.vergiNumarasi,
      grupKodu: model?.grupKodu,
      kod1: model?.kod1,
      kod2: model?.kod2,
      kod3: model?.kod3,
      kod4: model?.kod4,
      kod5: model?.kod5,
      bilgi: model?.bilgi,
      kilit: model?.kilit,
      bagliCari: model?.bagliCari,
      kosulKodu: model?.kosulKodu,
      muhasebeKodu: model?.muhKodu,
      kurfarkiborcKodu: model?.kurfarkiborcKodu,
      kurfarkialacakKodu: model?.kurfarkialacakKodu,
      vadeGunu: model?.vadeGunu.toStringIfNotNull,
      odemeTipi: model?.odemeTipi,
      efaturaSenaryo: model?.efaturaTipi,
      kull1s: model?.kull1s,
      kull2s: model?.kull2s,
      kull3s: model?.kull3s,
      kull4s: model?.kull4s,
      kull5s: model?.kull5s,
      kull6s: model?.kull6s,
      kull7s: model?.kull7s,
      kull8s: model?.kull8s,
      kull1n: model?.kull1n,
      kull2n: model?.kull2n,
      kull3n: model?.kull3n,
      kull4n: model?.kull4n,
      kull5n: model?.kull5n,
      kull6n: model?.kull6n,
      kull7n: model?.kull7n,
      kull8n: model?.kull8n,
      aciklama1: model?.aciklama1,
      aciklama2: model?.aciklama2,
      aciklama3: model?.aciklama3,
      postakodu: model?.postakodu,
      dovizli:  model?.dovizli == true ? "E" : "H",
      dovizKodu: model?.dovizKodu,
      plasiyerKodu: model?.plasiyerKodu,
      
    );
  }
}
