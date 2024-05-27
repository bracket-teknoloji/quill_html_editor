import "package:freezed_annotation/freezed_annotation.dart";

part "paketleme_edit_request_model.freezed.dart";
part "paketleme_edit_request_model.g.dart";

@freezed
class PaketlemeEditRequestModel with _$PaketlemeEditRequestModel {
  const factory PaketlemeEditRequestModel({
    int? islemKodu,
    int? paketId,
    int? kalemId,
  }) = _PaketlemeEditRequestModel;

  factory PaketlemeEditRequestModel.fromJson(Map<String, dynamic> json) => _$PaketlemeEditRequestModelFromJson(json);
}
