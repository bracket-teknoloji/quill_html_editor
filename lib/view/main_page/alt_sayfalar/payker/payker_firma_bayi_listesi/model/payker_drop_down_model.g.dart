// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payker_drop_down_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pagination _$PaginationFromJson(Map<String, dynamic> json) => _Pagination(
  more: json['More'] as bool,
  totalCount: (json['TotalCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaginationToJson(_Pagination instance) =>
    <String, dynamic>{
      'More': instance.more,
      'TotalCount': ?instance.totalCount,
    };

_DropdownFilter _$DropdownFilterFromJson(Map<String, dynamic> json) =>
    _DropdownFilter(
      searchTerm: json['SearchTerm'] as String?,
      pageNumber: (json['PageNumber'] as num?)?.toInt() ?? 1,
      pageSize: (json['PageSize'] as num?)?.toInt() ?? 10,
      selectedValues: (json['SelectedValues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      filterType: json['FilterType'] as String?,
      filters: (json['Filters'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$DropdownFilterToJson(_DropdownFilter instance) =>
    <String, dynamic>{
      'SearchTerm': ?instance.searchTerm,
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
      'SelectedValues': ?instance.selectedValues,
      'FilterType': ?instance.filterType,
      'Filters': ?instance.filters,
    };

_DropdownResult _$DropdownResultFromJson(Map<String, dynamic> json) =>
    _DropdownResult(
      results: (json['Results'] as List<dynamic>?)
          ?.map((e) => PaykerFirmaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['Pagination'] == null
          ? null
          : Pagination.fromJson(json['Pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DropdownResultToJson(_DropdownResult instance) =>
    <String, dynamic>{
      'Results': ?instance.results?.map((e) => e.toJson()).toList(),
      'Pagination': ?instance.pagination?.toJson(),
    };

_PaykerFirmaModel _$PaykerFirmaModelFromJson(Map<String, dynamic> json) =>
    _PaykerFirmaModel(id: json['Id'] as String?, text: json['Text'] as String?);

Map<String, dynamic> _$PaykerFirmaModelToJson(_PaykerFirmaModel instance) =>
    <String, dynamic>{'Id': ?instance.id, 'Text': ?instance.text};
