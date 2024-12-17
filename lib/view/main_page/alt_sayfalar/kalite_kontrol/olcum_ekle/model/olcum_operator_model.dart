import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "olcum_operator_model.freezed.dart";
part "olcum_operator_model.g.dart";

@unfreezed
class OlcumOperatorModel with _$OlcumOperatorModel, NetworkManagerMixin {
  factory OlcumOperatorModel({
    int? id,
    String? isyeri,
    String? adi,
    String? istasyonKodu,
    String? istasyonTanimi,
    String? durum,
    String? sicilno,
    String? adiSoyadi,
    String? soyadi,
    int? isletmeKodu,
    String? kartid,
    String? resim,
  }) = _OlcumOperatorModel;
  OlcumOperatorModel._();

  factory OlcumOperatorModel.fromJson(Map<String, dynamic> json) => _$OlcumOperatorModelFromJson(json);

  @override
  OlcumOperatorModel fromJson(Map<String, dynamic> json) => _$OlcumOperatorModelFromJson(json);
}
