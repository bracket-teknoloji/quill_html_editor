import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "genel_rehber_model.freezed.dart";
part "genel_rehber_model.g.dart";

@unfreezed
sealed class GenelRehberModel with _$GenelRehberModel, NetworkManagerMixin {
  factory GenelRehberModel({String? kodu, String? aciklama, String? adi}) = _GenelRehberModel;
  GenelRehberModel._();

  factory GenelRehberModel.fromJson(Map<String, dynamic> json) => _$GenelRehberModelFromJson(json);

  @override
  GenelRehberModel fromJson(Map<String, dynamic> json) => _$GenelRehberModelFromJson(json);
}
