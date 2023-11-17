import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "cek_senet_listesi_model.freezed.dart";
part "cek_senet_listesi_model.g.dart";

@unfreezed
class CekSenetListesiModel with _$CekSenetListesiModel, NetworkManagerMixin {
  factory CekSenetListesiModel({
    bool? isCiroTipli,
    DateTime? cikisTarihi,
    DateTime? odemeTarihi,
    DateTime? tarih,
    DateTime? vadeTarihi,
    double? dovizTutari,
    @JsonKey(name: "GetDovizTutari") double? getDovizTutari,
    double? tutar,
    int? dovizTipi,
    int? evrakSayisi,
    @JsonKey(name: "GetDovizTipi") int? getDovizTipi,
    String? aciklama1,
    String? aciklama2,
    String? aciklama3,
    String? alinanBordroNo,
    String? asilCari,
    String? belgeNo,
    String? belgeTipi,
    String? cariAdi,
    String? cariKodu,
    String? cariRaporKodu,
    String? cekBanka,
    String? cekSube,
    String? ciroTipi,
    String? dovizKodu,
    String? durum,
    String? durumAciklama,
    @JsonKey(name: "GetAsilCariAdi") String? getAsilCariAdi,
    @JsonKey(name: "GetCekBankaAdi") String? getCekBankaAdi,
    @JsonKey(name: "GetCekSubeAdi") String? getCekSubeAdi,
    String? plasiyerKodu,
    String? projeKodu,
    String? raporKodu,
    String? seriNo,
    String? verenKodu,
    String? verilenAdi,
    String? verilenBankaKodu,
    String? verilenBordroNo,
    String? verilenKodu,
    String? yerAciklama,
    String? yeri,
  }) = _CekSenetListesiModel;
  factory CekSenetListesiModel.fromJson(Map<String, dynamic> json) => _$CekSenetListesiModelFromJson(json);

  CekSenetListesiModel._();

  @override
  CekSenetListesiModel fromJson(Map<String, dynamic> json) => CekSenetListesiModel.fromJson(json);
}

extension CekSenetExtensions on CekSenetListesiModel {
  String get ciroTipiString => ciroTipi == "A" ? "Asıl" : "Ciro";

  String get yerAciklamaDurum => "${yerAciklama ?? ""} - $durumString";

  String get durumString {
    switch (durum) {
      case "B":
        return "Bekliyor";
      case "O":
        return "Ödendi";
      case "K":
        return "Karşılıksız";
      default:
        return "Onaylandı";
    }
  }

  String get aciklamalar {
    String aciklama = "";
    if (aciklama1 != null) aciklama += aciklama1 ?? "";
    if (aciklama2 != null) aciklama += ",\n${aciklama2!}";
    if (aciklama3 != null) aciklama += ",\n${aciklama3!}";
    return aciklama;
  }
}
