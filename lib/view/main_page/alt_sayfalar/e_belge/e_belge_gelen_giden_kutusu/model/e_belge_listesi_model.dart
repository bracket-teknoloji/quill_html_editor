import "package:freezed_annotation/freezed_annotation.dart";
import "../../../../../../core/base/model/base_network_mixin.dart";

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
    String? gonderimSekliEposta,
    String? eposta,
    String? eBelgeTuru,
    int? id,
    int? eFatMasId,
    int? eIrsMasId,
    DateTime? kayitTarihi,
    DateTime? eFaturaIptalTarihi,
    String? ilce,
    String? sehir,
    String? kayitYapanKul,
    String? gelenEFatKontrolEdildi,
    String? gelenEFatKontrolAciklama,
    String? gonderimSekliEPosta,
    String? ePosta,
  }) = _EBelgeListesiModel;

  factory EBelgeListesiModel.fromJson(Map<String, dynamic> json) => _$EBelgeListesiModelFromJson(json);

  @override
  EBelgeListesiModel fromJson(Map<String, dynamic> json) => _$EBelgeListesiModelFromJson(json);
}

extension EBelgeListesiModelExtensions on EBelgeListesiModel {
  bool get showBadge => gelen != "E" || taslak != "E";

  bool get uyariMi => showBadge && gondermeDurumu == "BEK";

  bool get gelenMi => gelen == "E";

  bool get dovizliMi => (dovizTipi ?? 0) > 0;

  bool get taslakMi => taslak == "E";

  bool get reddedildiMi => onayDurumKodu == "1";

  bool get eFaturaMi => ebelgeTuru == "EFT";

  bool get eArsivMi => ebelgeTuru == "AFT";

  bool get eIrsaliyeMi => ebelgeTuru == "EIR";

  bool get faturaIslendiMi => faturaIslendi == "E";

  bool get iptalEdildiMi => iptalEdildi == "E";

  bool get basimYapildiMi => basimYapildi == "E";

  bool get basariylaGonderildiMi => basariylaGonderildi == "E";

  bool get zarfSilinebilirMi => zarfSilinebilir == "E";

  bool get kabulEdildiMi => true;
}
