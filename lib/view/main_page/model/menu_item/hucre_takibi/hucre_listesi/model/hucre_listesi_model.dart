import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "hucre_listesi_model.freezed.dart";
part "hucre_listesi_model.g.dart";

@freezed
class HucreListesiModel with _$HucreListesiModel, NetworkManagerMixin {
  HucreListesiModel._();
  factory HucreListesiModel({
    String? hucreKodu,
    int? depoKodu,
    String? depoTanimi,
    @JsonKey(name: "SeriList") List<dynamic>? seriList,
    bool? eksiyeDusebilir,
  }) = _HucreListesiModel;

  factory HucreListesiModel.fromJson(Map<String, dynamic> json) => _$HucreListesiModelFromJson(json);

  @override
  HucreListesiModel fromJson(Map<String, dynamic> json) => _$HucreListesiModelFromJson(json);
}
