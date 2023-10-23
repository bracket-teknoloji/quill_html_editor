import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "stok_muhasebe_kodu_model.g.dart";

@JsonSerializable()
class StokMuhasebeKoduModel with NetworkManagerMixin {
  int? muhKodu;
  String? adi;
  String? alisHesabi;
  String? satisHesabi;
  String? hesapKodu;
  String? hesapAdi;
  String? agm;
  String? hesapTipi;
  @override
  StokMuhasebeKoduModel fromJson(Map<String, dynamic> json) => _$StokMuhasebeKoduModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokMuhasebeKoduModelToJson(this);
}
