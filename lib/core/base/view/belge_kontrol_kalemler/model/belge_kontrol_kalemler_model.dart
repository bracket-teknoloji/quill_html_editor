import "package:collection/collection.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

part "belge_kontrol_kalemler_model.freezed.dart";
part "belge_kontrol_kalemler_model.g.dart";

@freezed
sealed class BelgeKontrolKalemlerModel with _$BelgeKontrolKalemlerModel, NetworkManagerMixin {
  factory BelgeKontrolKalemlerModel({
    @JsonKey(name: "KONTROL_ID") int? kontrolId,
    @JsonKey(name: "BELGE_TIPI") String? belgeTipi,
    @JsonKey(name: "BELGE_NO") String? belgeNo,
    @JsonKey(name: "CARI_KODU") String? cariKodu,
    @JsonKey(name: "SIRA") int? sira,
    @JsonKey(name: "STOK_KODU") String? stokKodu,
    @JsonKey(name: "STOK_ADI") String? stokAdi,
    @JsonKey(name: "MIKTAR") double? miktar,
    @JsonKey(name: "TAMAMLANAN_MIKTAR") double? tamamlananMiktar,
    @JsonKey(name: "KALEM_BIRIM_SIRA") int? kalemBirimSira,
    @JsonKey(name: "STOK_OLCU_BIRIMI") String? stokOlcuBirimi,
    @JsonKey(name: "KALEM_BIRIM_ADI") String? kalemBirimAdi,
    @JsonKey(name: "KALAN_MIKTAR") double? kalanMiktar,
  }) = _BelgeKontrolKalemlerModel;

  BelgeKontrolKalemlerModel._();

  factory BelgeKontrolKalemlerModel.fromJson(Map<String, dynamic> json) => _$BelgeKontrolKalemlerModelFromJson(json);

  @override
  BelgeKontrolKalemlerModel? fromJson(Map<String, dynamic> json) => BelgeKontrolKalemlerModel.fromJson(json);

  String? get belgeTipiAciklama =>
      EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == belgeTipi)?.getName;

  bool get isTamamlandi => (tamamlananMiktar == miktar) && (miktar ?? 0) > 0;

  bool get isDevamEdiyor =>
      (tamamlananMiktar ?? 0) < (miktar ?? 0) && tamamlananMiktar != 0 && tamamlananMiktar != null;
}
