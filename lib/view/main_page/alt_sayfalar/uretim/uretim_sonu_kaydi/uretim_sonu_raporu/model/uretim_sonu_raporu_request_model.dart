import "package:freezed_annotation/freezed_annotation.dart";

part "uretim_sonu_raporu_request_model.freezed.dart";
part "uretim_sonu_raporu_request_model.g.dart";

@unfreezed
class UretimSonuRaporuRequestModel with _$UretimSonuRaporuRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory UretimSonuRaporuRequestModel({String? belgeNo, int? filtreKodu, String? stokKodu}) =
      _UretimSonuRaporuRequestModel;

  factory UretimSonuRaporuRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UretimSonuRaporuRequestModelFromJson(json);
}
