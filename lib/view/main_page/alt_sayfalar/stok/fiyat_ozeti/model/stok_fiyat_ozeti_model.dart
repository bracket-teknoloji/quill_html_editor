import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "stok_fiyat_ozeti_model.freezed.dart";
part "stok_fiyat_ozeti_model.g.dart";

@freezed
sealed class StokFiyatOzetiModel with _$StokFiyatOzetiModel, NetworkManagerMixin {
  const factory StokFiyatOzetiModel({
    int? sira,
    String? grup,
    String? tip,
    String? cariKodu,
    String? cariAdi,
    DateTime? tarih,
    double? fiyat,
    double? dovizFiyati,
    String? dovizAdi,
    int? dovizTipi,
    double? brutFiyat,
    double? brutDovizFiyati,
  }) = _StokFiyatOzetiModel;
  const StokFiyatOzetiModel._();

  factory StokFiyatOzetiModel.fromJson(Map<String, dynamic> json) => _$StokFiyatOzetiModelFromJson(json);

  @override
  StokFiyatOzetiModel fromJson(Map<String, dynamic> json) => _$StokFiyatOzetiModelFromJson(json);
}
