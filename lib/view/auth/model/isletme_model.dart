import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";

import "../../../core/base/model/base_network_mixin.dart";

part "isletme_model.g.dart";

@JsonSerializable()
@HiveType(typeId: 107)
class IsletmeModel with NetworkManagerMixin {
  @HiveField(0)
  @JsonKey(name: "SIRKET")
  String? sirket;
  @HiveField(1)
  @JsonKey(name: "ISLETME_KODU")
  int? isletmeKodu;
  @HiveField(2)
  @JsonKey(name: "SUBE_KODU")
  int? subeKodu;
  @HiveField(3)
  @JsonKey(name: "SUBE_ADI")
  String? subeAdi;
  @HiveField(4)
  @JsonKey(name: "ISLETME_ADI")
  String? isletmeAdi;
  @HiveField(5)
  @JsonKey(name: "LOKAL_DEPO_AKTIF")
  bool? lokalDepoAktif;
  @HiveField(6)
  @JsonKey(name: "MERKEZMI")
  String? merkezmi;
  @HiveField(7)
  @JsonKey(name: "ADRES")
  String? adres;
  @HiveField(8)
  @JsonKey(name: "TELEFON")
  String? telefon;
  @HiveField(9)
  @JsonKey(name: "FAKS")
  String? faks;
  @HiveField(10)
  @JsonKey(name: "EMAIL")
  String? email;
  @HiveField(11)
  @JsonKey(name: "IL_ADI")
  String? ilAdi;
  @HiveField(12)
  @JsonKey(name: "ILCE")
  String? ilce;
  @HiveField(13)
  @JsonKey(name: "VERGI_NUMARASI")
  String? vergiNumarasi;
  @HiveField(14)
  @JsonKey(name: "VERGI_DAIRESI")
  String? vergiDairesi;

  IsletmeModel({
    this.sirket,
    this.isletmeKodu,
    this.subeKodu,
    this.subeAdi,
    this.isletmeAdi,
    this.lokalDepoAktif,
    this.merkezmi,
    this.adres,
    this.telefon,
    this.faks,
    this.email,
    this.ilAdi,
    this.ilce,
    this.vergiNumarasi,
    this.vergiDairesi,
  });

  @override
  fromJson(Map<String, dynamic> json) => _$IsletmeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IsletmeModelToJson(this);

  @override
  String toString() =>
      "sirket: $sirket,\n isletmeKodu: $isletmeKodu,\n subeAdi: $subeAdi,\n isletmeAdi: $isletmeAdi,\n lokalDepoAktif: $lokalDepoAktif,\n merkezmi: $merkezmi,\n adres: $adres,\n telefon: $telefon,\n faks: $faks,\n email: $email,\n ilAdi: $ilAdi,\n ilce: $ilce,\n vergiNumarasi: $vergiNumarasi,\n vergiDairesi: $vergiDairesi";

  // create operator == and hashCode
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IsletmeModel &&
          runtimeType == other.runtimeType &&
          sirket == other.sirket &&
          isletmeKodu == other.isletmeKodu &&
          subeKodu == other.subeKodu &&
          subeAdi == other.subeAdi &&
          isletmeAdi == other.isletmeAdi &&
          lokalDepoAktif == other.lokalDepoAktif &&
          merkezmi == other.merkezmi &&
          adres == other.adres &&
          telefon == other.telefon &&
          faks == other.faks &&
          email == other.email &&
          ilAdi == other.ilAdi &&
          ilce == other.ilce &&
          vergiNumarasi == other.vergiNumarasi &&
          vergiDairesi == other.vergiDairesi;
  @override
  int get hashCode =>
      sirket.hashCode ^
      isletmeKodu.hashCode ^
      subeKodu.hashCode ^
      subeAdi.hashCode ^
      isletmeAdi.hashCode ^
      lokalDepoAktif.hashCode ^
      merkezmi.hashCode ^
      adres.hashCode ^
      telefon.hashCode ^
      faks.hashCode ^
      email.hashCode ^
      ilAdi.hashCode ^
      ilce.hashCode ^
      vergiNumarasi.hashCode ^
      vergiDairesi.hashCode;
}
