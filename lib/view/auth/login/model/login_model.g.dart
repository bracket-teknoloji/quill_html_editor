// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenModelAdapter extends TypeAdapter<TokenModel> {
  @override
  final typeId = 99;

  @override
  TokenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenModel()
      ..accessToken = fields[0] as String?
      ..tokenType = fields[1] as String?
      ..expiresIn = (fields[2] as num?)?.toInt()
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
