import "package:freezed_annotation/freezed_annotation.dart";
import "package:hive_ce_flutter/hive_flutter.dart";
import "package:picker/core/base/model/base_network_mixin.dart";

part "module_info_model.freezed.dart";
part "module_info_model.g.dart";

@HiveType(typeId: 153)
@unfreezed
@JsonSerializable()
final class ModuleInfoModel with _$ModuleInfoModel, NetworkManagerMixin {
  const ModuleInfoModel({
    this.hesap,
    this.moduller,
  });

  factory ModuleInfoModel.fromJson(Map<String, dynamic> json) => _$ModuleInfoModelFromJson(json);

  @override
  @HiveField(0)
  final Hesap? hesap;
  @override
  @HiveField(1)
  final List<Moduller>? moduller;

  @override
  ModuleInfoModel fromJson(Map<String, dynamic> json) => ModuleInfoModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ModuleInfoModelToJson(this);
}

@HiveType(typeId: 154)
@freezed
sealed class Hesap with _$Hesap {
  const factory Hesap({
    @HiveField(0) int? id,
    @HiveField(1) String? email,
    @HiveField(2) String? parola,
    @HiveField(3) String? adi,
    @HiveField(4) String? soyadi,
    @HiveField(5) String? adiSoyadi,
    @HiveField(6) String? firma,
    @HiveField(7) String? telefon,
    @HiveField(8) String? adres,
    @HiveField(9) int? vergiDairesi,
    @HiveField(10) String? vergiDairesiAdi,
    @HiveField(11) String? vergiNumarasi,
    @HiveField(12) int? ilKodu,
    @HiveField(13) String? ilAdi,
    @HiveField(14) int? ilceKodu,
    @HiveField(15) String? ilceAdi,
    @HiveField(16) bool? admin,
    @HiveField(17) bool? aktif,
    @HiveField(18) bool? bayiMi,
    @HiveField(19) int? kullaniciSayisi,
    @HiveField(20) String? dogrulamaKod,
    @HiveField(21) bool? yetkiSerbestrapor,
    @HiveField(22) bool? yetkiDizayn,
    @HiveField(23) bool? yetkiSohbet,
    @HiveField(24) bool? yetkiAjanda,
    @HiveField(25) bool? yetkiYedekleme,
    @HiveField(26) DateTime? kayittarihi,
    @HiveField(27) bool? ftpKullanimi,
    @HiveField(28) String? ftpAdres,
    @HiveField(29) String? ftpKullaniciAdi,
    @HiveField(30) String? ftpParola,
    @HiveField(31) bool? ftpDosyaYedek,
    @HiveField(32) List<Cihazlar>? cihazlar,
    @HiveField(33) DeveloperBilgi? developerBilgi,
    @HiveField(34) String? erpTipi,
    @HiveField(35) String? erpVersiyon,
    @HiveField(36) dynamic aciklama,
  }) = _Hesap;

  factory Hesap.fromJson(Map<String, dynamic> json) => _$HesapFromJson(json);
}

@HiveType(typeId: 155)
@freezed
sealed class Cihazlar with _$Cihazlar {
  const factory Cihazlar({
    @HiveField(0) int? id,
    @HiveField(1) String? platform,
    @HiveField(2) String? versiyon,
    @HiveField(3) dynamic storeVersiyon,
    @HiveField(4) String? isletimSistemi,
    @HiveField(5) String? isletimSistemiVer,
    @HiveField(6) String? isletimSistemiPlat,
    @HiveField(7) String? lisanskey,
    @HiveField(8) String? lisanspc,
    @HiveField(9) DateTime? songiristar,
    @HiveField(10) String? disIpAdresi,
    @HiveField(11) String? erpTipi,
    @HiveField(12) String? erpVersiyon,
    @HiveField(13) bool? sunucuMu,
    @HiveField(14) Sqlserverinfo? sqlserverinfo,
    @HiveField(15) int? applicationUptime,
  }) = _Cihazlar;

  factory Cihazlar.fromJson(Map<String, dynamic> json) => _$CihazlarFromJson(json);
}

@HiveType(typeId: 156)
@freezed
sealed class Sqlserverinfo with _$Sqlserverinfo {
  const factory Sqlserverinfo({
    @HiveField(0) String? name,
    @HiveField(1) String? instanceName,
    @HiveField(2) String? surum,
    @HiveField(3) int? versiyon,
    @HiveField(4) String? productVersion,
    @HiveField(5) String? edition,
    @HiveField(6) String? msdbGuid,
    @HiveField(7) String? tempdbGuid,
  }) = _Sqlserverinfo;

  factory Sqlserverinfo.fromJson(Map<String, dynamic> json) => _$SqlserverinfoFromJson(json);
}

@HiveType(typeId: 157)
@freezed
sealed class DeveloperBilgi with _$DeveloperBilgi {
  const factory DeveloperBilgi({
    @HiveField(0) bool? admin,
    @HiveField(1) String? guncellemeFtp,
    @HiveField(2) String? guncellemeFtpKullaniciAdi,
    @HiveField(3) String? guncellemeFtpParola,
    @HiveField(4) String? yedeklemeFtp,
    @HiveField(5) String? yedeklemeFtpKullaniciAdi,
    @HiveField(6) String? yedeklemeFtpParola,
  }) = _DeveloperBilgi;

  factory DeveloperBilgi.fromJson(Map<String, dynamic> json) => _$DeveloperBilgiFromJson(json);
}

@HiveType(typeId: 158)
@freezed
sealed class Moduller with _$Moduller {
  const factory Moduller({
    @HiveField(0) int? kategoriId,
    @HiveField(1) String? kategoriAdi,
    @HiveField(2) String? modulBaslik,
    @HiveField(3) String? dosyaAdi,
    @HiveField(4) String? aciklama,
    @HiveField(5) String? versiyon,
    @HiveField(6) bool? isdemo,
    @HiveField(7) dynamic sozlesmeBastar,
    @HiveField(8) DateTime? sozlesmeBittar,
    @HiveField(9) bool? kiralik,
    @HiveField(10) String? webServisAdresi,
    @HiveField(11) int? kullaniciSayisi,
    @HiveField(12) List<EkLisanslar>? ekLisanslar,
    @HiveField(13) bool? sozlesmeAktif,
    @HiveField(14) String? sozlesmeUyari,
  }) = _Moduller;

  factory Moduller.fromJson(Map<String, dynamic> json) => _$ModullerFromJson(json);
}

@HiveType(typeId: 159)
@freezed
sealed class EkLisanslar with _$EkLisanslar {
  const factory EkLisanslar({
    @HiveField(0) int? sira,
    @HiveField(1) String? tanimi,
    @HiveField(2) dynamic adet,
    @HiveField(3) dynamic bitisTarihi,
  }) = _EkLisanslar;

  factory EkLisanslar.fromJson(Map<String, dynamic> json) => _$EkLisanslarFromJson(json);
}
