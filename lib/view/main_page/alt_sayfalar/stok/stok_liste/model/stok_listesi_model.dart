import "package:hive/hive.dart";
import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/init/cache/cache_manager.dart";

part "stok_listesi_model.g.dart";

@JsonSerializable(explicitToJson: true)
class StokListesiModel with NetworkManagerMixin {
  StokListesiModel();

  StokListesiModel._init();

  bool? seriBakiyeKontrolu;
  bool? seriCikislardaAcik;
  bool? seriCikistaOtomatikMi;
  bool? seriGirislerdeAcik;
  bool? seriGiristeOtomatikMi;
  bool? seriMiktarKadarSor;
  DateTime? duzeltmetarihi;
  double? alisFiat1;
  double? alisFiat2;
  double? alisFiat3;
  double? alisFiat4;
  double? alisKdv;
  double? bakiye;
  double? birimAgirlik;
  double? dovAlisFiat;
  double? dovSatisFiat;
  double? olcuBirimi2Pay;
  double? olcuBirimi2Payda;
  double? olcuBirimi3Pay;
  double? olcuBirimi3Payda;
  double? satisFiat1;
  double? satisFiat2;
  double? satisFiat3;
  double? satisFiat4;
  double? satisKdv;
  int? alisDovTip;
  double? bulunanFiyat;
  int? depoKodu;
  int? fiatBirimi;
  int? muhdetayKodu;
  int? satDovTip;
  int? subeKodu;
  List<dynamic>? stokFiyatList;
  List<StokList>? stokList;
  String? alisDovizAdi;
  String? barkod1;
  String? barkod2;
  String? barkod3;
  String? duzeltmeyapankul;
  String? grupKodu;
  String? grupTanimi;
  String? kayittarihi;
  String? kayityapankul;
  String? kilitAlis;
  String? kilitGenel;
  String? kilitMussip;
  String? kilitSaticisip;
  String? kilitSatis;
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
  String? muhdetayAdi;
  String? olcuBirimi;
  String? olcuBirimi2;
  String? olcuBirimi3;
  String? paketMi;
  String? resimBase64;
  String? resimUrl;
  String? resimUrlKucuk;
  String? satisDovizAdi;
  String? stokAdi;
  String? stokKodu;
  String? ureticiKodu;
  bool? yapilandirmaAktif;
  String? yapkod;
  String? yapkodAciklama;
  int? idx;
  double? alisKuru;
  DateTime? alisKurTarihi;
  double? satisKuru;
  DateTime? satisKurTarihi;
  double? bulunanDovizFiyati;
  int? bulunanDovizTipi;

  static StokListesiModel? _instance;

  @override
  StokListesiModel fromJson(Map<String, dynamic> json) => _$StokListesiModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokListesiModelToJson(this);

  static StokListesiModel get instance {
    _instance ??= StokListesiModel._init()..stokList = [];
    return _instance!;
  }

  static void setInstance(StokListesiModel? instance) => _instance = instance;

  bool get dovizliMi => fiatBirimi != 0 && (satDovTip != null || alisDovTip != null);
  bool get koliMi => paketMi == "K" && CacheManager.getAnaVeri?.paramModel?.karmaKoliUyg == "E";
}

@HiveType(typeId: 2)
@JsonSerializable(createFactory: true)
class StokList {
  StokList({
    this.stokKodu,
    this.stokAdi,
    this.alisKdv,
    this.satisKdv,
    this.stokFiyatList,
    this.stokList,
    this.bulunanFiyat,
    this.paketMi,
    this.koliBilesenMiktari,
    this.koliBilesenOrani,
    this.koliBilesenFiyatorandan,
    this.koliBilesenKolikdv,
    this.depoKodu,
    this.bakiye,
  });

  factory StokList.fromJson(Map<String, dynamic> json) => _$StokListFromJson(json);

  @HiveField(0)
  double? alisKdv;
  @HiveField(1)
  double? bulunanFiyat;
  @HiveField(2)
  String? koliBilesenFiyatorandan;
  @HiveField(3)
  String? koliBilesenKolikdv;
  @HiveField(4)
  double? koliBilesenMiktari;
  @HiveField(5)
  double? koliBilesenOrani;
  @HiveField(6)
  String? paketMi;
  @HiveField(7)
  double? satisKdv;
  @HiveField(8)
  String? stokAdi;
  @HiveField(9)
  List<dynamic>? stokFiyatList;
  @HiveField(10)
  String? stokKodu;
  @HiveField(11)
  List<dynamic>? stokList;
  @HiveField(12)
  int? depoKodu;
  @HiveField(13)
  double? bakiye;
  @HiveField(14)
  String? muhdetayAdi;
  @HiveField(15)
  double? alisFiat1;
  @HiveField(16)
  double? alisFiat2;
  @HiveField(17)
  double? alisFiat3;
  @HiveField(18)
  double? alisFiat4;
  @HiveField(19)
  double? satisFiat1;
  @HiveField(20)
  double? satisFiat2;
  @HiveField(21)
  double? satisFiat3;
  @HiveField(22)
  double? satisFiat4;
  @HiveField(23)
  String? olcuBirimi;
  @HiveField(24)
  String? olcuBirimi2;
  @HiveField(25)
  String? olcuBirimi3;
  @HiveField(26)
  double? olcuBirimi2Pay;
  @HiveField(27)
  double? olcuBirimi2Payda;
  @HiveField(28)
  double? olcuBirimi3Pay;
  @HiveField(29)
  double? olcuBirimi3Payda;
  @HiveField(30)
  String? barkod1;
  @HiveField(31)
  String? barkod2;
  @HiveField(32)
  String? barkod3;
  @HiveField(33)
  String? kayityapankul;
  @HiveField(34)
  DateTime? kayittarihi;
  @HiveField(35)
  String? grupKodu;
  @HiveField(36)
  String? grupTanimi;
  @HiveField(37)
  String? kod1;
  @HiveField(38)
  String? kod1Tanimi;
  @HiveField(39)
  String? kod2;
  @HiveField(40)
  String? kod2Tanimi;
  @HiveField(41)
  String? kod3;
  @HiveField(42)
  String? kod3Tanimi;
  @HiveField(43)
  String? kod4;
  @HiveField(44)
  String? kod4Tanimi;
  @HiveField(45)
  String? kod5;
  @HiveField(46)
  String? kod5Tanimi;
  @HiveField(47)
  bool? seriCikislardaAcik;
  @HiveField(48)
  bool? seriGirislerdeAcik;
  @HiveField(49)
  bool? seriMiktarKadarSor;
  @HiveField(50)
  bool? seriBakiyeKontrolu;
  @HiveField(51)
  bool? seriGiristeOtomatikMi;
  @HiveField(52)
  bool? seriCikistaOtomatikMi;
  @HiveField(53)
  DateTime? duzeltmetarihi;
  @HiveField(54)
  String? duzeltmeyapankul;
  @HiveField(55)
  int? fiatBirimi;
  @HiveField(56)
  String? kilitGenel;
  @HiveField(57)
  String? kilitSaticisip;
  @HiveField(58)
  String? kilitMussip;
  @HiveField(59)
  String? kilitAlis;
  @HiveField(60)
  String? kilitSatis;
  @HiveField(61)
  int? subeKodu;
  @HiveField(62)
  int? muhdetayKodu;
  @HiveField(63)
  int? alisDovTip;
  @HiveField(64)
  double? dovAlisFiat;
  @HiveField(65)
  String? alisDovizAdi;
  @HiveField(66)
  int? satDovTip;
  @HiveField(67)
  double? dovSatisFiat;
  @HiveField(68)
  String? satisDovizAdi;
  @HiveField(69)
  String? ureticiKodu;
  @HiveField(70)
  double? birimAgirlik;

  Map<String, dynamic> toJson() => _$StokListToJson(this);
  double get toplamTutar => (bulunanFiyat ?? 0) * (koliBilesenMiktari ?? 0);
}
