import "package:freezed_annotation/freezed_annotation.dart";

part "transfer_mal_talebi_listesi_request_model.freezed.dart";
part "transfer_mal_talebi_listesi_request_model.g.dart";

@freezed
class TransferMalTalebiListesiRequestModel with _$TransferMalTalebiListesiRequestModel {
  const factory TransferMalTalebiListesiRequestModel({String? durum, List<int>? filtreler}) =
      _TransferMalTalebiListesiRequestModel;

  factory TransferMalTalebiListesiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$TransferMalTalebiListesiRequestModelFromJson(json);
}
