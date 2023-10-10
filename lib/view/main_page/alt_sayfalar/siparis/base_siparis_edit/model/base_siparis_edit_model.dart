import "dart:convert";

import "package:copy_with_extension/copy_with_extension.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";
import "package:kartal/kartal.dart";
import "package:uuid/uuid.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/constants/enum/siparis_tipi_enum.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../cari/cari_listesi/model/cari_listesi_model.dart";
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
    if (_instance?.isNew == true &&
        _instance?.belgeNo != null &&
        _instance?.kalemList.ext.isNotNullOrEmpty == true) {
      BaseSiparisEditModel? otherInstance =
          CacheManager.getSiparisEdit(_instance?.belgeNo ?? "");
      if (_instance != otherInstance) {
        var uuid = const Uuid();
        _instance?.uuid = uuid.v4();
        CacheManager.addSiparisEditListItem(_instance!);
      }
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
  SiparisTipiEnum? siparisTipi;
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
  });

  BaseSiparisEditModel._init();

  bool kalemEkliMi(StokListesiModel? model) {
    if (model != null) {
      return kalemList?.any((element) => element.stokKodu == model.stokKodu) ??
          false;
    } else {
      return false;
    }
  }

  double get sumGenIsk1 =>
      kalemList
          ?.map((e) => e.iskonto1)
          .toList()
          .fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ??
      0;
  double get sumGenIsk2 =>
      kalemList
          ?.map((e) => e.iskonto2)
          .toList()
          .fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ??
      0;
  double get sumGenIsk3 =>
      kalemList
          ?.map((e) => e.iskonto3)
          .toList()
          .fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ??
      0;
  double get malFazlasiTutar =>
      kalemList
          ?.map((e) => e.mfTutari)
          .toList()
          .fold(0, (a, b) => (a ?? 0) + (b)) ??
      0;
  double get kdvTutari {
    kdv = iskontoCheckerEkMaliyetsiz(kalemList
            ?.map((e) => e.kdvTutari)
            .toList()
            .fold(0, (a, b) => (a ?? 0) + (b)) ??
        0);
    return kdv ?? 0;
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

  double get satirIskonto =>
      kalemList
          ?.map((e) => e.iskontoTutari)
          .toList()
          .fold(0, (a, b) => (a ?? 0) + (b)) ??
      0;
  int toplamKalemMiktari([bool miktar2EklensinMi = false]) => (kalemList
              ?.map((e) => e.toplamKalemMiktari(miktar2EklensinMi).toInt())
              .toList()
              .fold(0, (a, b) => (a) + (b)) ??
          0)
      .toInt();

  double get toplamBrutTutar =>
      kalemList
          ?.map((e) => e.brutTutar)
          .toList()
          .fold(0, (a, b) => (a ?? 0) + (b)) ??
      0;
  double get genelToplamTutar {
    genelToplam = getAraToplam + kdvTutari;
    return genelToplam ?? 0;
  }

  double get getAraToplam {
    araToplam = iskontoChecker(kalemList
            ?.map((e) => e.araToplamTutari)
            .toList()
            .fold(0, (a, b) => (a ?? 0) + (b)) ??
        0);
    return araToplam ?? 0;
  }

  double get getAraToplam2 {
    return (genelToplam ?? 0) - (kdv ?? 0);
  }

  double iskontoChecker(double result) {
    araToplam = result;
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
    return result +
        (ekMaliyet1Tutari ?? 0) +
        (ekMaliyet2Tutari ?? 0) +
        (ekMaliyet3Tutari ?? 0);
  }

  int get getKalemSayisi => kalemList?.length ?? (kalemAdedi ?? 0);

  bool get yurticiMi => tipi != 6;
  bool get isEmpty => this == BaseSiparisEditModel();
  bool get isRemoteTempBelgeNull => remoteTempBelge == null;

  double get getToplamIskonto => toplamBrutTutar - getAraToplam;

  double get genelIskontoToplami =>
      ((genIsk1t ?? 0) + (genIsk2t ?? 0) + (genIsk3t ?? 0));

  double get getBrutTutar =>
      kalemList
          ?.map((e) => e.brutFiyat)
          .toList()
          .fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ??
      0;

  factory BaseSiparisEditModel.fromJson(String json) =>
      _$BaseSiparisEditModelFromJson(jsonDecode(json));

  void get setCache => CacheManager.setSiparisEdit(_instance!);
  @override
  fromJson(Map<String, dynamic> json) => _$BaseSiparisEditModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BaseSiparisEditModelToJson(this);

  //reset singleton
  static void resetInstance() => setInstance(BaseSiparisEditModel());

  //setter for singleton
  static void setInstance(BaseSiparisEditModel instance) =>
      _instance = instance;
}

@CopyWith()
@HiveType(typeId: 17)
@JsonSerializable(createFactory: true)
class KalemModel with NetworkManagerMixin {
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
  List<dynamic>? seriList;
  @HiveField(12)
  List<dynamic>? tempBarkodList;
  @HiveField(13)
  String? belgeNo;
  @HiveField(14)
  @JsonKey(name: "BelgeTipi")
  String? belgeTipi;
  @HiveField(15)
  String? cariKodu;
  @HiveField(16)
  String? depoTanimi;
  @HiveField(17)
  String? olcuBirimAdi;
  @HiveField(18)
  String? stokAdi;
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

  KalemModel(
      {this.iskonto1OranMi,
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
      this.yapkod});
  //koli mi
  bool get isKoli => koliMi ?? kalemList.ext.isNotNullOrEmpty;

  double toplamKalemMiktari([bool miktar2EklensinMi = false]) =>
      ((miktar ?? (miktar2EklensinMi ? miktar2 : null)) ?? 0) +
      (malFazlasiMiktar ?? 0);

  double? get getSelectedMiktar => (isKoli ? miktar2 : miktar);

  double get brutTutar {
    return ((getSelectedMiktar ?? 0) + (malFazlasiMiktar ?? 0)) *
        (brutFiyat ?? 0);
  }

  double get koliTutar =>
      kalemList
          ?.map((e) => e.brutTutar + e.kdvTutari)
          .toList()
          .fold(0, (a, b) => (a ?? 0) + (b)) ??
      0;

  double get araToplamTutari =>
      ((getSelectedMiktar ?? 0) * (brutFiyat ?? 0)) - iskontoTutari;

  double get genelToplamTutari => araToplamTutari + kdvTutari;

  double get mfTutari => (malfazIskAdedi ?? 0) * (brutFiyat ?? 0);

  double get kdvTutari => araToplamTutari * ((kdvOrani ?? 0) / 100);

  double get iskontoTutari {
    if ((iskonto1OranMi ?? true)) {
      double result = ((getSelectedMiktar ?? 0) * (brutFiyat ?? 0));
      if (iskonto1 != null && iskonto1 != 0) {
        result = result - result * ((iskonto1 ?? 0) / 100);
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
      return ((getSelectedMiktar ?? 0) * (brutFiyat ?? 0)) - result;
    } else {
      return (iskonto1 ?? 0) * (getSelectedMiktar ?? 0);
    }
  }

  double get dovizBrutTutar =>
      ((getSelectedMiktar ?? 0) + (malFazlasiMiktar ?? 0)) * (dovizFiyati ?? 0);

  double get dovizAraToplamTutari =>
      ((getSelectedMiktar ?? 0) * (dovizFiyati ?? 0)) - dovizIskontoTutari;

  double get dovizGenelToplamTutari => dovizAraToplamTutari + dovizKdvTutari;

  double get dovizMfTutari => (malfazIskAdedi ?? 0) * (dovizFiyati ?? 0);

  double get dovizKdvTutari => dovizAraToplamTutari * ((kdvOrani ?? 0) / 100);

  double get dovizIskontoTutari {
    if ((iskonto1OranMi ?? true)) {
      double result = ((getSelectedMiktar ?? 0) * (dovizFiyati ?? 0));
      if (iskonto1 != null && iskonto1 != 0) {
        result = result - result * ((iskonto1 ?? 0) / 100);
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
      return ((getSelectedMiktar ?? 0) * (dovizFiyati ?? 0)) - result;
    } else {
      return (iskonto1 ?? 0) * (getSelectedMiktar ?? 0);
    }
  }

  factory KalemModel.fromJson(Map<String, dynamic> json) =>
      _$KalemModelFromJson(json);

  factory KalemModel.fromStokList(StokList model) {
    return KalemModel(
        brutFiyat: model.bulunanFiyat,
        stokAlisKdv: model.alisKdv,
        stokSatisKdv: model.satisKdv,
        stokKodu: model.stokKodu,
        stokAdi: model.stokAdi,
        paketMi: model.paketMi,
        koliBilesenMiktari: model.koliBilesenMiktari,
        koliBilesenOrani: model.koliBilesenOrani,
        koliBilesenFiyatorandan: model.koliBilesenFiyatorandan,
        koliBilesenKolikdv: model.koliBilesenKolikdv);
  }
  @override
  Map<String, dynamic> toJson() => _$KalemModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) => _$KalemModelFromJson(json);
}
