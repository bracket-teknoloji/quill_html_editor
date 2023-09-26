// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_profil_parametre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BaseProfilParametreModel _$$_BaseProfilParametreModelFromJson(
        Map<String, dynamic> json) =>
    _$_BaseProfilParametreModel(
      siparisYeniKaydaHazirla:
          json['SIPARIS_YENI_KAYDA_HAZIRLA'] as bool? ?? true,
      siparisEkAlan: json['SIPARIS_EK_ALAN'] as bool? ?? false,
      siparisMiktar: json['SIPARIS_MIKTAR'] as bool? ?? false,
      siparisVade: json['SIPARIS_VADE'] as bool? ?? false,
      kurlariSilTekrarGuncelle:
          json['KURLARI_SIL_TEKRAR_GUNCELLE'] as bool? ?? false,
      stokResimleriGoster: json['STOK_RESIMLERI_GOSTER'] as bool? ?? false,
      stokSecildigindeYazdir:
          json['STOK_SECILDIGINDE_YAZDIR'] as bool? ?? false,
    );

Map<String, dynamic> _$$_BaseProfilParametreModelToJson(
        _$_BaseProfilParametreModel instance) =>
    <String, dynamic>{
      'SIPARIS_YENI_KAYDA_HAZIRLA': instance.siparisYeniKaydaHazirla,
      'SIPARIS_EK_ALAN': instance.siparisEkAlan,
      'SIPARIS_MIKTAR': instance.siparisMiktar,
      'SIPARIS_VADE': instance.siparisVade,
      'KURLARI_SIL_TEKRAR_GUNCELLE': instance.kurlariSilTekrarGuncelle,
      'STOK_RESIMLERI_GOSTER': instance.stokResimleriGoster,
      'STOK_SECILDIGINDE_YAZDIR': instance.stokSecildigindeYazdir,
    };
