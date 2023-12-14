import "package:json_annotation/json_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "save_stok_model.g.dart";

@JsonSerializable(
  explicitToJson: true,
)
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
    ..satisDovizTipi = model.satDovTip;

  @override
  Map<String, dynamic> toJson() => _$SaveStokModelToJson(this);
}
