import "package:freezed_annotation/freezed_annotation.dart";

part "olcum_seri_request_model.freezed.dart";
part "olcum_seri_request_model.g.dart";

@freezed
class OlcumSeriRequestModel with _$OlcumSeriRequestModel {
  const factory OlcumSeriRequestModel({
    String? stokKodu,
    int? girisDepo,
    int? cikisDepo,
    int? redGirisDepo,
    int? kabulGirisDepo,
    List<String>? seriListe,
  }) = _OlcumSeriRequestModel;

  factory OlcumSeriRequestModel.fromJson(Map<String, dynamic> json) => _$OlcumSeriRequestModelFromJson(json);
}
