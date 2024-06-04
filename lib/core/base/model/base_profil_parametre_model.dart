import "package:flutter/material.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

import "../../../view/main_page/model/param_model.dart";
import "base_network_mixin.dart";

part "base_profil_parametre_model.freezed.dart";
part "base_profil_parametre_model.g.dart";

@freezed
abstract class BaseProfilParametreModel with _$BaseProfilParametreModel, NetworkManagerMixin {
  factory BaseProfilParametreModel({
    @Default(false) bool siparisYeniKaydaHazirla,
    @Default(false) bool faturaYeniKaydaHazirla,
    @Default(false) bool talepTeklifYeniKaydaHazirla,
    @Default(false) bool transferYeniKaydaHazirla,
    @Default(false) bool siparisEkAlan,
    @Default(false) bool siparisMiktar,
    @Default(false) bool siparisVade,
    @Default(false) bool kurlariSilTekrarGuncelle,
    @Default(false) bool stokResimleriGoster,
    @Default(false) bool stokYazdirDizaynVeYaziciHatirla,
    @Default(false) bool stokSecildigindeYazdir,
    @Default(false) bool finansOzelRaporGrafikGoster,
    @Default(false) @Deprecated("Bunun yerine temaModu kullanılacak.") final bool acikTemaMi,

    /// 1 ise sistem varsayılanı
    /// 2 ise açık
    /// 3 ise karanlık tema
    @Default(ThemeMode.system) ThemeMode temaModu,
    @Default(false) bool rotaDisiGorunsunMu,
    NetFectDizaynList? netFectDizaynList,
    YaziciList? yaziciList,
    @Default(EditTipiEnum.isEmri) EditTipiEnum olcumGirisiBelgeTipi,
    @Default(false) bool kapaliBelgelerListelenmesinMi,
    @Default(false) bool sayimStokSecildigindeHemenKaydet,
  }) = _BaseProfilParametreModel;
  factory BaseProfilParametreModel.fromJson(Map<String, dynamic> json) => _$BaseProfilParametreModelFromJson(json);
  //Empty constructor
  BaseProfilParametreModel._();
  @override
  BaseProfilParametreModel fromJson(Map<String, dynamic> json) => _$BaseProfilParametreModelFromJson(json);
}
