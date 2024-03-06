import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "sayim_listesi_model.freezed.dart";
part "sayim_listesi_model.g.dart";

@unfreezed
class SayimListesiModel with _$SayimListesiModel, NetworkManagerMixin {
  SayimListesiModel._();
  factory SayimListesiModel({
    String? fisno,
    DateTime? baslangicTarihi,
    String? depo,
    String? aktif,
    String? kullanicilarJson,
    List<int>? depoList,
    List<int>? kullaniciList,
    String? kullanicilar,
    double? miktar,
    double? depoMiktari,
    String? tipi,
    SayimFiltreModel? filtre,
    String? filtreStr,
    DateTime? bitisTarihi,
  }) = _SayimListesiModel;

  factory SayimListesiModel.fromJson(Map<String, dynamic> json) => _$SayimListesiModelFromJson(json);

  @override
  SayimListesiModel fromJson(Map<String, dynamic> json) => _$SayimListesiModelFromJson(json);
}

@unfreezed
class SayimFiltreModel with _$SayimFiltreModel {
  factory SayimFiltreModel({
    @JsonKey(name: "ArrGrupKodu") List<String>? arrGrupKodu,
    int? depoKodu,
    @JsonKey(name: "SeriList") List<dynamic>? seriList,
    int? islemKodu,
    String? belgeNo,
    String? tipi,
    @JsonKey(name: "ArrKod1") List<String>? arrKod1,
    @JsonKey(name: "ArrKod2") List<String>? arrKod2,
    @JsonKey(name: "ArrKod3") List<String>? arrKod3,
    @JsonKey(name: "ArrKod4") List<String>? arrKod4,
    @JsonKey(name: "ArrKod5") List<String>? arrKod5,
    int? miktar,
    int? olcuBirimKodu,
    String? projeKodu,
    String? stokKodu,
  }) = _SayimFiltreModel;

  factory SayimFiltreModel.fromJson(Map<String, dynamic> json) => _$SayimFiltreModelFromJson(json);
}

extension SayimExtensions on SayimListesiModel {
  double? get fark => (miktar ?? 0) - (depoMiktari ??= 0);

  bool get serbestMi => tipi == "S";

  bool get filtreliMi => filtre != null && filtre?.arrGrupKodu != null;

  bool get miktarSifirdanBuyukMu => (miktar ?? 0) > 0 && filtreliMi;
}
