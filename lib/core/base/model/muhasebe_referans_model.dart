import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "muhasebe_referans_model.freezed.dart";
part "muhasebe_referans_model.g.dart";

@unfreezed
class MuhasebeReferansModel with _$MuhasebeReferansModel, NetworkManagerMixin {
  MuhasebeReferansModel._();
  factory MuhasebeReferansModel({
    String? kodu,
    String? tanimi,
  }) = _MuhasebeReferansModel;

  factory MuhasebeReferansModel.fromJson(Map<String, dynamic> json) => _$MuhasebeReferansModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$MuhasebeReferansModelFromJson(json);
  }
}
