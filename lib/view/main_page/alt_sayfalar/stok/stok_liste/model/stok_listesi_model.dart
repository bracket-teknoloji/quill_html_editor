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

  static StokListesiModel? _instance;

  @override
  fromJson(Map<String, dynamic> json) => _$StokListesiModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokListesiModelToJson(this);

  static StokListesiModel get instance {
    _instance ??= StokListesiModel._init()..stokList = [];
    return _instance!;
  }

  static void setInstance(StokListesiModel? instance) => _instance = instance;

  bool get dovizliMi => fiatBirimi != 0 && (satDovTip != null || alisDovTip != null);
  bool get koliMi => paketMi == "K" && CacheManager.getAnaVeri()?.paramModel?.karmaKoliUyg == "E";
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

  Map<String, dynamic> toJson() => _$StokListToJson(this);
  double get toplamTutar => (bulunanFiyat ?? 0) * (koliBilesenMiktari ?? 0);
}
