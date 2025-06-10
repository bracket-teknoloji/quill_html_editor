import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

part "seri_hareketleri_model.freezed.dart";
part "seri_hareketleri_model.g.dart";

@unfreezed
sealed class SeriHareketleriModel with _$SeriHareketleriModel, NetworkManagerMixin {
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
    int? islemKodu,
    String? acik1,
    String? acik2,
    String? aciklama1,
    String? seri1,
    int? requestVersion,
    String? seri2,
  }) = _SeriHareketleriModel;
  SeriHareketleriModel._();

  factory SeriHareketleriModel.fromJson(Map<String, dynamic> json) => _$SeriHareketleriModelFromJson(json);

  factory SeriHareketleriModel.ekle(StokListesiModel model) => SeriHareketleriModel(
    stokKodu: model.stokKodu,
    stokAdi: model.stokAdi,
    gckod: "G",
    islemKodu: 7,
    requestVersion: 2,
  );

  @override
  SeriHareketleriModel fromJson(Map<String, dynamic> json) => SeriHareketleriModel.fromJson(json);
}

extension SeriHareketleriModelExtensions on SeriHareketleriModel {
  bool get devirMi => kayitTipi == "D";
}
