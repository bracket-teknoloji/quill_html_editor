// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutModel _$LogoutModelFromJson(Map<String, dynamic> json) => LogoutModel()
  ..succes = json['Success'] as String?
  ..message = json['Message'] as String?;

Map<String, dynamic> _$LogoutModelToJson(LogoutModel instance) =>
    <String, dynamic>{
      if (instance.succes case final value?) 'Success': value,
      if (instance.message case final value?) 'Message': value,
    };
