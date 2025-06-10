import "package:freezed_annotation/freezed_annotation.dart";

part "hizli_tahsilat_kayitlari_request_model.freezed.dart";
part "hizli_tahsilat_kayitlari_request_model.g.dart";

@unfreezed
sealed class HizliTahsilatKayitlariRequestModel with _$HizliTahsilatKayitlariRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory HizliTahsilatKayitlariRequestModel({
    String? baslamaTarihi,
    String? bitisTarihi,
    String? ekranTipi,
    @Default(1) int? sayfa,
  }) = _HizliTahsilatKayitlariRequestModel;

  factory HizliTahsilatKayitlariRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HizliTahsilatKayitlariRequestModelFromJson(json);
}
