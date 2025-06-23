// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payker_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaykerFilterModel {

 List<FilterModel>? get filterModels; int? get draw; List<PaykerColumn>? get columns; List<Order>? get order; int? get start; int? get length; Search? get search; String? get sortOrder;
/// Create a copy of PaykerFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaykerFilterModelCopyWith<PaykerFilterModel> get copyWith => _$PaykerFilterModelCopyWithImpl<PaykerFilterModel>(this as PaykerFilterModel, _$identity);

  /// Serializes this PaykerFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaykerFilterModel&&const DeepCollectionEquality().equals(other.filterModels, filterModels)&&(identical(other.draw, draw) || other.draw == draw)&&const DeepCollectionEquality().equals(other.columns, columns)&&const DeepCollectionEquality().equals(other.order, order)&&(identical(other.start, start) || other.start == start)&&(identical(other.length, length) || other.length == length)&&(identical(other.search, search) || other.search == search)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(filterModels),draw,const DeepCollectionEquality().hash(columns),const DeepCollectionEquality().hash(order),start,length,search,sortOrder);



}

/// @nodoc
abstract mixin class $PaykerFilterModelCopyWith<$Res>  {
  factory $PaykerFilterModelCopyWith(PaykerFilterModel value, $Res Function(PaykerFilterModel) _then) = _$PaykerFilterModelCopyWithImpl;
@useResult
$Res call({
 List<FilterModel>? filterModels, int? draw, List<PaykerColumn>? columns, List<Order>? order, int? start, int? length, Search? search, String? sortOrder
});


$SearchCopyWith<$Res>? get search;

}
/// @nodoc
class _$PaykerFilterModelCopyWithImpl<$Res>
    implements $PaykerFilterModelCopyWith<$Res> {
  _$PaykerFilterModelCopyWithImpl(this._self, this._then);

  final PaykerFilterModel _self;
  final $Res Function(PaykerFilterModel) _then;

/// Create a copy of PaykerFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filterModels = freezed,Object? draw = freezed,Object? columns = freezed,Object? order = freezed,Object? start = freezed,Object? length = freezed,Object? search = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
filterModels: freezed == filterModels ? _self.filterModels : filterModels // ignore: cast_nullable_to_non_nullable
as List<FilterModel>?,draw: freezed == draw ? _self.draw : draw // ignore: cast_nullable_to_non_nullable
as int?,columns: freezed == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as List<PaykerColumn>?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as List<Order>?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as Search?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PaykerFilterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchCopyWith<$Res>? get search {
    if (_self.search == null) {
    return null;
  }

  return $SearchCopyWith<$Res>(_self.search!, (value) {
    return _then(_self.copyWith(search: value));
  });
}
}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _PaykerFilterModel implements PaykerFilterModel {
  const _PaykerFilterModel({final  List<FilterModel>? filterModels, this.draw, final  List<PaykerColumn>? columns, final  List<Order>? order, this.start, this.length, this.search, this.sortOrder}): _filterModels = filterModels,_columns = columns,_order = order;
  factory _PaykerFilterModel.fromJson(Map<String, dynamic> json) => _$PaykerFilterModelFromJson(json);

 final  List<FilterModel>? _filterModels;
@override List<FilterModel>? get filterModels {
  final value = _filterModels;
  if (value == null) return null;
  if (_filterModels is EqualUnmodifiableListView) return _filterModels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? draw;
 final  List<PaykerColumn>? _columns;
@override List<PaykerColumn>? get columns {
  final value = _columns;
  if (value == null) return null;
  if (_columns is EqualUnmodifiableListView) return _columns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Order>? _order;
@override List<Order>? get order {
  final value = _order;
  if (value == null) return null;
  if (_order is EqualUnmodifiableListView) return _order;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? start;
@override final  int? length;
@override final  Search? search;
@override final  String? sortOrder;

/// Create a copy of PaykerFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaykerFilterModelCopyWith<_PaykerFilterModel> get copyWith => __$PaykerFilterModelCopyWithImpl<_PaykerFilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaykerFilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaykerFilterModel&&const DeepCollectionEquality().equals(other._filterModels, _filterModels)&&(identical(other.draw, draw) || other.draw == draw)&&const DeepCollectionEquality().equals(other._columns, _columns)&&const DeepCollectionEquality().equals(other._order, _order)&&(identical(other.start, start) || other.start == start)&&(identical(other.length, length) || other.length == length)&&(identical(other.search, search) || other.search == search)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_filterModels),draw,const DeepCollectionEquality().hash(_columns),const DeepCollectionEquality().hash(_order),start,length,search,sortOrder);



}

/// @nodoc
abstract mixin class _$PaykerFilterModelCopyWith<$Res> implements $PaykerFilterModelCopyWith<$Res> {
  factory _$PaykerFilterModelCopyWith(_PaykerFilterModel value, $Res Function(_PaykerFilterModel) _then) = __$PaykerFilterModelCopyWithImpl;
@override @useResult
$Res call({
 List<FilterModel>? filterModels, int? draw, List<PaykerColumn>? columns, List<Order>? order, int? start, int? length, Search? search, String? sortOrder
});


@override $SearchCopyWith<$Res>? get search;

}
/// @nodoc
class __$PaykerFilterModelCopyWithImpl<$Res>
    implements _$PaykerFilterModelCopyWith<$Res> {
  __$PaykerFilterModelCopyWithImpl(this._self, this._then);

  final _PaykerFilterModel _self;
  final $Res Function(_PaykerFilterModel) _then;

/// Create a copy of PaykerFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filterModels = freezed,Object? draw = freezed,Object? columns = freezed,Object? order = freezed,Object? start = freezed,Object? length = freezed,Object? search = freezed,Object? sortOrder = freezed,}) {
  return _then(_PaykerFilterModel(
filterModels: freezed == filterModels ? _self._filterModels : filterModels // ignore: cast_nullable_to_non_nullable
as List<FilterModel>?,draw: freezed == draw ? _self.draw : draw // ignore: cast_nullable_to_non_nullable
as int?,columns: freezed == columns ? _self._columns : columns // ignore: cast_nullable_to_non_nullable
as List<PaykerColumn>?,order: freezed == order ? _self._order : order // ignore: cast_nullable_to_non_nullable
as List<Order>?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as Search?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PaykerFilterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchCopyWith<$Res>? get search {
    if (_self.search == null) {
    return null;
  }

  return $SearchCopyWith<$Res>(_self.search!, (value) {
    return _then(_self.copyWith(search: value));
  });
}
}


/// @nodoc
mixin _$PaykerColumn {

 String? get data; dynamic get name; bool? get searchable; bool? get orderable;
/// Create a copy of PaykerColumn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaykerColumnCopyWith<PaykerColumn> get copyWith => _$PaykerColumnCopyWithImpl<PaykerColumn>(this as PaykerColumn, _$identity);

  /// Serializes this PaykerColumn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaykerColumn&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.searchable, searchable) || other.searchable == searchable)&&(identical(other.orderable, orderable) || other.orderable == orderable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,const DeepCollectionEquality().hash(name),searchable,orderable);



}

/// @nodoc
abstract mixin class $PaykerColumnCopyWith<$Res>  {
  factory $PaykerColumnCopyWith(PaykerColumn value, $Res Function(PaykerColumn) _then) = _$PaykerColumnCopyWithImpl;
@useResult
$Res call({
 String? data, dynamic name, bool? searchable, bool? orderable
});




}
/// @nodoc
class _$PaykerColumnCopyWithImpl<$Res>
    implements $PaykerColumnCopyWith<$Res> {
  _$PaykerColumnCopyWithImpl(this._self, this._then);

  final PaykerColumn _self;
  final $Res Function(PaykerColumn) _then;

/// Create a copy of PaykerColumn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? name = freezed,Object? searchable = freezed,Object? orderable = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as dynamic,searchable: freezed == searchable ? _self.searchable : searchable // ignore: cast_nullable_to_non_nullable
as bool?,orderable: freezed == orderable ? _self.orderable : orderable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _PaykerColumn implements PaykerColumn {
  const _PaykerColumn({this.data, this.name, this.searchable, this.orderable});
  factory _PaykerColumn.fromJson(Map<String, dynamic> json) => _$PaykerColumnFromJson(json);

@override final  String? data;
@override final  dynamic name;
@override final  bool? searchable;
@override final  bool? orderable;

/// Create a copy of PaykerColumn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaykerColumnCopyWith<_PaykerColumn> get copyWith => __$PaykerColumnCopyWithImpl<_PaykerColumn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaykerColumnToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaykerColumn&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.searchable, searchable) || other.searchable == searchable)&&(identical(other.orderable, orderable) || other.orderable == orderable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data,const DeepCollectionEquality().hash(name),searchable,orderable);



}

/// @nodoc
abstract mixin class _$PaykerColumnCopyWith<$Res> implements $PaykerColumnCopyWith<$Res> {
  factory _$PaykerColumnCopyWith(_PaykerColumn value, $Res Function(_PaykerColumn) _then) = __$PaykerColumnCopyWithImpl;
@override @useResult
$Res call({
 String? data, dynamic name, bool? searchable, bool? orderable
});




}
/// @nodoc
class __$PaykerColumnCopyWithImpl<$Res>
    implements _$PaykerColumnCopyWith<$Res> {
  __$PaykerColumnCopyWithImpl(this._self, this._then);

  final _PaykerColumn _self;
  final $Res Function(_PaykerColumn) _then;

/// Create a copy of PaykerColumn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? name = freezed,Object? searchable = freezed,Object? orderable = freezed,}) {
  return _then(_PaykerColumn(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as dynamic,searchable: freezed == searchable ? _self.searchable : searchable // ignore: cast_nullable_to_non_nullable
as bool?,orderable: freezed == orderable ? _self.orderable : orderable // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$FilterModel {

 String? get type; String? get name; String? get value;
/// Create a copy of FilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterModelCopyWith<FilterModel> get copyWith => _$FilterModelCopyWithImpl<FilterModel>(this as FilterModel, _$identity);

  /// Serializes this FilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterModel&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,value);



}

/// @nodoc
abstract mixin class $FilterModelCopyWith<$Res>  {
  factory $FilterModelCopyWith(FilterModel value, $Res Function(FilterModel) _then) = _$FilterModelCopyWithImpl;
@useResult
$Res call({
 String? type, String? name, String? value
});




}
/// @nodoc
class _$FilterModelCopyWithImpl<$Res>
    implements $FilterModelCopyWith<$Res> {
  _$FilterModelCopyWithImpl(this._self, this._then);

  final FilterModel _self;
  final $Res Function(FilterModel) _then;

/// Create a copy of FilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? name = freezed,Object? value = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _FilterModel implements FilterModel {
  const _FilterModel({this.type, this.name, this.value});
  factory _FilterModel.fromJson(Map<String, dynamic> json) => _$FilterModelFromJson(json);

@override final  String? type;
@override final  String? name;
@override final  String? value;

/// Create a copy of FilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterModelCopyWith<_FilterModel> get copyWith => __$FilterModelCopyWithImpl<_FilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterModel&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,value);



}

/// @nodoc
abstract mixin class _$FilterModelCopyWith<$Res> implements $FilterModelCopyWith<$Res> {
  factory _$FilterModelCopyWith(_FilterModel value, $Res Function(_FilterModel) _then) = __$FilterModelCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? name, String? value
});




}
/// @nodoc
class __$FilterModelCopyWithImpl<$Res>
    implements _$FilterModelCopyWith<$Res> {
  __$FilterModelCopyWithImpl(this._self, this._then);

  final _FilterModel _self;
  final $Res Function(_FilterModel) _then;

/// Create a copy of FilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? name = freezed,Object? value = freezed,}) {
  return _then(_FilterModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Order {

@JsonKey(includeToJson: false, includeFromJson: true) String? get columnName; int? get column; int? get dir;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.columnName, columnName) || other.columnName == columnName)&&(identical(other.column, column) || other.column == column)&&(identical(other.dir, dir) || other.dir == dir));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,columnName,column,dir);



}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: true) String? columnName, int? column, int? dir
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? columnName = freezed,Object? column = freezed,Object? dir = freezed,}) {
  return _then(_self.copyWith(
columnName: freezed == columnName ? _self.columnName : columnName // ignore: cast_nullable_to_non_nullable
as String?,column: freezed == column ? _self.column : column // ignore: cast_nullable_to_non_nullable
as int?,dir: freezed == dir ? _self.dir : dir // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _Order implements Order {
  const _Order({@JsonKey(includeToJson: false, includeFromJson: true) this.columnName, this.column, this.dir});
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override@JsonKey(includeToJson: false, includeFromJson: true) final  String? columnName;
@override final  int? column;
@override final  int? dir;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.columnName, columnName) || other.columnName == columnName)&&(identical(other.column, column) || other.column == column)&&(identical(other.dir, dir) || other.dir == dir));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,columnName,column,dir);



}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false, includeFromJson: true) String? columnName, int? column, int? dir
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? columnName = freezed,Object? column = freezed,Object? dir = freezed,}) {
  return _then(_Order(
columnName: freezed == columnName ? _self.columnName : columnName // ignore: cast_nullable_to_non_nullable
as String?,column: freezed == column ? _self.column : column // ignore: cast_nullable_to_non_nullable
as int?,dir: freezed == dir ? _self.dir : dir // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Search {

 dynamic get value; bool? get regex;
/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchCopyWith<Search> get copyWith => _$SearchCopyWithImpl<Search>(this as Search, _$identity);

  /// Serializes this Search to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Search&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.regex, regex) || other.regex == regex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value),regex);



}

/// @nodoc
abstract mixin class $SearchCopyWith<$Res>  {
  factory $SearchCopyWith(Search value, $Res Function(Search) _then) = _$SearchCopyWithImpl;
@useResult
$Res call({
 dynamic value, bool? regex
});




}
/// @nodoc
class _$SearchCopyWithImpl<$Res>
    implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._self, this._then);

  final Search _self;
  final $Res Function(Search) _then;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? regex = freezed,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _Search implements Search {
  const _Search({this.value, this.regex});
  factory _Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

@override final  dynamic value;
@override final  bool? regex;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchCopyWith<_Search> get copyWith => __$SearchCopyWithImpl<_Search>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.regex, regex) || other.regex == regex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value),regex);



}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res> implements $SearchCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) = __$SearchCopyWithImpl;
@override @useResult
$Res call({
 dynamic value, bool? regex
});




}
/// @nodoc
class __$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

/// Create a copy of Search
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? regex = freezed,}) {
  return _then(_Search(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,regex: freezed == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
