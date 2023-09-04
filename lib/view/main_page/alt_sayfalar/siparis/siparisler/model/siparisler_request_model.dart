import "package:freezed_annotation/freezed_annotation.dart";

part "siparisler_request_model.freezed.dart";
part "siparisler_request_model.g.dart";

@unfreezed
class SiparislerRequestModel with _$SiparislerRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
   factory SiparislerRequestModel({
    String? pickerBelgeTuru,
    bool? iadeMi,
    @Default("") String? cariKodu,
    String? ozelKod2,
    String? cariTipi,
    String? miktarGetir,
    @JsonKey(name: "SIRALAMA") String? siralama,
    String? siparisKarsilanmaDurumu,
    String? ozelKod1,
    String? kapaliBelgelerListelenmesin,
    String? projeKodu,
    bool? faturalasmaGoster,
    String? arrKod5,
    String? arrGrupKodu,
    String? arrKod4,
    String? arrKod3,
    String? arrKod2,
    String? arrPlasiyerKodu,
    String? arrKod1,
    String? ekranTipi,
    int? sayfa,
    String? baslamaTarihi,
    String? bitisTarihi,
    String? searchText,
    @Default("")String? belgeNo,
    String? siparisDurumu,
    String? referansStokKodu
  }) = _SiparislerRequestModel;

  factory SiparislerRequestModel.fromJson(Map<String, dynamic> json) => _$SiparislerRequestModelFromJson(json);
}
