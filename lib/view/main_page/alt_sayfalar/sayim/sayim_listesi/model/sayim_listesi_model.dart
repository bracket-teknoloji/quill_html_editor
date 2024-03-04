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
    Filtre? filtre,
    String? filtreStr,
  }) = _SayimListesiModel;

  factory SayimListesiModel.fromJson(Map<String, dynamic> json) => _$SayimListesiModelFromJson(json);

  @override
  SayimListesiModel fromJson(Map<String, dynamic> json) => _$SayimListesiModelFromJson(json);
}

@freezed
class Filtre with _$Filtre {
  const factory Filtre({
    @JsonKey(name: "ArrGrupKodu") List<String>? arrGrupKodu,
    int? depoKodu,
    @JsonKey(name: "SeriList") List<dynamic>? seriList,
    int? islemKodu,
    String? tipi,
  }) = _Filtre;

  factory Filtre.fromJson(Map<String, dynamic> json) => _$FiltreFromJson(json);
}

extension SayimExtensions on SayimListesiModel {
  double? get fark => (miktar ?? 0) - (depoMiktari ??= 0);

  bool get serbestMi => tipi == "S";

  bool get filtreliMi => filtre != null && filtre?.arrGrupKodu != null;

  bool get miktarSifirdanBuyukMu => (miktar ?? 0) > 0;
}
