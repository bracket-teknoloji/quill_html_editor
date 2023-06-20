import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'cari_hareketleri_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.screamingSnake, createToJson: true)
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
  bool get borcHareketiMi {
    return (borc! > 0);
  }

  bool get devirMi => hareketKodu == "A";

  bool get kasaMi => hareketKodu == "D";

  bool get musteriCekMi => hareketKodu == "G";

  bool get musteriSenediMi => hareketKodu == "E";

  bool get borcCekMi => hareketKodu == "";

  bool get borcSenediMi => hareketKodu == "";

  String getBorcAlacakHarf() => borcHareketiMi ? "B" : "A";

  @override
  fromJson(Map<String, dynamic> json) => _$CariHareketleriModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CariHareketleriModelToJson(this);

  @override
  toString() => toJson().toString();

  @override
  operator ==(o) => o is CariHareketleriModel && o.inckeyno == inckeyno;
}
