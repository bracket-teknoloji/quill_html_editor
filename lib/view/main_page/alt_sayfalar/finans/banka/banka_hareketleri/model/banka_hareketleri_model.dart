import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "banka_hareketleri_model.freezed.dart";
part "banka_hareketleri_model.g.dart";

@unfreezed
class BankaHareketleriModel with _$BankaHareketleriModel, NetworkManagerMixin {
  factory BankaHareketleriModel({
    int? inckeyno,
    String? netheskodu,
    DateTime? tarih,
    int? harturu,
    String? ba,
    double? tutar,
    String? aciklama,
    String? entegrefkey,
    int? dovizTipi,
    double? dovizTutari,
    int? hareketTipi,
    String? hesapAdi,
    String? hareketAciklama,
    String? bankaKodu,
    String? bankaAdi,
    String? bankasubeKodu,
    String? subeAdi,
    String? belgeno,
    String? dovizAdi,
    String? cariKodu,
    String? cariAdi,
    String? belgeNo,
    String? kasaKodu,
    String? kasaAdi,
    String? entegreKasaKodu,
    String? sozlesmeKodu,
    String? projeKodu,
    String? projeAciklama,
    String? plasiyerKodu,
    String? plasiyerAdi,
    String? nakitmi,
    int? taksitSayisi,
  }) = _BankaHareketleriModel;
  BankaHareketleriModel._();

  factory BankaHareketleriModel.fromJson(Map<String, dynamic> json) => _$BankaHareketleriModelFromJson(json);

  @override
  BankaHareketleriModel fromJson(Map<String, dynamic> json) => _$BankaHareketleriModelFromJson(json);
}
