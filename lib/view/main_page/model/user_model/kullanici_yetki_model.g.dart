// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanici_yetki_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KullaniciYetkiModelImpl _$$KullaniciYetkiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$KullaniciYetkiModelImpl(
      bagliPlasiyerler: json['bagliPlasiyerler'] as List<dynamic>?,
      eIrsOnEki: json['eIrsOnEki'] as String?,
      eIrsAmbarOnEki: json['eIrsAmbarOnEki'] as String?,
      yetkiliKasalar: (json['yetkiliKasalar'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      kkartiHesaplar: json['kkartiHesaplar'] as List<dynamic>?,
      kkartiKasalar: json['kkartiKasalar'] as List<dynamic>?,
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
    );

Map<String, dynamic> _$$KullaniciYetkiModelImplToJson(
        _$KullaniciYetkiModelImpl instance) =>
    <String, dynamic>{
      if (instance.bagliPlasiyerler case final value?)
        'bagliPlasiyerler': value,
      if (instance.eIrsOnEki case final value?) 'eIrsOnEki': value,
      if (instance.eIrsAmbarOnEki case final value?) 'eIrsAmbarOnEki': value,
      if (instance.yetkiliKasalar case final value?) 'yetkiliKasalar': value,
      if (instance.kkartiHesaplar case final value?) 'kkartiHesaplar': value,
      if (instance.kkartiKasalar case final value?) 'kkartiKasalar': value,
      if (instance.acikHesapLimiti case final value?) 'acikHesapLimiti': value,
      if (instance.acikHesapTolerans case final value?)
        'acikHesapTolerans': value,
      if (instance.acikHesapLimitiBelgeTipleri case final value?)
        'acikHesapLimitiBelgeTipleri': value,
      if (instance.stokFiltreSQLTipi case final value?)
        'stok_FiltreSQLTipi': value,
      if (instance.cariFiltreSQLTipi case final value?)
        'cari_FiltreSQLTipi': value,
      if (instance.hizliTahsilatSozlesmeKodlari case final value?)
        'hizliTahsilat_SozlesmeKodlari': value,
      if (instance.siparisMusSipEkstraAlanlar case final value?)
        'siparis_MusSip_EkstraAlanlar': value,
      if (instance.sirketAlisDepo case final value?) 'sirket_alisDepo': value,
      if (instance.sirketSatisDepo case final value?) 'sirket_satisDepo': value,
      if (instance.transferDATVarsayilanCikisDepo case final value?)
        'transfer_DAT_VarsayilanCikisDepo': value,
      if (instance.transferDATVarsayilanGirisDepo case final value?)
        'transfer_DAT_VarsayilanGirisDepo': value,
      if (instance.cariRehPlaEslesmesinBelgeTipleri case final value?)
        'cariRehPlaEslesmesinBelgeTipleri': value,
      if (instance.profilKodu case final value?) 'profilKodu': value,
      if (instance.sirketAktifDepolar case final value?)
        'sirket_aktifDepolar': value,
      if (instance.sirketDatYetkiliDepolar case final value?)
        'sirket_DAT_YetkiliDepolar': value,
      if (instance.adminMi case final value?) 'ADMIN_MI': value,
      if (instance.varsayilanPlasiyerTanimi case final value?)
        'varsayilan_PlasiyerTanimi': value,
      if (instance.siparisMusSipBakiyesizStokSecilmesin case final value?)
        'siparis_MusSip_BakiyesizStokSecilmesin': value,
      if (instance.sevkiyatSatisIrsBakiyesizStokSecilmesin case final value?)
        'sevkiyat_SatisIrs_BakiyesizStokSecilmesin': value,
      if (instance.sevkiyatSatisFatBakiyesizStokSecilmesin case final value?)
        'sevkiyat_SatisFat_BakiyesizStokSecilmesin': value,
      if (instance.plasiyerKodu case final value?) 'plasiyerKodu': value,
      if (instance.varsayilanPlasiyerKodu case final value?)
        'varsayilan_PlasiyerKodu': value,
      if (instance.kkartiTahsilatYontemi case final value?)
        'kkartiTahsilatYontemi': value,
    };
