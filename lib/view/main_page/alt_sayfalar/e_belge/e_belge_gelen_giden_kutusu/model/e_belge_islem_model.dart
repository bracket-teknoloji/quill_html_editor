import "package:freezed_annotation/freezed_annotation.dart";

import "e_belge_listesi_model.dart";

part "e_belge_islem_model.freezed.dart";
part "e_belge_islem_model.g.dart";

@unfreezed
class EBelgeIslemModel with _$EBelgeIslemModel {
  factory EBelgeIslemModel({
    String? aciklama,
    String? belgeTuru,
    String? ebelgeTuru,
    String? kutuTuru,
    int? inckeyno,
    int? islemKodu,
    String? resmiBelgeNo,
    String? senaryoTipi,
    String? zarfid,
    String? belgeNo,
    String? cariKodu,
    DateTime? iptalTarihi,
    int? kopyaSayisi,
    String? yaziciAdi,
    int? dizaynNo,
    bool? dovizliOlustur,
    bool? gonderimSekliEposta,
    bool? internetFaturasi,
    String? kabul,
  }) = _EBelgeIslemModel;
  EBelgeIslemModel._();

  factory EBelgeIslemModel.fromJson(Map<String, dynamic> json) => _$EBelgeIslemModelFromJson(json);

  factory EBelgeIslemModel.fromEBelgeListesiModel(EBelgeListesiModel model) => EBelgeIslemModel(
    aciklama: model.kontrolAciklama,
    belgeTuru: model.belgeTuru,
    ebelgeTuru: model.ebelgeTuru,
    inckeyno: model.inckeyno,
    islemKodu: model.cevapKodu,
    resmiBelgeNo: model.resmiBelgeNo,
    senaryoTipi: model.senaryo,
    zarfid: model.zarfid,
    belgeNo: model.belgeNo,
    cariKodu: model.cariKodu,
    iptalTarihi: model.iptalTarihi,
  );
}
