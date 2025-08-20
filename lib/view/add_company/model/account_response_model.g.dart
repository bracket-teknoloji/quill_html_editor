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
      other is AccountResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
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
  'FIRMA': ?instance.firma,
  'EMAIL': ?instance.email,
  'PAROLA': ?instance.parola,
  'PICKER_LISANSI_VAR': ?instance.pickerLisansiVar,
  'WS_LAN': ?instance.wsLan,
  'WS_WAN': ?instance.wsWan,
  'WEB_SERVIS': ?instance.webServis,
  'LISANS_BITIS_TARIHI': ?instance.lisansBitisTarihi,
  'KULLANICI_SAYISI': ?instance.kullaniciSayisi,
  'FIRMA_KISA_ADI': ?instance.firmaKisaAdi,
  'SOZLESME_BITIS_TARIHI': ?instance.sozlesmeBitisTarihi,
  'SOZLESME_BITIS_KALAN_GUN': ?instance.sozlesmeBitisKalanGun,
  'KARSILAMA_MESAJI': ?instance.karsilamaMesaji,
  'KARSILAMA_RESIM_URL': ?instance.karsilamaResimUrl,
  'KARSILAMA_SANIYE': ?instance.karsilamaSaniye,
  'GUNCELLEME_VARMI': ?instance.guncellemeVarmi,
  'MAX_APK_VERSION': ?instance.maxApkVersion,
  'MAX_WS_VERSION': ?instance.maxWsVersion,
  'DEMO_BITIS_TARIHI': ?instance.demoBitisTarihi,
  'UZAKTAN_MI': ?instance.uzaktanMi,
  'SERVICE_DEBUG': ?instance.serviceDebug,
  'BAYI_KODU': ?instance.bayiKodu,
  'BAYI_EMAIL': ?instance.bayiEmail,
  'BAYI_UNVAN': ?instance.bayiUnvan,
  'BRACKET_CIHAZI': ?instance.bracketCihazi,
  'SOZLESME_UYARISI': ?instance.sozlesmeUyarisi,
  'SOZLESME_UYARISI_GOSTER': ?instance.sozlesmeUyarisiGoster,
  'KARSILAMA_BASLIK': ?instance.karsilamaBaslik,
  'SOZLESME_TEKLIF_GOSTER': ?instance.sozlesmeTeklifGoster,
};
