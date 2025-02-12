import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "teklif_iste_model.freezed.dart";
part "teklif_iste_model.g.dart";

@freezed
class TeklifIsteModel with _$TeklifIsteModel, NetworkManagerMixin {
  const factory  TeklifIsteModel({
    String? tip,
    String? mesaj,
  }) = _TeklifIsteModel;

  const TeklifIsteModel._();

  factory TeklifIsteModel.fromJson(Map<String, dynamic> json) => _$TeklifIsteModelFromJson(json);

  @override
  TeklifIsteModel fromJson(Map<String, dynamic> json) => TeklifIsteModel.fromJson(json);
}
