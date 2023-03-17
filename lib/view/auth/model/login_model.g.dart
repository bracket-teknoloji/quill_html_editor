// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginAuthAdapter extends TypeAdapter<LoginAuth> {
  @override
  final int typeId = 0;

  @override
  LoginAuth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginAuth(
      accessToken: fields[0] as String?,
      tokenType: fields[1] as String?,
      expiresIn: fields[2] as int?,
      userJson: (fields[3] as Map?)?.cast<String, dynamic>(),
      issued: fields[4] as String?,
      expires: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginAuth obj) {
    writer
      ..writeByte(6)
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
      ..write(obj.expires);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginAuthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
