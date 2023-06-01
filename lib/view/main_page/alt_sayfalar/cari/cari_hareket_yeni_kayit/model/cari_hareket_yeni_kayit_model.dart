import 'package:json_annotation/json_annotation.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'cari_hareket_yeni_kayit_model.g.dart';

@JsonSerializable(createToJson: true, includeIfNull: false, fieldRename: FieldRename.screamingSnake, explicitToJson: true)
class CariHareketYeniKayitModel with NetworkManagerMixin {
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
  fromJson(Map<String, dynamic> json) {
    return _$CariHareketYeniKayitModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$CariHareketYeniKayitModelToJson(this);
  }
}
