import "dart:convert";

import "package:freezed_annotation/freezed_annotation.dart";

import "../../../model/base_network_mixin.dart";

part "cari_listesi_request_model.freezed.dart";
part "cari_listesi_request_model.g.dart";

@freezed
class CariListesiRequestModel
    with _$CariListesiRequestModel, NetworkManagerMixin {
  CariListesiRequestModel._();
  @JsonSerializable(fieldRename: FieldRename.pascal, createToJson: true)
  factory CariListesiRequestModel({
    bool? eFaturaGoster,
    @JsonKey(name: "SIRALAMA") String? siralama,
    int? sayfa,
    @Default("CARI_CREH") String? menuKodu,
    @Default("") String? filterText,
    @Default("") String? kod,
    List<String>? arrPlasiyer,
    List<String>? arrKod1,
    List<String>? arrKod2,
    List<String>? arrKod3,
    List<String>? arrKod4,
    List<String>? arrKod5,
    List<String>? arrSehir,
    List<String>? arrGrupKodu,
    String? ilce,
    String? cariTipi,
    @JsonKey(name: "FILTER_BAKIYE") String? filterBakiye,
    String? bagliCariKodu,
    String? belgeTuru,
    String? teslimCari,
    String? sehir,
  }) = _CariListesiRequestModel;

  factory CariListesiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CariListesiRequestModelFromJson(json);

  @override
  CariListesiRequestModel? fromJson(Map<String, dynamic> json) =>
      _$CariListesiRequestModelFromJson(json);

  Map<String, dynamic> toJsonWithList() {
    final map = toJson();
    // replace list items with json
    if (map["ArrPlasiyer"] != null) {
      map["ArrPlasiyer"] = jsonEncode(map["ArrPlasiyer"]);
    }
    if (map["ArrKod1"] != null) {
      map["ArrKod1"] = jsonEncode(map["ArrKod1"]);
    }
    if (map["ArrKod2"] != null) {
      map["ArrKod2"] = jsonEncode(map["ArrKod2"]);
    }
    if (map["ArrKod3"] != null) {
      map["ArrKod3"] = jsonEncode(map["ArrKod3"]);
    }
    if (map["ArrKod4"] != null) {
      map["ArrKod4"] = jsonEncode(map["ArrKod4"]);
    }
    if (map["ArrKod5"] != null) {
      map["ArrKod5"] = jsonEncode(map["ArrKod5"]);
    }

    return map;
  }
}
