import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "paketleme_listesi_model.freezed.dart";
part "paketleme_listesi_model.g.dart";

@freezed
sealed class PaketlemeListesiModel with _$PaketlemeListesiModel, NetworkManagerMixin {
  factory PaketlemeListesiModel({
    int? id,
    String? kodu,
    int? kalemSayisi,
    DateTime? kayittarihi,
    String? kayityapankul,
    int? depoKodu,
    int? paketTuru,
    String? paketTuruTanimi,
    String? kilit,
    String? ukey,
  }) = _PaketlemeListesiModel;
  PaketlemeListesiModel._();

  factory PaketlemeListesiModel.fromJson(Map<String, dynamic> json) => _$PaketlemeListesiModelFromJson(json);

  @override
  PaketlemeListesiModel fromJson(Map<String, dynamic> json) => _$PaketlemeListesiModelFromJson(json);
}
