import "package:freezed_annotation/freezed_annotation.dart";

part "hucre_hareketleri_request_model.freezed.dart";
part "hucre_hareketleri_request_model.g.dart";

@freezed
class HucreHareketleriRequestModel with _$HucreHareketleriRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory HucreHareketleriRequestModel({String? ekranTipi, int? filtreKodu, String? stokKodu}) =
      _HucreHareketleriRequestModel;

  factory HucreHareketleriRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HucreHareketleriRequestModelFromJson(json);
}
