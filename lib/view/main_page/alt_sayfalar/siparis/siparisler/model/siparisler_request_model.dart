import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

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
    String? arrBelgeTipi,
    @Default("L") String? ekranTipi,
    int? sayfa,
    String? baslamaTarihi,
    String? bitisTarihi,
    String? searchText,
    @Default("") String? belgeNo,
    String? siparisDurumu,
    String? referansStokKodu,
    String? menuKodu,
    bool? siparisSevkEdilenGoster,
    String? refBelgeTuru,
  }) = _SiparislerRequestModel;

  factory SiparislerRequestModel.fromJson(Map<String, dynamic> json) => _$SiparislerRequestModelFromJson(json);

  factory SiparislerRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel model) => SiparislerRequestModel(
        menuKodu: "COMM_BREH",
        siralama: "TESLIM_TARIHI_AZ",
        ekranTipi: "R",
        siparisSevkEdilenGoster: true,
        pickerBelgeTuru: model.belgeTuru,
        cariKodu: model.cariKodu,
        projeKodu: model.projeKodu,
        belgeNo: model.belgeNo,
      );
}
