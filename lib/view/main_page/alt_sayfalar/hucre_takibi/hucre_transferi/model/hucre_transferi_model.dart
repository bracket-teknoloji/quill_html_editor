import "package:freezed_annotation/freezed_annotation.dart";

part "hucre_transferi_model.freezed.dart";
part "hucre_transferi_model.g.dart";

@unfreezed
class HucreTransferiModel with _$HucreTransferiModel {
  factory HucreTransferiModel({
    int? depoKodu,
    String? hedefHucre,
    String? hucreKodu,
    String? islemTuru,
    double? miktar,
    String? stokKodu,
    String? stokAdi,
    String? paketKodu,
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
