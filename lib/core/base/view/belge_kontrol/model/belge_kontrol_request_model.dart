import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "belge_kontrol_request_model.freezed.dart";
part "belge_kontrol_request_model.g.dart";

@unfreezed
sealed class BelgeKontrolRequestModel with _$BelgeKontrolRequestModel, NetworkManagerMixin {
  factory BelgeKontrolRequestModel({
    @JsonKey(name: "BaslamaTarihi") String? baslamaTarihi,
    @JsonKey(name: "BitisTarihi") String? bitisTarihi,
    @JsonKey(name: "Durum") String? durum,
  }) = _BelgeKontrolRequestModel;
  BelgeKontrolRequestModel._();

  factory BelgeKontrolRequestModel.fromJson(Map<String, dynamic> json) => _$BelgeKontrolRequestModelFromJson(json);

  @override
  NetworkManagerMixin? fromJson(Map<String, dynamic> json) => BelgeKontrolRequestModel.fromJson(json);
}
