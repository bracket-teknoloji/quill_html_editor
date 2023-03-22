import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_json_model.g.dart';

@JsonSerializable()
class UserJson {
  int? id;
  @JsonKey(name: "KULADI")
  String? kullaniciAdi;
  @JsonKey(name: "PAROLA")
  String? parola;
  @JsonKey(name: "ADI")
  String? ad;
  @JsonKey(name: "SOYADI")
  String? soyad;
  @JsonKey(name: "ERP_KULLANICI")
  String? erpKullanici;
  @JsonKey(name: "ERP_PAROLA")
  String? erpParola;
  @JsonKey(name: "PICKER_YETKILI")
  String? pickerYetkili;
  @JsonKey(name: "AD_SOYAD")
  late final String? adSoyad = "$ad $soyad";
  UserJson();

  factory UserJson.fromJson(String json) {
    return _$UserJsonFromJson(jsonDecode(utf8.decode(base64Decode(json))));
  }

  Map<String, dynamic> toJson() {
    return _$UserJsonToJson(this);
  }
}
