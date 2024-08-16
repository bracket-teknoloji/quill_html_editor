import "package:copy_with_extension/copy_with_extension.dart";
import "package:hive/hive.dart";
import "package:json_annotation/json_annotation.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "stok_listesi_model.g.dart";

typedef OlcuBirimiRecord = ({String? adi, int? kodu});

@JsonSerializable(explicitToJson: true)
@CopyWith()
class StokListesiModel with NetworkManagerMixin, BaseStokMixin {
  StokListesiModel._init();
  @override
  String? stokAdi;
  @override
  String? stokKodu;
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
  @override
  double? miktar;
  @override
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
  @override
  String? olcuBirimi;
  String? olcuBirimi2;
  String? olcuBirimi3;
  String? paketMi;
  String? resimBase64;
  String? resimUrl;
  String? resimUrlKucuk;
  String? satisDovizAdi;
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
  int bulunanDovizTipi = 0;
  String? yapacik;
  @override
  double? netMiktar;
  List<DepoBakiyeListe>? depoBakiyeListe;
  DateTime? belgeTarihi;
  String? otvUygula;
  String? otvOranmi;
  String? otvKodu;
  List<OtvAralikModel>? otvAralik;
  double? otvDeger;
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

  static StokListesiModel? _instance;

  StokListesiModel({
    this.seriBakiyeKontrolu,
    this.seriCikislardaAcik,
    this.seriCikistaOtomatikMi,
    this.seriGirislerdeAcik,
    this.seriGiristeOtomatikMi,
    this.seriMiktarKadarSor,
    this.duzeltmetarihi,
    this.alisFiat1,
    this.alisFiat2,
    this.alisFiat3,
    this.alisFiat4,
    this.alisKdv,
    this.bakiye,
    this.birimAgirlik,
    this.dovAlisFiat,
    this.dovSatisFiat,
    this.olcuBirimi2Pay,
    this.olcuBirimi2Payda,
    this.olcuBirimi3Pay,
    this.olcuBirimi3Payda,
    this.satisFiat1,
    this.satisFiat2,
    this.satisFiat3,
    this.satisFiat4,
    this.satisKdv,
    this.alisDovTip,
    this.bulunanFiyat,
    this.depoKodu,
    this.fiatBirimi,
    this.muhdetayKodu,
    this.satDovTip,
    this.subeKodu,
    this.stokFiyatList,
    this.stokList,
    this.alisDovizAdi,
    this.barkod1,
    this.barkod2,
    this.barkod3,
    this.duzeltmeyapankul,
    this.grupKodu,
    this.grupTanimi,
    this.kayittarihi,
    this.kayityapankul,
    this.kilitAlis,
    this.kilitGenel,
    this.kilitMussip,
    this.kilitSaticisip,
    this.kilitSatis,
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
    this.muhdetayAdi,
    this.olcuBirimi,
    this.olcuBirimi2,
    this.olcuBirimi3,
    this.paketMi,
    this.resimBase64,
    this.resimUrl,
    this.resimUrlKucuk,
    this.satisDovizAdi,
    this.stokAdi,
    this.stokKodu,
    this.ureticiKodu,
    this.yapilandirmaAktif,
    this.yapkod,
    this.yapkodAciklama,
    this.idx,
    this.alisKuru,
    this.alisKurTarihi,
    this.satisKuru,
    this.satisKurTarihi,
    this.bulunanDovizFiyati,
    this.bulunanDovizTipi = 0,
  });

  @override
  StokListesiModel fromJson(Map<String, dynamic> json) => _$StokListesiModelFromJson(json);

  factory StokListesiModel.fromJson(Map<String, dynamic> json) => _$StokListesiModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokListesiModelToJson(this);

  factory StokListesiModel.fromKalemModel(KalemModel model) => StokListesiModel()
    ..stokKodu = model.stokKodu
    ..stokAdi = model.stokAdi
    ..paketMi = model.paketMi
    ..alisKdv = model.kdvOrani
    ..satisKdv = model.kdvOrani
    ..alisDovTip = model.dovizKodu ?? 0
    ..satDovTip = model.dovizKodu ?? 0
    ..alisDovizAdi = model.dovizAdi
    ..satisDovizAdi = model.dovizAdi
    ..alisFiat1 = model.brutFiyat
    ..satisFiat1 = model.brutFiyat
    ..seriCikislardaAcik = model.seriCikislardaAcik
    ..seriGirislerdeAcik = model.seriGirislerdeAcik
    ..seriMiktarKadarSor = model.seriMiktarKadarSor
    ..dovAlisFiat = model.dovizliFiyat
    ..dovSatisFiat = model.dovizliFiyat
    ..satisDovizAdi = model.dovizAdi
    ..alisDovizAdi = model.dovizAdi
    ..depoKodu = model.depoKodu;

  static StokListesiModel get instance {
    _instance ??= StokListesiModel._init()..stokList = [];
    return _instance!;
  }

  static void setInstance(StokListesiModel? instance) => _instance = instance;

  bool get dovizliMi => fiatBirimi != 0 && (satDovTip != null || alisDovTip != null);
  String? olcuBirimiSelector(int? olcu) {
    if (olcu == 1) {
      return olcuBirimi;
    } else if (olcu == 2) {
      return olcuBirimi2;
    } else if (olcu == 3) {
      return olcuBirimi3;
    }
    return null;
  }

  int? get olcuBirimiAdedi {
    int sayac = 0;
    if (olcuBirimi != null) sayac++;
    if (olcuBirimi2 != null) sayac++;
    if (olcuBirimi3 != null) sayac++;
    return sayac;
  }

  List<OlcuBirimiRecord> get getOlcuBirimiRecords {
    final List<OlcuBirimiRecord> records = [];
    if (olcuBirimi != null) records.add((adi: olcuBirimi, kodu: 1));
    if (olcuBirimi2 != null) records.add((adi: olcuBirimi2, kodu: 2));
    if (olcuBirimi3 != null) records.add((adi: olcuBirimi3, kodu: 3));
    return records;
  }

  bool get koliMi => paketMi == "K" && CacheManager.getAnaVeri?.paramModel?.karmaKoliUyg == "E";
  bool get hizmetMi => stokKodu?.startsWith("HIZ") ?? false;

  double getOtvOrani(double fiyat) {
    if (otvOranmi != "E") return 0;
    if (otvKodu?.isNotEmpty == true) return otvDeger ?? 0;
    if (otvAralik.ext.isNullOrEmpty) return 0;
    for (var otv in otvAralik!) {
      if (fiyat >= otv.alt && fiyat <= otv.ust) return otv.oran;
    }
    return 0;
  }
}

@HiveType(typeId: 2)
@JsonSerializable(createFactory: true)
class StokList with BaseStokMixin {
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
  @override
  @HiveField(8)
  String? stokAdi;
  @HiveField(9)
  List<dynamic>? stokFiyatList;
  @override
  @HiveField(10)
  String? stokKodu;
  @HiveField(11)
  List<dynamic>? stokList;
  @HiveField(12)
  int? depoKodu;
  @override
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
  @override
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

@JsonSerializable()
class DepoBakiyeListe {
  int? depoKodu;
  double? giris;
  double? cikis;
  double? bakiye;

  DepoBakiyeListe({
    this.depoKodu,
    this.giris,
    this.cikis,
    this.bakiye,
  });

  factory DepoBakiyeListe.fromJson(Map<String, dynamic> json) => _$DepoBakiyeListeFromJson(json);

  Map<String, dynamic> toJson() => _$DepoBakiyeListeToJson(this);
}

@JsonSerializable()
class OtvAralikModel {
  double alt;
  double ust;
  double oran;

  OtvAralikModel(
    this.alt,
    this.ust,
    this.oran,
  );

  factory OtvAralikModel.fromJson(Map<String, dynamic> json) => _$OtvAralikModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtvAralikModelToJson(this);
}
