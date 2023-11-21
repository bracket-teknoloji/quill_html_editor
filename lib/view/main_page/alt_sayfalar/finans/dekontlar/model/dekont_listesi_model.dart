import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "dekont_listesi_model.freezed.dart";
part "dekont_listesi_model.g.dart";

@unfreezed
class DekontListesiModel with _$DekontListesiModel, NetworkManagerMixin {
  DekontListesiModel._();
  factory DekontListesiModel({
    int? inckeyno,
    String? seri,
    int? dekontNo,
    DateTime? tarih,
    int? kalemSayisi,
    double? borcToplami,
    String? seriAdi,
  }) = _DekontListesiModel;

  factory DekontListesiModel.fromJson(Map<String, dynamic> json) => _$DekontListesiModelFromJson(json);

  @override
  DekontListesiModel fromJson(Map<String, dynamic> json) => DekontListesiModel.fromJson(json);
}
