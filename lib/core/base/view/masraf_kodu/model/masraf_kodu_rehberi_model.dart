import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "masraf_kodu_rehberi_model.freezed.dart";
part "masraf_kodu_rehberi_model.g.dart";

@unfreezed
class MasrafKoduRehberiModel with _$MasrafKoduRehberiModel, NetworkManagerMixin {
  MasrafKoduRehberiModel._();
  factory MasrafKoduRehberiModel({
    String? masrafKodu,
    String? masrafAdi,
  }) = _MasrafKoduRehberiModel;

  factory MasrafKoduRehberiModel.fromJson(Map<String, dynamic> json) => _$MasrafKoduRehberiModelFromJson(json);

  @override
  MasrafKoduRehberiModel fromJson(Map<String, dynamic> json) => _$MasrafKoduRehberiModelFromJson(json);
}
