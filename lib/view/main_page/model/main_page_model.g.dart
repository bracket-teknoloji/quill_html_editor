// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

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
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
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
      other is MainPageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainPageModel _$MainPageModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MainPageModel',
      json,
      ($checkedConvert) {
        final val = MainPageModel();
        $checkedConvert(
            'UserModel',
            (v) => val.userModel = v == null
                ? null
                : UserModel.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'ServiceVersion', (v) => val.serviceVersion = v as String?);
        $checkedConvert('LangVersion', (v) => val.langVersion = v as String?);
        $checkedConvert(
            'SirketModel',
            (v) => val.sirketModel =
                SirketModel.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'LangModel',
            (v) =>
                val.langModel = LangModel.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'MenuList',
            (v) => val.menuList =
                (v as List<dynamic>?)?.map((e) => e as String).toList());
        $checkedConvert(
            'ParamModel',
            (v) => val.paramModel =
                ParamModel.fromJson(v as Map<String, dynamic>));
        return val;
      },
      fieldKeyMap: const {
        'userModel': 'UserModel',
        'serviceVersion': 'ServiceVersion',
        'langVersion': 'LangVersion',
        'sirketModel': 'SirketModel',
        'langModel': 'LangModel',
        'menuList': 'MenuList',
        'paramModel': 'ParamModel'
      },
    );

Map<String, dynamic> _$MainPageModelToJson(MainPageModel instance) =>
    <String, dynamic>{
      'UserModel': instance.userModel?.toJson(),
      'ServiceVersion': instance.serviceVersion,
      'LangVersion': instance.langVersion,
      'SirketModel': instance.sirketModel?.toJson(),
      'LangModel': instance.langModel?.toJson(),
      'MenuList': instance.menuList,
      'ParamModel': instance.paramModel?.toJson(),
    };
