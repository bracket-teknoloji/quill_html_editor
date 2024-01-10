import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "cek_senet_hareketleri_model.freezed.dart";
part "cek_senet_hareketleri_model.g.dart";

@unfreezed
class CekSenetHareketleriModel with _$CekSenetHareketleriModel, NetworkManagerMixin {
  CekSenetHareketleriModel._();
  factory CekSenetHareketleriModel({
    int? inckeyno,
    String? belgeTipi,
    String? belgeNo,
    String? yeri,
    String? durum,
    DateTime? tarih,
    String? hesapKodu,
    int? islemKodu,
    String? islemAdi,
    String? alinanBordroNo,
    String? devir,
    String? nereye,
    String? kayityapankul,
    String? kayittarihi,
  }) = _CekSenetHareketleriModel;

  factory CekSenetHareketleriModel.fromJson(Map<String, dynamic> json) => _$CekSenetHareketleriModelFromJson(json);

  @override
  CekSenetHareketleriModel fromJson(Map<String, dynamic> json) => CekSenetHareketleriModel.fromJson(json);
}

extension CekSenetHareketleriExtensions on CekSenetHareketleriModel {
  String get durumAdi {
    switch (durum) {
      case "B":
        return "Bekliyor";
      case "O":
        return "Ödendi";
      case "P":
        return "Karşılıksız";
      default:
        return "";
    }
  }

  String get yerAdi {
    switch (yeri) {
      case "P":
        return "Portföy";
      case "C":
        return "Ciro";
      case "T":
        return "Tahsilat";
      case "E":
        return "Teminat";
      case "I":
        return "İade";
      default:
        return "";
    }
  }
}
