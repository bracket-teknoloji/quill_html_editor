import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "stok_fiyati_model.freezed.dart";
part "stok_fiyati_model.g.dart";

@freezed
sealed class StokFiyatiModel with _$StokFiyatiModel, NetworkManagerMixin {
  factory StokFiyatiModel({
    double? fiyat,
    String? yer,
    int? fiyatSirasi,
    String? stokKodu,
    String? cariKodu,
    DateTime? tarih,
  }) = _StokFiyatiModel;
  StokFiyatiModel._();

  factory StokFiyatiModel.fromJson(Map<String, dynamic> json) => _$StokFiyatiModelFromJson(json);

  @override
  StokFiyatiModel fromJson(Map<String, dynamic> json) => StokFiyatiModel.fromJson(json);
}
