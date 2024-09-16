import "package:freezed_annotation/freezed_annotation.dart";
import "../../../../../../../../core/base/model/base_network_mixin.dart";

part "barkod_tanimla_kayitlari_model.freezed.dart";
part "barkod_tanimla_kayitlari_model.g.dart";

@freezed
class BarkodTanimlaKayitlariModel with _$BarkodTanimlaKayitlariModel, NetworkManagerMixin {
  BarkodTanimlaKayitlariModel._();

  factory BarkodTanimlaKayitlariModel({
    String? stokKodu,
    String? barkod,
    int? birim,
    String? kilit,
    String? aciklama,
    String? birimAdi,
    String? barkodTipi,
    String? barkodTipiAdi,
    double? birimPay,
    double? birimPayda,
    String? stokBirim1Adi,
  }) = _BarkodTanimlaKayitlariModel;

  factory BarkodTanimlaKayitlariModel.fromJson(Map<String, dynamic> json) => _$BarkodTanimlaKayitlariModelFromJson(json);

  @override
  BarkodTanimlaKayitlariModel fromJson(Map<String, dynamic> json) => _$BarkodTanimlaKayitlariModelFromJson(json);
}
