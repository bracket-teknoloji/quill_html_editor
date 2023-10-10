import "package:freezed_annotation/freezed_annotation.dart";
import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_request_model.freezed.dart";
part "cari_request_model.g.dart";

@unfreezed
class CariRequestModel with _$CariRequestModel, NetworkManagerMixin {
  CariRequestModel._();
  factory CariRequestModel({
    int? sayfa,
    String? ilce,
    String? cariTipi,
    String? siralama,
    String? menuKodu,
    String? filterText,
    bool? eFaturaGoster,
    String? filterBakiye,
    List<String>? kod,
    List<String>? arrKod5,
    List<String>? arrSehir,
    List<String>? arrPlasiyerKodu,
  }) = _CariRequestModel;

  factory CariRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CariRequestModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$CariRequestModelFromJson(json);
}
