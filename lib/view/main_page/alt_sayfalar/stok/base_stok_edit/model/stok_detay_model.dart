import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive_flutter/hive_flutter.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../stok_liste/model/stok_listesi_model.dart";

part "stok_detay_model.g.dart";

@JsonSerializable()
class StokDetayModel with NetworkManagerMixin {
  //singleton
  static StokDetayModel? _instance;
  static StokDetayModel get instance => _instance ??= StokDetayModel();

  //setter for singleton
  static void setInstance(StokDetayModel value) => _instance = value;
  String? stokKodu;
  String? stokAdi;
  @JsonKey(name: "SeriList")
  List<SeriList>? seriList;
  @JsonKey(name: "YapList")
  List<dynamic>? yapList;
  @JsonKey(name: "StokList")
  List<StokList>? stokList;
  @JsonKey(name: "FiyatList")
  List<FiyatList>? fiyatList;

  StokDetayModel();
  @override
  StokDetayModel fromJson(Map<String, dynamic> json) => _$StokDetayModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokDetayModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
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

  Map<String, dynamic> toJson() => _$FiyatListToJson(this);
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 196)
class SeriList {
  SeriList();
  @HiveField(0)
  String? stokKodu;
  @HiveField(1)
  int? depoKodu;
  @HiveField(2)
  double? miktar;
  @HiveField(3)
  String? seriNo;
  @HiveField(4)
  int? inckeyno;
  @HiveField(5)
  String? depoTanimi;

  int? hareketId;

  factory SeriList.fromJson(Map<String, dynamic> json) => _$SeriListFromJson(json);

  Map<String, dynamic> toJson() => _$SeriListToJson(this);
}
