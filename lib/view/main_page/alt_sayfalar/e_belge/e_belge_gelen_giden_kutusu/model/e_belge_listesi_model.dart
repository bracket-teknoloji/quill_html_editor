import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/view/e_irsaliye_ek_bilgiler/model/e_irsaliye_bilgi_model.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/constants/enum/e_belge_turu_enum.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "e_belge_request_model.dart";

part "e_belge_listesi_model.freezed.dart";
part "e_belge_listesi_model.g.dart";

@unfreezed
class EBelgeListesiModel with _$EBelgeListesiModel, NetworkManagerMixin {
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
    bool? gonderimSekliEPosta,
    String? ePosta,
    int? islemKodu,
    String? kutuTuru,
    String? aciklama,
    String? senaryoTipi,
    int? kopyaSayisi,
    String? yaziciAdi,
    int? dizaynNo,
    bool? dovizliOlustur,
    bool? internetFaturasi,
    EIrsaliyeBilgiModel? eirsBilgi,
    @JsonKey(includeFromJson: false, includeToJson: false) String? dizaynAdi,
  }) = _EBelgeListesiModel;

  factory EBelgeListesiModel.fromBaseSiparisEditModel(BaseSiparisEditModel model) => EBelgeListesiModel(
        belgeTuru: model.belgeTuru,
        ebelgeTuru: model.getEBelgeTuruEnum?.value,
        resmiBelgeNo: model.resmiBelgeNo,
        islemKodu: 1,
        tarih: model.tarih,
      );

  factory EBelgeListesiModel.sil(BaseSiparisEditModel model) => EBelgeListesiModel(
        belgeTuru: model.belgeTuru,
        ebelgeTuru: model.getEBelgeTuruEnum?.value,
        belgeNo: model.belgeNo,
        resmiBelgeNo: model.resmiBelgeNo,
        cariKodu: model.cariKodu,
        kutuTuru: "GIK",
        islemKodu: 8,
      );

  factory EBelgeListesiModel.taslakKaydet(BaseSiparisEditModel model) => EBelgeListesiModel(
        belgeTuru: model.belgeTuru,
        ebelgeTuru: model.getEBelgeTuruEnum?.value,
        belgeNo: model.belgeNo,
        resmiBelgeNo: model.resmiBelgeNo,
        cariKodu: model.cariKodu,
        senaryoTipi: model.efaturaTipi,
        kutuTuru: "GIK",
        islemKodu: 2,
      );
  factory EBelgeListesiModel.faturaGonder(BaseSiparisEditModel model) => EBelgeListesiModel(
        belgeTuru: model.belgeTuru,
        ebelgeTuru: model.getEBelgeTuruEnum?.value,
        belgeNo: model.belgeNo,
        resmiBelgeNo: model.resmiBelgeNo,
        cariKodu: model.cariKodu,
        senaryoTipi: model.efaturaTipi,
        kutuTuru: "GIK",
        eirsBilgi: model.eirsBilgiModel,
        islemKodu: 3,
      );

  factory EBelgeListesiModel.eBelgeEslestir(BaseSiparisEditModel model) => EBelgeListesiModel(
        belgeTuru: model.belgeTuru,
        ebelgeTuru: model.eArsivSerisindenMi ? "AFT" : "EFT",
        belgeNo: model.belgeNo,
        resmiBelgeNo: model.resmiBelgeNo,
        cariKodu: model.cariKodu,
        kutuTuru: "GET",
        islemKodu: 20,
      );

  factory EBelgeListesiModel.eBelgeEslestirmeKaldir(BaseSiparisEditModel model) => EBelgeListesiModel(
        belgeTuru: model.belgeTuru,
        ebelgeTuru: model.eArsivSerisindenMi ? "AFT" : "EFT",
        belgeNo: model.belgeNo,
        resmiBelgeNo: model.resmiBelgeNo,
        cariKodu: model.cariKodu,
        kutuTuru: "GET",
        islemKodu: 11,
      );
  factory EBelgeListesiModel.senaryoDegistir(BaseSiparisEditModel model) => EBelgeListesiModel(
        belgeTuru: model.belgeTuru,
        ebelgeTuru: model.eArsivSerisindenMi ? "AFT" : "EFT",
        belgeNo: model.belgeNo,
        resmiBelgeNo: model.resmiBelgeNo,
        cariKodu: model.cariKodu,
        senaryoTipi: model.efaturaSenaryo,
        kutuTuru: "GIK",
        islemKodu: 10,
      );
  EBelgeListesiModel._();

  factory EBelgeListesiModel.fromJson(Map<String, dynamic> json) => _$EBelgeListesiModelFromJson(json);

  @override
  EBelgeListesiModel fromJson(Map<String, dynamic> json) => _$EBelgeListesiModelFromJson(json);
}

extension EBelgeListesiModelExtensions on EBelgeListesiModel {
  EBelgeListesiModel get printEBelge => copyWith(islemKodu: 22);

  EBelgeListesiModel get taslakGonder => copyWith(islemKodu: eFaturaMi ? 2 : 16);

  EBelgeListesiModel get faturaGonder => copyWith(islemKodu: 3);

  EBelgeListesiModel get eBelgeGonder {
    if (eIrsaliyeMi) {
      return eIrsaliyeGonder;
    } else {
      return faturaGonder;
    }
  }

  EBelgeListesiModel get eIrsaliyeGonder => copyWith(islemKodu: 17);

  EBelgeListesiModel get eArsivTaslakSil => copyWith(islemKodu: 8);

  EBelgeListesiModel get eIrsaliyeTaslakSil => copyWith(islemKodu: 15);

  EBelgeListesiModel get eFaturaTaslakSil => copyWith(islemKodu: 9);

  EBelgeListesiModel get eBelgeEslestir => copyWith(islemKodu: 20);

  bool get yanitBekliyorMu => onayAciklama == "Yanıt Bekliyor";
  EBelgeListesiModel get taslakSil {
    if (eIrsaliyeMi) {
      return eIrsaliyeTaslakSil;
    } else if (eArsivMi) {
      return eArsivTaslakSil;
    } else {
      return eFaturaTaslakSil;
    }
    //   return
    // return eArsivMi ? eArsivTaslakSil : eFaturaTaslakSil;
  }

  EBelgeRequestModel get durumSorgula => EBelgeRequestModel(
        baslamaTarihi: tarih?.toDateString,
        bitisTarihi: DateTime.now().toDateString,
        eBelgeTuru: ebelgeTuru,
        faturaYonu: "GIK",
        resmiBelgeNo: resmiBelgeNo,
      );

  bool get showBadge => gelen != "E" || taslak != "E";

  String get faturaAciklama => "$islenenBelgeNo belge Netsis'e aktarıldı.";

  String? get seciliCariKodu => gelenMi ? kayitliCariKodu : cariKodu;

  bool get cariKayitliMi => gelenMi ? kayitliCariKodu != null : cariKodu != null;

  bool get uyariMi => showBadge && gondermeDurumu == "BEK";

  bool get gelenMi => gelen == "E";

  bool get dovizliMi => (dovizTipi ?? 0) > 0;

  bool get taslakMi => taslak == "E";

  bool get reddedildiMi => onayDurumKodu == "1";

  bool get eFaturaMi => ebelgeTuru == "EFT";

  bool get eArsivMi => ebelgeTuru == "AFT";

  bool get eIrsaliyeMi => ebelgeTuru == "EIR";

  bool get belgeIslendiMi => faturaIslendiMi || dekontIslendiMi;

  bool get faturaIslendiMi => faturaIslendi == "E";

  bool get dekontIslendiMi => dekontIslendi == "E";

  bool get iptalEdildiMi => iptalEdildi == "E";

  bool get basimYapildiMi => basimYapildi == "E";

  bool get basariylaGonderildiMi => basariylaGonderildi == "E";

  bool get zarfSilinebilirMi => zarfSilinebilir == "E";

  bool get kabulEdildiMi => true;

  String get onayDurumuString => "${cevapKodu ?? "0"} - ${cevapAciklama ?? "0"}";

  String get getDizaynAdi => "${dizaynNo ?? ""} - ${dizaynAdi ?? ""}";

  String get getTitle {
    if (eArsivMi) {
      return "E-Arşiv";
    } else if (eFaturaMi) {
      return "E-Fatura";
    } else if (eIrsaliyeMi) {
      return "E-İrsaliye";
    } else {
      return "E-Belge";
    }
  }
}
