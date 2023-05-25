

import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';

part 'stok_yeni_kayit_model.g.dart';


@JsonSerializable(createToJson: true,fieldRename: FieldRename.screamingSnake, includeIfNull: false)
class StokYeniKayitModel with NetworkManagerMixin{
    String? aciklama;
    String? belgeNo;
    int? depoKodu;
    int? fiyat;
    String? gc;
    String? hareketTuru;
    int? miktar;
    String? plasiyerKodu;
    String? projeKodu;
    String? stokKodu;
    DateTime? tarih;
    @JsonKey(name: "_YeniKayit")
    bool? yeniKayit;
  @override
  fromJson(Map<String, dynamic> json) {
    return _$StokYeniKayitModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StokYeniKayitModelToJson(this);
  }
}