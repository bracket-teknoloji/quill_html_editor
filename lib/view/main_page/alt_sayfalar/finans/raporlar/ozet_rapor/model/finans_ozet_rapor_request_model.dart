import "package:freezed_annotation/freezed_annotation.dart";

part "finans_ozet_rapor_request_model.freezed.dart";
part "finans_ozet_rapor_request_model.g.dart";

@unfreezed
class FinansOzetRaporRequestModel with _$FinansOzetRaporRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory FinansOzetRaporRequestModel({
    String? plasiyerKodu,
    String? cariKodu,
    String? tarihTipi,
    String? cariKoduIleBaslar,
    @JsonKey(name: "KDVDahil")
    bool? kdvDahil,
    String? baslamaTarihi,
    String? bitisTarihi,
    String? iadeDurumu,
  }) = _FinansOzetRaporRequestModel;

  factory FinansOzetRaporRequestModel.fromJson(Map<String, dynamic> json) => _$FinansOzetRaporRequestModelFromJson(json);
}
