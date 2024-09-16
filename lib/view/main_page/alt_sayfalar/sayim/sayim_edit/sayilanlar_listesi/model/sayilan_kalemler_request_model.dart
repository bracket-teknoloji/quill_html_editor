import "package:freezed_annotation/freezed_annotation.dart";
import "../../../sayim_listesi/model/sayim_listesi_model.dart";

part "sayilan_kalemler_request_model.freezed.dart";
part "sayilan_kalemler_request_model.g.dart";

@unfreezed
class SayilanKalemlerRequestModel with _$SayilanKalemlerRequestModel {
  factory SayilanKalemlerRequestModel({
    @JsonKey(name: "FiltreKodu") int? filtreKodu,
    @JsonKey(name: "DepoKodu") int? depoKodu,
    @JsonKey(name: "KullaniciAdi") String? kullaniciAdi,
    @JsonKey(name: "EkranTipi") @Default("L") String? ekranTipi,
    @JsonKey(name: "BelgeNo") String? belgeNo,
    @JsonKey(name: "seriBazinda") String? seriBazinda,
    @JsonKey(name: "ID") int? id,
  }) = _SayilanKalemlerRequestModel;

  factory SayilanKalemlerRequestModel.fromJson(Map<String, dynamic> json) => _$SayilanKalemlerRequestModelFromJson(json);

  factory SayilanKalemlerRequestModel.fromSayimListesiModel(SayimListesiModel model) => SayilanKalemlerRequestModel(
        depoKodu: model.depoList?.firstOrNull,
        kullaniciAdi: model.kullanicilar,
        filtreKodu: 3,
        ekranTipi: "L",
        belgeNo: model.fisno,
        id: model.id,
      );
}
