import "package:freezed_annotation/freezed_annotation.dart";

import "../../../model/base_network_mixin.dart";

part "surum_yenilikleri_model.freezed.dart";
part "surum_yenilikleri_model.g.dart";

@unfreezed
class SurumYenilikleriModel with _$SurumYenilikleriModel, NetworkManagerMixin {
  SurumYenilikleriModel._();
  factory SurumYenilikleriModel({
    int? surumKodu,
    String? versiyon,
    dynamic surumAdi,
    dynamic yer,
    List<ValueList>? liste,
    List<dynamic>? listAciklama,
    DateTime? tarih,
  }) = _SurumYenilikleriModel;

  factory SurumYenilikleriModel.fromJson(Map<String, dynamic> json) => _$SurumYenilikleriModelFromJson(json);

  @override
  SurumYenilikleriModel fromJson(Map<String, dynamic> json) => _$SurumYenilikleriModelFromJson(json);
}

@freezed
class ValueList with _$ValueList {
  const factory ValueList({
    int? id,
    String? aciklama,
    bool? talepEden,
  }) = _ValueList;

  factory ValueList.fromJson(Map<String, dynamic> json) => _$ValueListFromJson(json);
}
