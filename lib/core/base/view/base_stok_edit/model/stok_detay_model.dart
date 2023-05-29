import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'stok_detay_model.g.dart';

@JsonSerializable(includeIfNull: false, createToJson: true, fieldRename: FieldRename.screamingSnake)
class StokDetayModel with NetworkManagerMixin {
  //singleton
  static StokDetayModel? _instance;
  static StokDetayModel get instance {
    _instance ??= StokDetayModel();
    return _instance!;
  }

  //setter for singleton
  static setInstance(StokDetayModel value) => _instance = value;
  String? stokKodu;
  String? stokAdi;
  @JsonKey(name: "SeriList")
  List<dynamic>? seriList;
  @JsonKey(name: "YapList")
  List<dynamic>? yapList;
  @JsonKey(name: "StokList")
  List<StokList>? stokList;
  @JsonKey(name: "FiyatList")
  List<FiyatList>? fiyatList;

  StokDetayModel();

  @override
  fromJson(Map<String, dynamic> json) {
    return _$StokDetayModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StokDetayModelToJson(this);
  }
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true, createFactory: true)
class FiyatList {
  FiyatList();
  String? aS;
  String? stokKodu;
  int? dovizTipi;
  String? dovizKodu;
  DateTime? bastar;
  DateTime? bittar;
  String? gecerli;
  double? fiyat1;
  double? fiyat2;
  double? fiyat3;
  double? fiyat4;

  factory FiyatList.fromJson(Map<String, dynamic> json) => _$FiyatListFromJson(json);

  toJson() => _$FiyatListToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.screamingSnake, createToJson: true, createFactory: true)
class StokList {
  StokList();
  String? stokKodu;
  String? stokAdi;
  int? depoKodu;
  double? bakiye;
  String? muhdetayAdi;
  double? alisFiat1;
  double? alisFiat2;
  double? alisFiat3;
  double? alisFiat4;
  double? alisKdv;
  double? satisFiat1;
  double? satisFiat2;
  double? satisFiat3;
  double? satisFiat4;
  double? satisKdv;
  String? olcuBirimi;
  String? olcuBirimi2;
  String? olcuBirimi3;
  double? olcuBirimi2Pay;
  double? olcuBirimi2Payda;
  double? olcuBirimi3Pay;
  double? olcuBirimi3Payda;
  String? barkod1;
  String? barkod2;
  String? barkod3;
  String? kayityapankul;
  DateTime? kayittarihi;
  String? grupKodu;
  String? grupTanimi;
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
  bool? seriCikislardaAcik;
  bool? seriGirislerdeAcik;
  bool? seriMiktarKadarSor;
  bool? seriBakiyeKontrolu;
  bool? seriGiristeOtomatikMi;
  bool? seriCikistaOtomatikMi;
  DateTime? duzeltmetarihi;
  String? duzeltmeyapankul;
  List<dynamic>? stokFiyatList;
  List<dynamic>? stokList;
  int? fiatBirimi;
  String? kilitGenel;
  String? kilitSaticisip;
  String? kilitMussip;
  String? kilitAlis;
  String? kilitSatis;
  int? subeKodu;
  int? muhdetayKodu;
  int? alisDovTip;
  double? dovAlisFiat;
  String? alisDovizAdi;
  int? satDovTip;
  double? dovSatisFiat;
  String? satisDovizAdi;
  String? ureticiKodu;
  double? birimAgirlik;

  factory StokList.fromJson(Map<String, dynamic> json) => _$StokListFromJson(json);

  toJson() => _$StokListToJson(this);
}
