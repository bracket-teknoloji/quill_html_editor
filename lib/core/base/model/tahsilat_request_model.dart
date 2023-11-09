import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "tahsilat_request_model.freezed.dart";
part "tahsilat_request_model.g.dart";

@unfreezed
class TahsilatRequestModel with _$TahsilatRequestModel, NetworkManagerMixin {
  TahsilatRequestModel._();
  factory TahsilatRequestModel({
    String? aciklama,
    String? belgeNo,
    String? gc,
    String? guid,
    String? hesapKodu,
    String? hesapTipi,
    String? kasaKodu,
    String? plasiyerKodu,
    String? projeKodu,
    String? tag,
    bool? tahsilatmi,
    DateTime? tarih,
    double? tutar,
    double? dovizTutari,
    int? dovizTipi,
    String? kktYontemi,
    String? refKod,
    @JsonKey(name: "PickerBelgeTuru") String? pickerBelgeTuru,
    String? stokKodu,
    int? depoKodu,
    String? hareketTuru,
    int? miktar,
    double? fiyat,
    String? dekontSeri,
    @JsonKey(name: "_YeniKayit") bool? yeniKayit,
    String? cariKodu,
    String? sozlesmeKodu,
    String? krediKartNo,
    String? hedefAciklama,
    int? vadeGunu,
    double? bsmvTutari,
    String? dekontIslemTuru,
    String? dekontBelgeNo,
    String? hedefHesapKodu,
    String? islemModulu,
    String? masrafMuhKodu,
    double? masrafTutari,
    bool? cariyiBorclandir,
    String? hesapNo,
    String? iban,
    String? tcmbBankaKodu,
    String? tcmbSubeKodu,
  }) = _TahsilatRequestModel;

  factory TahsilatRequestModel.fromJson(Map<String, dynamic> json) => _$TahsilatRequestModelFromJson(json);

  @override
  TahsilatRequestModel fromJson(Map<String, dynamic> json) => _$TahsilatRequestModelFromJson(json);
}

extension TahsilatRequestExtensions on TahsilatRequestModel {
  bool get dovizliMi => dovizTipi != null && dovizTipi != 0;
}
