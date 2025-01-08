import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_hareket_yeni_kayit_model.g.dart";

@JsonSerializable(explicitToJson: true)
final class CariHareketYeniKayitModel with NetworkManagerMixin {
  String? aciklama;
  double? alacak;
  double? borc;
  String? belgeNo;
  String? cariKodu;
  String? hareketKodu;
  String? plasiyerKodu;
  String? projeKodu;
  int? inckeyno;
  DateTime? tarih;
  DateTime? vadeTarihi;
  @JsonKey(name: "_YeniKayit")
  bool? yeniKayit;

  @override
  CariHareketYeniKayitModel fromJson(Map<String, dynamic> json) => _$CariHareketYeniKayitModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CariHareketYeniKayitModelToJson(this);
}
