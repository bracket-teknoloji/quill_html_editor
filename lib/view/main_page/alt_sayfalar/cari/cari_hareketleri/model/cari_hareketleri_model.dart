import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

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

  @override
  fromJson(Map<String, dynamic> json) {
    return _$CariHareketleriModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CariHareketleriModelToJson(this);
  }

  @override
  toString() => toJson().toString();
}
