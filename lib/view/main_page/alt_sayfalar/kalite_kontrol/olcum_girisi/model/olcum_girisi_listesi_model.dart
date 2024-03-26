import "package:freezed_annotation/freezed_annotation.dart";

part "olcum_girisi_listesi_model.freezed.dart";
part "olcum_girisi_listesi_model.g.dart";

@freezed
class OlcumGirisiListesiModel with _$OlcumGirisiListesiModel {
  factory OlcumGirisiListesiModel() = _OlcumGirisiListesiModel;

  factory OlcumGirisiListesiModel.fromJson(Map<String, dynamic> json) => _$OlcumGirisiListesiModelFromJson(json);
}
