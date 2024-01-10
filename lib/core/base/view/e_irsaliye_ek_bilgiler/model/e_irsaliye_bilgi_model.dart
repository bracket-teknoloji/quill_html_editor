import "package:freezed_annotation/freezed_annotation.dart";

import "../../../model/base_network_mixin.dart";

part "e_irsaliye_bilgi_model.freezed.dart";
part "e_irsaliye_bilgi_model.g.dart";

@unfreezed
class EIrsaliyeBilgiModel with _$EIrsaliyeBilgiModel, NetworkManagerMixin {
  EIrsaliyeBilgiModel._();
  factory EIrsaliyeBilgiModel({
    String? dorsePlaka1,
    String? dorsePlaka2,
    String? dorsePlaka3,
    String? plaka,
    DateTime? sevktar,
    @JsonKey(name: "SOFOR_1_ACIKLAMA") String? sofor1Aciklama,
    @JsonKey(name: "SOFOR_1_ADI") String? sofor1Adi,
    @JsonKey(name: "SOFOR_1_KIMLIK_NO") String? sofor1KimlikNo,
    @JsonKey(name: "SOFOR_1_SOYADI") String? sofor1Soyadi,
    @JsonKey(name: "SOFOR_2_ACIKLAMA") String? sofor2Aciklama,
    @JsonKey(name: "SOFOR_2_ADI") String? sofor2Adi,
    @JsonKey(name: "SOFOR_2_KIMLIK_NO") String? sofor2KimlikNo,
    @JsonKey(name: "SOFOR_2_SOYADI") String? sofor2Soyadi,
    @JsonKey(name: "SOFOR_3_ACIKLAMA") String? sofor3Aciklama,
    @JsonKey(name: "SOFOR_3_ADI") String? sofor3Adi,
    @JsonKey(name: "SOFOR_3_KIMLIK_NO") String? sofor3KimlikNo,
    @JsonKey(name: "SOFOR_3_SOYADI") String? sofor3Soyadi,
    String? tasiyiciIl,
    String? tasiyiciIlce,
    String? tasiyiciPostakodu,
    String? tasiyiciUlke,
    String? tasiyiciUnvan,
    String? tasiyiciVkn,
    String? sablonKodu,
  }) = _EIrsaliyeBilgiModel;

  factory EIrsaliyeBilgiModel.fromJson(Map<String, dynamic> json) => _$EIrsaliyeBilgiModelFromJson(json);

  @override
  EIrsaliyeBilgiModel fromJson(Map<String, dynamic> json) => _$EIrsaliyeBilgiModelFromJson(json);
}

extension EIrsaliyeBilgiModelExtensions on EIrsaliyeBilgiModel {
  bool get tasiyiciBilgileriTamMi =>
      (tasiyiciIl?.isNotEmpty ?? false) &&
      (tasiyiciIlce?.isNotEmpty ?? false) &&
      (tasiyiciPostakodu?.isNotEmpty ?? false) &&
      (tasiyiciUlke?.isNotEmpty ?? false) &&
      (tasiyiciUnvan?.isNotEmpty ?? false) &&
      (tasiyiciVkn?.isNotEmpty ?? false);
}
