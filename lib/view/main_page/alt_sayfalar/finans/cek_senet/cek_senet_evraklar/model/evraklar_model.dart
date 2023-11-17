import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "evraklar_model.freezed.dart";
part "evraklar_model.g.dart";

@unfreezed
class EvraklarModel with _$EvraklarModel, NetworkManagerMixin {
  EvraklarModel._();
  factory EvraklarModel({
    int? id,
    String? belgeNo,
    String? aciklama,
    String? belgeTipi,
    String? resimUrl,
    String? resimUrlKucuk,
    int? boyutByte,
  }) = _EvraklarModel;

  factory EvraklarModel.fromJson(Map<String, dynamic> json) => _$EvraklarModelFromJson(json);

  @override
  EvraklarModel fromJson(Map<String, dynamic> json) => _$EvraklarModelFromJson(json);
}
