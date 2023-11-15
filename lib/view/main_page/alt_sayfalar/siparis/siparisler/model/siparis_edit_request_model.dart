import "package:freezed_annotation/freezed_annotation.dart";
import "../../../../../../core/constants/enum/siparis_tipi_enum.dart";
import "../../../cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../../stok/stok_hareketleri/model/stok_hareketleri_model.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../base_siparis_edit/model/base_siparis_edit_model.dart";

part "siparis_edit_request_model.freezed.dart";
part "siparis_edit_request_model.g.dart";

@unfreezed
class SiparisEditRequestModel with NetworkManagerMixin, _$SiparisEditRequestModel {
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
  }) = _SiparisEditRequestModel;

  SiparisEditRequestModel._();

  factory SiparisEditRequestModel.fromJson(Map<String, Object?> json) => _$SiparisEditRequestModelFromJson(json);

  factory SiparisEditRequestModel.fromKalemModel(KalemModel model) => SiparisEditRequestModel(
        belgeNo: model.belgeNo,
        cariKodu: model.cariKodu,
        belgeTuru: model.belgeTipi,
      );

  factory SiparisEditRequestModel.fromCariHareketleriModel(CariHareketleriModel model) => SiparisEditRequestModel(
        cariKodu: model.cariKodu,
        belgeNo: model.belgeNo,
        kisitYok: true,
        belgeTuru: model.belgeTipi,
        pickerBelgeTuru: model.belgeTipi,
      );
  factory SiparisEditRequestModel.fromSiparislerModel(BaseSiparisEditModel model) => SiparisEditRequestModel(
        belgeNo: model.belgeNo,
        pickerBelgeTuru: model.belgeTuru,
        belgeTuru: model.belgeTuru,
        belgeTipi: model.belgeTipi.toStringIfNotNull,
        cariKodu: model.cariKodu,
        tipi: model.tipi,
        tempBelgeId: model.tempBelgeId,
      );

  factory SiparisEditRequestModel.fromEBelgeListesiModel(EBelgeListesiModel? model) => SiparisEditRequestModel(
        belgeNo: model?.belgeNo,
        cariKodu: model?.cariKodu,
        belgeTuru: model?.belgeTuru,
        belgeTipi: model?.belgeTuru,
        tipi: model?.dovizTipi,
      );

  factory SiparisEditRequestModel.fromStokHareketleriModel(StokHareketleriModel? model) => SiparisEditRequestModel(
        belgeNo: model?.fisno,
        cariKodu: model?.cariKodu,
        belgeTuru: SiparisTipiEnum.values.firstWhere((element) => element.getName == model?.belgeTipiAciklama).rawValue,
      );
  @override
  SiparisEditRequestModel fromJson(Map<String, dynamic> json) => SiparisEditRequestModel.fromJson(json);
}
