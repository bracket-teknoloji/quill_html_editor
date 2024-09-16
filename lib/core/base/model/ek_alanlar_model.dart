import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "ek_alanlar_model.freezed.dart";
part "ek_alanlar_model.g.dart";

@unfreezed
class EkAlanlarModel with _$EkAlanlarModel, NetworkManagerMixin {
  EkAlanlarModel._();
  factory EkAlanlarModel({
    String? tabloAdi,
    String? alanKodu,
    String? alanAciklama,
    String? zorunlu,
    String? aktif,
    int? sira,
    int? veriTipi,
    int? uzunluk,
    int? componentTipi,
    @JsonKey(name: "SecimListesi") List<String>? secimListesi,
    String? ondeger,
  }) = _EkAlanlarModel;

  factory EkAlanlarModel.fromJson(Map<String, dynamic> json) => _$EkAlanlarModelFromJson(json);

  @override
  EkAlanlarModel fromJson(Map<String, dynamic> json) => _$EkAlanlarModelFromJson(json);
}
