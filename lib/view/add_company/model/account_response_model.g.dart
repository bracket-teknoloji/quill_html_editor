// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'account_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccountResponseModelAdapter extends TypeAdapter<AccountResponseModel> {
  @override
  final int typeId = 123;

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
      ..kullaniciSayisi = fields[8] as int?
      ..firmaKisaAdi = fields[9] as String?
      ..sozlesmeBitisTarihi = fields[10] as dynamic
      ..sozlesmeBitisKalanGun = fields[11] as int?
      ..karsilamaMesaji = fields[12] as dynamic
      ..karsilamaResimUrl = fields[13] as dynamic
      ..karsilamaSaniye = fields[14] as int?
      ..guncellemeVarmi = fields[15] as bool?
      ..maxApkVersion = fields[16] as int?
      ..maxWsVersion = fields[17] as String?
      ..demoBitisTarihi = fields[18] as dynamic;
  }

  @override
  void write(BinaryWriter writer, AccountResponseModel obj) {
    writer
      ..writeByte(19)
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
      ..write(obj.demoBitisTarihi);
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
        Map<String, dynamic> json) =>
    $checkedCreate(
      'AccountResponseModel',
      json,
      ($checkedConvert) {
        final val = AccountResponseModel();
        $checkedConvert('FIRMA', (v) => val.firma = v as String?);
        $checkedConvert('EMAIL', (v) => val.email = v as String?);
        $checkedConvert('PAROLA', (v) => val.parola = v as String?);
        $checkedConvert(
            'PICKER_LISANSI_VAR', (v) => val.pickerLisansiVar = v as String?);
        $checkedConvert('WS_LAN', (v) => val.wsLan = v as String?);
        $checkedConvert('WS_WAN', (v) => val.wsWan = v as String?);
        $checkedConvert('WEB_SERVIS', (v) => val.webServis = v as String?);
        $checkedConvert(
            'LISANS_BITIS_TARIHI', (v) => val.lisansBitisTarihi = v);
        $checkedConvert(
            'KULLANICI_SAYISI', (v) => val.kullaniciSayisi = v as int?);
        $checkedConvert(
            'FIRMA_KISA_ADI', (v) => val.firmaKisaAdi = v as String?);
        $checkedConvert(
            'SOZLESME_BITIS_TARIHI', (v) => val.sozlesmeBitisTarihi = v);
        $checkedConvert('SOZLESME_BITIS_KALAN_GUN',
            (v) => val.sozlesmeBitisKalanGun = v as int?);
        $checkedConvert('KARSILAMA_MESAJI', (v) => val.karsilamaMesaji = v);
        $checkedConvert(
            'KARSILAMA_RESIM_URL', (v) => val.karsilamaResimUrl = v);
        $checkedConvert(
            'KARSILAMA_SURESI', (v) => val.karsilamaSaniye = v as int?);
        $checkedConvert(
            'GUNCELLEME_VARMI', (v) => val.guncellemeVarmi = v as bool?);
        $checkedConvert(
            'MAX_APK_VERSION', (v) => val.maxApkVersion = v as int?);
        $checkedConvert(
            'MAX_WS_VERSION', (v) => val.maxWsVersion = v as String?);
        $checkedConvert('DEMO_BITIS_TARIHI', (v) => val.demoBitisTarihi = v);
        return val;
      },
      fieldKeyMap: const {
        'firma': 'FIRMA',
        'email': 'EMAIL',
        'parola': 'PAROLA',
        'pickerLisansiVar': 'PICKER_LISANSI_VAR',
        'wsLan': 'WS_LAN',
        'wsWan': 'WS_WAN',
        'webServis': 'WEB_SERVIS',
        'lisansBitisTarihi': 'LISANS_BITIS_TARIHI',
        'kullaniciSayisi': 'KULLANICI_SAYISI',
        'firmaKisaAdi': 'FIRMA_KISA_ADI',
        'sozlesmeBitisTarihi': 'SOZLESME_BITIS_TARIHI',
        'sozlesmeBitisKalanGun': 'SOZLESME_BITIS_KALAN_GUN',
        'karsilamaMesaji': 'KARSILAMA_MESAJI',
        'karsilamaResimUrl': 'KARSILAMA_RESIM_URL',
        'karsilamaSaniye': 'KARSILAMA_SURESI',
        'guncellemeVarmi': 'GUNCELLEME_VARMI',
        'maxApkVersion': 'MAX_APK_VERSION',
        'maxWsVersion': 'MAX_WS_VERSION',
        'demoBitisTarihi': 'DEMO_BITIS_TARIHI'
      },
    );

Map<String, dynamic> _$AccountResponseModelToJson(
        AccountResponseModel instance) =>
    <String, dynamic>{
      'FIRMA': instance.firma,
      'EMAIL': instance.email,
      'PAROLA': instance.parola,
      'PICKER_LISANSI_VAR': instance.pickerLisansiVar,
      'WS_LAN': instance.wsLan,
      'WS_WAN': instance.wsWan,
      'WEB_SERVIS': instance.webServis,
      'LISANS_BITIS_TARIHI': instance.lisansBitisTarihi,
      'KULLANICI_SAYISI': instance.kullaniciSayisi,
      'FIRMA_KISA_ADI': instance.firmaKisaAdi,
      'SOZLESME_BITIS_TARIHI': instance.sozlesmeBitisTarihi,
      'SOZLESME_BITIS_KALAN_GUN': instance.sozlesmeBitisKalanGun,
      'KARSILAMA_MESAJI': instance.karsilamaMesaji,
      'KARSILAMA_RESIM_URL': instance.karsilamaResimUrl,
      'KARSILAMA_SURESI': instance.karsilamaSaniye,
      'GUNCELLEME_VARMI': instance.guncellemeVarmi,
      'MAX_APK_VERSION': instance.maxApkVersion,
      'MAX_WS_VERSION': instance.maxWsVersion,
      'DEMO_BITIS_TARIHI': instance.demoBitisTarihi,
    };
