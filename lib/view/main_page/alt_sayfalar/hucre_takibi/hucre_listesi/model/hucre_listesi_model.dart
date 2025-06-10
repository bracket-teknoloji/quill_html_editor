import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "hucre_listesi_model.freezed.dart";
part "hucre_listesi_model.g.dart";

@freezed
sealed class HucreListesiModel with _$HucreListesiModel, NetworkManagerMixin {
  factory HucreListesiModel({
    String? hucreKodu,
    int? depoKodu,
    String? depoTanimi,
    @JsonKey(name: "SeriList") List<dynamic>? seriList,
    bool? eksiyeDusebilir,
    int? netMiktar,
    String? stokKodu,
    String? stokAdi,
  }) = _HucreListesiModel;
  HucreListesiModel._();

  factory HucreListesiModel.fromJson(Map<String, dynamic> json) => _$HucreListesiModelFromJson(json);

  @override
  HucreListesiModel fromJson(Map<String, dynamic> json) => _$HucreListesiModelFromJson(json);
}
