import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "olcum_girisi_listesi_model.freezed.dart";
part "olcum_girisi_listesi_model.g.dart";

@unfreezed
class OlcumGirisiListesiModel with _$OlcumGirisiListesiModel, NetworkManagerMixin {
  OlcumGirisiListesiModel._();
  factory OlcumGirisiListesiModel({
    String? belgeNo,
    DateTime? tarih,
    int? sira,
    String? stokKodu,
    String? stokAdi,
    String? yapkod,
    String? yapacik,
    double? miktar,
    int? olcumAdedi,
    int? kabulAdet,
    int? sartliAdet,
    int? retAdet,
  }) = _OlcumGirisiListesiModel;

  factory OlcumGirisiListesiModel.fromJson(Map<String, dynamic> json) => _$OlcumGirisiListesiModelFromJson(json);

  @override
  OlcumGirisiListesiModel fromJson(Map<String, dynamic> json) => _$OlcumGirisiListesiModelFromJson(json);
}
