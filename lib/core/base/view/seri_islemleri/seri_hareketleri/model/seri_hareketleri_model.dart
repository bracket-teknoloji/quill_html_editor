import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "seri_hareketleri_model.freezed.dart";
part "seri_hareketleri_model.g.dart";

@unfreezed
class SeriHareketleriModel with _$SeriHareketleriModel, NetworkManagerMixin {
  SeriHareketleriModel._();
  factory SeriHareketleriModel({
    String? stokKodu,
    String? stokAdi,
    int? depoKodu,
    double? miktar,
    String? seriNo,
    int? inckeyno,
    String? depoTanimi,
    String? kayitTipi,
    String? kayitTipiAdi,
    String? belgeNo,
    String? belgeTipi,
    String? belgeTipiAdi,
    String? haracik,
    String? gckod,
    DateTime? tarih,
    int? stharInc,
  }) = _SeriHareketleriModel;

  factory SeriHareketleriModel.fromJson(Map<String, dynamic> json) => _$SeriHareketleriModelFromJson(json);

  @override
  SeriHareketleriModel fromJson(Map<String, dynamic> json) => SeriHareketleriModel.fromJson(json);
}
