// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanici_yetki_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KullaniciYetkiModel _$KullaniciYetkiModelFromJson(Map<String, dynamic> json) =>
    _KullaniciYetkiModel(
      bagliPlasiyerler: (json['bagliPlasiyerler'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      eIrsOnEki: json['eIrsOnEki'] as String?,
      eIrsAmbarOnEki: json['eIrsAmbarOnEki'] as String?,
      yetkiliKasalar: (json['yetkiliKasalar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      kkartiHesaplar: (json['kkartiHesaplar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      kkartiKasalar: (json['kkartiKasalar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      acikHesapLimiti: (json['acikHesapLimiti'] as num?)?.toDouble(),
      acikHesapTolerans: (json['acikHesapTolerans'] as num?)?.toDouble(),
      acikHesapLimitiBelgeTipleri:
          json['acikHesapLimitiBelgeTipleri'] as List<dynamic>?,
      stokFiltreSQLTipi: json['stok_FiltreSQLTipi'] as String?,
      cariFiltreSQLTipi: json['cari_FiltreSQLTipi'] as String?,
      hizliTahsilatSozlesmeKodlari:
          json['hizliTahsilat_SozlesmeKodlari'] as List<dynamic>?,
      siparisMusSipEkstraAlanlar:
          json['siparis_MusSip_EkstraAlanlar'] as List<dynamic>?,
      sirketAlisDepo: (json['sirket_alisDepo'] as num?)?.toInt(),
      sirketSatisDepo: (json['sirket_satisDepo'] as num?)?.toInt(),
      transferDATVarsayilanCikisDepo:
          (json['transfer_DAT_VarsayilanCikisDepo'] as num?)?.toInt(),
      transferDATVarsayilanGirisDepo:
          (json['transfer_DAT_VarsayilanGirisDepo'] as num?)?.toInt(),
      cariRehPlaEslesmesinBelgeTipleri:
          json['cariRehPlaEslesmesinBelgeTipleri'] as List<dynamic>?,
      profilKodu: json['profilKodu'] as String?,
      sirketAktifDepolar: (json['sirket_aktifDepolar'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      sirketDatYetkiliDepolar:
          (json['sirket_DAT_YetkiliDepolar'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      adminMi: json['ADMIN_MI'] as bool?,
      varsayilanPlasiyerTanimi: json['varsayilan_PlasiyerTanimi'] as String?,
      siparisMusSipBakiyesizStokSecilmesin:
          json['siparis_MusSip_BakiyesizStokSecilmesin'] as bool?,
      sevkiyatSatisIrsBakiyesizStokSecilmesin:
          json['sevkiyat_SatisIrs_BakiyesizStokSecilmesin'] as bool?,
      sevkiyatSatisFatBakiyesizStokSecilmesin:
          json['sevkiyat_SatisFat_BakiyesizStokSecilmesin'] as bool?,
      plasiyerKodu: json['plasiyerKodu'] as String?,
      varsayilanPlasiyerKodu: json['varsayilan_PlasiyerKodu'] as String?,
      kkartiTahsilatYontemi: json['kkartiTahsilatYontemi'] as String?,
      satIrsOnEki: json['satIrsOnEki'] as String?,
      varsayilanNakitKasa: json['varsayilanNakitKasa'] as String?,
      sirketDepoYetkiTuru: json['sirket_Depo_YetkiTuru'] as String?,
      varsayilanProjeTanimi: json['varsayilan_ProjeTanimi'] as String?,
      varsayilanProjeKodu: json['varsayilan_ProjeKodu'] as String?,
      varsayilanKrediKartiKasa: json['varsayilanKrediKartiKasa'] as String?,
      varsayilanMuhasebeReferansTanimi:
          json['varsayilan_MuhasebeReferansTanimi'] as String?,
      varsayilanMuhasebeReferansKodu:
          json['varsayilan_MuhasebeReferansKodu'] as String?,
      satSipOnEki: json['satSipOnEki'] as String?,
      musSipOnEki: json['musSipOnEki'] as String?,
      alIrsOnEki: json['alIrsOnEki'] as String?,
      eFatOnEki: json['eFatOnEki'] as String?,
      eArvOnEki: json['eArvOnEki'] as String?,
      satAlmTalOnEki: json['satAlmTalOnEki'] as String?,
      satisTalOnEki: json['satisTalOnEki'] as String?,
      satAlmTekOnEki: json['satAlmTekOnEki'] as String?,
      satisTekOnEki: json['satisTekOnEki'] as String?,
      tahsilatOnEki: json['tahsilatOnEki'] as String?,
      sevkEmriOnEki: json['sevkEmriOnEki'] as String?,
      kkTahsilatOnEki: json['kkTahsilatOnEki'] as String?,
      eIrsDatOnEki: json['eIrsDATOnEki'] as String?,
      datOnEki: json['DATOnEki'] as String?,
      ambarCikisOnEki: json['ambarCikisOnEki'] as String?,
      ambarGirisOnEki: json['ambarGirisOnEki'] as String?,
      cariOnEki: json['cariOnEki'] as String?,
      uskOnEki: json['uskOnEki'] as String?,
      alisFatOnEki: json['alisFatOnEki'] as String?,
      satisFatOnEki: json['satisFatOnEki'] as String?,
      dekSeriCekTahsil: json['dekSeri_CekTahsil'] as String?,
      dekSeriKKartiTahsilati: json['dekSeri_KKartiTahsilati'] as String?,
      dekSeriCariEft: json['dekSeri_CariEFT'] as String?,
      dekSeriHesArasiVirman: json['dekSeri_HesArasiVirman'] as String?,
      dekSeriHesArasiEft: json['dekSeri_HesArasiEFT'] as String?,
      dekSeriCariVirman: json['dekSeri_CariVirman'] as String?,
    );

Map<String, dynamic> _$KullaniciYetkiModelToJson(
  _KullaniciYetkiModel instance,
) => <String, dynamic>{
  'bagliPlasiyerler': ?instance.bagliPlasiyerler,
  'eIrsOnEki': ?instance.eIrsOnEki,
  'eIrsAmbarOnEki': ?instance.eIrsAmbarOnEki,
  'yetkiliKasalar': ?instance.yetkiliKasalar,
  'kkartiHesaplar': ?instance.kkartiHesaplar,
  'kkartiKasalar': ?instance.kkartiKasalar,
  'acikHesapLimiti': ?instance.acikHesapLimiti,
  'acikHesapTolerans': ?instance.acikHesapTolerans,
  'acikHesapLimitiBelgeTipleri': ?instance.acikHesapLimitiBelgeTipleri,
  'stok_FiltreSQLTipi': ?instance.stokFiltreSQLTipi,
  'cari_FiltreSQLTipi': ?instance.cariFiltreSQLTipi,
  'hizliTahsilat_SozlesmeKodlari': ?instance.hizliTahsilatSozlesmeKodlari,
  'siparis_MusSip_EkstraAlanlar': ?instance.siparisMusSipEkstraAlanlar,
  'sirket_alisDepo': ?instance.sirketAlisDepo,
  'sirket_satisDepo': ?instance.sirketSatisDepo,
  'transfer_DAT_VarsayilanCikisDepo': ?instance.transferDATVarsayilanCikisDepo,
  'transfer_DAT_VarsayilanGirisDepo': ?instance.transferDATVarsayilanGirisDepo,
  'cariRehPlaEslesmesinBelgeTipleri':
      ?instance.cariRehPlaEslesmesinBelgeTipleri,
  'profilKodu': ?instance.profilKodu,
  'sirket_aktifDepolar': ?instance.sirketAktifDepolar,
  'sirket_DAT_YetkiliDepolar': ?instance.sirketDatYetkiliDepolar,
  'ADMIN_MI': ?instance.adminMi,
  'varsayilan_PlasiyerTanimi': ?instance.varsayilanPlasiyerTanimi,
  'siparis_MusSip_BakiyesizStokSecilmesin':
      ?instance.siparisMusSipBakiyesizStokSecilmesin,
  'sevkiyat_SatisIrs_BakiyesizStokSecilmesin':
      ?instance.sevkiyatSatisIrsBakiyesizStokSecilmesin,
  'sevkiyat_SatisFat_BakiyesizStokSecilmesin':
      ?instance.sevkiyatSatisFatBakiyesizStokSecilmesin,
  'plasiyerKodu': ?instance.plasiyerKodu,
  'varsayilan_PlasiyerKodu': ?instance.varsayilanPlasiyerKodu,
  'kkartiTahsilatYontemi': ?instance.kkartiTahsilatYontemi,
  'satIrsOnEki': ?instance.satIrsOnEki,
  'varsayilanNakitKasa': ?instance.varsayilanNakitKasa,
  'sirket_Depo_YetkiTuru': ?instance.sirketDepoYetkiTuru,
  'varsayilan_ProjeTanimi': ?instance.varsayilanProjeTanimi,
  'varsayilan_ProjeKodu': ?instance.varsayilanProjeKodu,
  'varsayilanKrediKartiKasa': ?instance.varsayilanKrediKartiKasa,
  'varsayilan_MuhasebeReferansTanimi':
      ?instance.varsayilanMuhasebeReferansTanimi,
  'varsayilan_MuhasebeReferansKodu': ?instance.varsayilanMuhasebeReferansKodu,
  'satSipOnEki': ?instance.satSipOnEki,
  'musSipOnEki': ?instance.musSipOnEki,
  'alIrsOnEki': ?instance.alIrsOnEki,
  'eFatOnEki': ?instance.eFatOnEki,
  'eArvOnEki': ?instance.eArvOnEki,
  'satAlmTalOnEki': ?instance.satAlmTalOnEki,
  'satisTalOnEki': ?instance.satisTalOnEki,
  'satAlmTekOnEki': ?instance.satAlmTekOnEki,
  'satisTekOnEki': ?instance.satisTekOnEki,
  'tahsilatOnEki': ?instance.tahsilatOnEki,
  'sevkEmriOnEki': ?instance.sevkEmriOnEki,
  'kkTahsilatOnEki': ?instance.kkTahsilatOnEki,
  'eIrsDATOnEki': ?instance.eIrsDatOnEki,
  'DATOnEki': ?instance.datOnEki,
  'ambarCikisOnEki': ?instance.ambarCikisOnEki,
  'ambarGirisOnEki': ?instance.ambarGirisOnEki,
  'cariOnEki': ?instance.cariOnEki,
  'uskOnEki': ?instance.uskOnEki,
  'alisFatOnEki': ?instance.alisFatOnEki,
  'satisFatOnEki': ?instance.satisFatOnEki,
  'dekSeri_CekTahsil': ?instance.dekSeriCekTahsil,
  'dekSeri_KKartiTahsilati': ?instance.dekSeriKKartiTahsilati,
  'dekSeri_CariEFT': ?instance.dekSeriCariEft,
  'dekSeri_HesArasiVirman': ?instance.dekSeriHesArasiVirman,
  'dekSeri_HesArasiEFT': ?instance.dekSeriHesArasiEft,
  'dekSeri_CariVirman': ?instance.dekSeriCariVirman,
};
