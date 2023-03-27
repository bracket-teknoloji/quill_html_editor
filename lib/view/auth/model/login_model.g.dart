// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenModelAdapter extends TypeAdapter<TokenModel> {
  @override
  final int typeId = 99;

  @override
  TokenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenModel()
      ..accessToken = fields[0] as String?
      ..tokenType = fields[1] as String?
      ..expiresIn = fields[2] as int?
      ..userJson = fields[3] as UserJson?
      ..issued = fields[4] as String?
      ..expires = fields[5] as String?
      ..error = fields[6] as String?
      ..errorDescription = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, TokenModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.tokenType)
      ..writeByte(2)
      ..write(obj.expiresIn)
      ..writeByte(3)
      ..write(obj.userJson)
      ..writeByte(4)
      ..write(obj.issued)
      ..writeByte(5)
      ..write(obj.expires)
      ..writeByte(6)
      ..write(obj.error)
      ..writeByte(7)
      ..write(obj.errorDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TokenModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'access_token',
            'token_type',
            'expires_in',
            'USER_JSON',
            '.issued',
            '.expires',
            'error',
            'error_description'
          ],
        );
        final val = TokenModel();
        $checkedConvert('access_token', (v) => val.accessToken = v as String?);
        $checkedConvert('token_type', (v) => val.tokenType = v as String?);
        $checkedConvert('expires_in', (v) => val.expiresIn = v as int?);
        $checkedConvert(
            'USER_JSON', (v) => val.userJson = UserJson.fromJson(v as String));
        $checkedConvert('.issued', (v) => val.issued = v as String?);
        $checkedConvert('.expires', (v) => val.expires = v as String?);
        $checkedConvert('error', (v) => val.error = v as String?);
        $checkedConvert(
            'error_description', (v) => val.errorDescription = v as String?);
        return val;
      },
      fieldKeyMap: const {
        'accessToken': 'access_token',
        'tokenType': 'token_type',
        'expiresIn': 'expires_in',
        'userJson': 'USER_JSON',
        'issued': '.issued',
        'expires': '.expires',
        'errorDescription': 'error_description'
      },
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'USER_JSON': instance.userJson?.toJson(),
      '.issued': instance.issued,
      '.expires': instance.expires,
      'error': instance.error,
      'error_description': instance.errorDescription,
    };
