import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "cari_aktivite_listesi_model.freezed.dart";
part "cari_aktivite_listesi_model.g.dart";

@unfreezed
class CariAktiviteListesiModel with _$CariAktiviteListesiModel, NetworkManagerMixin {
  CariAktiviteListesiModel._();
  factory CariAktiviteListesiModel({
    int? id,
    String? cariKodu,
    String? cariAdi,
    String? kullaniciAdi,
    int? aktiviteTipi,
    String? aktiviteAdi,
    DateTime? bastar,
    DateTime? kayittarihi,
    String? kayityapankul,
  }) = _CariAktiviteListesiModel;

  factory CariAktiviteListesiModel.fromJson(Map<String, dynamic> json) => _$CariAktiviteListesiModelFromJson(json);

  @override
  CariAktiviteListesiModel? fromJson(Map<String, dynamic> json) => _$CariAktiviteListesiModelFromJson(json);
}
