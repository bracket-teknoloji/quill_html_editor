import "package:freezed_annotation/freezed_annotation.dart";

part "ortalama_vade_tarihi_model.freezed.dart";
part "ortalama_vade_tarihi_model.g.dart";

@unfreezed
abstract class OrtalamaVadeTarihiModel with _$OrtalamaVadeTarihiModel {
  factory OrtalamaVadeTarihiModel({
    DateTime? vadeTarihi,
    double? tutar,
  }) = _OrtalamaVadeTarihiModel;

  factory OrtalamaVadeTarihiModel.fromJson(Map<String, dynamic> json) => _$OrtalamaVadeTarihiModelFromJson(json);
}
