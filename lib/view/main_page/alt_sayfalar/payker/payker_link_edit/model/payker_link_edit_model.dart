import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "payker_link_edit_model.freezed.dart";
part "payker_link_edit_model.g.dart";

@freezed
sealed class PaykerLinkEditModel with _$PaykerLinkEditModel, NetworkManagerMixin {
  const factory PaykerLinkEditModel({
    @Default(0) int firmaId,
    int? bayiId,
    double? tutar,
    String? email,
    String? unvan,
    DateTime? bitTar,
    String? taksitlerJson,
    int? kullanimSayisi,
    String? guid,
    bool? alindi,
  }) = _PaykerLinkEditModel;
  const PaykerLinkEditModel._();

  factory PaykerLinkEditModel.fromJson(Map<String, dynamic> json) => _$PaykerLinkEditModelFromJson(json);

  @override
  PaykerLinkEditModel fromJson(Map<String, dynamic> json) => PaykerLinkEditModel.fromJson(json);
}
