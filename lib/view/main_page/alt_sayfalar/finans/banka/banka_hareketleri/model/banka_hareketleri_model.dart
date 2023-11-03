import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "banka_hareketleri_model.freezed.dart";
part "banka_hareketleri_model.g.dart";

@unfreezed
class BankaHareketleriModel with _$BankaHareketleriModel, NetworkManagerMixin {

  BankaHareketleriModel._();
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
    int? dovizTutari,
    int? hareketTipi,
    String? hesapAdi,
    String? hareketAciklama,
    String? bankaKodu,
    String? bankaAdi,
    String? bankasubeKodu,
    String? subeAdi,
    String? belgeno,
  }) = _BankaHareketleriModel;

  factory BankaHareketleriModel.fromJson(Map<String, dynamic> json) => _$BankaHareketleriModelFromJson(json);

  @override
  BankaHareketleriModel fromJson(Map<String, dynamic> json) => _$BankaHareketleriModelFromJson(json);
}
