import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "stok_fiyat_ozeti_model.freezed.dart";
part "stok_fiyat_ozeti_model.g.dart";

@freezed
class StokFiyatOzetiModel with _$StokFiyatOzetiModel, NetworkManagerMixin {
  const StokFiyatOzetiModel._();
  const factory StokFiyatOzetiModel({
    int? sira,
    String? grup,
    String? tip,
    String? cariKodu,
    String? cariAdi,
    DateTime? tarih,
    double? fiyat,
    int? dovizFiyati,
    String? dovizAdi,
    int? dovizTipi,
    int? brutFiyat,
    int? brutDovizFiyati,
  }) = _StokFiyatOzetiModel;

  factory StokFiyatOzetiModel.fromJson(Map<String, dynamic> json) => _$StokFiyatOzetiModelFromJson(json);

  @override
  StokFiyatOzetiModel fromJson(Map<String, dynamic> json) => _$StokFiyatOzetiModelFromJson(json);
}
