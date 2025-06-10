import "package:freezed_annotation/freezed_annotation.dart";

part "e_belge_request_model.freezed.dart";
part "e_belge_request_model.g.dart";

@unfreezed
sealed class EBelgeRequestModel with _$EBelgeRequestModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory EBelgeRequestModel({
    String? basimDurumu,
    String? baslamaTarihi,
    String? bitisTarihi,
    String? eBelgeTuru,
    String? islendi,
    bool? kayitTarihineGore,
    String? kontrolEdildi,
    String? faturaYonu,
    String? onayDurumu,
    int? sayfa,
    String? senaryo,
    String? sirala,
    bool? sorgulanmasin,
    String? searchText,
    String? taslak,
    String? resmiBelgeNo,
  }) = _EBelgeRequestModel;
  EBelgeRequestModel._();

  factory EBelgeRequestModel.fromJson(Map<String, dynamic> json) => _$EBelgeRequestModelFromJson(json);

  EBelgeRequestModel fromJson(Map<String, dynamic> json) => EBelgeRequestModel.fromJson(json);
}
