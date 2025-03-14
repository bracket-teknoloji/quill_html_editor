import "package:copy_with_extension/copy_with_extension.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../cari_hareketleri/model/cari_hareketleri_model.dart";
import "cari_detay_model.dart";

part "cari_listesi_model.g.dart";

@CopyWith()
@HiveType(typeId: 195)
@JsonSerializable(explicitToJson: true)
final class CariListesiModel with NetworkManagerMixin {
  CariListesiModel({
    this.cariKodu,
    this.cariAdi,
    this.bagliCari,
    this.bagliCariAdi,
    this.cariTip,
    this.cariTipAciklama,
    this.kilit,
    this.vadeGunu,
    this.odemeTipi,
    this.hesaptutmasekli,
    this.plasiyerKodu,
    this.plasiyerAciklama,
    this.borcToplami,
    this.bakiyeList,
    this.alacakToplami,
    this.genisk1Orani,
    this.ulkeKodu,
    this.ulkeAdi,
    this.cariIl,
    this.cariIlce,
    this.cariTel,
    this.postakodu,
    this.email,
    this.web,
    this.cariAdres,
    this.vergiDairesi,
    this.vergiNumarasi,
    this.grupKodu,
    this.grupTanimi,
    this.bilgi,
    this.aciklama1,
    this.aciklama2,
    this.aciklama3,
    this.kodu,
    this.kod1,
    this.kod1Tanimi,
    this.kod2,
    this.kod2Tanimi,
    this.kod3,
    this.kod3Tanimi,
    this.kod4,
    this.kod4Tanimi,
    this.kod5,
    this.kod5Tanimi,
    this.kayityapankul,
    this.kayittarihi,
    this.duzeltmeyapankul,
    this.duzeltmetarihi,
    this.efaturaMi,
    this.efaturaTipi,
    this.efatGecisTarihi,
    this.efatAktif,
    this.riskTakibi,
    this.efaturaCarisi,
    this.bakiye,
    this.enlem,
    this.boylam,
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
    this.fax,
    this.sahisFirmasiMi,
    this.dovizli,
    this.dovizKodu,
    this.dovizAdi,
    this.subeKodu,
    this.kosulKodu,
    this.fiyatGrubu,
    this.kull1S,
    this.kull2S,
    this.dovBorcToplami,
    this.dovAlacakToplami,
    this.dovBakiye,
    this.muhKodu,
    this.muhHesapTipi,
    this.iadeMiktarGirebilir,
    this.sunucuTarihi,
    this.adi,
    this.adres,
    this.efaturaSenaryo,
    this.eposta,
    this.ilce,
    this.islemKodu,
    this.kurfarkialacakKodu,
    this.kurfarkiborcKodu,
    this.muhasebeKodu,
    this.requestVersion,
    this.sehir,
    this.telefon,
    this.tipi,
    this.vergiNo,
    this.website,
    this.depoKodlari,
    this.idx,
    this.kurfarkiborcAdi,
    this.kurfarkialacakAdi,
    this.adresi,
    this.anaCari,
    this.cariHarf,
    this.duzeltmeYapanKullanici,
    this.eFatAktif,
    this.eFaturaMi,
    this.eFaturaMiEh,
    this.eFaturaSenaryo,
    this.eIrsaliyeMi,
    this.faxNo,
    this.fiyatSirasi,
    this.genIsk1O,
    this.irsaliyeRiskOrani,
    this.isletmeKodu,
    this.kayitYapanKullanici,
    this.konumMetre,
    this.kilitTipi,
    this.kurFarkiBorcMuhAdi,
    this.kurFarkiBorcMuhKodu,
    this.kurFarkiAlacakMuhAdi,
    this.kurFarkiAlacakMuhKodu,
    this.muhAdi,
    this.odemeKodu,
    this.plasiyerAdi,
    this.postaKodu,
    this.riskTutari,
    this.sahisSirketiMi,
    this.siparisRiskOrani,
    this.tempMuhtelifCari,
    this.tempNoterlerSorgula,
    this.tipAciklama,
    this.vadeUyarisi,
    this.webAdresi,
    this.yurtIciDovizKodu,
  });

  CariListesiModel._init();

  factory CariListesiModel.fromJson(Map<String, dynamic> json) => _$CariListesiModelFromJson(json);

  factory CariListesiModel.fromCariHareketleriModel(CariHareketleriModel? model) => CariListesiModel(
    cariAdi: model?.cariAdi,
    cariKodu: model?.cariKodu,
    plasiyerAciklama: model?.plasiyerAciklama,
    plasiyerKodu: model?.plasiyerKodu,
    bakiye: ((model?.alacak ?? 0) - (model?.borc ?? 0)).abs(),
    vadeGunu: DateTime.now().compareTo(model?.vadeTarihi ?? DateTime.now()),
  );

  factory CariListesiModel.fromSiparisModel(BaseSiparisEditModel? model) => CariListesiModel(
    cariAdi: model?.cariAdi,
    cariKodu: model?.cariKodu,
    plasiyerAciklama: model?.plasiyerAciklama,
    plasiyerKodu: model?.plasiyerKodu,
  );

  factory CariListesiModel.fromEBelgeListesiModel(EBelgeListesiModel? model) => CariListesiModel(
    cariAdi: model?.cariAdi,
    cariKodu: model?.cariKodu,
    cariIl: model?.cariIl,
    cariIlce: model?.cariIlce,
    vergiNo: model?.vergiNo,
    dovizli: model?.dovizliMi,
    cariTip: model?.gelenMi == true ? "S" : "A",
    cariTipAciklama: model?.gelenMi == true ? "Satıcı" : "Alıcı",
    dovizAdi: model?.dovizAdi,
    dovizKodu: model?.dovizTipi,
    email: model?.ePosta,
    sahisFirmasiMi: model?.vergiNo?.length == 11,
  );
  //singleton
  static CariListesiModel? _instance;
  static CariListesiModel get instance {
    _instance ??= CariListesiModel._init();
    return _instance!;
  }

  //setter for singleton
  static void setInstance(CariListesiModel? instance) {
    _instance = instance;
    if (instance != null) {
      CariDetayModel.setInstance(CariDetayModel.instance..cariList = [instance]);
    }
  }

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
  @HiveField(84)
  double? dovBorcToplami;
  @HiveField(85)
  double? dovAlacakToplami;
  @HiveField(86)
  double? dovBakiye;
  @HiveField(87)
  String? muhKodu;
  @HiveField(88)
  String? muhHesapTipi;
  @HiveField(89)
  bool? iadeMiktarGirebilir;
  @HiveField(90)
  DateTime? sunucuTarihi;
  @HiveField(91)
  String? adi;
  @HiveField(92)
  String? adres;
  @HiveField(93)
  String? efaturaSenaryo;
  @HiveField(94)
  String? eposta;
  @HiveField(95)
  String? ilce;
  @HiveField(96)
  int? islemKodu;
  @HiveField(97)
  String? kurfarkialacakKodu;
  @HiveField(98)
  String? kurfarkiborcKodu;
  @HiveField(99)
  String? muhasebeKodu;
  @HiveField(100)
  int? requestVersion;
  @HiveField(101)
  String? sehir;
  @HiveField(102)
  String? telefon;
  @HiveField(103)
  String? tipi;
  @HiveField(104)
  String? vergiNo;
  @HiveField(105)
  String? website;
  @HiveField(106)
  List<int>? depoKodlari;
  @HiveField(107)
  int? idx;
  @HiveField(108)
  String? kurfarkiborcAdi;
  @HiveField(109)
  String? kurfarkialacakAdi;
  @HiveField(110)
  String? muhAdi;
  @HiveField(111)
  bool? tempMuhtelifCari;
  @HiveField(112)
  bool? tempNoterlerSorgula;
  @HiveField(113)
  String? anaCari;
  @HiveField(114)
  String? tipAciklama;
  @HiveField(115)
  String? kilitTipi;
  @HiveField(116)
  bool? sahisSirketiMi;
  @HiveField(117)
  String? odemeKodu;
  @HiveField(119)
  int? isletmeKodu;
  @HiveField(120)
  String? plasiyerAdi;
  @HiveField(121)
  String? kurFarkiBorcMuhKodu;
  @HiveField(122)
  String? kurFarkiBorcMuhAdi;
  @HiveField(123)
  String? kurFarkiAlacakMuhKodu;
  @HiveField(124)
  String? kurFarkiAlacakMuhAdi;
  @HiveField(125)
  int? yurtIciDovizKodu;
  @HiveField(126)
  double? genIsk1O;
  @HiveField(127)
  String? faxNo;
  @HiveField(128)
  String? postaKodu;
  @HiveField(129)
  String? webAdresi;
  @HiveField(130)
  String? adresi;
  @HiveField(131)
  String? kayitYapanKullanici;
  @HiveField(132)
  String? duzeltmeYapanKullanici;
  @HiveField(133)
  bool? eFaturaMi;
  @HiveField(134)
  String? eFaturaMiEh;
  @HiveField(135)
  String? eFaturaSenaryo;
  @HiveField(136)
  bool? eIrsaliyeMi;
  @HiveField(137)
  bool? eFatAktif;
  @HiveField(138)
  String? cariHarf;
  @HiveField(139)
  double? riskTutari;
  @HiveField(140)
  String? vadeUyarisi;
  @HiveField(141)
  double? siparisRiskOrani;
  @HiveField(142)
  double? irsaliyeRiskOrani;
  @HiveField(143)
  int? konumMetre;
  @HiveField(144)
  int? fiyatSirasi;
  @HiveField(145)
  int? ozelKapatmaIncKey;

  @override
  CariListesiModel fromJson(Map<String, dynamic> json) => _$CariListesiModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CariListesiModelToJson(this);

  bool get muhtelifMi => cariKodu == "0" * 15;
}

@JsonSerializable(explicitToJson: true)
final class BakiyeModel {
  String? cariKodu;
  int? dovizTipi;
  double? borcToplami;
  int? alacakToplami;
  double? bakiye;
  String? dovizAdi;

  BakiyeModel fromJson(Map<String, dynamic> json) => _$BakiyeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BakiyeModelToJson(this);
}
