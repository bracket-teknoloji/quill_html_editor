// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_profil_parametre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseProfilParametreModelImpl _$$BaseProfilParametreModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseProfilParametreModelImpl(
      siparisYeniKaydaHazirla:
          json['SIPARIS_YENI_KAYDA_HAZIRLA'] as bool? ?? false,
      faturaYeniKaydaHazirla:
          json['FATURA_YENI_KAYDA_HAZIRLA'] as bool? ?? false,
      talepTeklifYeniKaydaHazirla:
          json['TALEP_TEKLIF_YENI_KAYDA_HAZIRLA'] as bool? ?? false,
      transferYeniKaydaHazirla:
          json['TRANSFER_YENI_KAYDA_HAZIRLA'] as bool? ?? false,
      siparisEkAlan: json['SIPARIS_EK_ALAN'] as bool? ?? false,
      siparisMiktar: json['SIPARIS_MIKTAR'] as bool? ?? false,
      siparisVade: json['SIPARIS_VADE'] as bool? ?? false,
      kurlariSilTekrarGuncelle:
          json['KURLARI_SIL_TEKRAR_GUNCELLE'] as bool? ?? false,
      stokResimleriGoster: json['STOK_RESIMLERI_GOSTER'] as bool? ?? false,
      stokYazdirDizaynVeYaziciHatirla:
          json['STOK_YAZDIR_DIZAYN_VE_YAZICI_HATIRLA'] as bool? ?? false,
      stokSecildigindeYazdir:
          json['STOK_SECILDIGINDE_YAZDIR'] as bool? ?? false,
      finansOzelRaporGrafikGoster:
          json['FINANS_OZEL_RAPOR_GRAFIK_GOSTER'] as bool? ?? false,
      acikTemaMi: json['ACIK_TEMA_MI'] as bool? ?? false,
      temaModu: $enumDecodeNullable(_$ThemeModeEnumMap, json['TEMA_MODU']) ??
          ThemeMode.dark,
      rotaDisiGorunsunMu: json['ROTA_DISI_GORUNSUN_MU'] as bool? ?? false,
      netFectDizaynList: json['NET_FECT_DIZAYN_LIST'] == null
          ? null
          : NetFectDizaynList.fromJson(
              json['NET_FECT_DIZAYN_LIST'] as Map<String, dynamic>),
      yaziciList: json['YAZICI_LIST'] == null
          ? null
          : YaziciList.fromJson(json['YAZICI_LIST'] as Map<String, dynamic>),
      olcumGirisiBelgeTipi: $enumDecodeNullable(
              _$EditTipiEnumEnumMap, json['OLCUM_GIRISI_BELGE_TIPI']) ??
          EditTipiEnum.isEmri,
      kapaliBelgelerListelenmesinMi:
          json['KAPALI_BELGELER_LISTELENMESIN_MI'] as bool? ?? false,
      sayimStokSecildigindeHemenKaydet:
          json['SAYIM_STOK_SECILDIGINDE_HEMEN_KAYDET'] as bool? ?? false,
      sayimOtomatikEtiketYazdir:
          json['SAYIM_OTOMATIK_ETIKET_YAZDIR'] as bool? ?? false,
      stokGorunecekEkstraAlanlar:
          json['STOK_GORUNECEK_EKSTRA_ALANLAR'] as Map<String, dynamic>? ??
              const {},
      stokListesiGridSayisi:
          (json['STOK_LISTESI_GRID_SAYISI'] as num?)?.toInt() ?? 0,
      urunGrubunaGoreSatisRaporTipi:
          json['URUN_GRUBUNA_GORE_SATIS_RAPOR_TIPI'] as String? ?? "T",
      urunGrubunaGoreGruplansin:
          json['URUN_GRUBUNA_GORE_GRUPLANSIN'] as bool? ?? false,
      cariListesiSirala: json['CARI_LISTESI_SIRALA'] as String? ?? "AZ",
      stokListesiSirala: json['STOK_LISTESI_SIRALA'] as String? ?? "AZ",
      irsFaturalasanIrsaliyelerGelsin:
          json['IRS_FATURALASAN_IRSALIYELER_GELSIN'] as bool? ?? false,
    );

Map<String, dynamic> _$$BaseProfilParametreModelImplToJson(
    _$BaseProfilParametreModelImpl instance) {
  final val = <String, dynamic>{
    'SIPARIS_YENI_KAYDA_HAZIRLA': instance.siparisYeniKaydaHazirla,
    'FATURA_YENI_KAYDA_HAZIRLA': instance.faturaYeniKaydaHazirla,
    'TALEP_TEKLIF_YENI_KAYDA_HAZIRLA': instance.talepTeklifYeniKaydaHazirla,
    'TRANSFER_YENI_KAYDA_HAZIRLA': instance.transferYeniKaydaHazirla,
    'SIPARIS_EK_ALAN': instance.siparisEkAlan,
    'SIPARIS_MIKTAR': instance.siparisMiktar,
    'SIPARIS_VADE': instance.siparisVade,
    'KURLARI_SIL_TEKRAR_GUNCELLE': instance.kurlariSilTekrarGuncelle,
    'STOK_RESIMLERI_GOSTER': instance.stokResimleriGoster,
    'STOK_YAZDIR_DIZAYN_VE_YAZICI_HATIRLA':
        instance.stokYazdirDizaynVeYaziciHatirla,
    'STOK_SECILDIGINDE_YAZDIR': instance.stokSecildigindeYazdir,
    'FINANS_OZEL_RAPOR_GRAFIK_GOSTER': instance.finansOzelRaporGrafikGoster,
    'ACIK_TEMA_MI': instance.acikTemaMi,
    'TEMA_MODU': _$ThemeModeEnumMap[instance.temaModu]!,
    'ROTA_DISI_GORUNSUN_MU': instance.rotaDisiGorunsunMu,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NET_FECT_DIZAYN_LIST', instance.netFectDizaynList?.toJson());
  writeNotNull('YAZICI_LIST', instance.yaziciList?.toJson());
  val['OLCUM_GIRISI_BELGE_TIPI'] =
      _$EditTipiEnumEnumMap[instance.olcumGirisiBelgeTipi]!;
  val['KAPALI_BELGELER_LISTELENMESIN_MI'] =
      instance.kapaliBelgelerListelenmesinMi;
  val['SAYIM_STOK_SECILDIGINDE_HEMEN_KAYDET'] =
      instance.sayimStokSecildigindeHemenKaydet;
  val['SAYIM_OTOMATIK_ETIKET_YAZDIR'] = instance.sayimOtomatikEtiketYazdir;
  val['STOK_GORUNECEK_EKSTRA_ALANLAR'] = instance.stokGorunecekEkstraAlanlar;
  val['STOK_LISTESI_GRID_SAYISI'] = instance.stokListesiGridSayisi;
  val['URUN_GRUBUNA_GORE_SATIS_RAPOR_TIPI'] =
      instance.urunGrubunaGoreSatisRaporTipi;
  val['URUN_GRUBUNA_GORE_GRUPLANSIN'] = instance.urunGrubunaGoreGruplansin;
  val['CARI_LISTESI_SIRALA'] = instance.cariListesiSirala;
  val['STOK_LISTESI_SIRALA'] = instance.stokListesiSirala;
  val['IRS_FATURALASAN_IRSALIYELER_GELSIN'] =
      instance.irsFaturalasanIrsaliyelerGelsin;
  return val;
}

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$EditTipiEnumEnumMap = {
  EditTipiEnum.musteri: 'musteri',
  EditTipiEnum.satici: 'satici',
  EditTipiEnum.satisFatura: 'satisFatura',
  EditTipiEnum.satisIrsaliye: 'satisIrsaliye',
  EditTipiEnum.alisFatura: 'alisFatura',
  EditTipiEnum.alisIrsaliye: 'alisIrsaliye',
  EditTipiEnum.satisTeklifi: 'satisTeklifi',
  EditTipiEnum.alisTalebi: 'alisTalebi',
  EditTipiEnum.satisTalebi: 'satisTalebi',
  EditTipiEnum.depoTransferi: 'depoTransferi',
  EditTipiEnum.ambarGirisi: 'ambarGirisi',
  EditTipiEnum.ambarCikisi: 'ambarCikisi',
  EditTipiEnum.cari: 'cari',
  EditTipiEnum.isEmri: 'isEmri',
  EditTipiEnum.altIsEmri: 'altIsEmri',
  EditTipiEnum.isEmriTakip: 'isEmriTakip',
  EditTipiEnum.uretimSonuKaydi: 'uretimSonuKaydi',
  EditTipiEnum.olcumdenDepoTransferi: 'olcumdenDepoTransferi',
  EditTipiEnum.uretim: 'uretim',
  EditTipiEnum.paket: 'paket',
  EditTipiEnum.belgesizIslem: 'belgesizIslem',
};
