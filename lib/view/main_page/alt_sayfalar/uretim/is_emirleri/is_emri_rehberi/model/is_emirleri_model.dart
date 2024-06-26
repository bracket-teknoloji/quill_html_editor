import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";

part "is_emirleri_model.freezed.dart";
part "is_emirleri_model.g.dart";

@unfreezed
class IsEmirleriModel with _$IsEmirleriModel, NetworkManagerMixin, BaseStokMixin {

  IsEmirleriModel._();
  factory IsEmirleriModel({
    DateTime? tarih,
    DateTime? teslimTarihi,
    String? isemriNo,
    int? isemriSira,
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
    double? tamamlanan,
  }) = _IsEmirleriModel;

  factory IsEmirleriModel.fromJson(Map<String, dynamic> json) => _$IsEmirleriModelFromJson(json);

  @override
  IsEmirleriModel fromJson(Map<String, dynamic> json) => _$IsEmirleriModelFromJson(json);
}
