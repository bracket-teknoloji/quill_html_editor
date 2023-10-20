// GENERATED CODE - DO NOT MODIFY BY HAND

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

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) {
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
  return TokenModel()
    ..accessToken = json['access_token'] as String?
    ..tokenType = json['token_type'] as String?
    ..expiresIn = json['expires_in'] as int?
    ..userJson = UserJson.fromJson(json['USER_JSON'] as String?)
    ..issued = json['.issued'] as String?
    ..expires = json['.expires'] as String?
    ..error = json['error'] as String?
    ..errorDescription = json['error_description'] as String?;
}

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('access_token', instance.accessToken);
  writeNotNull('token_type', instance.tokenType);
  writeNotNull('expires_in', instance.expiresIn);
  writeNotNull('USER_JSON', instance.userJson?.toJson());
  writeNotNull('.issued', instance.issued);
  writeNotNull('.expires', instance.expires);
  writeNotNull('error', instance.error);
  writeNotNull('error_description', instance.errorDescription);
  return val;
}
