import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

part "paket_icerigi_model.freezed.dart";
part "paket_icerigi_model.g.dart";

@freezed
sealed class PaketIcerigiModel with _$PaketIcerigiModel, NetworkManagerMixin {
  factory PaketIcerigiModel({
    int? id,
    int? paketId,
    String? paketKodu,
    int? depoKodu,
    String? depoAdi,
    String? stokKodu,
    String? stokAdi,
    double? miktar,
    String? cikistaSeri,
    String? seriMiktarKadar,
    String? seriBakiyeKontrol,
    String? seriCikistaOtomatik,
    List<SeriList>? seriList,
  }) = _PaketIcerigiModel;
  PaketIcerigiModel._();

  factory PaketIcerigiModel.fromJson(Map<String, dynamic> json) => _$PaketIcerigiModelFromJson(json);

  @override
  PaketIcerigiModel fromJson(Map<String, dynamic> json) => _$PaketIcerigiModelFromJson(json);
}
