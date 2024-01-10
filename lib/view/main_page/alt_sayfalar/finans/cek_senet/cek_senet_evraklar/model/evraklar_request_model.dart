import "package:freezed_annotation/freezed_annotation.dart";

import "../../cek_senet_listesi/model/cek_senet_listesi_model.dart";

part "evraklar_request_model.freezed.dart";
part "evraklar_request_model.g.dart";

@freezed
class EvraklarRequestModel with _$EvraklarRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory EvraklarRequestModel({
    String? belgeTipi,
    String? urlGetir,
    String? belgeNo,
  }) = _EvraklarRequestModel;

  factory EvraklarRequestModel.fromJson(Map<String, dynamic> json) => _$EvraklarRequestModelFromJson(json);

  factory EvraklarRequestModel.fromCekSenetListesiModel(CekSenetListesiModel model) => EvraklarRequestModel(belgeTipi: model.belgeTipi, urlGetir: "E", belgeNo: model.belgeNo);
}
