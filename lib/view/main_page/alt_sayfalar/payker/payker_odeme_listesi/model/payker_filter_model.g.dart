// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaykerFilterModel _$PaykerFilterModelFromJson(Map<String, dynamic> json) =>
    _PaykerFilterModel(
      filterModels: (json['FilterModels'] as List<dynamic>?)
          ?.map((e) => FilterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      draw: (json['Draw'] as num?)?.toInt(),
      columns: (json['Columns'] as List<dynamic>?)
          ?.map((e) => PaykerColumn.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: (json['Order'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: (json['Start'] as num?)?.toInt(),
      length: (json['Length'] as num?)?.toInt(),
      search: json['Search'] == null
          ? null
          : Search.fromJson(json['Search'] as Map<String, dynamic>),
      sortOrder: json['SortOrder'] as String?,
    );

Map<String, dynamic> _$PaykerFilterModelToJson(_PaykerFilterModel instance) =>
    <String, dynamic>{
      'FilterModels': ?instance.filterModels?.map((e) => e.toJson()).toList(),
      'Draw': ?instance.draw,
      'Columns': ?instance.columns?.map((e) => e.toJson()).toList(),
      'Order': ?instance.order?.map((e) => e.toJson()).toList(),
      'Start': ?instance.start,
      'Length': ?instance.length,
      'Search': ?instance.search?.toJson(),
      'SortOrder': ?instance.sortOrder,
    };

_PaykerColumn _$PaykerColumnFromJson(Map<String, dynamic> json) =>
    _PaykerColumn(
      data: json['Data'] as String?,
      name: json['Name'],
      searchable: json['Searchable'] as bool?,
      orderable: json['Orderable'] as bool?,
    );

Map<String, dynamic> _$PaykerColumnToJson(_PaykerColumn instance) =>
    <String, dynamic>{
      'Data': ?instance.data,
      'Name': ?instance.name,
      'Searchable': ?instance.searchable,
      'Orderable': ?instance.orderable,
    };

_FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => _FilterModel(
  type: json['Type'] as String?,
  name: json['Name'] as String?,
  value: json['Value'] as String?,
);

Map<String, dynamic> _$FilterModelToJson(_FilterModel instance) =>
    <String, dynamic>{
      'Type': ?instance.type,
      'Name': ?instance.name,
      'Value': ?instance.value,
    };

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  columnName: json['ColumnName'] as String?,
  column: (json['Column'] as num?)?.toInt(),
  dir: (json['Dir'] as num?)?.toInt(),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'Column': ?instance.column,
  'Dir': ?instance.dir,
};

_Search _$SearchFromJson(Map<String, dynamic> json) =>
    _Search(value: json['Value'], regex: json['Regex'] as bool?);

Map<String, dynamic> _$SearchToJson(_Search instance) => <String, dynamic>{
  'Value': ?instance.value,
  'Regex': ?instance.regex,
};
