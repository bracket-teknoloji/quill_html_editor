// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'add_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AccountModel',
      json,
      ($checkedConvert) {
        final val = AccountModel();
        $checkedConvert('ADI', (v) => val.isim = v as String?);
        $checkedConvert('ADMIN', (v) => val.admin = v as String?);
        $checkedConvert(
            'AKTIF_ISLETME_KODU', (v) => val.aktifIsletmeKodu = v as int?);
        $checkedConvert(
            'AKTIF_SUBE_KODU', (v) => val.aktifSubeKodu = v as int?);
        $checkedConvert(
            'AKTIF_VERITABANI', (v) => val.aktifVeritabani = v as String?);
        $checkedConvert('CIHAZ_SISTEM_VERSIYONU',
            (v) => val.cihazSistemVersiyonu = v as String?);
        $checkedConvert(
            'APK_DERLEME_TARIHI',
            (v) => val.apkDerlemeTarihi =
                v == null ? null : DateTime.parse(v as String));
        $checkedConvert('CIHAZ_DILI', (v) => val.cihazDili = v as String?);
        $checkedConvert('G_CID', (v) => val.gCid = v as String?);
        $checkedConvert(
            'CIHAZ_MARKASI', (v) => val.cihazMarkasi = v as String?);
        $checkedConvert('CIHAZ_MODELI', (v) => val.cihazModeli = v as String?);
        $checkedConvert('G_DSN', (v) => val.gDsn = v as String?);
        $checkedConvert('CIHAZ_TARIHI', (v) => val.cihazTarihi = v as String?);
        $checkedConvert(
            'CIHAZ_TARIHI_UTC',
            (v) => val.cihazTarihiUtc =
                v == null ? null : DateTime.parse(v as String));
        $checkedConvert('CIHAZ_TIME_ZONE_DAKIKA',
            (v) => val.cihazTimeZoneDakika = v as int?);
        $checkedConvert('FCM_TOKEN', (v) => val.fcmToken = v as String?);
        $checkedConvert('UYE_EMAIL', (v) => val.uyeEmail = v as String?);
        $checkedConvert(
            'KONUM_DATE',
            (v) =>
                val.konumDate = v == null ? null : DateTime.parse(v as String));
        $checkedConvert('KONUM_TARIHI', (v) => val.konumTarihi = v as String?);
        $checkedConvert('G_KA', (v) => val.gKa = v as String?);
        $checkedConvert('G_BO', (v) => val.gBo = v as String?);
        $checkedConvert('G_EN', (v) => val.gEn = v as String?);
        $checkedConvert(
            'KULLANICI_ADI', (v) => val.kullaniciAdi = v as String?);
        $checkedConvert(
            'KURULU_HESAPLAR', (v) => val.kuruluHesaplar = v as String?);
        $checkedConvert('LOCAL_IP', (v) => val.localIp = v as String?);
        $checkedConvert(
            'OZEL_CIHAZ_KIMLIGI', (v) => val.ozelCihazKimligi = v as String?);
        $checkedConvert('OFFLINE', (v) => val.offline = v as String?);
        $checkedConvert('SIM_OPERATOR', (v) => val.simOperator = v as String?);
        $checkedConvert('PAKET_ADI', (v) => val.paketAdi = v as String?);
        $checkedConvert('PARAM_MAP', (v) => val.paramMap = v as String?);
        $checkedConvert('PLATFORM', (v) => val.platform = v as String?);
        $checkedConvert(
            'REQUEST_VERSION', (v) => val.requestVersion = v as int?);
        $checkedConvert('SOYADI', (v) => val.soyadi = v as String?);
        $checkedConvert(
            'SERVICE_VERSION', (v) => val.serviceVersion = v as String?);
        $checkedConvert('TZ_INFO', (v) => val.tzInfo = v as String?);
        $checkedConvert(
            'UYGULAMA_DILI', (v) => val.uygulamaDili = v as String?);
        $checkedConvert('UYGULAMA_GUNCELLEME_TARIHI',
            (v) => val.uygulamaGuncellemeTarihi = v as String?);
        $checkedConvert(
            'UYGULAMA_SURUMU', (v) => val.uygulamaSurumu = v as String?);
        $checkedConvert(
            'UYGULAMA_SURUM_KODU', (v) => val.uygulamaSurumKodu = v as int?);
        $checkedConvert('UZAK_ERISIM', (v) => val.uzakErisim = v as String?);
        $checkedConvert(
            'WIFIDEN_BAGLI', (v) => val.wifidenBagli = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'isim': 'ADI',
        'admin': 'ADMIN',
        'aktifIsletmeKodu': 'AKTIF_ISLETME_KODU',
        'aktifSubeKodu': 'AKTIF_SUBE_KODU',
        'aktifVeritabani': 'AKTIF_VERITABANI',
        'cihazSistemVersiyonu': 'CIHAZ_SISTEM_VERSIYONU',
        'apkDerlemeTarihi': 'APK_DERLEME_TARIHI',
        'cihazDili': 'CIHAZ_DILI',
        'gCid': 'G_CID',
        'cihazMarkasi': 'CIHAZ_MARKASI',
        'cihazModeli': 'CIHAZ_MODELI',
        'gDsn': 'G_DSN',
        'cihazTarihi': 'CIHAZ_TARIHI',
        'cihazTarihiUtc': 'CIHAZ_TARIHI_UTC',
        'cihazTimeZoneDakika': 'CIHAZ_TIME_ZONE_DAKIKA',
        'fcmToken': 'FCM_TOKEN',
        'uyeEmail': 'UYE_EMAIL',
        'konumDate': 'KONUM_DATE',
        'konumTarihi': 'KONUM_TARIHI',
        'gKa': 'G_KA',
        'gBo': 'G_BO',
        'gEn': 'G_EN',
        'kullaniciAdi': 'KULLANICI_ADI',
        'kuruluHesaplar': 'KURULU_HESAPLAR',
        'localIp': 'LOCAL_IP',
        'ozelCihazKimligi': 'OZEL_CIHAZ_KIMLIGI',
        'offline': 'OFFLINE',
        'simOperator': 'SIM_OPERATOR',
        'paketAdi': 'PAKET_ADI',
        'paramMap': 'PARAM_MAP',
        'platform': 'PLATFORM',
        'requestVersion': 'REQUEST_VERSION',
        'soyadi': 'SOYADI',
        'serviceVersion': 'SERVICE_VERSION',
        'tzInfo': 'TZ_INFO',
        'uygulamaDili': 'UYGULAMA_DILI',
        'uygulamaGuncellemeTarihi': 'UYGULAMA_GUNCELLEME_TARIHI',
        'uygulamaSurumu': 'UYGULAMA_SURUMU',
        'uygulamaSurumKodu': 'UYGULAMA_SURUM_KODU',
        'uzakErisim': 'UZAK_ERISIM',
        'wifidenBagli': 'WIFIDEN_BAGLI'
      },
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'ADI': instance.isim,
      'ADMIN': instance.admin,
      'AKTIF_ISLETME_KODU': instance.aktifIsletmeKodu,
      'AKTIF_SUBE_KODU': instance.aktifSubeKodu,
      'AKTIF_VERITABANI': instance.aktifVeritabani,
      'CIHAZ_SISTEM_VERSIYONU': instance.cihazSistemVersiyonu,
      'APK_DERLEME_TARIHI': instance.apkDerlemeTarihi?.toIso8601String(),
      'CIHAZ_DILI': instance.cihazDili,
      'G_CID': instance.gCid,
      'CIHAZ_MARKASI': instance.cihazMarkasi,
      'CIHAZ_MODELI': instance.cihazModeli,
      'G_DSN': instance.gDsn,
      'CIHAZ_TARIHI': instance.cihazTarihi,
      'CIHAZ_TARIHI_UTC': instance.cihazTarihiUtc?.toIso8601String(),
      'CIHAZ_TIME_ZONE_DAKIKA': instance.cihazTimeZoneDakika,
      'FCM_TOKEN': instance.fcmToken,
      'UYE_EMAIL': instance.uyeEmail,
      'KONUM_DATE': instance.konumDate?.toIso8601String(),
      'KONUM_TARIHI': instance.konumTarihi,
      'G_KA': instance.gKa,
      'G_BO': instance.gBo,
      'G_EN': instance.gEn,
      'KULLANICI_ADI': instance.kullaniciAdi,
      'KURULU_HESAPLAR': instance.kuruluHesaplar,
      'LOCAL_IP': instance.localIp,
      'OZEL_CIHAZ_KIMLIGI': instance.ozelCihazKimligi,
      'OFFLINE': instance.offline,
      'SIM_OPERATOR': instance.simOperator,
      'PAKET_ADI': instance.paketAdi,
      'PARAM_MAP': instance.paramMap,
      'PLATFORM': instance.platform,
      'REQUEST_VERSION': instance.requestVersion,
      'SOYADI': instance.soyadi,
      'SERVICE_VERSION': instance.serviceVersion,
      'TZ_INFO': instance.tzInfo,
      'UYGULAMA_DILI': instance.uygulamaDili,
      'UYGULAMA_GUNCELLEME_TARIHI': instance.uygulamaGuncellemeTarihi,
      'UYGULAMA_SURUMU': instance.uygulamaSurumu,
      'UYGULAMA_SURUM_KODU': instance.uygulamaSurumKodu,
      'UZAK_ERISIM': instance.uzakErisim,
      'WIFIDEN_BAGLI': instance.wifidenBagli,
    };
