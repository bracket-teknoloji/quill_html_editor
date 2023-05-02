// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'logout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutModel _$LogoutModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'LogoutModel',
      json,
      ($checkedConvert) {
        final val = LogoutModel();
        $checkedConvert('Success', (v) => val.succes = v as String?);
        $checkedConvert('Message', (v) => val.message = v as String?);
        return val;
      },
      fieldKeyMap: const {'succes': 'Success', 'message': 'Message'},
    );

Map<String, dynamic> _$LogoutModelToJson(LogoutModel instance) =>
    <String, dynamic>{
      'Success': instance.succes,
      'Message': instance.message,
    };
