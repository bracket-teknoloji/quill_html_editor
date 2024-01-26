import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "seri_uret_model.freezed.dart";
part "seri_uret_model.g.dart";

@unfreezed
class SeriUretModel with _$SeriUretModel, NetworkManagerMixin {
  SeriUretModel._();
  factory SeriUretModel({
    String? seriNo,
    String? stokKodu,
    int? sonNo,
  }) = _SeriUretModel;

  factory SeriUretModel.fromJson(Map<String, dynamic> json) => _$SeriUretModelFromJson(json);

  @override
  SeriUretModel fromJson(Map<String, dynamic> json) => _$SeriUretModelFromJson(json);
}
