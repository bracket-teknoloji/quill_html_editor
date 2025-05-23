// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainPageModelAdapter extends TypeAdapter<MainPageModel> {
  @override
  final int typeId = 100;

  @override
  MainPageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()};
    return MainPageModel()
      ..userModel = fields[0] as UserModel?
      ..serviceVersion = fields[1] as String?
      ..langVersion = fields[2] as String?
      ..sirketModel = fields[3] as SirketModel?
      ..menuList = (fields[5] as List?)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, MainPageModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userModel)
      ..writeByte(1)
      ..write(obj.serviceVersion)
      ..writeByte(2)
      ..write(obj.langVersion)
      ..writeByte(3)
      ..write(obj.sirketModel)
      ..writeByte(5)
      ..write(obj.menuList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainPageModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainPageModel _$MainPageModelFromJson(Map<String, dynamic> json) => MainPageModel()
  ..userModel = json['UserModel'] == null ? null : UserModel.fromJson(json['UserModel'] as Map<String, dynamic>)
  ..serviceVersion = json['ServiceVersion'] as String?
  ..langVersion = json['LangVersion'] as String?
  ..sirketModel = SirketModel.fromJson(json['SirketModel'] as Map<String, dynamic>)
  ..menuList = (json['MenuList'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..paramModel = ParamModel.fromJson(json['ParamModel'] as Map<String, dynamic>);

Map<String, dynamic> _$MainPageModelToJson(MainPageModel instance) => <String, dynamic>{
  if (instance.userModel?.toJson() case final value?) 'UserModel': value,
  if (instance.serviceVersion case final value?) 'ServiceVersion': value,
  if (instance.langVersion case final value?) 'LangVersion': value,
  if (instance.sirketModel?.toJson() case final value?) 'SirketModel': value,
  if (instance.menuList case final value?) 'MenuList': value,
  if (instance.paramModel?.toJson() case final value?) 'ParamModel': value,
};
