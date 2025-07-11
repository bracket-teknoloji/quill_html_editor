// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dialog_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginDialogModelAdapter extends TypeAdapter<LoginDialogModel> {
  @override
  final typeId = 68;

  @override
  LoginDialogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginDialogModel(
      account: fields[0] as AccountResponseModel?,
      username: fields[1] as String?,
      password: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginDialogModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginDialogModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
