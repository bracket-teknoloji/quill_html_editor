import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "kullanicilar_model.freezed.dart";
part "kullanicilar_model.g.dart";

@unfreezed
class KullanicilarModel with _$KullanicilarModel, NetworkManagerMixin {
  factory KullanicilarModel({
    String? kodu,
    String? adi,
  }) = _KullanicilarModel;
  KullanicilarModel._();

  factory KullanicilarModel.fromJson(Map<String, dynamic> json) => _$KullanicilarModelFromJson(json);

  @override
  KullanicilarModel fromJson(Map<String, dynamic> json) => _$KullanicilarModelFromJson(json);
}
