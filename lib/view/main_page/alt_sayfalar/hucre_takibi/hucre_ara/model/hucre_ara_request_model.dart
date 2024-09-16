import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "hucre_ara_request_model.freezed.dart";
part "hucre_ara_request_model.g.dart";

@unfreezed
class HucreAraRequestModel with _$HucreAraRequestModel, NetworkManagerMixin {
  HucreAraRequestModel._();
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory HucreAraRequestModel({
    String? barkod,
    String? ekranTipi,
    int? filtreKodu,
    Map<String, double>? hucreMiktarArray,
    String? menuKodu,
  }) = _HucreAraRequestModel;

  factory HucreAraRequestModel.fromJson(Map<String, dynamic> json) => _$HucreAraRequestModelFromJson(json);

  @override
  HucreAraRequestModel fromJson(Map<String, dynamic> json) => _$HucreAraRequestModelFromJson(json);
}
