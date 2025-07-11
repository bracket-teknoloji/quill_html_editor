// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountResponseModelAdapter extends TypeAdapter<AccountResponseModel> {
  @override
  final typeId = 123;

  @override
  AccountResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountResponseModel()
      ..firma = fields[0] as String?
      ..email = fields[1] as String?
      ..parola = fields[2] as String?
      ..pickerLisansiVar = fields[3] as String?
      ..wsLan = fields[4] as String?
      ..wsWan = fields[5] as String?
      ..webServis = fields[6] as String?
      ..lisansBitisTarihi = fields[7] as dynamic
      ..kullaniciSayisi = (fields[8] as num?)?.toInt()
      ..firmaKisaAdi = fields[9] as String?
      ..sozlesmeBitisTarihi = fields[10] as dynamic
      ..sozlesmeBitisKalanGun = (fields[11] as num?)?.toInt()
      ..karsilamaMesaji = fields[12] as String?
      ..karsilamaResimUrl = fields[13] as String?
      ..karsilamaSaniye = (fields[14] as num?)?.toInt()
      ..guncellemeVarmi = fields[15] as bool?
      ..maxApkVersion = (fields[16] as num?)?.toInt()
      ..maxWsVersion = fields[17] as String?
      ..demoBitisTarihi = fields[18] as dynamic
      ..uzaktanMi = fields[19] as bool?
      ..serviceDebug = fields[20] as bool?
      ..bayiKodu = fields[21] as dynamic
      ..bayiEmail = fields[22] as String?
      ..bayiUnvan = fields[23] as String?
      ..bracketCihazi = fields[24] as bool?
      ..sozlesmeUyarisi = fields[25] as bool?
      ..sozlesmeUyarisiGoster = fields[26] as bool?
      ..karsilamaBaslik = fields[27] as String?
      ..sozlesmeTeklifGoster = fields[28] as bool?;
  }

  @override
  void write(BinaryWriter writer, AccountResponseModel obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.firma)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.parola)
      ..writeByte(3)
      ..write(obj.pickerLisansiVar)
      ..writeByte(4)
      ..write(obj.wsLan)
      ..writeByte(5)
      ..write(obj.wsWan)
      ..writeByte(6)
      ..write(obj.webServis)
      ..writeByte(7)
      ..write(obj.lisansBitisTarihi)
      ..writeByte(8)
      ..write(obj.kullaniciSayisi)
      ..writeByte(9)
      ..write(obj.firmaKisaAdi)
      ..writeByte(10)
      ..write(obj.sozlesmeBitisTarihi)
      ..writeByte(11)
      ..write(obj.sozlesmeBitisKalanGun)
      ..writeByte(12)
      ..write(obj.karsilamaMesaji)
      ..writeByte(13)
      ..write(obj.karsilamaResimUrl)
      ..writeByte(14)
      ..write(obj.karsilamaSaniye)
      ..writeByte(15)
      ..write(obj.guncellemeVarmi)
      ..writeByte(16)
      ..write(obj.maxApkVersion)
      ..writeByte(17)
      ..write(obj.maxWsVersion)
      ..writeByte(18)
      ..write(obj.demoBitisTarihi)
      ..writeByte(19)
      ..write(obj.uzaktanMi)
      ..writeByte(20)
      ..write(obj.serviceDebug)
      ..writeByte(21)
      ..write(obj.bayiKodu)
      ..writeByte(22)
      ..write(obj.bayiEmail)
      ..writeByte(23)
      ..write(obj.bayiUnvan)
      ..writeByte(24)
      ..write(obj.bracketCihazi)
      ..writeByte(25)
      ..write(obj.sozlesmeUyarisi)
      ..writeByte(26)
      ..write(obj.sozlesmeUyarisiGoster)
      ..writeByte(27)
      ..write(obj.karsilamaBaslik)
      ..writeByte(28)
      ..write(obj.sozlesmeTeklifGoster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountResponseModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountResponseModel _$AccountResponseModelFromJson(
  Map<String, dynamic> json,
) => AccountResponseModel()
  ..firma = json['FIRMA'] as String?
  ..email = json['EMAIL'] as String?
  ..parola = json['PAROLA'] as String?
  ..pickerLisansiVar = json['PICKER_LISANSI_VAR'] as String?
  ..wsLan = json['WS_LAN'] as String?
  ..wsWan = json['WS_WAN'] as String?
  ..webServis = json['WEB_SERVIS'] as String?
  ..lisansBitisTarihi = json['LISANS_BITIS_TARIHI']
  ..kullaniciSayisi = (json['KULLANICI_SAYISI'] as num?)?.toInt()
  ..firmaKisaAdi = json['FIRMA_KISA_ADI'] as String?
  ..sozlesmeBitisTarihi = json['SOZLESME_BITIS_TARIHI']
  ..sozlesmeBitisKalanGun = (json['SOZLESME_BITIS_KALAN_GUN'] as num?)?.toInt()
  ..karsilamaMesaji = json['KARSILAMA_MESAJI'] as String?
  ..karsilamaResimUrl = json['KARSILAMA_RESIM_URL'] as String?
  ..karsilamaSaniye = (json['KARSILAMA_SANIYE'] as num?)?.toInt()
  ..guncellemeVarmi = json['GUNCELLEME_VARMI'] as bool?
  ..maxApkVersion = (json['MAX_APK_VERSION'] as num?)?.toInt()
  ..maxWsVersion = json['MAX_WS_VERSION'] as String?
  ..demoBitisTarihi = json['DEMO_BITIS_TARIHI']
  ..uzaktanMi = json['UZAKTAN_MI'] as bool? ?? true
  ..serviceDebug = json['SERVICE_DEBUG'] as bool?
  ..bayiKodu = json['BAYI_KODU']
  ..bayiEmail = json['BAYI_EMAIL'] as String?
  ..bayiUnvan = json['BAYI_UNVAN'] as String?
  ..bracketCihazi = json['BRACKET_CIHAZI'] as bool?
  ..sozlesmeUyarisi = json['SOZLESME_UYARISI'] as bool?
  ..sozlesmeUyarisiGoster = json['SOZLESME_UYARISI_GOSTER'] as bool?
  ..karsilamaBaslik = json['KARSILAMA_BASLIK'] as String?
  ..sozlesmeTeklifGoster = json['SOZLESME_TEKLIF_GOSTER'] as bool?;

Map<String, dynamic> _$AccountResponseModelToJson(
  AccountResponseModel instance,
) => <String, dynamic>{
  if (instance.firma case final value?) 'FIRMA': value,
  if (instance.email case final value?) 'EMAIL': value,
  if (instance.parola case final value?) 'PAROLA': value,
  if (instance.pickerLisansiVar case final value?) 'PICKER_LISANSI_VAR': value,
  if (instance.wsLan case final value?) 'WS_LAN': value,
  if (instance.wsWan case final value?) 'WS_WAN': value,
  if (instance.webServis case final value?) 'WEB_SERVIS': value,
  if (instance.lisansBitisTarihi case final value?) 'LISANS_BITIS_TARIHI': value,
  if (instance.kullaniciSayisi case final value?) 'KULLANICI_SAYISI': value,
  if (instance.firmaKisaAdi case final value?) 'FIRMA_KISA_ADI': value,
  if (instance.sozlesmeBitisTarihi case final value?) 'SOZLESME_BITIS_TARIHI': value,
  if (instance.sozlesmeBitisKalanGun case final value?) 'SOZLESME_BITIS_KALAN_GUN': value,
  if (instance.karsilamaMesaji case final value?) 'KARSILAMA_MESAJI': value,
  if (instance.karsilamaResimUrl case final value?) 'KARSILAMA_RESIM_URL': value,
  if (instance.karsilamaSaniye case final value?) 'KARSILAMA_SANIYE': value,
  if (instance.guncellemeVarmi case final value?) 'GUNCELLEME_VARMI': value,
  if (instance.maxApkVersion case final value?) 'MAX_APK_VERSION': value,
  if (instance.maxWsVersion case final value?) 'MAX_WS_VERSION': value,
  if (instance.demoBitisTarihi case final value?) 'DEMO_BITIS_TARIHI': value,
  if (instance.uzaktanMi case final value?) 'UZAKTAN_MI': value,
  if (instance.serviceDebug case final value?) 'SERVICE_DEBUG': value,
  if (instance.bayiKodu case final value?) 'BAYI_KODU': value,
  if (instance.bayiEmail case final value?) 'BAYI_EMAIL': value,
  if (instance.bayiUnvan case final value?) 'BAYI_UNVAN': value,
  if (instance.bracketCihazi case final value?) 'BRACKET_CIHAZI': value,
  if (instance.sozlesmeUyarisi case final value?) 'SOZLESME_UYARISI': value,
  if (instance.sozlesmeUyarisiGoster case final value?) 'SOZLESME_UYARISI_GOSTER': value,
  if (instance.karsilamaBaslik case final value?) 'KARSILAMA_BASLIK': value,
  if (instance.sozlesmeTeklifGoster case final value?) 'SOZLESME_TEKLIF_GOSTER': value,
};
