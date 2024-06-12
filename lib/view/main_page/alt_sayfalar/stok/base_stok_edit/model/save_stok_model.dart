import "package:json_annotation/json_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/alt_sayfalar/barkod_kayitlari/model/barkod_tanimla_kayitlari_model.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../stok_liste/model/stok_listesi_model.dart";

part "save_stok_model.g.dart";

@JsonSerializable(explicitToJson: true)
class SaveStokModel with NetworkManagerMixin {
  static SaveStokModel? _instance;
  static SaveStokModel get instance {
    _instance ??= SaveStokModel._init();
    return _instance!;
  }

  SaveStokModel._init();
  SaveStokModel();
  //setter for singleton
  static void setInstance(SaveStokModel? instance) => _instance = instance;
  String? adi;
  double? alisDovizFiyati;
  int? alisDovizTipi;
  double? alisFiyati1;
  double? alisFiyati2;
  double? alisFiyati3;
  double? alisFiyati4;
  double? alisKdvOrani;
  String? barkod1;
  String? barkod2;
  String? barkod3;
  int? depoKodu;
  String? grupKodu;
  int? islemKodu;
  String? kod1;
  String? kod2;
  String? kod3;
  String? kod4;
  String? kod5;
  String? kodu;
  int? muhdetayKodu;
  String? olcuBirimi1;
  String? olcuBirimi2;
  double? olcuBirimi2Pay;
  double? olcuBirimi2Payda;
  String? olcuBirimi3;
  double? olcuBirimi3Pay;
  double? olcuBirimi3Payda;
  int? requestVersion;
  double? satisDovizFiyati;
  int? satisDovizTipi;
  double? satisFiyati1;
  double? satisFiyati2;
  double? satisFiyati3;
  double? satisFiyati4;
  double? satisKdvOrani;
  String? resimBase64;
  bool? seriGiristeOtomatik;
  bool? seriCikistaAktif;
  bool? seriCikistaOtomatik;
  bool? seriGiristeAktif;
  bool? seriMiktarKadar;
  int? subeKodu;
  String? ureticiKodu;
  @JsonKey(name: "_YeniKayit")
  bool? yeniKayit;
  @JsonKey(name: "StokBarkodModel")
  BarkodTanimlaKayitlariModel? stokBarkodModel;
  @override
  SaveStokModel fromJson(Map<String, dynamic> json) => _$SaveStokModelFromJson(json);

  factory SaveStokModel.fromStokListesiModel(StokListesiModel model) => SaveStokModel()
    ..adi = model.stokAdi
    ..kodu = model.stokKodu
    ..alisFiyati1 = model.alisFiat1
    ..alisDovizTipi = model.alisDovTip
    ..satisDovizTipi = model.satDovTip
    ..alisFiyati2 = model.alisFiat2
    ..alisFiyati3 = model.alisFiat3
    ..alisFiyati4 = model.alisFiat4
    ..alisKdvOrani = model.alisKdv
    ..satisKdvOrani = model.satisKdv
    ..alisDovizFiyati = model.dovAlisFiat
    ..satisDovizFiyati = model.dovSatisFiat
    ..muhdetayKodu = model.muhdetayKodu
    ..satisFiyati1 = model.satisFiat1
    ..satisFiyati2 = model.satisFiat2
    ..satisFiyati3 = model.satisFiat3
    ..satisFiyati4 = model.satisFiat4
    ..alisFiyati1 = model.alisFiat1
    ..alisFiyati2 = model.alisFiat2
    ..alisFiyati3 = model.alisFiat3
    ..alisFiyati4 = model.alisFiat4
    ..satisKdvOrani = model.satisKdv
    ..alisKdvOrani = model.alisKdv
    ..satisDovizFiyati = model.dovSatisFiat
    ..alisDovizFiyati = model.dovAlisFiat
    ..alisDovizTipi = model.alisDovTip
    ..barkod1 = model.barkod1
    ..barkod2 = model.barkod2
    ..barkod3 = model.barkod3
    ..depoKodu = model.depoKodu
    ..grupKodu = model.grupKodu
    ..satisDovizTipi = model.satDovTip
    ..kod1 = model.kod1
    ..kod2 = model.kod2
    ..kod3 = model.kod3
    ..kod4 = model.kod4
    ..kod5 = model.kod5
    //sdkjflksdf
    ..adi = model.stokAdi
    ..alisDovizFiyati = model.dovAlisFiat
    ..alisDovizTipi = model.alisDovTip
    ..alisFiyati1 = model.alisFiat1
    ..alisFiyati2 = model.alisFiat2
    ..alisFiyati3 = model.alisFiat3
    ..alisFiyati4 = model.alisFiat4
    ..alisKdvOrani = model.alisKdv
    ..barkod1 = model.barkod1
    ..barkod2 = model.barkod2
    ..barkod3 = model.barkod3
    ..depoKodu = model.depoKodu
    ..grupKodu = model.grupKodu
    // ..islemKodu = model.islemKodu
    ..kod1 = model.kod1
    ..kod2 = model.kod2
    ..kod3 = model.kod3
    ..kod4 = model.kod4
    ..kod5 = model.kod5
    ..kodu = model.stokKodu
    ..muhdetayKodu = model.muhdetayKodu
    ..olcuBirimi1 = model.olcuBirimi
    ..olcuBirimi2 = model.olcuBirimi2
    ..olcuBirimi2Pay = model.olcuBirimi2Pay
    ..olcuBirimi2Payda = model.olcuBirimi2Payda
    ..olcuBirimi3 = model.olcuBirimi3
    ..olcuBirimi3Pay = model.olcuBirimi3Pay
    ..olcuBirimi3Payda = model.olcuBirimi3Payda
    // ..requestVersion = model.requestVersion
    ..satisDovizFiyati = model.dovSatisFiat
    ..satisDovizTipi = model.satDovTip
    ..satisFiyati1 = model.satisFiat1
    ..satisFiyati2 = model.satisFiat2
    ..satisFiyati3 = model.satisFiat3
    ..satisFiyati4 = model.satisFiat4
    ..satisKdvOrani = model.satisKdv
    ..resimBase64 = model.resimBase64
    ..seriGiristeOtomatik = model.seriGiristeOtomatikMi
    ..seriCikistaAktif = model.seriCikislardaAcik
    ..seriCikistaOtomatik = model.seriCikistaOtomatikMi
    ..seriGiristeAktif = model.seriGirislerdeAcik
    ..seriMiktarKadar = model.seriMiktarKadarSor
    ..subeKodu = model.subeKodu
    ..ureticiKodu = model.ureticiKodu;

  @override
  Map<String, dynamic> toJson() => _$SaveStokModelToJson(this);
}
