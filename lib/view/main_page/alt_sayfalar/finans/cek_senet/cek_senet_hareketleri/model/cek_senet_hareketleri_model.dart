import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "cek_senet_hareketleri_model.freezed.dart";
part "cek_senet_hareketleri_model.g.dart";

@unfreezed
class CekSenetHareketleriModel with _$CekSenetHareketleriModel, NetworkManagerMixin {
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
  CekSenetHareketleriModel._();

  factory CekSenetHareketleriModel.fromJson(Map<String, dynamic> json) => _$CekSenetHareketleriModelFromJson(json);

  @override
  CekSenetHareketleriModel fromJson(Map<String, dynamic> json) => CekSenetHareketleriModel.fromJson(json);
}

extension CekSenetHareketleriExtensions on CekSenetHareketleriModel {
  String get durumAdi => switch (durum) {
        "B" => "Bekliyor",
        "O" => "Ödendi",
        "P" => "Karşılıksız",
        _ => "",
      };

  String get yerAdi => switch (yeri) {
        "P" => "Portföy",
        "C" => "Ciro",
        "T" => "Tahsilat",
        "E" => "Teminat",
        "I" => "İade",
        _ => "",
      };
}
