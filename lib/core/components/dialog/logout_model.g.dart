// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutModel _$LogoutModelFromJson(Map<String, dynamic> json) => LogoutModel()
  ..succes = json['Success'] as String?
  ..message = json['Message'] as String?;

Map<String, dynamic> _$LogoutModelToJson(LogoutModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Success', instance.succes);
  writeNotNull('Message', instance.message);
  return val;
}
