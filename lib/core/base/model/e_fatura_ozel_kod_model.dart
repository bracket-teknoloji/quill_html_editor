import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "e_fatura_ozel_kod_model.freezed.dart";
part "e_fatura_ozel_kod_model.g.dart";

@unfreezed
class EFaturaOzelKodModel with _$EFaturaOzelKodModel, NetworkManagerMixin {
  EFaturaOzelKodModel._();
  factory EFaturaOzelKodModel({
    int? tip,
    String? tipAdi,
    int? kod,
    String? aciklama,
  }) = _EFaturaOzelKodModel;

  factory EFaturaOzelKodModel.fromJson(Map<String, dynamic> json) => _$EFaturaOzelKodModelFromJson(json);

  @override
  EFaturaOzelKodModel fromJson(Map<String, dynamic> json) => EFaturaOzelKodModel.fromJson(json);
}
