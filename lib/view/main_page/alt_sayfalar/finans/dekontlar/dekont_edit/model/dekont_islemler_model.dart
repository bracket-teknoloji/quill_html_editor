import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "dekont_islemler_model.freezed.dart";
part "dekont_islemler_model.g.dart";

@unfreezed
class DekontIslemlerModel with _$DekontIslemlerModel, NetworkManagerMixin {
  DekontIslemlerModel._();
  factory DekontIslemlerModel({
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
    int? dovizTutari,
    String? aciklama,
    String? plasiyerKodu,
    String? refkey,
    String? cariAdi,
    String? plasiyerAciklama,
    int? depoKodu,
    int? exportTipi,
    String? muhasebeHesapTipi,
  }) = _DekontIslemlerModel;

  factory DekontIslemlerModel.fromJson(Map<String, dynamic> json) => _$DekontIslemlerModelFromJson(json);

  @override
  DekontIslemlerModel fromJson(Map<String, dynamic> json) => _$DekontIslemlerModelFromJson(json);
}
