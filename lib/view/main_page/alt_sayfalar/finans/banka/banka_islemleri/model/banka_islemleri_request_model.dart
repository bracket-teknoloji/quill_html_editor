import "package:freezed_annotation/freezed_annotation.dart";

part "banka_islemleri_request_model.freezed.dart";
part "banka_islemleri_request_model.g.dart";

@unfreezed
class BankaIslemleriRequestModel with _$BankaIslemleriRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory BankaIslemleriRequestModel({
    String? baslamaTarihi,
    String? bitisTarihi,
    String? menuKodu,
    int? sayfa,
    String? plasiyerKodu,
    String? hesapTipi,
    String? hesapKodu,
    String? kasaKodu,
    String? gc,
  }) = _BankaIslemleriRequestModel;

  factory BankaIslemleriRequestModel.fromJson(Map<String, dynamic> json) => _$BankaIslemleriRequestModelFromJson(json);
}
