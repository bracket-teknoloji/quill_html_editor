import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/base_stok_mixin.dart";

part "is_emri_hammadde_takibi_listesi_model.freezed.dart";
part "is_emri_hammadde_takibi_listesi_model.g.dart";

@unfreezed
sealed class IsEmriHammaddeTakibiListesiModel
    with _$IsEmriHammaddeTakibiListesiModel, NetworkManagerMixin, BaseStokMixin {
  factory IsEmriHammaddeTakibiListesiModel({
    int? takipno,
    int? nfisemrino,
    String? isemrino,
    String? stokKodu,
    String? stokAdi,
    String? yapkod,
    String? yapacik,
    String? makineKodu,
    double? miktar,
  }) = _IsEmriHammaddeTakibiListesiModel;
  IsEmriHammaddeTakibiListesiModel._();

  factory IsEmriHammaddeTakibiListesiModel.fromJson(Map<String, dynamic> json) =>
      _$IsEmriHammaddeTakibiListesiModelFromJson(json);

  @override
  IsEmriHammaddeTakibiListesiModel fromJson(Map<String, dynamic> json) =>
      _$IsEmriHammaddeTakibiListesiModelFromJson(json);
}
