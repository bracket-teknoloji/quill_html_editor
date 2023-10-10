import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "kasa_islemleri_model.freezed.dart";
part "kasa_islemleri_model.g.dart";

@unfreezed
class KasaIslemleriModel with _$KasaIslemleriModel, NetworkManagerMixin {
  KasaIslemleriModel._();
  factory KasaIslemleriModel({
    int? inckeyno,
    int? caharInckeyno,
    String? kasaKodu,
    String? kasaAdi,
    String? belgeNo,
    DateTime? tarih,
    String? tip,
    String? tipAciklama,
    String? hedefAciklama,
    double? tutar,
    String? cariMuh,
    String? gc,
    String? kod,
    String? cariKodu,
    String? cariAdi,
    String? hesapAdi,
    double? dovizTutari,
    double? dovizKuru,
    String? plasiyerKodu,
    String? plasiyerAdi,
    String? projeKodu,
    String? projeAdi,
    String? aciklama,
    String? refkey,
    DateTime? kasaDevirTarihi,
    double? kasaDevirTutari,
    double? kasaDovizDevirTutari,
    int? kasaDovizTipi,
  }) = _KasaIslemleriModel;

  factory KasaIslemleriModel.fromJson(Map<String, dynamic> json) => _$KasaIslemleriModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$KasaIslemleriModelFromJson(json);
}
