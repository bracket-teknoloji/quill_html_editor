import "package:freezed_annotation/freezed_annotation.dart";

part "olcum_operator_model.freezed.dart";
part "olcum_operator_model.g.dart";

@freezed
class OlcumOperatorModel with _$OlcumOperatorModel {
  const factory OlcumOperatorModel({
    int? id,
    String? isyeri,
    String? adi,
    String? istasyonKodu,
    String? istasyonTanimi,
    String? durum,
    String? sicilno,
    String? soyadi,
    int? isletmeKodu,
    String? sicilNo,
    String? kartid,
    String? resim,
  }) = _OlcumOperatorModel;

  factory OlcumOperatorModel.fromJson(Map<String, dynamic> json) => _$OlcumOperatorModelFromJson(json);
}
