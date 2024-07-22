import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "base_grup_kodu_model.freezed.dart";
part "base_grup_kodu_model.g.dart";

@unfreezed
class BaseGrupKoduModel with _$BaseGrupKoduModel, NetworkManagerMixin {
  @JsonSerializable(createFactory: true)
  factory BaseGrupKoduModel({
    String? modul,
    int? grupNo,
    String? grupKodu,
    String? grupAdi,
    String? tip,
    String? kod1,
    String? kod2,
    String? kod3,
    String? kod4,
    String? kod5,
    String? kod1Adi,
    String? kod2Adi,
    String? kod3Adi,
    String? kod4Adi,
    String? kod5Adi,
  }) = _BaseGrupKoduModel;

  BaseGrupKoduModel._();
  factory BaseGrupKoduModel.fromJson(Map<String, Object?> json) => _$BaseGrupKoduModelFromJson(json);

  @override
  BaseGrupKoduModel fromJson(Map<String, dynamic> json) => _$BaseGrupKoduModelFromJson(json);
}
