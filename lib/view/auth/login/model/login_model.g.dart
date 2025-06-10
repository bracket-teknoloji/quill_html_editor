// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel()
  ..accessToken = json['access_token'] as String?
  ..tokenType = json['token_type'] as String?
  ..expiresIn = (json['expires_in'] as num?)?.toInt()
  ..userJson = UserJson.fromJson(json['USER_JSON'] as String?)
  ..issued = json['.issued'] as String?
  ..expires = json['.expires'] as String?
  ..error = json['error'] as String?
  ..errorDescription = json['error_description'] as String?;

Map<String, dynamic> _$TokenModelToJson(
  TokenModel instance,
) => <String, dynamic>{
  if (instance.accessToken case final value?) 'access_token': value,
  if (instance.tokenType case final value?) 'token_type': value,
  if (instance.expiresIn case final value?) 'expires_in': value,
  if (instance.userJson?.toJson() case final value?) 'USER_JSON': value,
  if (instance.issued case final value?) '.issued': value,
  if (instance.expires case final value?) '.expires': value,
  if (instance.error case final value?) 'error': value,
  if (instance.errorDescription case final value?) 'error_description': value,
};
