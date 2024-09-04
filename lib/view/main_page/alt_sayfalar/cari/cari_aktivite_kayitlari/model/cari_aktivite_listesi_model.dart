import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

part "cari_aktivite_listesi_model.freezed.dart";
part "cari_aktivite_listesi_model.g.dart";

@unfreezed
class CariAktiviteListesiModel with _$CariAktiviteListesiModel, NetworkManagerMixin {
  CariAktiviteListesiModel._();
  factory CariAktiviteListesiModel({
    int? id,
    int? islemKodu,
    String? cariKodu,
    String? cariAdi,
    String? kullaniciAdi,
    String? kullaniciTitle,
    int? aktiviteTipi,
    int? aktiviteId,
    String? aktiviteAdi,
    DateTime? bastar,
    DateTime? kayittarihi,
    String? kayityapankul,
    DateTime? bittar,
    String? sonucAciklama,
    double? sure,
    String? aciklama,
    DateTime? duzeltmetarihi,
    DateTime? tarih,
    String? duzeltmeyapankul,
    String? ilgiliKisi,
    String? bolum,
    @JsonKey(includeToJson: false) bool? aktiviteBitirilsin,
    List<CariAktiviteListesiModel>? listDetay,
  }) = _CariAktiviteListesiModel;

  factory CariAktiviteListesiModel.fromJson(Map<String, dynamic> json) => _$CariAktiviteListesiModelFromJson(json);

  @override
  CariAktiviteListesiModel? fromJson(Map<String, dynamic> json) => _$CariAktiviteListesiModelFromJson(json);

  factory CariAktiviteListesiModel.fromCariListesiModel(CariListesiModel? model) => CariAktiviteListesiModel(
        cariAdi: model?.cariAdi,
        cariKodu: model?.cariKodu,
      );
}

extension CariAktiviteExtensions on CariAktiviteListesiModel {
  bool get bittiMi => bittar != null;
}
