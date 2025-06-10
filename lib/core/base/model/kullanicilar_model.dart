import "package:freezed_annotation/freezed_annotation.dart";

import "base_network_mixin.dart";

part "kullanicilar_model.freezed.dart";
part "kullanicilar_model.g.dart";

@freezed
sealed class KullanicilarModel with _$KullanicilarModel, NetworkManagerMixin {
  const factory KullanicilarModel({String? kodu, String? adi}) = _KullanicilarModel;
  const KullanicilarModel._();

  factory KullanicilarModel.fromJson(Map<String, dynamic> json) => _$KullanicilarModelFromJson(json);

  @override
  KullanicilarModel fromJson(Map<String, dynamic> json) => _$KullanicilarModelFromJson(json);
}
