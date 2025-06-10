import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "kullanici_haritasi_model.freezed.dart";
part "kullanici_haritasi_model.g.dart";

@unfreezed
sealed class KullaniciHaritasiModel with _$KullaniciHaritasiModel, NetworkManagerMixin {
  factory KullaniciHaritasiModel({
    String? kullanici,
    String? kullaniciAdsoyad,
    DateTime? tarih,
    double? enlem,
    double? boylam,
    String? cihazMarka,
    String? cihazModel,
    String? cihazId,
    int? hiz,
  }) = _KullaniciHaritasiModel;
  KullaniciHaritasiModel._();

  @override
  factory KullaniciHaritasiModel.fromJson(Map<String, dynamic> json) => _$KullaniciHaritasiModelFromJson(json);

  @override
  KullaniciHaritasiModel? fromJson(Map<String, dynamic> json) => _$KullaniciHaritasiModelFromJson(json);
}
