// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payker_drop_down_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pagination {

 bool get more; int? get totalCount;
/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationCopyWith<Pagination> get copyWith => _$PaginationCopyWithImpl<Pagination>(this as Pagination, _$identity);

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pagination&&(identical(other.more, more) || other.more == more)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,more,totalCount);



}

/// @nodoc
abstract mixin class $PaginationCopyWith<$Res>  {
  factory $PaginationCopyWith(Pagination value, $Res Function(Pagination) _then) = _$PaginationCopyWithImpl;
@useResult
$Res call({
 bool more, int? totalCount
});




}
/// @nodoc
class _$PaginationCopyWithImpl<$Res>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._self, this._then);

  final Pagination _self;
  final $Res Function(Pagination) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? more = null,Object? totalCount = freezed,}) {
  return _then(_self.copyWith(
more: null == more ? _self.more : more // ignore: cast_nullable_to_non_nullable
as bool,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _Pagination implements Pagination {
  const _Pagination({required this.more, this.totalCount});
  factory _Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

@override final  bool more;
@override final  int? totalCount;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationCopyWith<_Pagination> get copyWith => __$PaginationCopyWithImpl<_Pagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pagination&&(identical(other.more, more) || other.more == more)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,more,totalCount);



}

/// @nodoc
abstract mixin class _$PaginationCopyWith<$Res> implements $PaginationCopyWith<$Res> {
  factory _$PaginationCopyWith(_Pagination value, $Res Function(_Pagination) _then) = __$PaginationCopyWithImpl;
@override @useResult
$Res call({
 bool more, int? totalCount
});




}
/// @nodoc
class __$PaginationCopyWithImpl<$Res>
    implements _$PaginationCopyWith<$Res> {
  __$PaginationCopyWithImpl(this._self, this._then);

  final _Pagination _self;
  final $Res Function(_Pagination) _then;

/// Create a copy of Pagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? more = null,Object? totalCount = freezed,}) {
  return _then(_Pagination(
more: null == more ? _self.more : more // ignore: cast_nullable_to_non_nullable
as bool,totalCount: freezed == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$DropdownFilter {

/// Kullanıcının dropdown arama alanına yazdığı metin
 String? get searchTerm;/// Sayfa numarası (sayfalama için)
 int get pageNumber;/// Sayfa başına gösterilecek kayıt sayısı
 int get pageSize;/// Kullanıcı tarafından seçilmiş değerlerin listesi
 List<String>? get selectedValues;/// Filtre tipi ya da kategori (optional, örn. "Country", "Category", vb.)
 String? get filterType;/// Ek filtreleme için opsiyonel key-value çiftleri (özelleştirilebilir)
 Map<String, String>? get filters;
/// Create a copy of DropdownFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropdownFilterCopyWith<DropdownFilter> get copyWith => _$DropdownFilterCopyWithImpl<DropdownFilter>(this as DropdownFilter, _$identity);

  /// Serializes this DropdownFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DropdownFilter&&super == other&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other.selectedValues, selectedValues)&&(identical(other.filterType, filterType) || other.filterType == filterType)&&const DeepCollectionEquality().equals(other.filters, filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchTerm,pageNumber,pageSize,const DeepCollectionEquality().hash(selectedValues),filterType,const DeepCollectionEquality().hash(filters));



}

/// @nodoc
abstract mixin class $DropdownFilterCopyWith<$Res>  {
  factory $DropdownFilterCopyWith(DropdownFilter value, $Res Function(DropdownFilter) _then) = _$DropdownFilterCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, int pageNumber, int pageSize, List<String>? selectedValues, String? filterType, Map<String, String>? filters
});




}
/// @nodoc
class _$DropdownFilterCopyWithImpl<$Res>
    implements $DropdownFilterCopyWith<$Res> {
  _$DropdownFilterCopyWithImpl(this._self, this._then);

  final DropdownFilter _self;
  final $Res Function(DropdownFilter) _then;

/// Create a copy of DropdownFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchTerm = freezed,Object? pageNumber = null,Object? pageSize = null,Object? selectedValues = freezed,Object? filterType = freezed,Object? filters = freezed,}) {
  return _then(_self.copyWith(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,selectedValues: freezed == selectedValues ? _self.selectedValues : selectedValues // ignore: cast_nullable_to_non_nullable
as List<String>?,filterType: freezed == filterType ? _self.filterType : filterType // ignore: cast_nullable_to_non_nullable
as String?,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _DropdownFilter extends DropdownFilter {
   _DropdownFilter({this.searchTerm, this.pageNumber = 1, this.pageSize = 10, final  List<String>? selectedValues, this.filterType, final  Map<String, String>? filters}): _selectedValues = selectedValues,_filters = filters,super._();
  factory _DropdownFilter.fromJson(Map<String, dynamic> json) => _$DropdownFilterFromJson(json);

/// Kullanıcının dropdown arama alanına yazdığı metin
@override final  String? searchTerm;
/// Sayfa numarası (sayfalama için)
@override@JsonKey() final  int pageNumber;
/// Sayfa başına gösterilecek kayıt sayısı
@override@JsonKey() final  int pageSize;
/// Kullanıcı tarafından seçilmiş değerlerin listesi
 final  List<String>? _selectedValues;
/// Kullanıcı tarafından seçilmiş değerlerin listesi
@override List<String>? get selectedValues {
  final value = _selectedValues;
  if (value == null) return null;
  if (_selectedValues is EqualUnmodifiableListView) return _selectedValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Filtre tipi ya da kategori (optional, örn. "Country", "Category", vb.)
@override final  String? filterType;
/// Ek filtreleme için opsiyonel key-value çiftleri (özelleştirilebilir)
 final  Map<String, String>? _filters;
/// Ek filtreleme için opsiyonel key-value çiftleri (özelleştirilebilir)
@override Map<String, String>? get filters {
  final value = _filters;
  if (value == null) return null;
  if (_filters is EqualUnmodifiableMapView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DropdownFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropdownFilterCopyWith<_DropdownFilter> get copyWith => __$DropdownFilterCopyWithImpl<_DropdownFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DropdownFilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DropdownFilter&&super == other&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&const DeepCollectionEquality().equals(other._selectedValues, _selectedValues)&&(identical(other.filterType, filterType) || other.filterType == filterType)&&const DeepCollectionEquality().equals(other._filters, _filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchTerm,pageNumber,pageSize,const DeepCollectionEquality().hash(_selectedValues),filterType,const DeepCollectionEquality().hash(_filters));



}

/// @nodoc
abstract mixin class _$DropdownFilterCopyWith<$Res> implements $DropdownFilterCopyWith<$Res> {
  factory _$DropdownFilterCopyWith(_DropdownFilter value, $Res Function(_DropdownFilter) _then) = __$DropdownFilterCopyWithImpl;
@override @useResult
$Res call({
 String? searchTerm, int pageNumber, int pageSize, List<String>? selectedValues, String? filterType, Map<String, String>? filters
});




}
/// @nodoc
class __$DropdownFilterCopyWithImpl<$Res>
    implements _$DropdownFilterCopyWith<$Res> {
  __$DropdownFilterCopyWithImpl(this._self, this._then);

  final _DropdownFilter _self;
  final $Res Function(_DropdownFilter) _then;

/// Create a copy of DropdownFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? pageNumber = null,Object? pageSize = null,Object? selectedValues = freezed,Object? filterType = freezed,Object? filters = freezed,}) {
  return _then(_DropdownFilter(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,selectedValues: freezed == selectedValues ? _self._selectedValues : selectedValues // ignore: cast_nullable_to_non_nullable
as List<String>?,filterType: freezed == filterType ? _self.filterType : filterType // ignore: cast_nullable_to_non_nullable
as String?,filters: freezed == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}


/// @nodoc
mixin _$DropdownResult {

 List<PaykerFirmaModel>? get results; Pagination? get pagination;
/// Create a copy of DropdownResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DropdownResultCopyWith<DropdownResult> get copyWith => _$DropdownResultCopyWithImpl<DropdownResult>(this as DropdownResult, _$identity);

  /// Serializes this DropdownResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DropdownResult&&super == other&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),pagination);



}

/// @nodoc
abstract mixin class $DropdownResultCopyWith<$Res>  {
  factory $DropdownResultCopyWith(DropdownResult value, $Res Function(DropdownResult) _then) = _$DropdownResultCopyWithImpl;
@useResult
$Res call({
 List<PaykerFirmaModel>? results, Pagination? pagination
});


$PaginationCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$DropdownResultCopyWithImpl<$Res>
    implements $DropdownResultCopyWith<$Res> {
  _$DropdownResultCopyWithImpl(this._self, this._then);

  final DropdownResult _self;
  final $Res Function(DropdownResult) _then;

/// Create a copy of DropdownResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = freezed,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
results: freezed == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<PaykerFirmaModel>?,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,
  ));
}
/// Create a copy of DropdownResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _DropdownResult extends DropdownResult {
  const _DropdownResult({final  List<PaykerFirmaModel>? results, this.pagination}): _results = results,super._();
  factory _DropdownResult.fromJson(Map<String, dynamic> json) => _$DropdownResultFromJson(json);

 final  List<PaykerFirmaModel>? _results;
@override List<PaykerFirmaModel>? get results {
  final value = _results;
  if (value == null) return null;
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Pagination? pagination;

/// Create a copy of DropdownResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DropdownResultCopyWith<_DropdownResult> get copyWith => __$DropdownResultCopyWithImpl<_DropdownResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DropdownResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DropdownResult&&super == other&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),pagination);



}

/// @nodoc
abstract mixin class _$DropdownResultCopyWith<$Res> implements $DropdownResultCopyWith<$Res> {
  factory _$DropdownResultCopyWith(_DropdownResult value, $Res Function(_DropdownResult) _then) = __$DropdownResultCopyWithImpl;
@override @useResult
$Res call({
 List<PaykerFirmaModel>? results, Pagination? pagination
});


@override $PaginationCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$DropdownResultCopyWithImpl<$Res>
    implements _$DropdownResultCopyWith<$Res> {
  __$DropdownResultCopyWithImpl(this._self, this._then);

  final _DropdownResult _self;
  final $Res Function(_DropdownResult) _then;

/// Create a copy of DropdownResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = freezed,Object? pagination = freezed,}) {
  return _then(_DropdownResult(
results: freezed == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PaykerFirmaModel>?,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as Pagination?,
  ));
}

/// Create a copy of DropdownResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$PaykerFirmaModel {

 String? get id; String? get text;
/// Create a copy of PaykerFirmaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaykerFirmaModelCopyWith<PaykerFirmaModel> get copyWith => _$PaykerFirmaModelCopyWithImpl<PaykerFirmaModel>(this as PaykerFirmaModel, _$identity);

  /// Serializes this PaykerFirmaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaykerFirmaModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text);



}

/// @nodoc
abstract mixin class $PaykerFirmaModelCopyWith<$Res>  {
  factory $PaykerFirmaModelCopyWith(PaykerFirmaModel value, $Res Function(PaykerFirmaModel) _then) = _$PaykerFirmaModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? text
});




}
/// @nodoc
class _$PaykerFirmaModelCopyWithImpl<$Res>
    implements $PaykerFirmaModelCopyWith<$Res> {
  _$PaykerFirmaModelCopyWithImpl(this._self, this._then);

  final PaykerFirmaModel _self;
  final $Res Function(PaykerFirmaModel) _then;

/// Create a copy of PaykerFirmaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? text = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _PaykerFirmaModel extends PaykerFirmaModel {
   _PaykerFirmaModel({this.id, this.text}): super._();
  factory _PaykerFirmaModel.fromJson(Map<String, dynamic> json) => _$PaykerFirmaModelFromJson(json);

@override final  String? id;
@override final  String? text;

/// Create a copy of PaykerFirmaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaykerFirmaModelCopyWith<_PaykerFirmaModel> get copyWith => __$PaykerFirmaModelCopyWithImpl<_PaykerFirmaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaykerFirmaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaykerFirmaModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,text);



}

/// @nodoc
abstract mixin class _$PaykerFirmaModelCopyWith<$Res> implements $PaykerFirmaModelCopyWith<$Res> {
  factory _$PaykerFirmaModelCopyWith(_PaykerFirmaModel value, $Res Function(_PaykerFirmaModel) _then) = __$PaykerFirmaModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? text
});




}
/// @nodoc
class __$PaykerFirmaModelCopyWithImpl<$Res>
    implements _$PaykerFirmaModelCopyWith<$Res> {
  __$PaykerFirmaModelCopyWithImpl(this._self, this._then);

  final _PaykerFirmaModel _self;
  final $Res Function(_PaykerFirmaModel) _then;

/// Create a copy of PaykerFirmaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? text = freezed,}) {
  return _then(_PaykerFirmaModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
