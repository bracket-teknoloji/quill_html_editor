// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kullanici_yetki_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KullaniciYetkiModelImpl _$$KullaniciYetkiModelImplFromJson(Map<String, dynamic> json) => _$KullaniciYetkiModelImpl(
      bagliPlasiyerler: json['bagliPlasiyerler'] as List<dynamic>?,
      eIrsOnEki: json['eIrsOnEki'] as String?,
      eIrsAmbarOnEki: json['eIrsAmbarOnEki'] as String?,
      yetkiliKasalar: (json['yetkiliKasalar'] as List<dynamic>?)?.map((e) => e as String).toList(),
      kkartiHesaplar: json['kkartiHesaplar'] as List<dynamic>?,
      kkartiKasalar: json['kkartiKasalar'] as List<dynamic>?,
      acikHesapLimiti: (json['acikHesapLimiti'] as num?)?.toDouble(),
      acikHesapTolerans: (json['acikHesapTolerans'] as num?)?.toDouble(),
      acikHesapLimitiBelgeTipleri: json['acikHesapLimitiBelgeTipleri'] as List<dynamic>?,
      stokFiltreSQLTipi: json['stok_FiltreSQLTipi'] as String?,
      cariFiltreSQLTipi: json['cari_FiltreSQLTipi'] as String?,
      hizliTahsilatSozlesmeKodlari: json['hizliTahsilat_SozlesmeKodlari'] as List<dynamic>?,
      siparisMusSipEkstraAlanlar: json['siparis_MusSip_EkstraAlanlar'] as List<dynamic>?,
      sirketAlisDepo: json['sirket_alisDepo'] as int?,
      sirketSatisDepo: json['sirket_satisDepo'] as int?,
      transferDATVarsayilanCikisDepo: json['transfer_DAT_VarsayilanCikisDepo'] as int?,
      transferDATVarsayilanGirisDepo: json['transfer_DAT_VarsayilanGirisDepo'] as int?,
      cariRehPlaEslesmesinBelgeTipleri: json['cariRehPlaEslesmesinBelgeTipleri'] as List<dynamic>?,
      profilKodu: json['profilKodu'] as String?,
      sirketAktifDepolar: (json['sirket_aktifDepolar'] as List<dynamic>?)?.map((e) => e as int).toList(),
      sirketDatYetkiliDepolar: (json['sirket_DAT_YetkiliDepolar'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$KullaniciYetkiModelImplToJson(_$KullaniciYetkiModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bagliPlasiyerler', instance.bagliPlasiyerler);
  writeNotNull('eIrsOnEki', instance.eIrsOnEki);
  writeNotNull('eIrsAmbarOnEki', instance.eIrsAmbarOnEki);
  writeNotNull('yetkiliKasalar', instance.yetkiliKasalar);
  writeNotNull('kkartiHesaplar', instance.kkartiHesaplar);
  writeNotNull('kkartiKasalar', instance.kkartiKasalar);
  writeNotNull('acikHesapLimiti', instance.acikHesapLimiti);
  writeNotNull('acikHesapTolerans', instance.acikHesapTolerans);
  writeNotNull('acikHesapLimitiBelgeTipleri', instance.acikHesapLimitiBelgeTipleri);
  writeNotNull('stok_FiltreSQLTipi', instance.stokFiltreSQLTipi);
  writeNotNull('cari_FiltreSQLTipi', instance.cariFiltreSQLTipi);
  writeNotNull('hizliTahsilat_SozlesmeKodlari', instance.hizliTahsilatSozlesmeKodlari);
  writeNotNull('siparis_MusSip_EkstraAlanlar', instance.siparisMusSipEkstraAlanlar);
  writeNotNull('sirket_alisDepo', instance.sirketAlisDepo);
  writeNotNull('sirket_satisDepo', instance.sirketSatisDepo);
  writeNotNull('transfer_DAT_VarsayilanCikisDepo', instance.transferDATVarsayilanCikisDepo);
  writeNotNull('transfer_DAT_VarsayilanGirisDepo', instance.transferDATVarsayilanGirisDepo);
  writeNotNull('cariRehPlaEslesmesinBelgeTipleri', instance.cariRehPlaEslesmesinBelgeTipleri);
  writeNotNull('profilKodu', instance.profilKodu);
  writeNotNull('sirket_aktifDepolar', instance.sirketAktifDepolar);
  writeNotNull('sirket_DAT_YetkiliDepolar', instance.sirketDatYetkiliDepolar);
  return val;
}
