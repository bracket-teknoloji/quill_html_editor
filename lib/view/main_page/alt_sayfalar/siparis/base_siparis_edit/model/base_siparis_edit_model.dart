import "dart:convert";
import "dart:developer";

import "package:copy_with_extension/copy_with_extension.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/constants/enum/e_belge_turu_enum.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:uuid/uuid.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/base/view/e_irsaliye_ek_bilgiler/model/e_irsaliye_bilgi_model.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/yetki_controller/yetki_controller.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../../stok/base_stok_edit/model/stok_detay_model.dart";
import "../../../stok/stok_liste/model/stok_listesi_model.dart";

part "base_siparis_edit_model.g.dart";

@HiveType(typeId: 151)
class ListSiparisEditModel {
  @HiveField(0)
  List<BaseSiparisEditModel>? list;

  //setter for list
  set setList(List<BaseSiparisEditModel>? list) {
    this.list = list;
  }

  //remove index and set
  void removeAt(int index) {
    list?.removeAt(index);
    setList = list;
  }

  ListSiparisEditModel({this.list});
}

@CopyWith()
@HiveType(typeId: 152)
@JsonSerializable(createFactory: true)
class BaseSiparisEditModel with NetworkManagerMixin {
  //singleton
  static BaseSiparisEditModel? _instance;
  static BaseSiparisEditModel get instance {
    _instance ??= BaseSiparisEditModel._init();
    if (_instance?.isNew == true && _instance?.belgeNo != null && _instance?.kalemList.ext.isNotNullOrEmpty == true) {
      // final BaseSiparisEditModel? otherInstance = _instance?.siparisTipi?.getEditModel;
      // if (_instance != otherInstance) {
      const uuid = Uuid();
      _instance?.uuid = uuid.v4();
      CacheManager.addSiparisEditListItem(_instance!);
      // }
    }
    return _instance!;
  }

  @HiveField(0)
  DateTime? duzeltmetarihi;
  @HiveField(1)
  int? kalemAdedi;
  @HiveField(2)
  String? cariEfaturami;
  @HiveField(3)
  String? cYedek6;
  @HiveField(4)
  String? duzeltmeyapankul;
  @HiveField(5)
  String? plasiyerAciklama;
  @HiveField(6)
  String? projeAciklama;
  @HiveField(7)
  BaseSiparisEditModel? tempJsonData;
  @HiveField(8)
  String? teslimCariAdi;
  @HiveField(9)
  @JsonKey(defaultValue: false, includeToJson: false, includeFromJson: false)
  bool? kdvDahilmi;
  @HiveField(10)
  bool? remoteTempBelge;
  @HiveField(11)
  bool? tempBelgeMi;
  @HiveField(12)
  CariListesiModel? cariModel;
  @HiveField(13)
  DateTime? islemeBaslamaTarihi;
  @HiveField(14)
  DateTime? istenilenTeslimTarihi;
  @HiveField(15)
  DateTime? kayittarihi;
  @HiveField(16)
  DateTime? kosulTarihi;
  @HiveField(17)
  DateTime? tarih;
  @HiveField(18)
  DateTime? teslimTarihi;
  @HiveField(19)
  DateTime? vadeTarihi;
  @HiveField(20)
  double? araToplam;
  @HiveField(21)
  double? ekMaliyet1Tutari;
  @HiveField(22)
  double? ekMaliyet2Tutari;
  @HiveField(23)
  double? ekMaliyet3Tutari;
  @HiveField(24)
  double? genelIskonto1;
  @HiveField(25)
  double? genelIskonto2;
  @HiveField(26)
  double? genelIskonto3;
  @HiveField(27)
  double? genelToplam;
  @HiveField(28)
  double? genIsk1o;
  @HiveField(29)
  double? genIsk1t;
  @HiveField(30)
  double? genIsk2o;
  @HiveField(31)
  double? genIsk2t;
  @HiveField(32)
  double? genIsk3o;
  @HiveField(33)
  double? genIsk3t;
  @HiveField(34)
  double? kdv;
  @HiveField(35)
  @JsonKey(name: "BelgeTipi")
  int? belgeTipi;
  @HiveField(36)
  int? cikisDepoKodu;
  @HiveField(37)
  int? genisk1Tipi;
  @HiveField(38)
  int? genisk2Tipi;
  @HiveField(39)
  int? genisk3Tipi;
  @HiveField(40)
  int? kalemModelAdedi;
  @HiveField(41)
  int? tempBelgeId;
  @HiveField(42)
  int? tempKayitTipi;
  @HiveField(43)
  int? tipi;
  @HiveField(44)
  int? topluDepo;
  @HiveField(45)
  int? vadeGunu;
  @HiveField(46)
  List<dynamic>? tempSipList;
  @HiveField(47)
  List<KalemModel>? kalemList;
  @HiveField(48)
  List<KalemModel>? kalemModeller;
  @HiveField(49)
  List<KalemModel>? kalemModelList;
  @HiveField(50)
  String? acik1;
  @HiveField(51)
  String? acik10;
  @HiveField(52)
  String? acik11;
  @HiveField(53)
  String? acik12;
  @HiveField(54)
  String? acik13;
  @HiveField(55)
  String? acik14;
  @HiveField(56)
  String? acik15;
  @HiveField(57)
  String? acik16;
  @HiveField(58)
  String? acik2;
  @HiveField(59)
  String? acik3;
  @HiveField(60)
  String? acik4;
  @HiveField(61)
  String? acik5;
  @HiveField(62)
  String? acik6;
  @HiveField(63)
  String? acik7;
  @HiveField(64)
  String? acik8;
  @HiveField(65)
  String? acik9;
  @HiveField(66)
  String? belgeKodu;
  @HiveField(67)
  String? belgeNo;
  @HiveField(68)
  String? belgeTuru;
  @HiveField(69)
  String? cariAdi;
  @HiveField(70)
  String? cariKodu;
  @HiveField(71)
  @JsonKey(name: "EK_ACIK_1")
  String? ekAcik1;
  @HiveField(72)
  @JsonKey(name: "EK_ACIK_10")
  String? ekAcik10;
  @HiveField(73)
  @JsonKey(name: "EK_ACIK_11")
  String? ekAcik11;
  @HiveField(74)
  @JsonKey(name: "EK_ACIK_12")
  String? ekAcik12;
  @HiveField(75)
  @JsonKey(name: "EK_ACIK_13")
  String? ekAcik13;
  @HiveField(76)
  @JsonKey(name: "EK_ACIK_14")
  String? ekAcik14;
  @HiveField(77)
  @JsonKey(name: "EK_ACIK_51")
  String? ekAcik15;
  @HiveField(78)
  @JsonKey(name: "EK_ACIK_16")
  String? ekAcik16;
  @HiveField(79)
  @JsonKey(name: "EK_ACIK_2")
  String? ekAcik2;
  @HiveField(80)
  @JsonKey(name: "EK_ACIK_3")
  String? ekAcik3;
  @HiveField(81)
  @JsonKey(name: "EK_ACIK_4")
  String? ekAcik4;
  @HiveField(82)
  @JsonKey(name: "EK_ACIK_5")
  String? ekAcik5;
  @HiveField(83)
  @JsonKey(name: "EK_ACIK_6")
  String? ekAcik6;
  @HiveField(84)
  @JsonKey(name: "EK_ACIK_7")
  String? ekAcik7;
  @HiveField(85)
  @JsonKey(name: "EK_ACIK_8")
  String? ekAcik8;
  @HiveField(86)
  @JsonKey(name: "EK_ACIK_9")
  String? ekAcik9;
  @HiveField(87)
  String? ekAciklama;
  @HiveField(88)
  String? islemId;
  @HiveField(89)
  String? kayityapankul;
  @HiveField(90)
  @JsonKey(defaultValue: "H")
  String? kdvDahil;
  @HiveField(91)
  String? kosulKodu;
  @HiveField(92)
  String? mevcutBelgeNo;
  @HiveField(93)
  String? mevcutCariKodu;
  @HiveField(94)
  String? odemeKodu;
  @HiveField(95)
  String? ozelKod1;
  @HiveField(96)
  String? ozelKod2;
  @HiveField(97)
  @JsonKey(name: "PickerBelgeTuru")
  String? pickerBelgeTuru;
  @HiveField(98)
  String? plasiyerKodu;
  @HiveField(99)
  String? projeKodu;
  @HiveField(100)
  String? remoteTempBelgeEtiketi;
  @HiveField(101)
  String? tag;
  @HiveField(102)
  List<KalemModel>? kalemler;
  @HiveField(103)
  @JsonKey(includeToJson: false, includeFromJson: false)
  EditTipiEnum? siparisTipi;
  //! Yeni mi diye kontrol etmek için
  @HiveField(104)
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool? isNew;
  @HiveField(105)
  String? irsaliyelesti;
  @HiveField(106)
  int? irslesenSayi;
  @HiveField(107)
  String? faturalasti;
  @HiveField(108)
  int? dovizTipi;
  @HiveField(109)
  String? dovizAdi;
  @HiveField(110)
  String? kapatilmis;
  @HiveField(111)
  String? aciklama;
  @HiveField(112)
  double? dovizTutari;
  @HiveField(113)
  String? teslimCari;
  @HiveField(114)
  double? fYedek4;
  @HiveField(115)
  @JsonKey(name: "_YeniKayit")
  bool? yeniKayit;
  @HiveField(116)
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? uuid;
  @HiveField(117)
  int? faturalasanSayi;
  @HiveField(118)
  double? miktar;
  @HiveField(119)
  double? kalanMiktar;
  @HiveField(120)
  String? yeniBelgeNo;
  @HiveField(121)
  int? islemKodu;
  @HiveField(122)
  String? resmiBelgeNo;
  @HiveField(123)
  String? cikisYeri;
  @HiveField(124)
  String? hareketTuru;
  @HiveField(125)
  String? kasaKodu;
  @HiveField(126)
  String? efaturaDurumu;
  @HiveField(127)
  String? efaturaTipi;
  @HiveField(128)
  String? earsivDurumu;
  @HiveField(129)
  int? genIsk1O;
  @HiveField(130)
  double? genIsk2O;
  @HiveField(131)
  double? genIsk3O;
  @HiveField(132)
  bool? cariDovizli;
  @HiveField(133)
  String? efaturaMi;
  @HiveField(134)
  String? efatOnayDurumKodu;
  @HiveField(135)
  String? efatOnayAciklama;
  @HiveField(136)
  int? efaturaGibDurumKodu;
  @HiveField(137)
  String? efaturaDurumAciklama;
  @HiveField(138)
  String? earsivMi;
  @HiveField(139)
  String? earsivDurumAciklama;
  @HiveField(140)
  int? earsivGibDurumKodu;
  @HiveField(141)
  String? eirsaliyeDurumu;
  @HiveField(142)
  String? ebelgeCheckbox;
  @HiveField(143)
  EIrsaliyeBilgiModel? eirsBilgiModel;
  @HiveField(144)
  String? uetdsBildirildi;
  @HiveField(145)
  @JsonKey(defaultValue: false, includeToJson: false, includeFromJson: false)
  bool? kdvDahilMi;
  @HiveField(146)
  int? efatOzelkod;
  @HiveField(147)
  String? siparislesti;
  @HiveField(148)
  String? arrBelgeNo;
  @HiveField(149)
  String? sonrakiRevizeNo;
  @HiveField(150)
  bool? teklifRevizeIslemi;
  @HiveField(151)
  String? onaylayankul;
  @HiveField(152)
  DateTime? onaytarihi;
  @HiveField(153)
  String? efaturaSenaryo;
  @HiveField(154)
  @JsonKey(defaultValue: {})
  Map<String, dynamic>? paramMap;
  @HiveField(155)
  String? yeniCariKodu;
  @HiveField(156)
  String? depoTanimi;
  @HiveField(157)
  bool? efattanAlisFat;
  @HiveField(158)
  int? efaturaInckeyno;
  @HiveField(159)
  String? ebelgeZarfid;
  // @JsonKey(includeFromJson: false, includeToJson: false)
  @HiveField(160)
  double? efattanTutar;
  @HiveField(161)
  double? efattanDoviz;
  @HiveField(162)
  String? efattanDovizAdi;
  @HiveField(163)
  CariListesiModel? muhtelifCariModel;
  @HiveField(164)
  String? cariTitle;
  @HiveField(165)
  int? hedefDepo;
  @HiveField(166)
  int? girisDepo;
  @HiveField(167)
  int? cikisSubeKodu;
  @HiveField(168)
  int? girisSubeKodu;
  @HiveField(169)
  String? lokalDat;
  @HiveField(170)
  String? masrafKodu;
  @HiveField(171)
  String? eirsaliye;
  @HiveField(172)
  int? girisDepoKodu;
  @HiveField(173)
  String? topluGirisDepoTanimi;
  @HiveField(174)
  String? topluCikisDepoTanimi;
  @HiveField(175)
  String? isemriNo;
  @HiveField(176)
  String? isemriAciklama;
  @HiveField(177)
  String? masrafKoduAdi;
  @HiveField(178)
  int? masrafKoduTipi;
  @HiveField(179)
  String? eirsaliyeMi;
  @HiveField(180)
  String? eirsaliyeDurumAciklama;
  @HiveField(181)
  int? eirsaliyeGibDurumKodu;
  @HiveField(182)
  int? cariDovizkodu;
  @HiveField(183)
  String? datOnayda;
  @HiveField(184)
  String? olcumBelgeRefKey;
  @HiveField(185)
  @JsonKey(defaultValue: {})
  Map<String, double>? dovizListesi;

  BaseSiparisEditModel({
    this.duzeltmetarihi,
    this.kalemAdedi,
    this.cariEfaturami,
    this.cYedek6,
    this.duzeltmeyapankul,
    this.plasiyerAciklama,
    this.projeAciklama,
    this.tempJsonData,
    this.teslimCariAdi,
    this.kdvDahilmi,
    this.remoteTempBelge,
    this.tempBelgeMi,
    this.cariModel,
    this.islemeBaslamaTarihi,
    this.istenilenTeslimTarihi,
    this.kayittarihi,
    this.kosulTarihi,
    this.tarih,
    this.teslimTarihi,
    this.vadeTarihi,
    this.araToplam,
    this.ekMaliyet1Tutari,
    this.ekMaliyet2Tutari,
    this.ekMaliyet3Tutari,
    this.genelIskonto1,
    this.genelIskonto2,
    this.genelIskonto3,
    this.genelToplam,
    this.genIsk1o,
    this.genIsk1t,
    this.genIsk2o,
    this.genIsk2t,
    this.genIsk3o,
    this.genIsk3t,
    this.kdv,
    this.belgeTipi,
    this.cikisDepoKodu,
    this.genisk1Tipi,
    this.genisk2Tipi,
    this.genisk3Tipi,
    this.kalemModelAdedi,
    this.tempBelgeId,
    this.tempKayitTipi,
    this.tipi,
    this.topluDepo,
    this.vadeGunu,
    this.tempSipList,
    this.kalemList,
    this.kalemModeller,
    this.kalemModelList,
    this.acik1,
    this.acik10,
    this.acik11,
    this.acik12,
    this.acik13,
    this.acik14,
    this.acik15,
    this.acik16,
    this.acik2,
    this.acik3,
    this.acik4,
    this.acik5,
    this.acik6,
    this.acik7,
    this.acik8,
    this.acik9,
    this.belgeKodu,
    this.belgeNo,
    this.belgeTuru,
    this.cariAdi,
    this.cariKodu,
    this.ekAcik1,
    this.ekAcik10,
    this.ekAcik11,
    this.ekAcik12,
    this.ekAcik13,
    this.ekAcik14,
    this.ekAcik15,
    this.ekAcik16,
    this.ekAcik2,
    this.ekAcik3,
    this.ekAcik4,
    this.ekAcik5,
    this.ekAcik6,
    this.ekAcik7,
    this.ekAcik8,
    this.ekAcik9,
    this.ekAciklama,
    this.islemId,
    this.kayityapankul,
    this.kdvDahil,
    this.kosulKodu,
    this.mevcutBelgeNo,
    this.mevcutCariKodu,
    this.odemeKodu,
    this.ozelKod1,
    this.ozelKod2,
    this.pickerBelgeTuru,
    this.plasiyerKodu,
    this.projeKodu,
    this.remoteTempBelgeEtiketi,
    this.tag,
    this.kalemler,
    this.siparisTipi,
    this.isNew,
    this.irsaliyelesti,
    this.irslesenSayi,
    this.faturalasti,
    this.dovizTipi,
    this.dovizAdi,
    this.kapatilmis,
    this.aciklama,
    this.dovizTutari,
    this.teslimCari,
    this.fYedek4,
    this.miktar,
    this.kalanMiktar,
    this.yeniBelgeNo,
    this.islemKodu,
    this.resmiBelgeNo,
    this.cikisYeri,
    this.hareketTuru,
    this.kasaKodu,
    this.efaturaDurumu,
    this.efaturaTipi,
    this.earsivDurumu,
    this.genIsk1O,
    this.genIsk2O,
    this.genIsk3O,
    this.cariDovizli,
    this.efaturaMi,
    this.efatOnayDurumKodu,
    this.efatOnayAciklama,
    this.efaturaGibDurumKodu,
    this.efaturaDurumAciklama,
    this.earsivMi,
    this.earsivDurumAciklama,
    this.earsivGibDurumKodu,
    this.eirsaliyeDurumu,
    this.ebelgeCheckbox,
    this.eirsBilgiModel,
    this.uetdsBildirildi,
    this.kdvDahilMi,
    this.efatOzelkod,
    this.siparislesti,
    this.faturalasanSayi,
    this.yeniKayit,
    this.uuid,
    this.arrBelgeNo,
    this.sonrakiRevizeNo,
    this.teklifRevizeIslemi,
    this.onaylayankul,
    this.onaytarihi,
    this.efaturaSenaryo,
    this.paramMap,
    this.yeniCariKodu,
    this.depoTanimi,
    this.efattanAlisFat,
    this.efaturaInckeyno,
    this.ebelgeZarfid,
    this.efattanTutar,
    this.efattanDoviz,
    this.efattanDovizAdi,
    this.muhtelifCariModel,
    this.cariTitle,
    this.hedefDepo,
    this.girisDepo,
    this.cikisSubeKodu,
    this.girisSubeKodu,
    this.lokalDat,
    this.masrafKodu,
    this.eirsaliye,
    this.girisDepoKodu,
    this.topluGirisDepoTanimi,
    this.topluCikisDepoTanimi,
    this.isemriNo,
    this.isemriAciklama,
    this.masrafKoduAdi,
    this.masrafKoduTipi,
    this.eirsaliyeDurumAciklama,
    this.eirsaliyeMi,
    this.cariDovizkodu,
    this.eirsaliyeGibDurumKodu,
    this.datOnayda,
    this.olcumBelgeRefKey,
    this.dovizListesi,
  });

  BaseSiparisEditModel._init();

  String? getTitle(String? belgeNo) {
    if (_yetkiController.eArsivSerisindenMi(belgeNo ?? "")) {
      return "E-Arşiv";
    } else if (_yetkiController.eFaturaSerisindenMi(belgeNo ?? "")) {
      return "E-Fatura";
    } else if (_yetkiController.eIrsaliyeSerisindenMi(belgeNo ?? "")) {
      return "E-İrsaliye";
    }
    return null;
  }

  YetkiController get _yetkiController => YetkiController();

  bool get eBelgeMi => eArsivMi || eFaturaMi || eIrsaliyeMi;

  bool get muhtelifMi => cariKodu == ("0" * 15);

  bool get eFaturaSerisindenMi => _yetkiController.eFaturaSerisindenMi(belgeNo ?? "");

  bool get eArsivSerisindenMi => _yetkiController.eArsivSerisindenMi(belgeNo ?? "");

  bool get eIrsaliyeSerisindenMi => _yetkiController.eIrsaliyeSerisindenMi(belgeNo ?? "");

  bool get eBelgeSerisinden => eFaturaSerisindenMi || eArsivSerisindenMi || eIrsaliyeSerisindenMi;

  bool get eBelgeEslestirmeIslemiYapilabilirMi => resmiBelgeNo != null && (aIrsMi || aFaturaMi);

  bool get eIrsaliyeIslemleriYapilabilirMi => _yetkiController.eIrsaliyeAktif && eIrsaliyeMi;

  bool get eBelgeIslemlerGorunsunMu =>
      _yetkiController.eFaturaAktif && (eBelgeSerisinden || eBelgeMi || eBelgeEslestirmeIslemiYapilabilirMi) && ((getEditTipiEnum?.faturaMi ?? false) || eIrsaliyeIslemleriYapilabilirMi);

  bool get isTempBelge => remoteTempBelge == true || (tempKayitTipi ?? 0) > 0;

  // bool get taslakMi => (earsivDurumu == "TAS" || efaturaDurumu == "TAS") && (efaturaMi == "E" || earsivMi == "E");

  bool get eArsivMi => earsivMi == "E";

  bool get eFaturaMi => efaturaMi == "E";

  bool get eIrsaliyeMi => eirsaliyeMi == "E";

  bool get siparislestiMi => siparislesti == "E";

  bool get faturalastiMi => faturalasti == "E";

  bool get irsaliyelestiMi => irsaliyelesti == "E";

  bool get kapaliMi => tipi == 1;

  bool get basariliMi {
    if (eArsivMi) {
      return earsivDurumu == "TMM";
    } else if (eFaturaMi) {
      return efaturaDurumu == "TMM" && (getEditTipiEnum?.satisMi ?? false);
    } else if (eIrsaliyeMi) {
      return eirsaliyeDurumu == "TMM";
    }
    return false;
  }

  bool get uyariMi {
    if (eArsivMi) {
      return earsivDurumu == "BEK";
    } else if (eFaturaMi) {
      return efaturaDurumu == "BEK" && (getEditTipiEnum?.satisMi ?? false);
    } else if (eIrsaliyeMi) {
      return eirsaliyeDurumu == "BEK";
    }
    return false;
  }

  String get gibDurumKodu {
    final String value;
    if (eArsivMi) {
      value = "$earsivGibDurumKodu\n$earsivDurumAciklama";
    } else if (eFaturaMi) {
      value = "$efaturaGibDurumKodu\n$efaturaDurumAciklama";
    } else if (eIrsaliyeMi) {
      value = "$eirsaliyeGibDurumKodu\n$eirsaliyeDurumAciklama";
    } else {
      value = "";
    }
    return "Durum Kodu: $value";
  }

  int? get getModulID {
    if (eArsivSerisindenMi) {
      return 100;
    } else if (eFaturaSerisindenMi) {
      return 99;
    } else if (eIrsaliyeSerisindenMi) {
      return 104;
    }
    return null;
  }

  bool get taslakMi {
    if (eArsivMi) {
      return earsivDurumu == "TAS";
    } else if (eFaturaMi) {
      return efaturaDurumu == "TAS" && (getEditTipiEnum?.satisMi ?? false);
    } else if (eIrsaliyeMi) {
      return eirsaliyeDurumu == "TAS";
    }
    return false;
  }

  bool get hataliMi {
    if (eFaturaMi) {
      return efaturaDurumu == "HAT";
    } else if (eIrsaliyeMi) {
      return eirsaliyeDurumu == "HAT";
    } else if (eArsivMi) {
      return earsivDurumu == "HAT";
    } else {
      return false;
    }
  }

  bool get islemBilgileriDegistirebilirMi => (!kapaliMi) && (getEditTipiEnum?.duzenlensinMi ?? false);

  // bool get eBelgeGoster => eFaturaMi || eArsivMi;

  bool get onaylandiMi => onaylayankul != null;

  bool get onaydaMi => tipi == 3;

  bool get stekMi => belgeTuru == "STEK";

  bool get stalMi => belgeTuru == "STAL";

  bool get atalMi => belgeTuru == "ATAL";

  bool get aIrsMi => belgeTuru == "AI";

  bool get sIrsMi => belgeTuru == "SI";

  bool get aFaturaMi => belgeTuru == "AF";

  bool get sFaturaMi => belgeTuru == "SF";

  bool get faturaIrsaliyeMi => belgeTuru == "SI" || belgeTuru == "AI" || belgeTuru == "SF" || belgeTuru == "AF";

  bool get teklifRevizeEdilmisMi => sonrakiRevizeNo != null;

  bool get teklifIrsaliyeDonerMi => !(kapaliMi || onaydaMi || teklifRevizeEdilmisMi) ? siparislestiMi : false;

  String? get eFaturaTipAdi {
    if (efaturaTipi == "TIC") {
      return "Ticari";
    } else if (efaturaTipi == "TEM") {
      return "Temel";
    }
    return null;
  }

  String get titleName {
    if (eFaturaSerisindenMi) {
      return "E-Fatura";
    } else if (eArsivSerisindenMi) {
      return "E-Arşiv";
    } else if (eIrsaliyeSerisindenMi) {
      return "E-İrsaliye";
    } else {
      return "Sipariş";
    }
  }

  String get tipiName {
    final Map<String, int> belgeTipiMap = <String, int>{
      "Kapalı": 1,
      "Açık": 2,
      "İade": 4,
      "Zayi İade": 5,
      "İhracat": 6,
    };
    return belgeTipiMap.entries.firstWhereOrNull((element) => element.value == tipi)?.key ?? "";
  }

  bool get dovizliMi => kalemList?.any((element) => element.dovizliMi) == true;

  bool get teklifFaturayaDonerMi {
    final bool islemGorduMu = kapaliMi || onaydaMi || teklifRevizeEdilmisMi;
    if (islemGorduMu) {
      return false;
    }
    if (!siparislestiMi) {
      return false;
    }
    return siparislestiMi || irsaliyelestiMi;
  }

  String get faturaTipi {
    if (eFaturaSerisindenMi) {
      return "EFT";
    } else if (eArsivSerisindenMi) {
      return "EAR";
    } else if (eIrsaliyeSerisindenMi) {
      return "EIR";
    } else {
      return "Sipariş";
    }
  }

  bool get teklifSipariseDonerMi => !(kapaliMi || onaydaMi || teklifRevizeEdilmisMi);

  bool get teklifRevizeEdilebilirMi => !(kapaliMi || onaydaMi || teklifRevizeEdilmisMi);

  EditTipiEnum? get getEditTipiEnum => EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == belgeTuru);

  EBelgeTuruEnum? get getEBelgeTuruEnum => EBelgeTuruEnum.values.firstWhereOrNull((element) => element.value == faturaTipi);

  // bool get muhtelifCariMi => cariKodu ;

  double get eBelgeGonderAraToplam => (genelToplam ?? 0) - (kdv ?? 0);

  bool kalemEkliMi(StokListesiModel? model) {
    if (model != null) {
      return kalemList?.any((element) => element.stokKodu == model.stokKodu) ?? false;
    } else {
      return false;
    }
  }

  bool get silinebilirMi {
    switch (efaturaDurumu) {
      case "TMM":
      case "BEK":
      case "TAS":
        return false;
      default:
        return true;
    }
  }

  double get genelDovizliToplamTutar {
    dovizTutari = kalemList?.map((e) => e.dovizAdi != null ? e.dovizBrutTutar : 0).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
    return dovizTutari ?? 0;
  }

  double get sumGenIsk1 => kalemList?.map((e) => e.iskonto1).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;
  double get sumGenIsk2 => kalemList?.map((e) => e.iskonto2).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;
  double get sumGenIsk3 => kalemList?.map((e) => e.iskonto3).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;
  double get malFazlasiTutar => kalemList?.map((e) => e.mfTutari).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
  double get malFazlasiDovizTutari => kalemList?.map((e) => e.mfTutari / (e.dovizKuru ?? 1)).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
  double get kdvTutari {
    kdv = iskontoCheckerEkMaliyetsiz(kalemList?.map((e) => e.kdvTutari).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0);
    return kdv ?? 0;
  }

  double get dovizliKdv => dovizliIskontoCheckerEkMaliyetsiz(kalemList?.map((e) => e.dovizliMi ? e.dovizKdvTutari : 0).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0);

  double get getDovizTutari {
    dovizTutari = kalemList?.map((e) => e.dovizliMi ? e.dovizBrutTutar : 0).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
    return dovizTutari ?? 0;
  }

  double iskontoCheckerEkMaliyetsiz(double result) {
    if (genIsk1o != null && genIsk1o != 0.0) {
      result = result - result * ((genIsk1o ?? 0) / 100);
      genelIskonto1 = result * (genIsk1o ?? 0) / 100;
    } else {
      genelIskonto1 = 0;
    }
    if (genIsk2o != null && genIsk2o != 0.0) {
      result = result - result * ((genIsk2o ?? 0) / 100);
      genelIskonto2 = result * (genIsk2o ?? 0) / 100;
    } else {
      genelIskonto2 = 0;
    }
    if (genIsk3o != null && genIsk3o != 0.0) {
      result = result - result * ((genIsk3o ?? 0) / 100);
      genelIskonto3 = result * (genIsk3o ?? 0) / 100;
    } else {
      genelIskonto3 = 0;
    }
    return result;
  }

  double dovizliIskontoCheckerEkMaliyetsiz(double result) {
    if (genIsk1o != null && genIsk1o != 0.0) {
      result = result - result * ((genIsk1o ?? 0) / 100);
    }
    if (genIsk2o != null && genIsk2o != 0.0) {
      result = result - result * ((genIsk2o ?? 0) / 100);
    }
    if (genIsk3o != null && genIsk3o != 0.0) {
      result = result - result * ((genIsk3o ?? 0) / 100);
    }
    return result;
  }

  String get kdvTutarlariVeOranlari {
    String result = "";
    kalemList?.forEach((element) {
      if (element.kdvTutari != 0) {
        result += "${element.stokAdi ?? ""} %${element.kdvOrani} : ${element.kdvTutari}\n";
      }
    });
    return result;
  }

  double get satirIskonto => kalemList?.map((e) => e.iskontoTutari).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
  double get satirDovizIskonto => kalemList?.map((e) => e.dovizIskontoTutari).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
  int toplamKalemMiktari([bool miktar2EklensinMi = false]) => kalemList?.map((e) => e.toplamKalemMiktari(miktar2EklensinMi).toInt()).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
  double get toplamAgirlik => kalemList?.map((e) => e.kalemAgirlik).sum ?? 0;
  double get toplamBrutTutar => kalemList?.map((e) => e.brutTutar).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
  double get toplamAraToplam => kalemList?.map((e) => e.araToplamTutari).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
  double get toplamDovizBrutTutar => kalemList?.map((e) => e.getDovizBrutTutar).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;
  double get toplamNetTutar => kalemList?.map((e) => e.netFiyat ?? 0).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;

  double get tutarToIskonto1 => (genIsk1t ?? 0) / (toplamAraToplam != 0 ? toplamAraToplam : 1) * 100;

  double get genelToplamTutar {
    if (kdvDahilMi ?? false) {
      genelToplam = toplamBrutTutar - getToplamIskonto;
    } else {
      //? getToplamEkMaliyet ekleme sebebim GetToplamIskonto İçinde zaten bulunuyor olması
      genelToplam = getAraToplam + kdvTutari + getToplamEkMaliyet;
    }
    return genelToplam ?? 0;
  }

  double get genelDovizToplamTutar {
    if (kdvDahilMi ?? false) {
      dovizTutari = toplamDovizBrutTutar - getDovizliToplamIskonto;
    } else {
      dovizTutari = getDovizliToplamTutar;
    }
    return dovizTutari ?? 0;
  }

  double get getAraToplam {
    araToplam = iskontoChecker(kalemList?.map((e) => e.araToplamTutari).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0) - ((BaseSiparisEditModel.instance.kdvDahilMi ?? false) ? kdvTutari : 0);
    return araToplam ?? 0;
  }

  double get getDovizliAraToplam => dovizliIskontoCheckerEkMaliyetsiz(kalemList?.map((e) => e.dovizAraToplamTutari).sum ?? 0) - ((BaseSiparisEditModel.instance.kdvDahilMi ?? false) ? dovizliKdv : 0);

  double get getDovizliToplamTutar => dovizliIskontoCheckerEkMaliyetsiz(kalemList?.map((e) => e.dovizGenelToplamTutari).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0);

  double get getAraToplam2 => (genelToplam ?? 0) - (kdv ?? 0);

  double get dovizKuru => (genelToplam ?? 0) / (dovizTutari ?? 0);

  double iskontoChecker(double result) {
    if (genIsk1o != null && genIsk1o != 0.0) {
      genelIskonto1 = result * (genIsk1o ?? 0) / 100;
      genIsk1t = genelIskonto1;
      result = result - result * ((genIsk1o ?? 0) / 100);
    } else {
      genelIskonto1 = 0;
      genIsk1t = 0;
    }
    if (genIsk2o != null && genIsk2o != 0.0) {
      genelIskonto2 = result * (genIsk2o ?? 0) / 100;
      genIsk2t = genelIskonto2;
      result = result - result * ((genIsk2o ?? 0) / 100);
    } else {
      genelIskonto2 = 0;
      genIsk2t = 0;
    }
    if (genIsk3o != null && genIsk3o != 0.0) {
      genelIskonto3 = result * (genIsk3o ?? 0) / 100;
      genIsk3t = genelIskonto3;
      result = result - result * ((genIsk3o ?? 0) / 100);
    } else {
      genelIskonto3 = 0;
      genIsk3t = 0;
    }
    return result + (ekMaliyet1Tutari ?? 0) + (ekMaliyet2Tutari ?? 0) + (ekMaliyet3Tutari ?? 0);
  }

  int get getKalemSayisi => kalemList?.length ?? (kalemAdedi ?? 0);

  bool get yurticiMi => tipi != 6;
  bool get isEmpty {
    log(toJson().toString());
    return this == BaseSiparisEditModel();
  }

  bool get isRemoteTempBelgeNull => remoteTempBelge == null;

  double get getToplamEkMaliyet => (ekMaliyet1Tutari ?? 0) + (ekMaliyet2Tutari ?? 0) + (ekMaliyet3Tutari ?? 0);

  double get getToplamIskonto => toplamBrutTutar - getAraToplam - ((kdvDahilMi ?? false) ? kdvTutari : 0) + getToplamEkMaliyet;

  double get getDovizliToplamIskonto => getDovizliToplamTutar - getDovizliAraToplam - dovizliKdv;

  double get genelIskontoToplami => (genIsk1t ?? 0) + (genIsk2t ?? 0) + (genIsk3t ?? 0);

  double get getBrutTutar => kalemList?.map((e) => e.brutFiyat).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;

  factory BaseSiparisEditModel.fromJson(String json) => _$BaseSiparisEditModelFromJson(jsonDecode(json));

  @override
  BaseSiparisEditModel fromJson(Map<String, dynamic> json) => _$BaseSiparisEditModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseSiparisEditModelToJson(this);

  //reset singleton
  static void resetInstance() => setInstance(BaseSiparisEditModel());

  //setter for singleton
  static void setInstance(BaseSiparisEditModel instance) => _instance = instance;

  factory BaseSiparisEditModel.fromEBelgeListesiModel(EBelgeListesiModel model) => BaseSiparisEditModel(
        belgeNo: model.belgeNo,
        belgeTuru: model.belgeTuru,
        cariKodu: model.cariKodu,
        cariAdi: model.cariAdi,
        tarih: model.tarih,
        genelToplam: model.genelToplam,
        dovizTutari: model.dovizTutari,
        dovizTipi: model.dovizTipi,
        dovizAdi: model.dovizAdi,
        cariDovizli: model.dovizliMi,
        kdvDahilMi: model.kdvTutari != null,
        kdvDahil: model.kdvTutari != null ? "E" : "H",
        aciklama: model.aciklama,
        efaturaSenaryo: model.senaryoTipi,
      );

  factory BaseSiparisEditModel.cariKoduDegistir(BaseSiparisEditModel model) => BaseSiparisEditModel(
        cariKodu: model.cariKodu,
        belgeNo: model.belgeNo,
        tipi: model.tipi,
        belgeTuru: model.belgeTuru,
        islemKodu: 3,
        pickerBelgeTuru: model.pickerBelgeTuru,
        tag: "FaturaModel",
        paramMap: {
          "TESLIM_CARI_DEGISMESIN": "H",
        },
      );

  factory BaseSiparisEditModel.belgeNoDegistir(BaseSiparisEditModel model) => BaseSiparisEditModel(
        cariKodu: model.cariKodu,
        belgeNo: model.belgeNo,
        tipi: model.tipi,
        belgeTuru: model.belgeTuru,
        belgeTipi: model.belgeTipi,
        islemKodu: 10,
        pickerBelgeTuru: model.pickerBelgeTuru,
        yeniBelgeNo: model.yeniBelgeNo,
        resmiBelgeNo: model.resmiBelgeNo,
        tag: "FaturaModel",
      );

  factory BaseSiparisEditModel.fromCariListesiModel(CariListesiModel model) => BaseSiparisEditModel(
        cariKodu: model.cariKodu,
        cariAdi: model.cariAdi,
        dovizAdi: model.dovizAdi,
        cariDovizli: model.dovizli,
        plasiyerAciklama: model.plasiyerAciklama,
        plasiyerKodu: model.plasiyerKodu,
      );

  factory BaseSiparisEditModel.fromOlcumBelgeModel(OlcumBelgeModel model) => BaseSiparisEditModel(
        cariKodu: model.cariKodu,
        belgeNo: model.belgeNo,
        belgeTuru: model.belgeTuru,
        pickerBelgeTuru: model.belgeTuru,
      );
}

@CopyWith()
@HiveType(typeId: 17)
@JsonSerializable(createFactory: true)
class KalemModel with NetworkManagerMixin, BaseStokMixin {
  @HiveField(0)
  @JsonKey(defaultValue: true, name: "ISKONTO_1_ORAN_MI")
  bool? iskonto1OranMi;
  @HiveField(1)
  DateTime? tarih;
  @HiveField(2)
  DateTime? teslimTarihi;
  @HiveField(3)
  double? brutFiyat;
  @HiveField(4)
  int? depoKodu;
  @HiveField(5)
  double? kdvOrani;
  @override
  @HiveField(6)
  double? miktar;
  @HiveField(7)
  int? olcuBirimKodu;
  @HiveField(8)
  int? sira;
  @HiveField(9)
  List<dynamic>? hucreList;
  @HiveField(10)
  List<StokList>? kalemModelHucreList;
  @HiveField(11)
  @JsonKey(name: "SeriList")
  List<SeriList>? seriList;
  @HiveField(12)
  List<dynamic>? tempBarkodList;
  @HiveField(13)
  String? belgeNo;
  @HiveField(14)
  // @JsonKey(name: "BelgeTipi")
  String? belgeTipi;
  @HiveField(15)
  String? cariKodu;
  @HiveField(16)
  String? depoTanimi;
  @HiveField(17)
  String? olcuBirimAdi;
  @override
  @HiveField(18)
  String? stokAdi;
  @override
  @HiveField(19)
  String? stokKodu;
  @HiveField(20)
  String? stokOlcuBirimi;
  @HiveField(21)
  double? dovizKuru;
  @HiveField(22)
  int? dovizTipi;
  @HiveField(23)
  double? dovizliFiyat;
  @HiveField(24)
  String? aciklama1;
  @HiveField(25)
  String? aciklama10;
  @HiveField(26)
  String? aciklama2;
  @HiveField(27)
  String? aciklama3;
  @HiveField(28)
  String? aciklama4;
  @HiveField(29)
  String? aciklama5;
  @HiveField(30)
  String? aciklama6;
  @HiveField(31)
  String? aciklama7;
  @HiveField(32)
  String? aciklama8;
  @HiveField(33)
  String? aciklama9;
  @HiveField(34)
  String? ekalan1;
  @HiveField(35)
  String? ekalan2;
  @HiveField(36)
  int? isk1Tipi;
  @HiveField(37)
  int? isk2Tipi;
  @HiveField(38)
  int? isk3Tipi;
  @HiveField(39)
  double? iskonto1;
  @HiveField(40)
  double? iskonto2;
  @HiveField(41)
  double? iskonto3;
  @HiveField(42)
  double? malfazIskAdedi;
  @HiveField(43)
  double? miktar2;
  @HiveField(44)
  String? projeKodu;
  @HiveField(45)
  double? satisFiyati;
  @HiveField(46)
  int? dovizKodu;
  @HiveField(47)
  double? dovizFiyati;
  @HiveField(48)
  double? malfazCevrimliMiktar;
  @HiveField(49)
  double? malFazlasiMiktar;
  @HiveField(50)
  String? kosulKodu;
  @HiveField(51)
  int? isk4Tipi;
  @HiveField(52)
  double? iskonto4;
  @HiveField(53)
  int? isk5Tipi;
  @HiveField(54)
  double? iskonto5;
  @HiveField(55)
  int? isk6Tipi;
  @HiveField(56)
  double? iskonto6;
  @HiveField(57)
  List<KalemModel>? kalemList;
  @HiveField(58)
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool? koliMi;
  @HiveField(59)
  int? inckeyno;
  @HiveField(60)
  String? cariAdi;
  @HiveField(61)
  String? plasiyerKodu;
  @HiveField(62)
  String? kapali;
  @HiveField(63)
  double? stokSatisKdv;
  @HiveField(64)
  double? stokAlisKdv;
  @HiveField(65)
  double? netFiyat;
  @HiveField(66)
  List<dynamic>? zHucreList;
  @HiveField(67)
  double? kalan;
  @HiveField(68)
  String? paketMi;
  @HiveField(69)
  int? lYedek9;
  @HiveField(70)
  double? koliBilesenMiktari;
  @HiveField(71)
  double? koliBilesenOrani;
  @HiveField(72)
  String? koliBilesenFiyatorandan;
  @HiveField(73)
  String? koliBilesenKolikdv;
  @HiveField(74)
  int? stokSatDovTip;
  @HiveField(75)
  int? stokAlisDovTip;
  @HiveField(76)
  String? stokAlisDovizAdi;
  @HiveField(77)
  String? stokSatDovizAdi;
  @HiveField(78)
  String? muhasebeKodu;
  @HiveField(79)
  String? yapkod;
  @HiveField(80)
  String? siparisNo;
  @HiveField(81)
  int? siparisSira;
  @HiveField(82)
  String? irsaliyeNo;
  @HiveField(83)
  int? irsaliyeSira;
  @HiveField(84)
  double? tamamlanan;
  @HiveField(85)
  bool? seriCikislardaAcik;
  @HiveField(86)
  bool? seriGirislerdeAcik;
  @HiveField(87)
  bool? seriMiktarKadarSor;
  @HiveField(88)
  String? dovizAdi;
  @HiveField(89)
  List<dynamic>? kalemListHucreList;
  @HiveField(90)
  String? arrBelgeNo;
  @HiveField(91)
  int? efatOzelkod;
  @HiveField(92)
  String? efatOzelkodAdi;
  @HiveField(93)
  String? kalemAdi;
  @HiveField(94)
  bool? kalemAdiDegistimi;
  @HiveField(95)
  bool? kalemAdiDegisti;
  @HiveField(96)
  final String? teklifNo;
  @HiveField(97)
  final int? teklifKalemSira;
  @HiveField(98)
  String? kalemStoktanKodu;
  @HiveField(99)
  String? muhasebeTanimi;
  @HiveField(100)
  int? hedefDepo;
  @HiveField(101)
  int? siparisInckeyno;
  @HiveField(102)
  int? sipInckeyno;
  @HiveField(103)
  String? muhRefKodu;
  @HiveField(104)
  List<dynamic>? sayimListesiModelHucreList;
  @HiveField(105)
  double? dipFiyat;
  @HiveField(106)
  double? stokSatisKuru;
  @HiveField(107)
  double? olcuBirimCarpani;
  @HiveField(108)
  double? stokBakiye;
  @HiveField(109)
  double? stokBirimAgirlik;
  @override
  @HiveField(110)
  double? bakiye;
  @override
  @HiveField(111)
  double? netMiktar;

  KalemModel({
    this.iskonto1OranMi,
    this.tarih,
    this.teslimTarihi,
    this.brutFiyat,
    this.depoKodu,
    this.kdvOrani,
    this.miktar,
    this.olcuBirimKodu,
    this.sira,
    this.hucreList,
    this.kalemModelHucreList,
    this.seriList,
    this.tempBarkodList,
    this.belgeNo,
    this.belgeTipi,
    this.cariKodu,
    this.depoTanimi,
    this.olcuBirimAdi,
    this.stokAdi,
    this.stokKodu,
    this.stokOlcuBirimi,
    this.dovizKuru,
    this.dovizTipi,
    this.dovizliFiyat,
    this.aciklama1,
    this.aciklama10,
    this.aciklama2,
    this.aciklama3,
    this.aciklama4,
    this.aciklama5,
    this.aciklama6,
    this.aciklama7,
    this.aciklama8,
    this.aciklama9,
    this.ekalan1,
    this.ekalan2,
    this.isk1Tipi,
    this.isk2Tipi,
    this.isk3Tipi,
    this.isk4Tipi,
    this.isk5Tipi,
    this.isk6Tipi,
    this.iskonto1,
    this.iskonto2,
    this.iskonto3,
    this.iskonto4,
    this.iskonto5,
    this.iskonto6,
    this.malfazIskAdedi,
    this.miktar2,
    this.projeKodu,
    this.satisFiyati,
    this.dovizKodu,
    this.dovizFiyati,
    this.malfazCevrimliMiktar,
    this.malFazlasiMiktar,
    this.kosulKodu,
    this.kalemList,
    this.koliMi,
    this.inckeyno,
    this.cariAdi,
    this.plasiyerKodu,
    this.kapali,
    this.stokSatisKdv,
    this.stokAlisKdv,
    this.netFiyat,
    this.zHucreList,
    this.kalan,
    this.paketMi,
    this.lYedek9,
    this.koliBilesenMiktari,
    this.koliBilesenOrani,
    this.koliBilesenFiyatorandan,
    this.koliBilesenKolikdv,
    this.stokSatDovTip,
    this.stokAlisDovTip,
    this.stokAlisDovizAdi,
    this.stokSatDovizAdi,
    this.muhasebeKodu,
    this.yapkod,
    this.siparisNo,
    this.siparisSira,
    this.irsaliyeNo,
    this.irsaliyeSira,
    this.tamamlanan,
    this.seriCikislardaAcik,
    this.seriGirislerdeAcik,
    this.seriMiktarKadarSor,
    this.dovizAdi,
    this.kalemListHucreList,
    this.arrBelgeNo,
    this.efatOzelkod,
    this.efatOzelkodAdi,
    this.kalemAdi,
    this.kalemAdiDegistimi,
    this.kalemAdiDegisti,
    this.teklifNo,
    this.teklifKalemSira,
    this.muhasebeTanimi,
    this.hedefDepo,
    this.siparisInckeyno,
    this.sipInckeyno,
    this.kalemStoktanKodu,
    this.muhRefKodu,
    this.sayimListesiModelHucreList,
  });

  factory KalemModel.forTalepTeklifSiparislestir(KalemModel model) => KalemModel(
        siparisNo: model.belgeNo,
        siparisSira: model.sira,
        depoKodu: model.depoKodu,
        stokKodu: model.stokKodu,
      );
  factory KalemModel.fromOlcumBelgeModel(OlcumBelgeModel? model) => KalemModel(
        stokAdi: model?.stokAdi,
        stokKodu: model?.stokKodu,
        miktar: model?.miktar,
        cariAdi: model?.cariAdi,
        cariKodu: model?.cariKodu,
      );
  double koliBilesenOrandan(double bilesenOrani) {
    final double toplamOran = kalemList?.map((e) => e.koliBilesenOrani).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;
    if (kalemList?.every((element) => element.koliBilesenFiyatorandan == "E") ?? false) {
      return toplamTutar * bilesenOrani / toplamOran;
    } else {
      return 0;
    }
  }

  double get kalemAgirlik => (miktar ?? 0) * (stokBirimAgirlik ?? 0);

  bool get dovizliMi => (dovizKodu != null && dovizKodu != 0) || (dovizTipi != null && dovizTipi != 0);

  bool get kalemStoktanMi => kalemStoktanKodu == stokKodu;

  bool get seriliMi => BaseSiparisEditModel._instance?.getEditTipiEnum?.satisMi == true ? seriCikislardaAcik == true : seriGirislerdeAcik == true;

  bool get seriTamamMi => seriliMi && (seriList?.map((e) => e.miktar).sum ?? 0) == miktar;

  bool get seriEksikMi => seriliMi && (seriList?.map((e) => e.miktar).sum ?? 0) < (miktar ?? 0);

  double get teslimMiktari => (miktar ?? 0) - (kalan ?? 0);

  String get faturaKalemAciklama {
    if (seriliMi) {
      return "Seriler(${seriList?.length ?? 0}) (Miktar: ${(seriList?.map((e) => e.miktar).fold(0.0, (a, b) => a + (b ?? 0.0)) ?? 0).toIntIfDouble}) : ${seriList?.firstOrNull?.seriNo ?? ""}";
    } else if (siparisNo != null && (BaseSiparisEditModel.instance.getEditTipiEnum?.siparisMi == true)) {
      return "Sipariş ${siparisNo ?? ""}  (${siparisSira ?? 0})";
    } else if (teklifNo != null) {
      return "${BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi == true ? "Satış" : "Alış"} Teklifi $teklifNo  (${teklifKalemSira ?? 0})";
    } else {
      return "";
    }
    // }
    // return "Seriler(${seriList?.length ?? 0}) (Miktar: ${(seriList?.map((e) => e.miktar).fold(0.0, (a, b) => a + (b ?? 0.0)) ?? 0).toIntIfDouble}) : ${seriList?.firstOrNull?.seriNo ?? ""}";
  }

  //koli mi
  bool get isKoli => koliMi ?? kalemList.ext.isNotNullOrEmpty;

  double toplamKalemMiktari([bool miktar2EklensinMi = false]) => ((miktar ?? (miktar2EklensinMi ? miktar2 : null)) ?? 0) + (malfazIskAdedi ?? 0);

  double? get getSelectedMiktar => (isKoli ? miktar2 : miktar) ?? 0 - (malfazIskAdedi ?? 0);

  double get getSelectedMalFazlasizMiktar => (isKoli ? miktar2 : miktar) ?? 0 - (malfazIskAdedi ?? 0);

  double get brutTutar => (getSelectedMiktar ?? 0) * (brutFiyat ?? 0);

  double get dovizliBrutTutar => ((getSelectedMiktar ?? 0) + (malfazIskAdedi ?? 0)) * (dovizliFiyat ?? 0);

  double get koliTutar =>
      (kalemList?.every((element) => element.koliBilesenFiyatorandan == "E") ?? false) ? brutTutar : kalemList?.map((e) => e.brutTutar + e.kdvTutari).toList().fold(0, (a, b) => (a ?? 0) + b) ?? 0;

  double get toplamTutar => isKoli ? koliTutar : brutTutar;

  double get araToplamTutari => brutTutar - iskontoTutari - mfTutari;

  double get getAraToplamTutari => araToplamTutari - ((BaseSiparisEditModel.instance.kdvDahilMi ?? false) ? kdvTutari : 0);

  double get araToplamNetTutari => ((getSelectedMiktar ?? 0) * (netFiyat ?? 0)) - iskontoTutari;

  double get genelToplamTutari => araToplamTutari + ((BaseSiparisEditModel.instance.kdvDahilMi ?? false) ? 0 : kdvTutari);

  double get mfTutari => (malfazIskAdedi ?? 0) * (brutFiyat ?? 0);

  double get kdvTutari => (BaseSiparisEditModel.instance.kdvDahilMi ?? false) ? araToplamTutari - (araToplamTutari * 100 / ((kdvOrani ?? 0) + 100)) : araToplamTutari * ((kdvOrani ?? 0) / 100);

  double get dovizKdvTutari =>
      (BaseSiparisEditModel.instance.kdvDahilMi ?? false) ? getDovizAraToplamTutari - (getDovizAraToplamTutari * 100 / ((kdvOrani ?? 0) + 100)) : getDovizAraToplamTutari * ((kdvOrani ?? 0) / 100);

  double get iskontoTutari {
    double result = brutTutar - mfTutari;
    if (iskonto1OranMi ?? true) {
      if (iskonto1 != null && iskonto1 != 0) {
        result = result - result * ((iskonto1 ?? 0) / 100);
      }
    } else {
      result = result - (iskonto1 ?? 0) * (getSelectedMiktar ?? 0);
    }
    if (iskonto2 != null && iskonto2 != 0) {
      result = result - result * ((iskonto2 ?? 0) / 100);
    }
    if (iskonto3 != null && iskonto3 != 0) {
      result = result - result * ((iskonto3 ?? 0) / 100);
    }
    if (iskonto4 != null && iskonto4 != 0) {
      result = result - result * ((iskonto4 ?? 0) / 100);
    }
    if (iskonto5 != null && iskonto5 != 0) {
      result = result - result * ((iskonto5 ?? 0) / 100);
    }
    if (iskonto6 != null && iskonto6 != 0) {
      result = result - result * ((iskonto6 ?? 0) / 100);
    }
    return ((getSelectedMiktar ?? 0) * (brutFiyat ?? 0)) - result - mfTutari;
  }

  double get dovizIskontoTutari {
    double result = (getSelectedMiktar ?? 0) * (dovizliFiyat ?? 0);
    if (iskonto1OranMi ?? true) {
      if (iskonto1 != null && iskonto1 != 0) {
        result = result - result * ((iskonto1 ?? 0) / 100);
      }
    } else {
      result = result - (iskonto1 ?? 0) * (getSelectedMiktar ?? 0);
    }
    if (iskonto2 != null && iskonto2 != 0) {
      result = result - result * ((iskonto2 ?? 0) / 100);
    }
    if (iskonto3 != null && iskonto3 != 0) {
      result = result - result * ((iskonto3 ?? 0) / 100);
    }
    if (iskonto4 != null && iskonto4 != 0) {
      result = result - result * ((iskonto4 ?? 0) / 100);
    }
    if (iskonto5 != null && iskonto5 != 0) {
      result = result - result * ((iskonto5 ?? 0) / 100);
    }
    if (iskonto6 != null && iskonto6 != 0) {
      result = result - result * ((iskonto6 ?? 0) / 100);
    }
    return ((getSelectedMiktar ?? 0) * (dovizliFiyat ?? 0)) - result;
  }

  double get dovizBrutTutar => !dovizliMi ? 0 : ((getSelectedMiktar ?? 0) + (malfazIskAdedi ?? 0)) * (dovizliFiyat ?? (brutTutar / (dovizKuru ?? 1)));
  double get getDovizBrutTutar => !dovizliMi ? 0 : dovizliFiyat ?? (brutTutar / (dovizKuru ?? 1));

  double get dovizAraToplamTutari => !dovizliMi ? 0 : araToplamTutari / (dovizKuru ?? 1);
  double get getKdvsizDovizAraToplamTutari => getDovizAraToplamTutari - ((BaseSiparisEditModel.instance.kdvDahilMi ?? false) ? dovizKdvTutari : 0);
  double get getDovizAraToplamTutari => !dovizliMi ? 0 : ((dovizliFiyat ?? (brutTutar / (dovizKuru ?? 1))) - dovizIskontoTutari);

  double get dovizGenelToplamTutari => !dovizliMi ? 0 : genelToplamTutari / (dovizKuru ?? 1);

  double get dovizMfTutari => (malfazIskAdedi ?? 0) * (dovizliFiyat ?? 0);

  factory KalemModel.fromJson(Map<String, dynamic> json) => _$KalemModelFromJson(json);

  factory KalemModel.fromStokList(StokList model) => KalemModel(
        brutFiyat: model.bulunanFiyat,
        stokAlisKdv: model.alisKdv,
        stokSatisKdv: model.satisKdv,
        stokKodu: model.stokKodu,
        stokAdi: model.stokAdi,
        paketMi: model.paketMi,
        koliBilesenMiktari: model.koliBilesenMiktari,
        koliBilesenOrani: model.koliBilesenOrani,
        koliBilesenFiyatorandan: model.koliBilesenFiyatorandan,
        koliBilesenKolikdv: model.koliBilesenKolikdv,
      );
  factory KalemModel.fromStokListesiModel(StokListesiModel model) => KalemModel(
        brutFiyat: model.bulunanFiyat,
        stokAlisKdv: model.alisKdv,
        stokSatisKdv: model.satisKdv,
        stokKodu: model.stokKodu,
        stokAdi: model.stokAdi,
        paketMi: model.paketMi,
        seriGirislerdeAcik: model.seriGirislerdeAcik,
        seriCikislardaAcik: model.seriCikislardaAcik,
        seriMiktarKadarSor: model.seriMiktarKadarSor,
      );
  @override
  Map<String, dynamic> toJson() => _$KalemModelToJson(this);

  @override
  KalemModel fromJson(Map<String, dynamic> json) => _$KalemModelFromJson(json);
}
