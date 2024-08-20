import "package:json_annotation/json_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "cari_stok_satis_ozeti_model.g.dart";

@JsonSerializable(explicitToJson: true)
class CariStokSatisOzetiModel with NetworkManagerMixin {
  String? stokKodu;
  double? miktar;
  DateTime? tarih;
  String? stokAdi;
  String? olcuBirimAdi;
  double? netTutar;
  String? belgeTipi;
  int? dovizTipi;
  double? dovNetTutar;
  double? dovBrutTutar;
  double? dovizKuru;
  String? dovizAdi;
  String? dovizSimge;

  @override
  CariStokSatisOzetiModel fromJson(Map<String, dynamic> json) => _$CariStokSatisOzetiModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CariStokSatisOzetiModelToJson(this);
}
