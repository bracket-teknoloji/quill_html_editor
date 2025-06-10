import "package:freezed_annotation/freezed_annotation.dart";

part "uretim_sonu_kaydi_listesi_request_model.freezed.dart";
part "uretim_sonu_kaydi_listesi_request_model.g.dart";

@unfreezed
sealed class UretimSonuKaydiListesiRequestModel with _$UretimSonuKaydiListesiRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory UretimSonuKaydiListesiRequestModel({int? sayfa, String? ekranTipi, String? belgeNo, String? searchText}) =
      _UretimSonuKaydiListesiRequestModel;

  factory UretimSonuKaydiListesiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UretimSonuKaydiListesiRequestModelFromJson(json);
}
