// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_profil_parametre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseProfilParametreModelImpl _$$BaseProfilParametreModelImplFromJson(Map<String, dynamic> json) => _$BaseProfilParametreModelImpl(
      siparisYeniKaydaHazirla: json['SIPARIS_YENI_KAYDA_HAZIRLA'] as bool? ?? true,
      siparisEkAlan: json['SIPARIS_EK_ALAN'] as bool? ?? false,
      siparisMiktar: json['SIPARIS_MIKTAR'] as bool? ?? false,
      siparisVade: json['SIPARIS_VADE'] as bool? ?? false,
      kurlariSilTekrarGuncelle: json['KURLARI_SIL_TEKRAR_GUNCELLE'] as bool? ?? false,
      stokResimleriGoster: json['STOK_RESIMLERI_GOSTER'] as bool? ?? false,
      stokYazdirDizaynVeYaziciHatirla: json['STOK_YAZDIR_DIZAYN_VE_YAZICI_HATIRLA'] as bool? ?? false,
      stokSecildigindeYazdir: json['STOK_SECILDIGINDE_YAZDIR'] as bool? ?? false,
      netFectDizaynList: json['NET_FECT_DIZAYN_LIST'] == null ? null : NetFectDizaynList.fromJson(json['NET_FECT_DIZAYN_LIST'] as Map<String, dynamic>),
      yaziciList: json['YAZICI_LIST'] == null ? null : YaziciList.fromJson(json['YAZICI_LIST'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BaseProfilParametreModelImplToJson(_$BaseProfilParametreModelImpl instance) {
  final val = <String, dynamic>{
    'SIPARIS_YENI_KAYDA_HAZIRLA': instance.siparisYeniKaydaHazirla,
    'SIPARIS_EK_ALAN': instance.siparisEkAlan,
    'SIPARIS_MIKTAR': instance.siparisMiktar,
    'SIPARIS_VADE': instance.siparisVade,
    'KURLARI_SIL_TEKRAR_GUNCELLE': instance.kurlariSilTekrarGuncelle,
    'STOK_RESIMLERI_GOSTER': instance.stokResimleriGoster,
    'STOK_YAZDIR_DIZAYN_VE_YAZICI_HATIRLA': instance.stokYazdirDizaynVeYaziciHatirla,
    'STOK_SECILDIGINDE_YAZDIR': instance.stokSecildigindeYazdir,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NET_FECT_DIZAYN_LIST', instance.netFectDizaynList?.toJson());
  writeNotNull('YAZICI_LIST', instance.yaziciList?.toJson());
  return val;
}
