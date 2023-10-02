import "package:freezed_annotation/freezed_annotation.dart";

part "kasa_islemleri_request_model.freezed.dart";
part "kasa_islemleri_request_model.g.dart";

@unfreezed
class KasaIslemleriRequestModel with _$KasaIslemleriRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory KasaIslemleriRequestModel({
    String? baslamaTarihi,
    String? bitisTarihi,
    String? menuKodu,
    int? sayfa,
    String? plasiyerKodu,
    String? hesapTipi,
    String? hesapKodu,
    String? kasaKodu,
    String? gc,
  }) = _KasaIslemleriRequestModel;

  factory KasaIslemleriRequestModel.fromJson(Map<String, dynamic> json) => _$KasaIslemleriRequestModelFromJson(json);
}
