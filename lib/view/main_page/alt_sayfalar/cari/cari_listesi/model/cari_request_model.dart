import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "cari_request_model.freezed.dart";
part "cari_request_model.g.dart";

@unfreezed
class CariRequestModel with _$CariRequestModel, NetworkManagerMixin {
  CariRequestModel._();

  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory CariRequestModel({
    String? filterText,
    List<String>? kod,
    int? sayfa,
    String? ilce,
    String? cariTipi,
    @JsonKey(name: "SIRALAMA") String? siralama,
    String? menuKodu,
    bool? eFaturaGoster,
    @JsonKey(name: "FILTER_BAKIYE") String? filterBakiye,
    List<String?>? arrGrupKodu,
    List<String?>? arrKod1,
    List<String?>? arrKod2,
    List<String?>? arrKod3,
    List<String?>? arrKod4,
    List<String?>? arrKod5,
    List<String?>? arrSehir,
    @JsonKey(name: "ArrPlasiyerKodu") List<String?>? arrPlasiyerKodu,
  }) = _CariRequestModel;

  factory CariRequestModel.fromJson(Map<String, dynamic> json) => _$CariRequestModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) => _$CariRequestModelFromJson(json);
}
