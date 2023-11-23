import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "dekont_duzenle_request_model.freezed.dart";
part "dekont_duzenle_request_model.g.dart";

@unfreezed
class DekontDuzenleRequestModel with _$DekontDuzenleRequestModel, NetworkManagerMixin {
  DekontDuzenleRequestModel._();
  factory DekontDuzenleRequestModel({
    int? inckeyno,
    DateTime? tarih,
    String? seriNo,
    int? dekontNo,
    int? siraNo,
    String? ba,
    String? hesapTipi,
    String? hesapTipiAciklama,
    String? hesapKodu,
    String? hesapAdi,
    double? tutar,
    int? dovizTipi,
    String? dovizAdi,
    double? dovizTutari,
    String? aciklama,
    String? plasiyerKodu,
    String? refkey,
    String? plasiyerAciklama,
    int? depoKodu,
    int? exportTipi,
    String? muhasebeHesapTipi,
    String? belgeNo,
    String? exportRefno,
    String? cariAdi,
  }) = _DekontDuzenleRequestModel;

  factory DekontDuzenleRequestModel.fromJson(Map<String, dynamic> json) => _$DekontDuzenleRequestModelFromJson(json);

  @override
  DekontDuzenleRequestModel fromJson(Map<String, dynamic> json) => _$DekontDuzenleRequestModelFromJson(json);
}

extension DekontDuzenleRequestModelExtensions on DekontDuzenleRequestModel {
  bool get dovizliMi => dovizTipi != 0 && dovizTipi != null;

  double get dovizKuru => (dovizTutari ?? 0) / (tutar ?? 1);

// String? get shortPlasiyerAciklama => plasiyerAciklama?.split(" ").
// create a shortPlasiyerAciklama string from plasiyerAciklama, first letter of each word without last word and last name

  // String? get shortPlasiyerAciklama => "${plasiyerAciklama?.split(" ").map((e) => e[0]).toList().join("")} ${plasiyerAciklama?.split(" ").last}";
}
