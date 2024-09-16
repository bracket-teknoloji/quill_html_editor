import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "hucre_hareketleri_model.freezed.dart";
part "hucre_hareketleri_model.g.dart";

@freezed
class HucreHareketleriModel with _$HucreHareketleriModel, NetworkManagerMixin {
  HucreHareketleriModel._();
  factory HucreHareketleriModel({
    int? inckeyno,
    String? stokKodu,
    String? stokAdi,
    String? gc,
    String? hucreKodu,
    DateTime? tarih,
    //TODO Double olacak
    int? netMiktar,
    String? belgeTipi,
    String? hareketTuru,
    String? hareketAdi,
    String? kayityapankul,
    DateTime? kayittarihi,
    int? depoKodu,
    String? depoTanimi,
    String? eksiBakiye,
    String? stokOlcuBirimi,
    String? stharFisno,
    int? stharInc,
    String? yapkod,
  }) = _HucreHareketleriModel;

  factory HucreHareketleriModel.fromJson(Map<String, dynamic> json) => _$HucreHareketleriModelFromJson(json);

  @override
  HucreHareketleriModel fromJson(Map<String, dynamic> json) => _$HucreHareketleriModelFromJson(json);
}
