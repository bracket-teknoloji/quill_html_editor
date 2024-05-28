import "package:freezed_annotation/freezed_annotation.dart";

part "paketleme_listesi_request_model.freezed.dart";
part "paketleme_listesi_request_model.g.dart";

@freezed
class PaketlemeListesiRequestModel with _$PaketlemeListesiRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory PaketlemeListesiRequestModel({
    @JsonKey(name: "ID") int? id,
    String? stokKodu,
    String? belgeNo,
    String? menuKodu,
    int? depoKodu,
    String? paketKodu,
    int? islemKodu,
    String? kisitYok,
    String? ekranTipi,
    @JsonKey(name: "PaketID") int? paketId,
  }) = _PaketlemeListesiRequestModel;

  factory PaketlemeListesiRequestModel.fromJson(Map<String, dynamic> json) => _$PaketlemeListesiRequestModelFromJson(json);
}
