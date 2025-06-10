import "package:freezed_annotation/freezed_annotation.dart";

part "banka_listesi_request_model.freezed.dart";
part "banka_listesi_request_model.g.dart";

@unfreezed
sealed class BankaListesiRequestModel with _$BankaListesiRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory BankaListesiRequestModel({
    String? bakiye,
    String? arrHesapTipi,
    String? haricHesaplarArray,
    String? sirala,
    @Default("R") String? ekranTipi,
    String? menuKodu,
    String? belgeTipi,
    String? bankaKodu,
    String? islemModulu,
  }) = _BankaListesiRequestModel;

  factory BankaListesiRequestModel.fromJson(Map<String, dynamic> json) => _$BankaListesiRequestModelFromJson(json);
}
