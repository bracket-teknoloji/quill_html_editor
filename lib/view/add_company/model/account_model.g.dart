// GENERATED CODE - DO NOT MODIFY BY HAND

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

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel()
  ..isim = json['ISIM'] as String?
  ..admin = json['ADMIN'] as String?
  ..aktifIsletmeKodu = json['AKTIF_ISLETME_KODU'] as int?
  ..aktifSubeKodu = json['AKTIF_SUBE_KODU'] as int?
  ..aktifVeritabani = json['AKTIF_VERITABANI'] as String?
  ..cihazSistemVersiyonu = json['CIHAZ_SISTEM_VERSIYONU'] as String?
  ..apkDerlemeTarihi = json['APK_DERLEME_TARIHI'] == null
      ? null
      : DateTime.parse(json['APK_DERLEME_TARIHI'] as String)
  ..cihazDili = json['CIHAZ_DILI'] as String?
  ..gCid = json['G_CID'] as String?
  ..cihazMarkasi = json['CIHAZ_MARKASI'] as String?
  ..cihazKimligi = json['CIHAZ_KIMLIGI'] as String?
  ..cihazModeli = json['CIHAZ_MODELI'] as String?
  ..gDsn = json['G_DSN'] as String?
  ..cihazTarihi = json['CIHAZ_TARIHI'] as String?
  ..cihazTarihiUtc = json['CIHAZ_TARIHI_UTC'] == null
      ? null
      : DateTime.parse(json['CIHAZ_TARIHI_UTC'] as String)
  ..cihazTimeZoneDakika = json['CIHAZ_TIME_ZONE_DAKIKA'] as int?
  ..fcmToken = json['FCM_TOKEN'] as String?
  ..uyeEmail = json['UYE_EMAIL'] as String?
  ..uyeSifre = json['UYE_SIFRE'] as String?
  ..konumDate = json['KONUM_DATE'] == null
      ? null
      : DateTime.parse(json['KONUM_DATE'] as String)
  ..konumTarihi = json['KONUM_TARIHI'] as String?
  ..gKa = json['G_KA'] as String?
  ..gBo = json['G_BO'] as String?
  ..gEn = json['G_EN'] as String?
  ..kullaniciAdi = json['KULLANICI_ADI'] as String?
  ..kuruluHesaplar = json['KURULU_HESAPLAR'] as String?
  ..localIp = json['LOCAL_IP'] as String?
  ..ozelCihazKimligi = json['OZEL_CIHAZ_KIMLIGI'] as String?
  ..offline = json['OFFLINE'] as String?
  ..simOperator = json['SIM_OPERATOR'] as String?
  ..paketAdi = json['PAKET_ADI'] as String?
  ..paramMap = json['PARAM_MAP'] as String?
  ..platform = json['PLATFORM'] as String?
  ..requestVersion = json['REQUEST_VERSION'] as int?
  ..soyadi = json['SOYADI'] as String?
  ..serviceVersion = json['SERVICE_VERSION'] as String?
  ..tzInfo = json['TZ_INFO'] as String?
  ..uygulamaDili = json['UYGULAMA_DILI'] as String?
  ..uygulamaGuncellemeTarihi = json['UYGULAMA_GUNCELLEME_TARIHI'] as String?
  ..uygulamaSurumu = json['UYGULAMA_SURUMU'] as String?
  ..uygulamaSurumKodu = json['UYGULAMA_SURUM_KODU'] as int?
  ..uzakErisim = json['UZAK_ERISIM'] as String?
  ..wifidenBagli = json['WIFIDEN_BAGLI'] as String?
  ..qrData = json['QR_DATA'] as String?;

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ISIM', instance.isim);
  writeNotNull('ADMIN', instance.admin);
  writeNotNull('AKTIF_ISLETME_KODU', instance.aktifIsletmeKodu);
  writeNotNull('AKTIF_SUBE_KODU', instance.aktifSubeKodu);
  writeNotNull('AKTIF_VERITABANI', instance.aktifVeritabani);
  writeNotNull('CIHAZ_SISTEM_VERSIYONU', instance.cihazSistemVersiyonu);
  writeNotNull(
      'APK_DERLEME_TARIHI', instance.apkDerlemeTarihi?.toIso8601String());
  writeNotNull('CIHAZ_DILI', instance.cihazDili);
  writeNotNull('G_CID', instance.gCid);
  writeNotNull('CIHAZ_MARKASI', instance.cihazMarkasi);
  writeNotNull('CIHAZ_KIMLIGI', instance.cihazKimligi);
  writeNotNull('CIHAZ_MODELI', instance.cihazModeli);
  writeNotNull('G_DSN', instance.gDsn);
  writeNotNull('CIHAZ_TARIHI', instance.cihazTarihi);
  writeNotNull('CIHAZ_TARIHI_UTC', instance.cihazTarihiUtc?.toIso8601String());
  writeNotNull('CIHAZ_TIME_ZONE_DAKIKA', instance.cihazTimeZoneDakika);
  writeNotNull('FCM_TOKEN', instance.fcmToken);
  writeNotNull('UYE_EMAIL', instance.uyeEmail);
  writeNotNull('UYE_SIFRE', instance.uyeSifre);
  writeNotNull('KONUM_DATE', instance.konumDate?.toIso8601String());
  writeNotNull('KONUM_TARIHI', instance.konumTarihi);
  writeNotNull('G_KA', instance.gKa);
  writeNotNull('G_BO', instance.gBo);
  writeNotNull('G_EN', instance.gEn);
  writeNotNull('KULLANICI_ADI', instance.kullaniciAdi);
  writeNotNull('KURULU_HESAPLAR', instance.kuruluHesaplar);
  writeNotNull('LOCAL_IP', instance.localIp);
  writeNotNull('OZEL_CIHAZ_KIMLIGI', instance.ozelCihazKimligi);
  writeNotNull('OFFLINE', instance.offline);
  writeNotNull('SIM_OPERATOR', instance.simOperator);
  writeNotNull('PAKET_ADI', instance.paketAdi);
  writeNotNull('PARAM_MAP', instance.paramMap);
  writeNotNull('PLATFORM', instance.platform);
  writeNotNull('REQUEST_VERSION', instance.requestVersion);
  writeNotNull('SOYADI', instance.soyadi);
  writeNotNull('SERVICE_VERSION', instance.serviceVersion);
  writeNotNull('TZ_INFO', instance.tzInfo);
  writeNotNull('UYGULAMA_DILI', instance.uygulamaDili);
  writeNotNull('UYGULAMA_GUNCELLEME_TARIHI', instance.uygulamaGuncellemeTarihi);
  writeNotNull('UYGULAMA_SURUMU', instance.uygulamaSurumu);
  writeNotNull('UYGULAMA_SURUM_KODU', instance.uygulamaSurumKodu);
  writeNotNull('UZAK_ERISIM', instance.uzakErisim);
  writeNotNull('WIFIDEN_BAGLI', instance.wifidenBagli);
  writeNotNull('QR_DATA', instance.qrData);
  return val;
}

ParamMap _$ParamMapFromJson(Map<String, dynamic> json) => ParamMap();

Map<String, dynamic> _$ParamMapToJson(ParamMap instance) => <String, dynamic>{};
