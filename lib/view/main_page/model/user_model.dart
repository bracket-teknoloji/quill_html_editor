import 'package:json_annotation/json_annotation.dart';

import 'lang_model.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: true, createFactory: true)
class UserModel {
  UserModel();
  @JsonKey(name: "ID")
  int? id;
  @JsonKey(name: "KULADI")
  String? kuladi;
  @JsonKey(name: "PAROLA")
  String? parola;
  @JsonKey(name: "ADI")
  String? adi;
  @JsonKey(name: "SOYADI")
  String? soyadi;
  @JsonKey(name: "ERP_KULLANICI")
  String? erpKullanici;
  @JsonKey(name: "ERP_PAROLA")
  String? erpParola;
  @JsonKey(name: "PROFIL_KODU")
  int? profilKodu;
  @JsonKey(name: "PROFIL_ADI")
  String? profilAdi;
  @JsonKey(name: "PROFIL_YETKI")
  String? profilYetki;
  @JsonKey(name: "KULLANICI_YETKI")
  String? kullaniciYetki;
  @JsonKey(name: "PICKER_YETKILI")
  String? pickerYetkili;
  @JsonKey(name: "YETKILI_SUBE_JSON")
  String? yetkiliSubelerJson;
  @JsonKey(name: "KONUM_ENLEM")
  double? konumEnlem;
  @JsonKey(name: "KONUM_BOYLAM")
  double? konumBoylam;
  @JsonKey(name: "LANG_MODEL")
  LangModel? langModel;
  @JsonKey(name: "AD_SOYAD")
  String? adSoyad;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
