import "package:json_annotation/json_annotation.dart";

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
  fromJson(Map<String, dynamic> json) => _$SaveStokModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SaveStokModelToJson(this);
}
