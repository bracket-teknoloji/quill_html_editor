import "package:freezed_annotation/freezed_annotation.dart";

part "dizayn_request_model.freezed.dart";
part "dizayn_request_model.g.dart";

@freezed
class DizaynRequestModel with _$DizaynRequestModel {
  const factory DizaynRequestModel({
    @JsonKey(name: "ModulID") int? modulId,
    @JsonKey(name: "ERPDizaynlari") bool? erpDizaynlari,
  }) = _DizaynRequestModel;

  factory DizaynRequestModel.fromJson(Map<String, dynamic> json) => _$DizaynRequestModelFromJson(json);
}
