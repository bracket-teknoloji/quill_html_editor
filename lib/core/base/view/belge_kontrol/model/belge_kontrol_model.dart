import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "belge_kontrol_model.freezed.dart";
part "belge_kontrol_model.g.dart";

@unfreezed
class BelgeKontrolModel with _$BelgeKontrolModel, NetworkManagerMixin {
  factory BelgeKontrolModel({
    @JsonKey(name: "ID") int? id,
    @JsonKey(name: "BELGE_TIPI") String? belgeTipi,
    @JsonKey(name: "BELGE_NO") String? belgeNo,
    @JsonKey(name: "CARI_KODU") String? cariKodu,
    @JsonKey(name: "BELGE_TARIHI") DateTime? belgeTarihi,
    @JsonKey(name: "MIKTAR") int? miktar,
    @JsonKey(name: "TAMAMLANAN_MIKTAR") int? tamamlananMiktar,
    @JsonKey(name: "KAYITYAPANKUL") String? kayityapankul,
    @JsonKey(name: "KAYITTARIHI") DateTime? kayittarihi,
    @JsonKey(name: "CARI_ADI") String? cariAdi,
    @JsonKey(name: "KALAN_MIKTAR") int? kalanMiktar,
  }) = _BelgeKontrolModel;
  BelgeKontrolModel._();

  factory BelgeKontrolModel.fromJson(Map<String, dynamic> json) => _$BelgeKontrolModelFromJson(json);

  @override
  NetworkManagerMixin? fromJson(Map<String, dynamic> json) => BelgeKontrolModel.fromJson(json);
}
