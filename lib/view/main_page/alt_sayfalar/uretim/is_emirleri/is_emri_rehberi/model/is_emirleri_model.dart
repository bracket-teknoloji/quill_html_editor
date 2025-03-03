import "dart:ui";

import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/constants/color_palette.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/base_stok_mixin.dart";

part "is_emirleri_model.freezed.dart";
part "is_emirleri_model.g.dart";

@unfreezed
class IsEmirleriModel with _$IsEmirleriModel, NetworkManagerMixin, BaseStokMixin {
  factory IsEmirleriModel({
    DateTime? tarih,
    DateTime? teslimTarihi,
    String? isemriNo,
    int? isemriSira,
    int? islemKodu,
    int? requestVersion,
    String? stokKodu,
    String? yapkod,
    String? stokAdi,
    double? miktar,
    double? kalan,
    int? cikisDepo,
    int? girisDepo,
    String? kapali,
    String? rework,
    String? cikisDepoAdi,
    String? girisDepoAdi,
    String? stokOlcuBirimi,
    String? projeKodu,
    String? refIsemrino,
    String? siparisNo,
    int? siparisSira,
    String? cariKodu,
    String? cariAdi,
    String? aciklama,
    double? tamamlanan,
  }) = _IsEmirleriModel;
  IsEmirleriModel._();

  factory IsEmirleriModel.fromJson(Map<String, dynamic> json) => _$IsEmirleriModelFromJson(json);

  @override
  IsEmirleriModel fromJson(Map<String, dynamic> json) => _$IsEmirleriModelFromJson(json);

  Color? get cardColor {
    if ((tamamlanan ?? 0) > 0) {
      if (tamamlanan == miktar) {
        return ColorPalette.mantis;
      }
      return ColorPalette.gamboge;
    } else {
      return null;
    }
  }
}
