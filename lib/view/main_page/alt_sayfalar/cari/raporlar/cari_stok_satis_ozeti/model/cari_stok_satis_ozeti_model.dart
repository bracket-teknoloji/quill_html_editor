import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../core/base/model/base_network_mixin.dart';

part 'cari_stok_satis_ozeti_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: true, includeIfNull: false, fieldRename: FieldRename.screamingSnake)
class CariStokSatisOzetiModel with NetworkManagerMixin {
  String? stokKodu;
  double? miktar;
  DateTime? tarih;
  String? stokAdi;
  String? olcuBirimAdi;
  double? netTutar;

  @override
  fromJson(Map<String, dynamic> json) => _$CariStokSatisOzetiModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CariStokSatisOzetiModelToJson(this);
}
