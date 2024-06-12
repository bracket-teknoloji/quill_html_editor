import "package:freezed_annotation/freezed_annotation.dart";

part "barkod_tanimla_kayitlari_request_model.freezed.dart";
part "barkod_tanimla_kayitlari_request_model.g.dart";

@freezed
class BarkodTanimlaKayitlariRequestModel with _$BarkodTanimlaKayitlariRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory BarkodTanimlaKayitlariRequestModel({
    String? stokKodu,
    String? kayitTipi,
  }) = _BarkodTanimlaKayitlariRequestModel;

  factory BarkodTanimlaKayitlariRequestModel.fromJson(Map<String, dynamic> json) => _$BarkodTanimlaKayitlariRequestModelFromJson(json);
}
