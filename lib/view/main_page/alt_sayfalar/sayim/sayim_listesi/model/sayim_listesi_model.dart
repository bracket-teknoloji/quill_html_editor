import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/constants/enum/depo_fark_raporu_filtre_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

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
    int? id,
    int? depoKodu,
    int? cevrim,
    String? stokKodu,
    String? kayityapankul,
    String? depoTanimi,
    String? stokAdi,
    String? projeKodu,
    DateTime? kayittarihi,
    String? barkod,
    double? stokBakiye,
    String? seriNo,
    String? seri2,
    String? seri3,
    String? seri4,
    DateTime? sonKullanmaTarihi,
    StokListesiModel? stokModel,
  }) = _SayimListesiModel;

  factory SayimListesiModel.fromJson(Map<String, dynamic> json) => _$SayimListesiModelFromJson(json);

  @override
  SayimListesiModel fromJson(Map<String, dynamic> json) => _$SayimListesiModelFromJson(json);
}

@unfreezed
class SayimFiltreModel with _$SayimFiltreModel, NetworkManagerMixin {
  SayimFiltreModel._();
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
    @Default(1) double? miktar,
    int? olcuBirimKodu,
    String? projeKodu,
    String? stokKodu,
    String? stokAdi,
    projeAdi,
    String? kull1s,
    String? kull2s,
    String? kull3s,
    String? kull4s,
    String? kull5s,
    int? id,
    int? cevrim,
    String? fisno,
    String? kayityapankul,
    String? depoTanimi,
    DateTime? kayittarihi,
  }) = _SayimFiltreModel;

  factory SayimFiltreModel.fromJson(Map<String, dynamic> json) => _$SayimFiltreModelFromJson(json);

  @override
  SayimFiltreModel fromJson(Map<String, dynamic> json) => _$SayimFiltreModelFromJson(json);
}

extension SayimExtensions on SayimListesiModel {
  double get fark => (miktar ?? 0) - (depoMiktari ?? 0);

  double get depoFark => (stokBakiye ?? 0) - (miktar ?? 0);

  bool get serbestMi => tipi == "S";

  bool get filtreliMi => filtre != null && filtre?.arrGrupKodu != null;

  bool get miktarSifirdanBuyukMu => (miktar ?? 0) > 0;

  bool get tumDepolarMi => depoList?.any((element) => element == -1) == true;

  bool get sayildiMi => miktarSifirdanBuyukMu;

  bool get sayilmadiMi => !sayildiMi;

  bool get fazlaSayildiMi => (stokBakiye ?? 0) < (miktar ?? 0);

  bool get eksikSayildiMi => !fazlaSayildiMi;

  bool get farkVarMi => depoFark != 0;

  bool filtrele(DepoFarkRaporuFiltreEnum filtreTuru) {
    if (filtreTuru.tumuMu) {
      return true;
    }
    if (filtreTuru.sayilanlarMi) {
      return sayildiMi;
    }
    if (filtreTuru.sayilmayanlarMi) {
      return sayilmadiMi;
    }
    if (filtreTuru.fazlaSayilanlarMi) {
      return fazlaSayildiMi;
    }
    if (filtreTuru.eksikSayilanlarMi) {
      return eksikSayildiMi;
    }
    if (filtreTuru.farkVerenlerMi) {
      return farkVarMi;
    }
    return false;
  }
}
