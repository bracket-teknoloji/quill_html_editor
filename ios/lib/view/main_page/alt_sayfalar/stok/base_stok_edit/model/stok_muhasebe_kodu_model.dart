import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "stok_muhasebe_kodu_model.g.dart";

@JsonSerializable()
class StokMuhasebeKoduModel with NetworkManagerMixin {
  int? muhKodu;
  String? adi;
  String? alisHesabi;
  String? satisHesabi;
  @override
  fromJson(Map<String, dynamic> json) {
    return _$StokMuhasebeKoduModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StokMuhasebeKoduModelToJson(this);
  }
}
