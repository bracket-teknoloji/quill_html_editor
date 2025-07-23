// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountModelAdapter extends TypeAdapter<AccountModel> {
  @override
  final typeId = 73;

  @override
  AccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountModel()
      ..isim = fields[0] as String?
      ..admin = fields[1] as String?
      ..aktifIsletmeKodu = (fields[2] as num?)?.toInt()
      ..aktifSubeKodu = (fields[3] as num?)?.toInt()
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
      ..cihazTimeZoneDakika = (fields[15] as num?)?.toInt()
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
      ..paramMap = (fields[31] as Map?)?.cast<String, dynamic>()
      ..platform = fields[32] as String?
      ..requestVersion = (fields[33] as num?)?.toInt()
      ..soyadi = fields[34] as String?
      ..serviceVersion = fields[35] as String?
      ..tzInfo = fields[36] as String?
      ..uygulamaDili = fields[37] as String?
      ..uygulamaGuncellemeTarihi = fields[38] as String?
      ..uygulamaSurumu = fields[39] as String?
      ..uygulamaSurumKodu = (fields[40] as num?)?.toInt()
      ..uzakErisim = fields[41] as String?
      ..wifidenBagli = fields[42] as String?
      ..qrData = fields[43] as String?
      ..debugMu = fields[44] as bool?
      ..adi = fields[45] as String?
      ..wifiAdi = fields[46] as String?
      ..debug = fields[47] as String?
      ..girisTarihi = fields[48] as DateTime?
      ..sonKullanimTarihi = fields[49] as DateTime?
      ..onayli = fields[50] as String?
      ..konumEnlem = fields[51] as String?
      ..konumBoylam = fields[52] as String?;
  }

  @override
  void write(BinaryWriter writer, AccountModel obj) {
    writer
      ..writeByte(53)
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
      ..write(obj.qrData)
      ..writeByte(44)
      ..write(obj.debugMu)
      ..writeByte(45)
      ..write(obj.adi)
      ..writeByte(46)
      ..write(obj.wifiAdi)
      ..writeByte(47)
      ..write(obj.debug)
      ..writeByte(48)
      ..write(obj.girisTarihi)
      ..writeByte(49)
      ..write(obj.sonKullanimTarihi)
      ..writeByte(50)
      ..write(obj.onayli)
      ..writeByte(51)
      ..write(obj.konumEnlem)
      ..writeByte(52)
      ..write(obj.konumBoylam);
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
  ..aktifIsletmeKodu = (json['AKTIF_ISLETME_KODU'] as num?)?.toInt()
  ..aktifSubeKodu = (json['AKTIF_SUBE_KODU'] as num?)?.toInt()
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
  ..cihazTimeZoneDakika = (json['CIHAZ_TIME_ZONE_DAKIKA'] as num?)?.toInt()
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
  ..paramMap = json['PARAM_MAP'] as Map<String, dynamic>? ?? {}
  ..platform = json['PLATFORM'] as String?
  ..requestVersion = (json['REQUEST_VERSION'] as num?)?.toInt()
  ..soyadi = json['SOYADI'] as String?
  ..serviceVersion = json['SERVICE_VERSION'] as String?
  ..tzInfo = json['TZ_INFO'] as String?
  ..uygulamaDili = json['UYGULAMA_DILI'] as String?
  ..uygulamaGuncellemeTarihi = json['UYGULAMA_GUNCELLEME_TARIHI'] as String?
  ..uygulamaSurumu = json['UYGULAMA_SURUMU'] as String?
  ..uygulamaSurumKodu = (json['UYGULAMA_SURUM_KODU'] as num?)?.toInt()
  ..uzakErisim = json['UZAK_ERISIM'] as String?
  ..wifidenBagli = json['WIFIDEN_BAGLI'] as String?
  ..qrData = json['QR_DATA'] as String?
  ..debugMu = json['DEBUG_MU'] as bool?
  ..adi = json['ADI'] as String?
  ..wifiAdi = json['WIFI_ADI'] as String?
  ..debug = json['DEBUG'] as String?
  ..girisTarihi = json['GIRIS_TARIHI'] == null
      ? null
      : DateTime.parse(json['GIRIS_TARIHI'] as String)
  ..sonKullanimTarihi = json['SON_KULLANIM_TARIHI'] == null
      ? null
      : DateTime.parse(json['SON_KULLANIM_TARIHI'] as String)
  ..onayli = json['ONAYLI'] as String?
  ..konumEnlem = json['KONUM_ENLEM'] as String?
  ..konumBoylam = json['KONUM_BOYLAM'] as String?;

Map<String, dynamic> _$AccountModelToJson(
  AccountModel instance,
) => <String, dynamic>{
  if (instance.isim case final value?) 'ISIM': value,
  if (instance.admin case final value?) 'ADMIN': value,
  if (instance.aktifIsletmeKodu case final value?) 'AKTIF_ISLETME_KODU': value,
  if (instance.aktifSubeKodu case final value?) 'AKTIF_SUBE_KODU': value,
  if (instance.aktifVeritabani case final value?) 'AKTIF_VERITABANI': value,
  if (instance.cihazSistemVersiyonu case final value?)
    'CIHAZ_SISTEM_VERSIYONU': value,
  if (instance.apkDerlemeTarihi?.toIso8601String() case final value?)
    'APK_DERLEME_TARIHI': value,
  if (instance.cihazDili case final value?) 'CIHAZ_DILI': value,
  if (instance.gCid case final value?) 'G_CID': value,
  if (instance.cihazMarkasi case final value?) 'CIHAZ_MARKASI': value,
  if (instance.cihazKimligi case final value?) 'CIHAZ_KIMLIGI': value,
  if (instance.cihazModeli case final value?) 'CIHAZ_MODELI': value,
  if (instance.gDsn case final value?) 'G_DSN': value,
  if (instance.cihazTarihi case final value?) 'CIHAZ_TARIHI': value,
  if (instance.cihazTarihiUtc?.toIso8601String() case final value?)
    'CIHAZ_TARIHI_UTC': value,
  if (instance.cihazTimeZoneDakika case final value?)
    'CIHAZ_TIME_ZONE_DAKIKA': value,
  if (instance.fcmToken case final value?) 'FCM_TOKEN': value,
  if (instance.uyeEmail case final value?) 'UYE_EMAIL': value,
  if (instance.uyeSifre case final value?) 'UYE_SIFRE': value,
  if (instance.konumDate?.toIso8601String() case final value?)
    'KONUM_DATE': value,
  if (instance.konumTarihi case final value?) 'KONUM_TARIHI': value,
  if (instance.gKa case final value?) 'G_KA': value,
  if (instance.gBo case final value?) 'G_BO': value,
  if (instance.gEn case final value?) 'G_EN': value,
  if (instance.kullaniciAdi case final value?) 'KULLANICI_ADI': value,
  if (instance.kuruluHesaplar case final value?) 'KURULU_HESAPLAR': value,
  if (instance.localIp case final value?) 'LOCAL_IP': value,
  if (instance.ozelCihazKimligi case final value?) 'OZEL_CIHAZ_KIMLIGI': value,
  if (instance.offline case final value?) 'OFFLINE': value,
  if (instance.simOperator case final value?) 'SIM_OPERATOR': value,
  if (instance.paketAdi case final value?) 'PAKET_ADI': value,
  if (instance.paramMap case final value?) 'PARAM_MAP': value,
  if (instance.platform case final value?) 'PLATFORM': value,
  if (instance.requestVersion case final value?) 'REQUEST_VERSION': value,
  if (instance.soyadi case final value?) 'SOYADI': value,
  if (instance.serviceVersion case final value?) 'SERVICE_VERSION': value,
  if (instance.tzInfo case final value?) 'TZ_INFO': value,
  if (instance.uygulamaDili case final value?) 'UYGULAMA_DILI': value,
  if (instance.uygulamaGuncellemeTarihi case final value?)
    'UYGULAMA_GUNCELLEME_TARIHI': value,
  if (instance.uygulamaSurumu case final value?) 'UYGULAMA_SURUMU': value,
  if (instance.uygulamaSurumKodu case final value?)
    'UYGULAMA_SURUM_KODU': value,
  if (instance.uzakErisim case final value?) 'UZAK_ERISIM': value,
  if (instance.wifidenBagli case final value?) 'WIFIDEN_BAGLI': value,
  if (instance.qrData case final value?) 'QR_DATA': value,
  if (instance.debugMu case final value?) 'DEBUG_MU': value,
  if (instance.adi case final value?) 'ADI': value,
  if (instance.wifiAdi case final value?) 'WIFI_ADI': value,
  if (instance.debug case final value?) 'DEBUG': value,
  if (instance.girisTarihi?.toIso8601String() case final value?)
    'GIRIS_TARIHI': value,
  if (instance.sonKullanimTarihi?.toIso8601String() case final value?)
    'SON_KULLANIM_TARIHI': value,
  if (instance.onayli case final value?) 'ONAYLI': value,
  if (instance.konumEnlem case final value?) 'KONUM_ENLEM': value,
  if (instance.konumBoylam case final value?) 'KONUM_BOYLAM': value,
};
