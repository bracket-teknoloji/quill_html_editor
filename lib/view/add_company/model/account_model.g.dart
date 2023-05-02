// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountModelAdapter extends TypeAdapter<AccountModel> {
  @override
  final int typeId = 73;

  @override
  AccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountModel()
      ..isim = fields[0] as String?
      ..admin = fields[1] as String?
      ..aktifIsletmeKodu = fields[2] as int?
      ..aktifSubeKodu = fields[3] as int?
      ..aktifVeritabani = fields[4] as String?
      ..cihazSistemVersiyonu = fields[5] as String?
      ..apkDerlemeTarihi = fields[6] as DateTime?
      ..cihazDili = fields[7] as String?
      ..gCid = fields[8] as String?
      ..cihazMarkasi = fields[9] as String?
      ..cihazKimligi = fields[10] as String?
      ..cihazModeli = fields[11] as String?
      ..gDsn = fields[12] as String?
      ..cihazTarihi = fields[13] as String?
      ..cihazTarihiUtc = fields[14] as DateTime?
      ..cihazTimeZoneDakika = fields[15] as int?
      ..fcmToken = fields[16] as String?
      ..uyeEmail = fields[17] as String?
      ..uyeSifre = fields[18] as String?
      ..konumDate = fields[19] as DateTime?
      ..konumTarihi = fields[20] as String?
      ..gKa = fields[21] as String?
      ..gBo = fields[22] as String?
      ..gEn = fields[23] as String?
      ..kullaniciAdi = fields[24] as String?
      ..kuruluHesaplar = fields[25] as String?
      ..localIp = fields[26] as String?
      ..ozelCihazKimligi = fields[27] as String?
      ..offline = fields[28] as String?
      ..simOperator = fields[29] as String?
      ..paketAdi = fields[30] as String?
      ..paramMap = fields[31] as String?
      ..platform = fields[32] as String?
      ..requestVersion = fields[33] as int?
      ..soyadi = fields[34] as String?
      ..serviceVersion = fields[35] as String?
      ..tzInfo = fields[36] as String?
      ..uygulamaDili = fields[37] as String?
      ..uygulamaGuncellemeTarihi = fields[38] as String?
      ..uygulamaSurumu = fields[39] as String?
      ..uygulamaSurumKodu = fields[40] as int?
      ..uzakErisim = fields[41] as String?
      ..wifidenBagli = fields[42] as String?
      ..qrData = fields[43] as String?;
  }

  @override
  void write(BinaryWriter writer, AccountModel obj) {
    writer
      ..writeByte(44)
      ..writeByte(0)
      ..write(obj.isim)
      ..writeByte(1)
      ..write(obj.admin)
      ..writeByte(2)
      ..write(obj.aktifIsletmeKodu)
      ..writeByte(3)
      ..write(obj.aktifSubeKodu)
      ..writeByte(4)
      ..write(obj.aktifVeritabani)
      ..writeByte(5)
      ..write(obj.cihazSistemVersiyonu)
      ..writeByte(6)
      ..write(obj.apkDerlemeTarihi)
      ..writeByte(7)
      ..write(obj.cihazDili)
      ..writeByte(8)
      ..write(obj.gCid)
      ..writeByte(9)
      ..write(obj.cihazMarkasi)
      ..writeByte(10)
      ..write(obj.cihazKimligi)
      ..writeByte(11)
      ..write(obj.cihazModeli)
      ..writeByte(12)
      ..write(obj.gDsn)
      ..writeByte(13)
      ..write(obj.cihazTarihi)
      ..writeByte(14)
      ..write(obj.cihazTarihiUtc)
      ..writeByte(15)
      ..write(obj.cihazTimeZoneDakika)
      ..writeByte(16)
      ..write(obj.fcmToken)
      ..writeByte(17)
      ..write(obj.uyeEmail)
      ..writeByte(18)
      ..write(obj.uyeSifre)
      ..writeByte(19)
      ..write(obj.konumDate)
      ..writeByte(20)
      ..write(obj.konumTarihi)
      ..writeByte(21)
      ..write(obj.gKa)
      ..writeByte(22)
      ..write(obj.gBo)
      ..writeByte(23)
      ..write(obj.gEn)
      ..writeByte(24)
      ..write(obj.kullaniciAdi)
      ..writeByte(25)
      ..write(obj.kuruluHesaplar)
      ..writeByte(26)
      ..write(obj.localIp)
      ..writeByte(27)
      ..write(obj.ozelCihazKimligi)
      ..writeByte(28)
      ..write(obj.offline)
      ..writeByte(29)
      ..write(obj.simOperator)
      ..writeByte(30)
      ..write(obj.paketAdi)
      ..writeByte(31)
      ..write(obj.paramMap)
      ..writeByte(32)
      ..write(obj.platform)
      ..writeByte(33)
      ..write(obj.requestVersion)
      ..writeByte(34)
      ..write(obj.soyadi)
      ..writeByte(35)
      ..write(obj.serviceVersion)
      ..writeByte(36)
      ..write(obj.tzInfo)
      ..writeByte(37)
      ..write(obj.uygulamaDili)
      ..writeByte(38)
      ..write(obj.uygulamaGuncellemeTarihi)
      ..writeByte(39)
      ..write(obj.uygulamaSurumu)
      ..writeByte(40)
      ..write(obj.uygulamaSurumKodu)
      ..writeByte(41)
      ..write(obj.uzakErisim)
      ..writeByte(42)
      ..write(obj.wifidenBagli)
      ..writeByte(43)
      ..write(obj.qrData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
        $checkedConvert(
            'CIHAZ_KIMLIGI', (v) => val.cihazKimligi = v as String?);
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
        $checkedConvert('UYE_SIFRE', (v) => val.uyeSifre = v as String?);
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
        $checkedConvert('QR_DATA', (v) => val.qrData = v as String?);
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
        'cihazKimligi': 'CIHAZ_KIMLIGI',
        'cihazModeli': 'CIHAZ_MODELI',
        'gDsn': 'G_DSN',
        'cihazTarihi': 'CIHAZ_TARIHI',
        'cihazTarihiUtc': 'CIHAZ_TARIHI_UTC',
        'cihazTimeZoneDakika': 'CIHAZ_TIME_ZONE_DAKIKA',
        'fcmToken': 'FCM_TOKEN',
        'uyeEmail': 'UYE_EMAIL',
        'uyeSifre': 'UYE_SIFRE',
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
        'wifidenBagli': 'WIFIDEN_BAGLI',
        'qrData': 'QR_DATA'
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
      'CIHAZ_KIMLIGI': instance.cihazKimligi,
      'CIHAZ_MODELI': instance.cihazModeli,
      'G_DSN': instance.gDsn,
      'CIHAZ_TARIHI': instance.cihazTarihi,
      'CIHAZ_TARIHI_UTC': instance.cihazTarihiUtc?.toIso8601String(),
      'CIHAZ_TIME_ZONE_DAKIKA': instance.cihazTimeZoneDakika,
      'FCM_TOKEN': instance.fcmToken,
      'UYE_EMAIL': instance.uyeEmail,
      'UYE_SIFRE': instance.uyeSifre,
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
      'QR_DATA': instance.qrData,
    };

ParamMap _$ParamMapFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ParamMap',
      json,
      ($checkedConvert) {
        final val = ParamMap();
        return val;
      },
    );

Map<String, dynamic> _$ParamMapToJson(ParamMap instance) => <String, dynamic>{};
