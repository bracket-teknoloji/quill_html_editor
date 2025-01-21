import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "transfer_mal_talebi_listesi_model.freezed.dart";
part "transfer_mal_talebi_listesi_model.g.dart";

@unfreezed
class TransferMalTalebiListesiModel with _$TransferMalTalebiListesiModel, NetworkManagerMixin {
  factory TransferMalTalebiListesiModel({
    @JsonKey(name: "ID") int? id,
    @JsonKey(name: "TARIH") DateTime? tarih,
    @JsonKey(name: "DEPO_KODU") int? depoKodu,
    @JsonKey(name: "DURUM_ADI") String? durumAdi,
    @JsonKey(name: "KALEM_SAYISI") int? kalemSayisi,
    @JsonKey(name: "MIKTAR") int? miktar,
    @JsonKey(name: "KALAN_MIKTAR") int? kalanMiktar,
    @JsonKey(name: "KAYITTARIHI") DateTime? kayittarihi,
    @JsonKey(name: "KAYITYAPANKUL") String? kayityapankul,
    @JsonKey(name: "TAMAMLANAN_MIKTAR") int? tamamlananMiktar,
  }) = _TransferMalTalebiListesiModel;

  TransferMalTalebiListesiModel._();

  factory TransferMalTalebiListesiModel.fromJson(Map<String, dynamic> json) => _$TransferMalTalebiListesiModelFromJson(json);

  @override
  TransferMalTalebiListesiModel fromJson(Map<String, dynamic> json) => _$TransferMalTalebiListesiModelFromJson(json);

  bool get isTamamlandi => (tamamlananMiktar ?? 0) == (miktar ?? 0);
}
