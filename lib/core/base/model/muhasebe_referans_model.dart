import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "muhasebe_referans_model.freezed.dart";
part "muhasebe_referans_model.g.dart";

@unfreezed
class MuhasebeReferansModel with _$MuhasebeReferansModel, NetworkManagerMixin {
  factory MuhasebeReferansModel({String? kodu, String? tanimi}) = _MuhasebeReferansModel;
  MuhasebeReferansModel._();

  factory MuhasebeReferansModel.fromJson(Map<String, dynamic> json) => _$MuhasebeReferansModelFromJson(json);

  @override
  MuhasebeReferansModel fromJson(Map<String, dynamic> json) => _$MuhasebeReferansModelFromJson(json);
}
