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
    int? miktar,
    String? stokKodu,
    String? stokAdi,
    
  }) = _HucreTransferiModel;

  factory HucreTransferiModel.fromJson(Map<String, dynamic> json) => _$HucreTransferiModelFromJson(json);
}
