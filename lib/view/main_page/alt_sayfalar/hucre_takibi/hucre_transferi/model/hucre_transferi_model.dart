import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/belge_rehberi/model/belge_rehberi_model.dart";

part "hucre_transferi_model.freezed.dart";
part "hucre_transferi_model.g.dart";

@unfreezed
class HucreTransferiModel with _$HucreTransferiModel {
  factory HucreTransferiModel({
    int? depoKodu,
    @JsonKey(includeFromJson: false, includeToJson: false) String? depoTanimi,
    @JsonKey(includeFromJson: false, includeToJson: false) BelgeRehberiModel? belgeModel,
    String? hedefHucre,
    String? hucreKodu,
    String? islemTuru,
    String? pickerBelgeTuru,
    double? miktar,
    String? stokKodu,
    String? stokAdi,
    String? paketKodu,
    String? belgeTuru,
    String? belgeNo,
    String? cariKodu,
  }) = _HucreTransferiModel;

  factory HucreTransferiModel.fromJson(Map<String, dynamic> json) => _$HucreTransferiModelFromJson(json);

  factory HucreTransferiModel.forStok(HucreTransferiModel model) => _HucreTransferiModel(
        depoKodu: model.depoKodu,
        hedefHucre: model.hedefHucre,
        hucreKodu: model.hucreKodu,
        islemTuru: model.islemTuru,
        miktar: model.miktar,
        stokKodu: model.stokKodu,
        stokAdi: model.stokAdi,
      );
  factory HucreTransferiModel.forPaket(HucreTransferiModel model) => _HucreTransferiModel(
        depoKodu: model.depoKodu,
        hedefHucre: model.hedefHucre,
        paketKodu: model.paketKodu,
      );
}

extension HucreTransferiModelExtensions on HucreTransferiModel {
  bool get isValid => depoKodu != null && (stokKodu != null || paketKodu != null) && belgeTuru != null;
}
