import "package:freezed_annotation/freezed_annotation.dart";
import "base_network_mixin.dart";

part "seri_model.freezed.dart";
part "seri_model.g.dart";

@freezed
class SeriModel with _$SeriModel, NetworkManagerMixin {
  SeriModel._();
  factory SeriModel({
    String? seriNo,
    String? aciklama,
  }) = _SeriModel;

  factory SeriModel.fromJson(Map<String, dynamic> json) =>
      _$SeriModelFromJson(json);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$SeriModelFromJson(json);
  }
}
