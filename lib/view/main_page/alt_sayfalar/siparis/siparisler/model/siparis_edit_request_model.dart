import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../../stok/stok_hareketleri/model/stok_hareketleri_model.dart";
import "../../../talep_teklif/talep_teklif_listesi/model/talep_teklif_listesi_model.dart";
import "../../base_siparis_edit/model/base_siparis_edit_model.dart";

part "siparis_edit_request_model.freezed.dart";
part "siparis_edit_request_model.g.dart";

@unfreezed
sealed class SiparisEditRequestModel with NetworkManagerMixin, _$SiparisEditRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory SiparisEditRequestModel({
    @JsonKey(defaultValue: "D") String? ekranTipi,
    @Default(true) bool? kisitYok,
    @JsonKey(name: "BelgeTipi") String? belgeTipi,
    @JsonKey(name: "PickerBelgeTuru") String? pickerBelgeTuru,
    bool? remoteTempBelge,
    int? faturaTipi,
    int? tempBelgeId,
    int? tipi,
    String? belgeNo,
    String? belgeTarihi,
    String? belgeTuru,
    String? cariKodu,
    String? islemId,
    String? kayitModu,
    String? menuKodu,
    String? mevcutBelgeNo,
    String? mevcutCariKodu,
    String? paramMap,
    String? resimGoster,
    String? stokKodu,
    String? tag,
    bool? siparisSevkEdilenGoster,
    int? filtreKodu,
    int? eFaturaIncKeyNo,
    int? depoKodu,
    bool? iadeMi,
    String? ozelKod2,
    String? cariTipi,
    String? miktarGetir,
    @JsonKey(name: "SIRALAMA") String? siralama,
    String? siparisKarsilanmaDurumu,
    String? ozelKod1,
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
    int? sayfa,
    String? baslamaTarihi,
    String? bitisTarihi,
    String? searchText,
    String? siparisDurumu,
    String? referansStokKodu,
    String? refBelgeTuru,
    String? arrBelgeTipi,
    String? arrBelgeNo,
    String? bakiyeDurumu,
    bool? isNew,
    int? hedefDepoKodu,
    @JsonKey(name: "Barkod") String? barkod,
    @JsonKey(name: "Okutuldu") String? okutuldu,
  }) = _SiparisEditRequestModel;

  SiparisEditRequestModel._();

  factory SiparisEditRequestModel.fromJson(Map<String, Object?> json) => _$SiparisEditRequestModelFromJson(json);

  factory SiparisEditRequestModel.fromKalemModel(KalemModel model) => SiparisEditRequestModel(
    belgeNo: model.belgeNo,
    cariKodu: model.cariKodu,
    belgeTuru: model.belgeTipi,
    belgeTipi: model.belgeTipi,
  );

  factory SiparisEditRequestModel.fromCariHareketleriModel(CariHareketleriModel model) => SiparisEditRequestModel(
    cariKodu: model.cariKodu,
    belgeNo: model.belgeNo,
    belgeTuru: model.belgeTipi,
    belgeTipi: model.belgeTipi,
    pickerBelgeTuru: model.belgeTipi,
  );

  factory SiparisEditRequestModel.fromSiparislerModel(BaseSiparisEditModel model) => SiparisEditRequestModel(
    belgeNo: model.belgeNo,
    pickerBelgeTuru: model.belgeTuru,
    belgeTuru: model.belgeTuru,
    belgeTipi: model.belgeTipi.toStringIfNotNull,
    belgeTarihi: model.tarih?.toDateString,
    cariKodu: model.cariKodu,
    filtreKodu: 2,
    tipi: model.tipi,
    tempBelgeId: model.tempBelgeId,
    isNew: model.isNew,
  );

  factory SiparisEditRequestModel.forDepolarArasiTransfer(BaseSiparisEditModel model) => SiparisEditRequestModel(
    belgeNo: model.belgeNo,
    belgeTuru: model.belgeTuru,
    cariKodu: model.cariKodu,
    tipi: model.tipi,
    ekranTipi: "D",
    kayitModu: "U",
  );

  factory SiparisEditRequestModel.forTalepMalToplama(BaseSiparisEditModel model) => SiparisEditRequestModel(
    iadeMi: false,
    filtreKodu: 6,
    belgeNo: model.id.toStringIfNotNull,
    hedefDepoKodu: model.depoKodu,
    kisitYok: null,
  );

  factory SiparisEditRequestModel.fromTalepTeklifListesiModel(TalepTeklifListesiModel model) => SiparisEditRequestModel(
    belgeNo: model.belgeNo,
    cariKodu: model.cariKodu,
    belgeTuru: model.belgeTuru,
    belgeTipi: model.belgeTuru,
  );

  factory SiparisEditRequestModel.fromEBelgeListesiModel(EBelgeListesiModel? model) => SiparisEditRequestModel(
    belgeNo: model?.belgeNo,
    cariKodu: model?.cariKodu,
    belgeTuru: model?.belgeTuru,
    belgeTipi: model?.belgeTuru,
    pickerBelgeTuru: model?.belgeTuru,
    filtreKodu: 8,
    tipi: model?.dovizTipi,
    eFaturaIncKeyNo: model?.inckeyno,
  );

  factory SiparisEditRequestModel.fromStokHareketleriModel(StokHareketleriModel? model) =>
      SiparisEditRequestModel(belgeNo: model?.fisno, cariKodu: model?.cariKodu, belgeTipi: model?.belgeTipi);
  @override
  SiparisEditRequestModel fromJson(Map<String, dynamic> json) => SiparisEditRequestModel.fromJson(json);
}
