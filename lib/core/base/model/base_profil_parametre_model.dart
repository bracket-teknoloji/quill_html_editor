import "package:flutter/material.dart";
import "package:freezed_annotation/freezed_annotation.dart";

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
    @Default(false) 
    @Deprecated("message") final bool acikTemaMi,
    /// 1 ise cihaz varsayılanı
    /// 2 ise açık
    /// 3 ise karanlık tema
    @Default(ThemeMode.system) ThemeMode temaModu,
    NetFectDizaynList? netFectDizaynList,
    YaziciList? yaziciList,
  }) = _BaseProfilParametreModel;
  factory BaseProfilParametreModel.fromJson(Map<String, dynamic> json) => _$BaseProfilParametreModelFromJson(json);
  //Empty constructor
  BaseProfilParametreModel._();
  @override
  BaseProfilParametreModel fromJson(Map<String, dynamic> json) => _$BaseProfilParametreModelFromJson(json);
}
