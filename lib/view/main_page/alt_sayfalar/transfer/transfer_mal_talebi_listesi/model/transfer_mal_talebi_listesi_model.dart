import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "transfer_mal_talebi_listesi_model.freezed.dart";
part "transfer_mal_talebi_listesi_model.g.dart";

@unfreezed
class TransferMalTalebiListesiModel with _$TransferMalTalebiListesiModel, NetworkManagerMixin {
  factory TransferMalTalebiListesiModel({
    @JsonKey(name: "ID") @Default(-1) int id,
    @JsonKey(name: "TARIH") DateTime? tarih,
    @JsonKey(name: "DEPO_KODU") int? depoKodu,
    @JsonKey(name: "DURUM_ADI") String? durumAdi,
    @JsonKey(name: "KALEM_SAYISI") int? kalemSayisi,
    @JsonKey(name: "MIKTAR") double? miktar,
    @JsonKey(name: "KALAN_MIKTAR") double? kalanMiktar,
    @JsonKey(name: "KAYITTARIHI") DateTime? kayittarihi,
    @JsonKey(name: "KAYITYAPANKUL") String? kayityapankul,
    @JsonKey(name: "TAMAMLANAN_MIKTAR") double? tamamlananMiktar,
    @JsonKey(name: "ACIKLAMA") String? aciklama,
    @JsonKey(name: "BELGE_NO") String? belgeNo,
    @JsonKey(name: "KAPALI") bool? kapali,
    @JsonKey(name: "BELGE_TIPI") String? belgeTipi,
    @JsonKey(name: "HEDEF_SUBE") int? hedefSube,
    @JsonKey(name: "ISLEM_KODU") int? islemKodu,
    @JsonKey(name: "KALEM_LIST") List<KalemModel>? kalemList,
  }) = _TransferMalTalebiListesiModel;

  TransferMalTalebiListesiModel._();

  factory TransferMalTalebiListesiModel.fromJson(Map<String, dynamic> json) => _$TransferMalTalebiListesiModelFromJson(json);

  @override
  TransferMalTalebiListesiModel fromJson(Map<String, dynamic> json) => _$TransferMalTalebiListesiModelFromJson(json);

}
