import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../../core/base/model/base_stok_mixin.dart";
import "../../../../../stok/base_stok_edit/model/stok_detay_model.dart";

part "hucre_takibi_stoklar_model.freezed.dart";
part "hucre_takibi_stoklar_model.g.dart";

@freezed
class HucreTakibiStoklarModel with _$HucreTakibiStoklarModel, NetworkManagerMixin, BaseStokMixin {
  factory HucreTakibiStoklarModel({
    String? stokKodu,
    String? stokAdi,
    double? miktar,
    double? netMiktar,
    double? bakiye,
    int? belgeOlcuBirimKodu,
    String? belgeOlcuBirimAdi,
    String? stokOlcuBirimi1,
    int? kalemSayisi,
    String? hucreKodu,
    int? depoKodu,
    String? yapkod,
    String? yapacik,
    String? olcuBirimi,
    String? depoTanimi,
    List<SeriList>? seriList,
    bool? eksiyeDusebilir,
  }) = _HucreTakibiStoklarModel;
  HucreTakibiStoklarModel._();

  factory HucreTakibiStoklarModel.fromJson(Map<String, dynamic> json) => _$HucreTakibiStoklarModelFromJson(json);

  @override
  HucreTakibiStoklarModel fromJson(Map<String, dynamic> json) => _$HucreTakibiStoklarModelFromJson(json);
}
