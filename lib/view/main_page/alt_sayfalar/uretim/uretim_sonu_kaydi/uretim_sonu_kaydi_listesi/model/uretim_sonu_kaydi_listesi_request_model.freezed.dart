// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uretim_sonu_kaydi_listesi_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UretimSonuKaydiListesiRequestModel {

 int? get sayfa; set sayfa(int? value); String? get ekranTipi; set ekranTipi(String? value); String? get belgeNo; set belgeNo(String? value); String? get searchText; set searchText(String? value);
/// Create a copy of UretimSonuKaydiListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UretimSonuKaydiListesiRequestModelCopyWith<UretimSonuKaydiListesiRequestModel> get copyWith => _$UretimSonuKaydiListesiRequestModelCopyWithImpl<UretimSonuKaydiListesiRequestModel>(this as UretimSonuKaydiListesiRequestModel, _$identity);

  /// Serializes this UretimSonuKaydiListesiRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $UretimSonuKaydiListesiRequestModelCopyWith<$Res>  {
  factory $UretimSonuKaydiListesiRequestModelCopyWith(UretimSonuKaydiListesiRequestModel value, $Res Function(UretimSonuKaydiListesiRequestModel) _then) = _$UretimSonuKaydiListesiRequestModelCopyWithImpl;
@useResult
$Res call({
 int? sayfa, String? ekranTipi, String? belgeNo, String? searchText
});




}
/// @nodoc
class _$UretimSonuKaydiListesiRequestModelCopyWithImpl<$Res>
    implements $UretimSonuKaydiListesiRequestModelCopyWith<$Res> {
  _$UretimSonuKaydiListesiRequestModelCopyWithImpl(this._self, this._then);

  final UretimSonuKaydiListesiRequestModel _self;
  final $Res Function(UretimSonuKaydiListesiRequestModel) _then;

/// Create a copy of UretimSonuKaydiListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sayfa = freezed,Object? ekranTipi = freezed,Object? belgeNo = freezed,Object? searchText = freezed,}) {
  return _then(_self.copyWith(
sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UretimSonuKaydiListesiRequestModel].
extension UretimSonuKaydiListesiRequestModelPatterns on UretimSonuKaydiListesiRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UretimSonuKaydiListesiRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UretimSonuKaydiListesiRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UretimSonuKaydiListesiRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _UretimSonuKaydiListesiRequestModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UretimSonuKaydiListesiRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _UretimSonuKaydiListesiRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sayfa,  String? ekranTipi,  String? belgeNo,  String? searchText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UretimSonuKaydiListesiRequestModel() when $default != null:
return $default(_that.sayfa,_that.ekranTipi,_that.belgeNo,_that.searchText);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sayfa,  String? ekranTipi,  String? belgeNo,  String? searchText)  $default,) {final _that = this;
switch (_that) {
case _UretimSonuKaydiListesiRequestModel():
return $default(_that.sayfa,_that.ekranTipi,_that.belgeNo,_that.searchText);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sayfa,  String? ekranTipi,  String? belgeNo,  String? searchText)?  $default,) {final _that = this;
switch (_that) {
case _UretimSonuKaydiListesiRequestModel() when $default != null:
return $default(_that.sayfa,_that.ekranTipi,_that.belgeNo,_that.searchText);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _UretimSonuKaydiListesiRequestModel implements UretimSonuKaydiListesiRequestModel {
   _UretimSonuKaydiListesiRequestModel({this.sayfa, this.ekranTipi, this.belgeNo, this.searchText});
  factory _UretimSonuKaydiListesiRequestModel.fromJson(Map<String, dynamic> json) => _$UretimSonuKaydiListesiRequestModelFromJson(json);

@override  int? sayfa;
@override  String? ekranTipi;
@override  String? belgeNo;
@override  String? searchText;

/// Create a copy of UretimSonuKaydiListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UretimSonuKaydiListesiRequestModelCopyWith<_UretimSonuKaydiListesiRequestModel> get copyWith => __$UretimSonuKaydiListesiRequestModelCopyWithImpl<_UretimSonuKaydiListesiRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UretimSonuKaydiListesiRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$UretimSonuKaydiListesiRequestModelCopyWith<$Res> implements $UretimSonuKaydiListesiRequestModelCopyWith<$Res> {
  factory _$UretimSonuKaydiListesiRequestModelCopyWith(_UretimSonuKaydiListesiRequestModel value, $Res Function(_UretimSonuKaydiListesiRequestModel) _then) = __$UretimSonuKaydiListesiRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? sayfa, String? ekranTipi, String? belgeNo, String? searchText
});




}
/// @nodoc
class __$UretimSonuKaydiListesiRequestModelCopyWithImpl<$Res>
    implements _$UretimSonuKaydiListesiRequestModelCopyWith<$Res> {
  __$UretimSonuKaydiListesiRequestModelCopyWithImpl(this._self, this._then);

  final _UretimSonuKaydiListesiRequestModel _self;
  final $Res Function(_UretimSonuKaydiListesiRequestModel) _then;

/// Create a copy of UretimSonuKaydiListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sayfa = freezed,Object? ekranTipi = freezed,Object? belgeNo = freezed,Object? searchText = freezed,}) {
  return _then(_UretimSonuKaydiListesiRequestModel(
sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
