import "package:freezed_annotation/freezed_annotation.dart";

part "sayilan_kalemler_request_model.freezed.dart";
part "sayilan_kalemler_request_model.g.dart";

@unfreezed
class SayilanKalemlerRequestModel with _$SayilanKalemlerRequestModel {
  factory SayilanKalemlerRequestModel({
    @JsonKey(name: "FiltreKodu") String? filtreKodu,
    @JsonKey(name: "DepoKodu") int? depoKodu,
    @JsonKey(name: "KullaniciAdi") String? kullaniciAdi,
    @JsonKey(name: "EkranTipi") @Default("L") String? ekranTipi,
    @JsonKey(name: "BelgeNo") String? belgeNo,
  }) = _SayilanKalemlerRequestModel;

  factory SayilanKalemlerRequestModel.fromJson(Map<String, dynamic> json) => _$SayilanKalemlerRequestModelFromJson(json);
}
