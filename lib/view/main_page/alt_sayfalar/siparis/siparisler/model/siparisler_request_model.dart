import "package:freezed_annotation/freezed_annotation.dart";

import "../../base_siparis_edit/model/base_siparis_edit_model.dart";

part "siparisler_request_model.freezed.dart";
part "siparisler_request_model.g.dart";

@unfreezed
class SiparislerRequestModel with _$SiparislerRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory SiparislerRequestModel({
    String? pickerBelgeTuru,
    bool? iadeMi,
    @Default("") String? cariKodu,
    String? teslimCariKodu,
    String? ozelKod2,
    String? cariTipi,
    String? miktarGetir,
    @JsonKey(name: "SIRALAMA") String? siralama,
    String? siparisKarsilanmaDurumu,
    String? ozelKod1,
    String? stokKodu,
    bool? kapaliBelgelerListelenmesin,
    String? projeKodu,
    bool? faturalasmaGoster,
    String? arrKod5,
    String? arrGrupKodu,
    String? arrKod4,
    String? arrKod3,
    String? arrKod2,
    String? arrPlasiyerKodu,
    String? arrKod1,
    @Default("R") String? ekranTipi,
    int? sayfa,
    String? baslamaTarihi,
    String? bitisTarihi,
    String? searchText,
    int? filtreKodu,
    String? depoKodu,
    String? hedefDepoKodu,
    @Default("") String? belgeNo,
    String? siparisDurumu,
    String? referansStokKodu,
    String? menuKodu,
    bool? siparisSevkEdilenGoster,
    String? refBelgeTuru,
    bool? kisitYok,
    String? arrBelgeTipi,
    String? arrBelgeNo,
    String? lokalDAT,
    bool? faturalanmisIrsaliyelerGelsin,
  }) = _SiparislerRequestModel;

  factory SiparislerRequestModel.fromJson(Map<String, dynamic> json) => _$SiparislerRequestModelFromJson(json);

  factory SiparislerRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel model) => SiparislerRequestModel(
        menuKodu: "COMM_BREH",
        siralama: "TESLIM_TARIHI_AZ",
        kisitYok: true,
        ekranTipi: "R",
        miktarGetir: "E",
        arrBelgeTipi: "[2,6]",
        siparisDurumu: "A",
        pickerBelgeTuru: model.belgeTuru,
        siparisKarsilanmaDurumu: "K",
        siparisSevkEdilenGoster: true,
        belgeNo: model.belgeNo ?? "",
        arrBelgeNo: model.arrBelgeNo,
        cariKodu: model.cariKodu ?? "",

        // refBelgeTuru: model.belgeTuru,
        projeKodu: model.projeKodu,
      );
}
