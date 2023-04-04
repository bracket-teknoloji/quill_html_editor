// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'main_page_model.dart';

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
