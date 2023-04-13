import 'package:json_annotation/json_annotation.dart';

import '../../../core/base/model/base_network_mixin.dart';

part 'isletme_model.g.dart';

@JsonSerializable(createToJson: true)
class IsletmeModel with NetworkManagerMixin {
  @JsonKey(name: "SIRKET")
  String? sirket;
  @JsonKey(name: "ISLETME_KODU")
  int? isletmeKodu;
  @JsonKey(name: "SUBE_KODU")
  int? subeKodu;
  @JsonKey(name: "SUBE_ADI")
  String? subeAdi;
  @JsonKey(name: "ISLETME_ADI")
  String? isletmeAdi;
  @JsonKey(name: "LOKAL_DEPO_AKTIF")
  bool? lokalDepoAktif;
  @JsonKey(name: "MERKEZMI")
  String? merkezmi;
  @JsonKey(name: "ADRES")
  String? adres;
  @JsonKey(name: "TELEFON")
  String? telefon;
  @JsonKey(name: "FAKS")
  String? faks;
  @JsonKey(name: "EMAIL")
  String? email;
  @JsonKey(name: "IL_ADI")
  String? ilAdi;
  @JsonKey(name: "ILCE")
  String? ilce;
  @JsonKey(name: "VERGI_NUMARASI")
  String? vergiNumarasi;
  @JsonKey(name: "VERGI_DAIRESI")
  String? vergiDairesi;

  IsletmeModel();

  @override
  fromJson(Map<String, dynamic> json) {
    return _$IsletmeModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$IsletmeModelToJson(this);
  }

  @override
  String toString() {
    return "sirket: $sirket,\n isletmeKodu: $isletmeKodu,\n subeAdi: $subeAdi,\n isletmeAdi: $isletmeAdi,\n lokalDepoAktif: $lokalDepoAktif,\n merkezmi: $merkezmi,\n adres: $adres,\n telefon: $telefon,\n faks: $faks,\n email: $email,\n ilAdi: $ilAdi,\n ilce: $ilce,\n vergiNumarasi: $vergiNumarasi,\n vergiDairesi: $vergiDairesi";
  }

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
