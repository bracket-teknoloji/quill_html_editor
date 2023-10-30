import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "e_belge_listesi_model.freezed.dart";
part "e_belge_listesi_model.g.dart";

@unfreezed
class EBelgeListesiModel with _$EBelgeListesiModel, NetworkManagerMixin {
  EBelgeListesiModel._();
  factory EBelgeListesiModel({
    String? ebelgeTuru,
    int? inckeyno,
    int? efatmasInckeyno,
    String? gelen,
    String? taslak,
    String? gonderildi,
    String? faturaIslendi,
    String? dekontIslendi,
    String? iptalEdildi,
    int? cevapKodu,
    String? cevapAciklama,
    String? basariylaGonderildi,
    String? onayDurumKodu,
    String? onayAciklama,
    String? resmiBelgeNo,
    DateTime? tarih,
    DateTime? kayittarihi,
    String? belgeTuru,
    String? cariAdi,
    String? vergiNo,
    String? cariIlce,
    String? cariIl,
    double? dovizKuru,
    String? basimYapildi,
    double? genelToplam,
    double? kdvTutari,
    String? senaryo,
    String? zarfid,
    String? uuid,
    String? faturaTipi,
    String? kayityapankul,
    String? kontrolEdildi,
    String? kayitliCariKodu,
    String? belgeNo,
    String? islenenBelgeNo,
    String? cariKodu,
    int? dovizTipi,
    String? dovizAdi,
    double? dovizTutari,
    double? iskontoTutari,
    String? dekontJson,
    String? kontrolAciklama,
    String? dizaynYolu,
    String? gondermeDurumu,
    String? zarfSilinebilir,
        DateTime? iptalTarihi,
  }) = _EBelgeListesiModel;

  factory EBelgeListesiModel.fromJson(Map<String, dynamic> json) => _$EBelgeListesiModelFromJson(json);

  @override
  EBelgeListesiModel fromJson(Map<String, dynamic> json) => _$EBelgeListesiModelFromJson(json);
}

extension EBelgeListesiModelExtensions on EBelgeListesiModel {
  bool get showBadge => gelen != "E" || taslak != "E";

  bool get uyariMi => showBadge && gondermeDurumu == "BEK";
}
