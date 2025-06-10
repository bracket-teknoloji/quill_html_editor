import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/base/model/base_stok_mixin.dart";

part "hucredeki_stoklar_model.freezed.dart";
part "hucredeki_stoklar_model.g.dart";

@freezed
sealed class HucredekiStoklarModel with _$HucredekiStoklarModel, NetworkManagerMixin, BaseStokMixin {
  factory HucredekiStoklarModel({
    String? hucreKodu,
    int? depoKodu,
    String? stokKodu,
    String? stokAdi,
    double? netMiktar,
    String? yapkod,
    String? yapacik,
    double? bakiye,
    double? miktar,
    String? olcuBirimi,
  }) = _HucredekiStoklarModel;
  HucredekiStoklarModel._();

  factory HucredekiStoklarModel.fromJson(Map<String, dynamic> json) => _$HucredekiStoklarModelFromJson(json);

  @override
  HucredekiStoklarModel fromJson(Map<String, dynamic> json) => _$HucredekiStoklarModelFromJson(json);
}
