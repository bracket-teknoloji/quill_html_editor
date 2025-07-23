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

Map<String, dynamic> _$PaykerFilterModelToJson(
  _PaykerFilterModel instance,
) => <String, dynamic>{
  if (instance.filterModels?.map((e) => e.toJson()).toList() case final value?)
    'FilterModels': value,
  if (instance.draw case final value?) 'Draw': value,
  if (instance.columns?.map((e) => e.toJson()).toList() case final value?)
    'Columns': value,
  if (instance.order?.map((e) => e.toJson()).toList() case final value?)
    'Order': value,
  if (instance.start case final value?) 'Start': value,
  if (instance.length case final value?) 'Length': value,
  if (instance.search?.toJson() case final value?) 'Search': value,
  if (instance.sortOrder case final value?) 'SortOrder': value,
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
      if (instance.data case final value?) 'Data': value,
      if (instance.name case final value?) 'Name': value,
      if (instance.searchable case final value?) 'Searchable': value,
      if (instance.orderable case final value?) 'Orderable': value,
    };

_FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => _FilterModel(
  type: json['Type'] as String?,
  name: json['Name'] as String?,
  value: json['Value'] as String?,
);

Map<String, dynamic> _$FilterModelToJson(_FilterModel instance) =>
    <String, dynamic>{
      if (instance.type case final value?) 'Type': value,
      if (instance.name case final value?) 'Name': value,
      if (instance.value case final value?) 'Value': value,
    };

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  columnName: json['ColumnName'] as String?,
  column: (json['Column'] as num?)?.toInt(),
  dir: (json['Dir'] as num?)?.toInt(),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  if (instance.column case final value?) 'Column': value,
  if (instance.dir case final value?) 'Dir': value,
};

_Search _$SearchFromJson(Map<String, dynamic> json) =>
    _Search(value: json['Value'], regex: json['Regex'] as bool?);

Map<String, dynamic> _$SearchToJson(_Search instance) => <String, dynamic>{
  if (instance.value case final value?) 'Value': value,
  if (instance.regex case final value?) 'Regex': value,
};
