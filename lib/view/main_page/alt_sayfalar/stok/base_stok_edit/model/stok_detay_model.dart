import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../stok_liste/model/stok_listesi_model.dart";

part "stok_detay_model.g.dart";

@JsonSerializable()
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
  fromJson(Map<String, dynamic> json) => _$StokDetayModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokDetayModelToJson(this);
}

@JsonSerializable(explicitToJson: true, createFactory: true)
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

  factory FiyatList.fromJson(Map<String, dynamic> json) =>
      _$FiyatListFromJson(json);

  toJson() => _$FiyatListToJson(this);
}
