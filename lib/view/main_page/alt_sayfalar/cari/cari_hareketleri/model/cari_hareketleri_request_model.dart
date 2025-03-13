import "package:freezed_annotation/freezed_annotation.dart";

part "cari_hareketleri_request_model.freezed.dart";
part "cari_hareketleri_request_model.g.dart";

@unfreezed
class CariHareketleriRequestModel with _$CariHareketleriRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory CariHareketleriRequestModel({
    @JsonKey(name: "SIRALAMA") String? siralama,
    bool? sadeceTahsilatlarOdemeler,
    String? cariKodu,
    String? ekranTipi,
    String? arrPlasiyerKodu,
    String? arrHareketTuru,
    String? baslamaTarihi,
    String? bitisTarihi,
    @JsonKey(name: "BA") String? ba,
    String? menuKodu,
    String? kapatilmis,
  }) = _CariHareketleriRequestModel;

  factory CariHareketleriRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CariHareketleriRequestModelFromJson(json);
}
