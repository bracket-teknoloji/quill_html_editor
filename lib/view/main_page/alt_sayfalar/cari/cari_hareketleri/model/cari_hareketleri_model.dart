import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_hareketleri_model.g.dart";

@JsonSerializable()
class CariHareketleriModel with NetworkManagerMixin {
  int? inckeyno;
  String? cariKodu;
  String? cariAdi;
  DateTime? tarih;
  String? aciklama;
  double? borc;
  String? hareketAciklama;
  String? hareketKodu;
  String? belgeNo;
  String? plasiyerKodu;
  String? plasiyerAciklama;
  double? yuruyenBakiye;
  double? dovYuruyenBakiye;
  String? projeKodu;
  String? projeAciklama;
  double? dovizBorc;
  int? dovizTuru;
  String? dovizAdi;
  String? refkey;
  DateTime? vadeTarihi;
  String? belgeTipi;
  double? alacak;
  bool? bordroMu;
  double? dovizAlacak;
  int? subeKodu;
  bool get borcHareketiMi => borc! > 0;

  bool get devirMi => hareketKodu == "A";

  bool get kasaMi => hareketKodu == "D";

  bool get musteriCekMi => hareketKodu == "G";

  bool get musteriSenediMi => hareketKodu == "E";

  bool get borcCekMi => hareketKodu == "";

  bool get borcSenediMi => hareketKodu == "";

  String getBorcAlacakHarf() => borcHareketiMi ? "B" : "A";

  bool get dovizliMi => (dovizTuru ?? 0) > 1;

  double get dovizBakiye => ((dovizAlacak ?? 0) - (dovizBorc ?? 0)).abs();

  @override
  fromJson(Map<String, dynamic> json) => _$CariHareketleriModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CariHareketleriModelToJson(this);

  @override
  toString() => toJson().toString();

  @override
  // ignore: hash_and_equals
  operator ==(other) => other is CariHareketleriModel && other.inckeyno == inckeyno;
}
