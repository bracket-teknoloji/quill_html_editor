// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModuleInfoModelAdapter extends TypeAdapter<ModuleInfoModel> {
  @override
  final typeId = 153;

  @override
  ModuleInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModuleInfoModel(
      hesap: fields[0] as Hesap?,
      moduller: (fields[1] as List?)?.cast<Moduller>(),
    );
  }

  @override
  void write(BinaryWriter writer, ModuleInfoModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hesap)
      ..writeByte(1)
      ..write(obj.moduller);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModuleInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HesapAdapter extends TypeAdapter<Hesap> {
  @override
  final typeId = 154;

  @override
  Hesap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hesap(
      id: (fields[0] as num?)?.toInt(),
      email: fields[1] as String?,
      parola: fields[2] as String?,
      adi: fields[3] as String?,
      soyadi: fields[4] as String?,
      adiSoyadi: fields[5] as String?,
      firma: fields[6] as String?,
      telefon: fields[7] as String?,
      adres: fields[8] as String?,
      vergiDairesi: (fields[9] as num?)?.toInt(),
      vergiDairesiAdi: fields[10] as String?,
      vergiNumarasi: fields[11] as String?,
      ilKodu: (fields[12] as num?)?.toInt(),
      ilAdi: fields[13] as String?,
      ilceKodu: (fields[14] as num?)?.toInt(),
      ilceAdi: fields[15] as String?,
      admin: fields[16] as bool?,
      aktif: fields[17] as bool?,
      bayiMi: fields[18] as bool?,
      kullaniciSayisi: (fields[19] as num?)?.toInt(),
      dogrulamaKod: fields[20] as String?,
      yetkiSerbestrapor: fields[21] as bool?,
      yetkiDizayn: fields[22] as bool?,
      yetkiSohbet: fields[23] as bool?,
      yetkiAjanda: fields[24] as bool?,
      yetkiYedekleme: fields[25] as bool?,
      kayittarihi: fields[26] as DateTime?,
      ftpKullanimi: fields[27] as bool?,
      ftpAdres: fields[28] as String?,
      ftpKullaniciAdi: fields[29] as String?,
      ftpParola: fields[30] as String?,
      ftpDosyaYedek: fields[31] as bool?,
      cihazlar: (fields[32] as List?)?.cast<Cihazlar>(),
      developerBilgi: fields[33] as DeveloperBilgi?,
      erpTipi: fields[34] as String?,
      erpVersiyon: fields[35] as String?,
      aciklama: fields[36] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Hesap obj) {
    writer
      ..writeByte(37)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.parola)
      ..writeByte(3)
      ..write(obj.adi)
      ..writeByte(4)
      ..write(obj.soyadi)
      ..writeByte(5)
      ..write(obj.adiSoyadi)
      ..writeByte(6)
      ..write(obj.firma)
      ..writeByte(7)
      ..write(obj.telefon)
      ..writeByte(8)
      ..write(obj.adres)
      ..writeByte(9)
      ..write(obj.vergiDairesi)
      ..writeByte(10)
      ..write(obj.vergiDairesiAdi)
      ..writeByte(11)
      ..write(obj.vergiNumarasi)
      ..writeByte(12)
      ..write(obj.ilKodu)
      ..writeByte(13)
      ..write(obj.ilAdi)
      ..writeByte(14)
      ..write(obj.ilceKodu)
      ..writeByte(15)
      ..write(obj.ilceAdi)
      ..writeByte(16)
      ..write(obj.admin)
      ..writeByte(17)
      ..write(obj.aktif)
      ..writeByte(18)
      ..write(obj.bayiMi)
      ..writeByte(19)
      ..write(obj.kullaniciSayisi)
      ..writeByte(20)
      ..write(obj.dogrulamaKod)
      ..writeByte(21)
      ..write(obj.yetkiSerbestrapor)
      ..writeByte(22)
      ..write(obj.yetkiDizayn)
      ..writeByte(23)
      ..write(obj.yetkiSohbet)
      ..writeByte(24)
      ..write(obj.yetkiAjanda)
      ..writeByte(25)
      ..write(obj.yetkiYedekleme)
      ..writeByte(26)
      ..write(obj.kayittarihi)
      ..writeByte(27)
      ..write(obj.ftpKullanimi)
      ..writeByte(28)
      ..write(obj.ftpAdres)
      ..writeByte(29)
      ..write(obj.ftpKullaniciAdi)
      ..writeByte(30)
      ..write(obj.ftpParola)
      ..writeByte(31)
      ..write(obj.ftpDosyaYedek)
      ..writeByte(32)
      ..write(obj.cihazlar)
      ..writeByte(33)
      ..write(obj.developerBilgi)
      ..writeByte(34)
      ..write(obj.erpTipi)
      ..writeByte(35)
      ..write(obj.erpVersiyon)
      ..writeByte(36)
      ..write(obj.aciklama);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HesapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CihazlarAdapter extends TypeAdapter<Cihazlar> {
  @override
  final typeId = 155;

  @override
  Cihazlar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cihazlar(
      id: (fields[0] as num?)?.toInt(),
      platform: fields[1] as String?,
      versiyon: fields[2] as String?,
      storeVersiyon: fields[3] as dynamic,
      isletimSistemi: fields[4] as String?,
      isletimSistemiVer: fields[5] as String?,
      isletimSistemiPlat: fields[6] as String?,
      lisanskey: fields[7] as String?,
      lisanspc: fields[8] as String?,
      songiristar: fields[9] as DateTime?,
      disIpAdresi: fields[10] as String?,
      erpTipi: fields[11] as String?,
      erpVersiyon: fields[12] as String?,
      sunucuMu: fields[13] as bool?,
      sqlserverinfo: fields[14] as Sqlserverinfo?,
      applicationUptime: (fields[15] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Cihazlar obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.platform)
      ..writeByte(2)
      ..write(obj.versiyon)
      ..writeByte(3)
      ..write(obj.storeVersiyon)
      ..writeByte(4)
      ..write(obj.isletimSistemi)
      ..writeByte(5)
      ..write(obj.isletimSistemiVer)
      ..writeByte(6)
      ..write(obj.isletimSistemiPlat)
      ..writeByte(7)
      ..write(obj.lisanskey)
      ..writeByte(8)
      ..write(obj.lisanspc)
      ..writeByte(9)
      ..write(obj.songiristar)
      ..writeByte(10)
      ..write(obj.disIpAdresi)
      ..writeByte(11)
      ..write(obj.erpTipi)
      ..writeByte(12)
      ..write(obj.erpVersiyon)
      ..writeByte(13)
      ..write(obj.sunucuMu)
      ..writeByte(14)
      ..write(obj.sqlserverinfo)
      ..writeByte(15)
      ..write(obj.applicationUptime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CihazlarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SqlserverinfoAdapter extends TypeAdapter<Sqlserverinfo> {
  @override
  final typeId = 156;

  @override
  Sqlserverinfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sqlserverinfo(
      name: fields[0] as String?,
      instanceName: fields[1] as String?,
      surum: fields[2] as String?,
      versiyon: (fields[3] as num?)?.toInt(),
      productVersion: fields[4] as String?,
      edition: fields[5] as String?,
      msdbGuid: fields[6] as String?,
      tempdbGuid: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Sqlserverinfo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.instanceName)
      ..writeByte(2)
      ..write(obj.surum)
      ..writeByte(3)
      ..write(obj.versiyon)
      ..writeByte(4)
      ..write(obj.productVersion)
      ..writeByte(5)
      ..write(obj.edition)
      ..writeByte(6)
      ..write(obj.msdbGuid)
      ..writeByte(7)
      ..write(obj.tempdbGuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SqlserverinfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DeveloperBilgiAdapter extends TypeAdapter<DeveloperBilgi> {
  @override
  final typeId = 157;

  @override
  DeveloperBilgi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeveloperBilgi(
      admin: fields[0] as bool?,
      guncellemeFtp: fields[1] as String?,
      guncellemeFtpKullaniciAdi: fields[2] as String?,
      guncellemeFtpParola: fields[3] as String?,
      yedeklemeFtp: fields[4] as String?,
      yedeklemeFtpKullaniciAdi: fields[5] as String?,
      yedeklemeFtpParola: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DeveloperBilgi obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.admin)
      ..writeByte(1)
      ..write(obj.guncellemeFtp)
      ..writeByte(2)
      ..write(obj.guncellemeFtpKullaniciAdi)
      ..writeByte(3)
      ..write(obj.guncellemeFtpParola)
      ..writeByte(4)
      ..write(obj.yedeklemeFtp)
      ..writeByte(5)
      ..write(obj.yedeklemeFtpKullaniciAdi)
      ..writeByte(6)
      ..write(obj.yedeklemeFtpParola);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeveloperBilgiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ModullerAdapter extends TypeAdapter<Moduller> {
  @override
  final typeId = 158;

  @override
  Moduller read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Moduller(
      kategoriId: (fields[0] as num?)?.toInt(),
      kategoriAdi: fields[1] as String?,
      modulBaslik: fields[2] as String?,
      dosyaAdi: fields[3] as String?,
      aciklama: fields[4] as String?,
      versiyon: fields[5] as String?,
      isdemo: fields[6] as bool?,
      sozlesmeBastar: fields[7] as dynamic,
      sozlesmeBittar: fields[8] as DateTime?,
      kiralik: fields[9] as bool?,
      webServisAdresi: fields[10] as String?,
      kullaniciSayisi: (fields[11] as num?)?.toInt(),
      ekLisanslar: (fields[12] as List?)?.cast<EkLisanslar>(),
      sozlesmeAktif: fields[13] as bool?,
      sozlesmeUyari: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Moduller obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.kategoriId)
      ..writeByte(1)
      ..write(obj.kategoriAdi)
      ..writeByte(2)
      ..write(obj.modulBaslik)
      ..writeByte(3)
      ..write(obj.dosyaAdi)
      ..writeByte(4)
      ..write(obj.aciklama)
      ..writeByte(5)
      ..write(obj.versiyon)
      ..writeByte(6)
      ..write(obj.isdemo)
      ..writeByte(7)
      ..write(obj.sozlesmeBastar)
      ..writeByte(8)
      ..write(obj.sozlesmeBittar)
      ..writeByte(9)
      ..write(obj.kiralik)
      ..writeByte(10)
      ..write(obj.webServisAdresi)
      ..writeByte(11)
      ..write(obj.kullaniciSayisi)
      ..writeByte(12)
      ..write(obj.ekLisanslar)
      ..writeByte(13)
      ..write(obj.sozlesmeAktif)
      ..writeByte(14)
      ..write(obj.sozlesmeUyari);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModullerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EkLisanslarAdapter extends TypeAdapter<EkLisanslar> {
  @override
  final typeId = 159;

  @override
  EkLisanslar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EkLisanslar(
      sira: (fields[0] as num?)?.toInt(),
      tanimi: fields[1] as String?,
      adet: fields[2] as dynamic,
      bitisTarihi: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, EkLisanslar obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.sira)
      ..writeByte(1)
      ..write(obj.tanimi)
      ..writeByte(2)
      ..write(obj.adet)
      ..writeByte(3)
      ..write(obj.bitisTarihi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EkLisanslarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleInfoModel _$ModuleInfoModelFromJson(Map<String, dynamic> json) =>
    ModuleInfoModel(
      hesap: json['HESAP'] == null
          ? null
          : Hesap.fromJson(json['HESAP'] as Map<String, dynamic>),
      moduller: (json['MODULLER'] as List<dynamic>?)
          ?.map((e) => Moduller.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ModuleInfoModelToJson(ModuleInfoModel instance) =>
    <String, dynamic>{
      if (instance.hesap?.toJson() case final value?) 'HESAP': value,
      if (instance.moduller?.map((e) => e.toJson()).toList() case final value?)
        'MODULLER': value,
    };

_Hesap _$HesapFromJson(Map<String, dynamic> json) => _Hesap(
  id: (json['ID'] as num?)?.toInt(),
  email: json['EMAIL'] as String?,
  parola: json['PAROLA'] as String?,
  adi: json['ADI'] as String?,
  soyadi: json['SOYADI'] as String?,
  adiSoyadi: json['ADI_SOYADI'] as String?,
  firma: json['FIRMA'] as String?,
  telefon: json['TELEFON'] as String?,
  adres: json['ADRES'] as String?,
  vergiDairesi: (json['VERGI_DAIRESI'] as num?)?.toInt(),
  vergiDairesiAdi: json['VERGI_DAIRESI_ADI'] as String?,
  vergiNumarasi: json['VERGI_NUMARASI'] as String?,
  ilKodu: (json['IL_KODU'] as num?)?.toInt(),
  ilAdi: json['IL_ADI'] as String?,
  ilceKodu: (json['ILCE_KODU'] as num?)?.toInt(),
  ilceAdi: json['ILCE_ADI'] as String?,
  admin: json['ADMIN'] as bool?,
  aktif: json['AKTIF'] as bool?,
  bayiMi: json['BAYI_MI'] as bool?,
  kullaniciSayisi: (json['KULLANICI_SAYISI'] as num?)?.toInt(),
  dogrulamaKod: json['DOGRULAMA_KOD'] as String?,
  yetkiSerbestrapor: json['YETKI_SERBESTRAPOR'] as bool?,
  yetkiDizayn: json['YETKI_DIZAYN'] as bool?,
  yetkiSohbet: json['YETKI_SOHBET'] as bool?,
  yetkiAjanda: json['YETKI_AJANDA'] as bool?,
  yetkiYedekleme: json['YETKI_YEDEKLEME'] as bool?,
  kayittarihi: json['KAYITTARIHI'] == null
      ? null
      : DateTime.parse(json['KAYITTARIHI'] as String),
  ftpKullanimi: json['FTP_KULLANIMI'] as bool?,
  ftpAdres: json['FTP_ADRES'] as String?,
  ftpKullaniciAdi: json['FTP_KULLANICI_ADI'] as String?,
  ftpParola: json['FTP_PAROLA'] as String?,
  ftpDosyaYedek: json['FTP_DOSYA_YEDEK'] as bool?,
  cihazlar: (json['CIHAZLAR'] as List<dynamic>?)
      ?.map((e) => Cihazlar.fromJson(e as Map<String, dynamic>))
      .toList(),
  developerBilgi: json['DEVELOPER_BILGI'] == null
      ? null
      : DeveloperBilgi.fromJson(
          json['DEVELOPER_BILGI'] as Map<String, dynamic>,
        ),
  erpTipi: json['ERP_TIPI'] as String?,
  erpVersiyon: json['ERP_VERSIYON'] as String?,
  aciklama: json['ACIKLAMA'],
);

Map<String, dynamic> _$HesapToJson(_Hesap instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.email case final value?) 'EMAIL': value,
  if (instance.parola case final value?) 'PAROLA': value,
  if (instance.adi case final value?) 'ADI': value,
  if (instance.soyadi case final value?) 'SOYADI': value,
  if (instance.adiSoyadi case final value?) 'ADI_SOYADI': value,
  if (instance.firma case final value?) 'FIRMA': value,
  if (instance.telefon case final value?) 'TELEFON': value,
  if (instance.adres case final value?) 'ADRES': value,
  if (instance.vergiDairesi case final value?) 'VERGI_DAIRESI': value,
  if (instance.vergiDairesiAdi case final value?) 'VERGI_DAIRESI_ADI': value,
  if (instance.vergiNumarasi case final value?) 'VERGI_NUMARASI': value,
  if (instance.ilKodu case final value?) 'IL_KODU': value,
  if (instance.ilAdi case final value?) 'IL_ADI': value,
  if (instance.ilceKodu case final value?) 'ILCE_KODU': value,
  if (instance.ilceAdi case final value?) 'ILCE_ADI': value,
  if (instance.admin case final value?) 'ADMIN': value,
  if (instance.aktif case final value?) 'AKTIF': value,
  if (instance.bayiMi case final value?) 'BAYI_MI': value,
  if (instance.kullaniciSayisi case final value?) 'KULLANICI_SAYISI': value,
  if (instance.dogrulamaKod case final value?) 'DOGRULAMA_KOD': value,
  if (instance.yetkiSerbestrapor case final value?) 'YETKI_SERBESTRAPOR': value,
  if (instance.yetkiDizayn case final value?) 'YETKI_DIZAYN': value,
  if (instance.yetkiSohbet case final value?) 'YETKI_SOHBET': value,
  if (instance.yetkiAjanda case final value?) 'YETKI_AJANDA': value,
  if (instance.yetkiYedekleme case final value?) 'YETKI_YEDEKLEME': value,
  if (instance.kayittarihi?.toIso8601String() case final value?)
    'KAYITTARIHI': value,
  if (instance.ftpKullanimi case final value?) 'FTP_KULLANIMI': value,
  if (instance.ftpAdres case final value?) 'FTP_ADRES': value,
  if (instance.ftpKullaniciAdi case final value?) 'FTP_KULLANICI_ADI': value,
  if (instance.ftpParola case final value?) 'FTP_PAROLA': value,
  if (instance.ftpDosyaYedek case final value?) 'FTP_DOSYA_YEDEK': value,
  if (instance.cihazlar?.map((e) => e.toJson()).toList() case final value?)
    'CIHAZLAR': value,
  if (instance.developerBilgi?.toJson() case final value?)
    'DEVELOPER_BILGI': value,
  if (instance.erpTipi case final value?) 'ERP_TIPI': value,
  if (instance.erpVersiyon case final value?) 'ERP_VERSIYON': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
};

_Cihazlar _$CihazlarFromJson(Map<String, dynamic> json) => _Cihazlar(
  id: (json['ID'] as num?)?.toInt(),
  platform: json['PLATFORM'] as String?,
  versiyon: json['VERSIYON'] as String?,
  storeVersiyon: json['STORE_VERSIYON'],
  isletimSistemi: json['ISLETIM_SISTEMI'] as String?,
  isletimSistemiVer: json['ISLETIM_SISTEMI_VER'] as String?,
  isletimSistemiPlat: json['ISLETIM_SISTEMI_PLAT'] as String?,
  lisanskey: json['LISANSKEY'] as String?,
  lisanspc: json['LISANSPC'] as String?,
  songiristar: json['SONGIRISTAR'] == null
      ? null
      : DateTime.parse(json['SONGIRISTAR'] as String),
  disIpAdresi: json['DIS_IP_ADRESI'] as String?,
  erpTipi: json['ERP_TIPI'] as String?,
  erpVersiyon: json['ERP_VERSIYON'] as String?,
  sunucuMu: json['SUNUCU_MU'] as bool?,
  sqlserverinfo: json['SQLSERVERINFO'] == null
      ? null
      : Sqlserverinfo.fromJson(json['SQLSERVERINFO'] as Map<String, dynamic>),
  applicationUptime: (json['APPLICATION_UPTIME'] as num?)?.toInt(),
);

Map<String, dynamic> _$CihazlarToJson(_Cihazlar instance) => <String, dynamic>{
  if (instance.id case final value?) 'ID': value,
  if (instance.platform case final value?) 'PLATFORM': value,
  if (instance.versiyon case final value?) 'VERSIYON': value,
  if (instance.storeVersiyon case final value?) 'STORE_VERSIYON': value,
  if (instance.isletimSistemi case final value?) 'ISLETIM_SISTEMI': value,
  if (instance.isletimSistemiVer case final value?)
    'ISLETIM_SISTEMI_VER': value,
  if (instance.isletimSistemiPlat case final value?)
    'ISLETIM_SISTEMI_PLAT': value,
  if (instance.lisanskey case final value?) 'LISANSKEY': value,
  if (instance.lisanspc case final value?) 'LISANSPC': value,
  if (instance.songiristar?.toIso8601String() case final value?)
    'SONGIRISTAR': value,
  if (instance.disIpAdresi case final value?) 'DIS_IP_ADRESI': value,
  if (instance.erpTipi case final value?) 'ERP_TIPI': value,
  if (instance.erpVersiyon case final value?) 'ERP_VERSIYON': value,
  if (instance.sunucuMu case final value?) 'SUNUCU_MU': value,
  if (instance.sqlserverinfo?.toJson() case final value?)
    'SQLSERVERINFO': value,
  if (instance.applicationUptime case final value?) 'APPLICATION_UPTIME': value,
};

_Sqlserverinfo _$SqlserverinfoFromJson(Map<String, dynamic> json) =>
    _Sqlserverinfo(
      name: json['NAME'] as String?,
      instanceName: json['INSTANCE_NAME'] as String?,
      surum: json['SURUM'] as String?,
      versiyon: (json['VERSIYON'] as num?)?.toInt(),
      productVersion: json['PRODUCT_VERSION'] as String?,
      edition: json['EDITION'] as String?,
      msdbGuid: json['MSDB_GUID'] as String?,
      tempdbGuid: json['TEMPDB_GUID'] as String?,
    );

Map<String, dynamic> _$SqlserverinfoToJson(_Sqlserverinfo instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'NAME': value,
      if (instance.instanceName case final value?) 'INSTANCE_NAME': value,
      if (instance.surum case final value?) 'SURUM': value,
      if (instance.versiyon case final value?) 'VERSIYON': value,
      if (instance.productVersion case final value?) 'PRODUCT_VERSION': value,
      if (instance.edition case final value?) 'EDITION': value,
      if (instance.msdbGuid case final value?) 'MSDB_GUID': value,
      if (instance.tempdbGuid case final value?) 'TEMPDB_GUID': value,
    };

_DeveloperBilgi _$DeveloperBilgiFromJson(Map<String, dynamic> json) =>
    _DeveloperBilgi(
      admin: json['ADMIN'] as bool?,
      guncellemeFtp: json['GUNCELLEME_FTP'] as String?,
      guncellemeFtpKullaniciAdi:
          json['GUNCELLEME_FTP_KULLANICI_ADI'] as String?,
      guncellemeFtpParola: json['GUNCELLEME_FTP_PAROLA'] as String?,
      yedeklemeFtp: json['YEDEKLEME_FTP'] as String?,
      yedeklemeFtpKullaniciAdi: json['YEDEKLEME_FTP_KULLANICI_ADI'] as String?,
      yedeklemeFtpParola: json['YEDEKLEME_FTP_PAROLA'] as String?,
    );

Map<String, dynamic> _$DeveloperBilgiToJson(_DeveloperBilgi instance) =>
    <String, dynamic>{
      if (instance.admin case final value?) 'ADMIN': value,
      if (instance.guncellemeFtp case final value?) 'GUNCELLEME_FTP': value,
      if (instance.guncellemeFtpKullaniciAdi case final value?)
        'GUNCELLEME_FTP_KULLANICI_ADI': value,
      if (instance.guncellemeFtpParola case final value?)
        'GUNCELLEME_FTP_PAROLA': value,
      if (instance.yedeklemeFtp case final value?) 'YEDEKLEME_FTP': value,
      if (instance.yedeklemeFtpKullaniciAdi case final value?)
        'YEDEKLEME_FTP_KULLANICI_ADI': value,
      if (instance.yedeklemeFtpParola case final value?)
        'YEDEKLEME_FTP_PAROLA': value,
    };

_Moduller _$ModullerFromJson(Map<String, dynamic> json) => _Moduller(
  kategoriId: (json['KATEGORI_ID'] as num?)?.toInt(),
  kategoriAdi: json['KATEGORI_ADI'] as String?,
  modulBaslik: json['MODUL_BASLIK'] as String?,
  dosyaAdi: json['DOSYA_ADI'] as String?,
  aciklama: json['ACIKLAMA'] as String?,
  versiyon: json['VERSIYON'] as String?,
  isdemo: json['ISDEMO'] as bool?,
  sozlesmeBastar: json['SOZLESME_BASTAR'],
  sozlesmeBittar: json['SOZLESME_BITTAR'] == null
      ? null
      : DateTime.parse(json['SOZLESME_BITTAR'] as String),
  kiralik: json['KIRALIK'] as bool?,
  webServisAdresi: json['WEB_SERVIS_ADRESI'] as String?,
  kullaniciSayisi: (json['KULLANICI_SAYISI'] as num?)?.toInt(),
  ekLisanslar: (json['EK_LISANSLAR'] as List<dynamic>?)
      ?.map((e) => EkLisanslar.fromJson(e as Map<String, dynamic>))
      .toList(),
  sozlesmeAktif: json['SOZLESME_AKTIF'] as bool?,
  sozlesmeUyari: json['SOZLESME_UYARI'] as String?,
);

Map<String, dynamic> _$ModullerToJson(_Moduller instance) => <String, dynamic>{
  if (instance.kategoriId case final value?) 'KATEGORI_ID': value,
  if (instance.kategoriAdi case final value?) 'KATEGORI_ADI': value,
  if (instance.modulBaslik case final value?) 'MODUL_BASLIK': value,
  if (instance.dosyaAdi case final value?) 'DOSYA_ADI': value,
  if (instance.aciklama case final value?) 'ACIKLAMA': value,
  if (instance.versiyon case final value?) 'VERSIYON': value,
  if (instance.isdemo case final value?) 'ISDEMO': value,
  if (instance.sozlesmeBastar case final value?) 'SOZLESME_BASTAR': value,
  if (instance.sozlesmeBittar?.toIso8601String() case final value?)
    'SOZLESME_BITTAR': value,
  if (instance.kiralik case final value?) 'KIRALIK': value,
  if (instance.webServisAdresi case final value?) 'WEB_SERVIS_ADRESI': value,
  if (instance.kullaniciSayisi case final value?) 'KULLANICI_SAYISI': value,
  if (instance.ekLisanslar?.map((e) => e.toJson()).toList() case final value?)
    'EK_LISANSLAR': value,
  if (instance.sozlesmeAktif case final value?) 'SOZLESME_AKTIF': value,
  if (instance.sozlesmeUyari case final value?) 'SOZLESME_UYARI': value,
};

_EkLisanslar _$EkLisanslarFromJson(Map<String, dynamic> json) => _EkLisanslar(
  sira: (json['SIRA'] as num?)?.toInt(),
  tanimi: json['TANIMI'] as String?,
  adet: json['ADET'],
  bitisTarihi: json['BITIS_TARIHI'],
);

Map<String, dynamic> _$EkLisanslarToJson(_EkLisanslar instance) =>
    <String, dynamic>{
      if (instance.sira case final value?) 'SIRA': value,
      if (instance.tanimi case final value?) 'TANIMI': value,
      if (instance.adet case final value?) 'ADET': value,
      if (instance.bitisTarihi case final value?) 'BITIS_TARIHI': value,
    };
