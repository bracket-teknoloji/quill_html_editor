import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";

part "hucredeki_stoklar_model.freezed.dart";
part "hucredeki_stoklar_model.g.dart";

@freezed
class HucredekiStoklarModel with _$HucredekiStoklarModel, NetworkManagerMixin, BaseStokMixin {
  HucredekiStoklarModel._();
  factory HucredekiStoklarModel({
    String? hucreKodu,
    int? depoKodu,
    String? stokKodu,
    String? stokAdi,
    double? netMiktar,
    String? yapkod,
    String? yapacik,
    double? bakiye,
  }) = _HucredekiStoklarModel;

  factory HucredekiStoklarModel.fromJson(Map<String, dynamic> json) => _$HucredekiStoklarModelFromJson(json);

  @override
  HucredekiStoklarModel fromJson(Map<String, dynamic> json) => _$HucredekiStoklarModelFromJson(json);
}
