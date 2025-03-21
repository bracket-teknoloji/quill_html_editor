import "package:freezed_annotation/freezed_annotation.dart";

import "../../../view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/model/dekont_duzenle_request_model.dart";
import "base_network_mixin.dart";

part "tahsilat_request_model.freezed.dart";
part "tahsilat_request_model.g.dart";

@unfreezed
class TahsilatRequestModel with _$TahsilatRequestModel, NetworkManagerMixin {
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
    List<DekontKalemler>? kalemler,
    String? hedefCariKodu,
    double? tahsilatBakiye,
    double? odemeBakiye,
    String? hedefHesapReferansKodu,
    String? kaynakHesapReferansKodu,
    int? taksitSayisi,
  }) = _TahsilatRequestModel;
  TahsilatRequestModel._();

  factory TahsilatRequestModel.fromJson(Map<String, dynamic> json) => _$TahsilatRequestModelFromJson(json);

  factory TahsilatRequestModel.fromCekSenetListesiModel(CekSenetListesiModel model) => TahsilatRequestModel(
    belgeNo: model.belgeNo,
    plasiyerKodu: model.plasiyerKodu,
    tarih: model.tarih,
    projeKodu: model.projeKodu,
  );

  @override
  TahsilatRequestModel fromJson(Map<String, dynamic> json) => _$TahsilatRequestModelFromJson(json);
}

@unfreezed
class DekontKalemler with _$DekontKalemler, NetworkManagerMixin {
  factory DekontKalemler({
    String? aciklama,
    String? belgeNo,
    String? ba,
    int? dovizTipi,
    double? dovizTutari,
    String? exportRefno,
    int? exportTipi,
    String? hesapKodu,
    String? hesapTipi,
    String? plasiyerKodu,
    String? projeKodu,
    DateTime? tarih,
    double? tutar,
    int? depoKodu,
    int? inckeyno,
    String? seriNo,
    int? dekontNo,
    int? siraNo,
    String? hesapTipiAciklama,
    String? hesapAdi,
    String? dovizAdi,
    String? refkey,
    String? plasiyerAciklama,
    String? muhasebeHesapTipi,
    @JsonKey(includeToJson: false, includeFromJson: false) String? kalemAdi,
    @JsonKey(includeToJson: false, includeFromJson: false) String? plasiyerAdi,
    @JsonKey(includeToJson: false, includeFromJson: false) String? projeAdi,
    @JsonKey(includeToJson: false, includeFromJson: false) String? dovizTipiAdi,
    @JsonKey(includeToJson: false, includeFromJson: false) String? exportAdi,
    @JsonKey(includeToJson: false, includeFromJson: false) String? depoAdi,
    String? cariKodu,
    String? dekontIslemTuru,
    String? dekontSeri,
    String? guid,
    String? hedefAciklama,
    String? hedefCariKodu,
    String? islemModulu,
    String? tag,
    int? vadeGunu,
    bool? yeniKayit,
  }) = _DekontKalemler;

  factory DekontKalemler.fromDekontDuzenleModel(DekontDuzenleRequestModel model) => DekontKalemler(
    aciklama: model.aciklama,
    ba: model.ba,
    dovizTipi: model.dovizTipi,
    dovizTutari: model.dovizTutari,
    exportTipi: model.exportTipi != 0 ? model.exportTipi : null,
    hesapKodu: model.hesapKodu,
    hesapTipi: model.hesapTipi,
    plasiyerKodu: model.plasiyerKodu,
    tarih: model.tarih,
    kalemAdi: model.hesapAdi,
    tutar: model.tutar,
    depoKodu: model.depoKodu,
    inckeyno: model.inckeyno,
    seriNo: model.seriNo,
    dekontNo: model.dekontNo,
    siraNo: model.siraNo,
    hesapTipiAciklama: model.hesapTipiAciklama,
    hesapAdi: model.hesapAdi,
    dovizAdi: model.dovizAdi,
    plasiyerAciklama: model.plasiyerAciklama,
    muhasebeHesapTipi: model.muhasebeHesapTipi,
    belgeNo: model.belgeNo,
    plasiyerAdi: model.plasiyerAciklama,
    dovizTipiAdi: model.dovizAdi,
  );
  DekontKalemler._();

  factory DekontKalemler.fromJson(Map<String, dynamic> json) => _$DekontKalemlerFromJson(json);

  @override
  DekontKalemler fromJson(Map<String, dynamic> json) => _$DekontKalemlerFromJson(json);
}

extension TahsilatRequestExtensions on TahsilatRequestModel {
  bool get dovizliMi => dovizTipi != null && dovizTipi != 0;
}

extension DekontKalemlerExtensions on DekontKalemler {
  bool get cariMi => hesapTipi == "C";

  bool get muhasebeMi => hesapTipi == "M";

  bool get bankaMi => hesapTipi == "B";

  bool get stokMu => hesapTipi == "S";

  String get hesapAdi => switch (hesapTipi) {
    "C" => "Cari",
    "M" => "Muhasebe",
    "B" => "Banka",
    "S" => "Stok",
    _ => "",
  };

  double get dovizKuru => (dovizTutari ?? 0) / (tutar ?? 1);

  bool get dovizliMi => dovizTipi != null && dovizTipi != 0;
}
