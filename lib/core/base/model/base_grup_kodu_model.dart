import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "base_grup_kodu_model.freezed.dart";
part "base_grup_kodu_model.g.dart";

@unfreezed
sealed class BaseGrupKoduModel with _$BaseGrupKoduModel, NetworkManagerMixin {
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

  factory BaseGrupKoduModel.forFirstSelected(BaseGrupKoduModel model) => model.copyWith(
    kod1: model.grupNo == 1 ? model.kod1 ?? model.grupKodu : null,
    kod2: model.grupNo == 2 ? model.kod2 ?? model.grupKodu : null,
    kod3: model.grupNo == 3 ? model.kod3 ?? model.grupKodu : null,
    kod4: model.grupNo == 4 ? model.kod4 ?? model.grupKodu : null,
    kod5: model.grupNo == 5 ? model.kod5 ?? model.grupKodu : null,
    grupKodu: model.grupNo == 0 ? model.grupKodu : null,
    kod1Adi: model.grupNo == 1 ? model.kod1Adi ?? model.grupAdi : null,
    kod2Adi: model.grupNo == 2 ? model.kod2Adi ?? model.grupAdi : null,
    kod3Adi: model.grupNo == 3 ? model.kod3Adi ?? model.grupAdi : null,
    kod4Adi: model.grupNo == 4 ? model.kod4Adi ?? model.grupAdi : null,
    kod5Adi: model.grupNo == 5 ? model.kod5Adi ?? model.grupAdi : null,
  );

  BaseGrupKoduModel._();
  factory BaseGrupKoduModel.fromJson(Map<String, Object?> json) => _$BaseGrupKoduModelFromJson(json);

  @override
  BaseGrupKoduModel fromJson(Map<String, dynamic> json) => _$BaseGrupKoduModelFromJson(json);
}
