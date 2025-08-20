// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hucre_ara_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HucreAraRequestModel {

 String? get barkod; set barkod(String? value); String? get ekranTipi; set ekranTipi(String? value); int? get filtreKodu; set filtreKodu(int? value); Map<String, double>? get hucreMiktarArray; set hucreMiktarArray(Map<String, double>? value); String? get menuKodu; set menuKodu(String? value);
/// Create a copy of HucreAraRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HucreAraRequestModelCopyWith<HucreAraRequestModel> get copyWith => _$HucreAraRequestModelCopyWithImpl<HucreAraRequestModel>(this as HucreAraRequestModel, _$identity);

  /// Serializes this HucreAraRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $HucreAraRequestModelCopyWith<$Res>  {
  factory $HucreAraRequestModelCopyWith(HucreAraRequestModel value, $Res Function(HucreAraRequestModel) _then) = _$HucreAraRequestModelCopyWithImpl;
@useResult
$Res call({
 String? barkod, String? ekranTipi, int? filtreKodu, Map<String, double>? hucreMiktarArray, String? menuKodu
});




}
/// @nodoc
class _$HucreAraRequestModelCopyWithImpl<$Res>
    implements $HucreAraRequestModelCopyWith<$Res> {
  _$HucreAraRequestModelCopyWithImpl(this._self, this._then);

  final HucreAraRequestModel _self;
  final $Res Function(HucreAraRequestModel) _then;

/// Create a copy of HucreAraRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? barkod = freezed,Object? ekranTipi = freezed,Object? filtreKodu = freezed,Object? hucreMiktarArray = freezed,Object? menuKodu = freezed,}) {
  return _then(_self.copyWith(
barkod: freezed == barkod ? _self.barkod : barkod // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,hucreMiktarArray: freezed == hucreMiktarArray ? _self.hucreMiktarArray : hucreMiktarArray // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HucreAraRequestModel].
extension HucreAraRequestModelPatterns on HucreAraRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HucreAraRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HucreAraRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HucreAraRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _HucreAraRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HucreAraRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _HucreAraRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? barkod,  String? ekranTipi,  int? filtreKodu,  Map<String, double>? hucreMiktarArray,  String? menuKodu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HucreAraRequestModel() when $default != null:
return $default(_that.barkod,_that.ekranTipi,_that.filtreKodu,_that.hucreMiktarArray,_that.menuKodu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? barkod,  String? ekranTipi,  int? filtreKodu,  Map<String, double>? hucreMiktarArray,  String? menuKodu)  $default,) {final _that = this;
switch (_that) {
case _HucreAraRequestModel():
return $default(_that.barkod,_that.ekranTipi,_that.filtreKodu,_that.hucreMiktarArray,_that.menuKodu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? barkod,  String? ekranTipi,  int? filtreKodu,  Map<String, double>? hucreMiktarArray,  String? menuKodu)?  $default,) {final _that = this;
switch (_that) {
case _HucreAraRequestModel() when $default != null:
return $default(_that.barkod,_that.ekranTipi,_that.filtreKodu,_that.hucreMiktarArray,_that.menuKodu);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _HucreAraRequestModel extends HucreAraRequestModel {
   _HucreAraRequestModel({this.barkod, this.ekranTipi, this.filtreKodu, this.hucreMiktarArray, this.menuKodu}): super._();
  factory _HucreAraRequestModel.fromJson(Map<String, dynamic> json) => _$HucreAraRequestModelFromJson(json);

@override  String? barkod;
@override  String? ekranTipi;
@override  int? filtreKodu;
@override  Map<String, double>? hucreMiktarArray;
@override  String? menuKodu;

/// Create a copy of HucreAraRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HucreAraRequestModelCopyWith<_HucreAraRequestModel> get copyWith => __$HucreAraRequestModelCopyWithImpl<_HucreAraRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HucreAraRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$HucreAraRequestModelCopyWith<$Res> implements $HucreAraRequestModelCopyWith<$Res> {
  factory _$HucreAraRequestModelCopyWith(_HucreAraRequestModel value, $Res Function(_HucreAraRequestModel) _then) = __$HucreAraRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? barkod, String? ekranTipi, int? filtreKodu, Map<String, double>? hucreMiktarArray, String? menuKodu
});




}
/// @nodoc
class __$HucreAraRequestModelCopyWithImpl<$Res>
    implements _$HucreAraRequestModelCopyWith<$Res> {
  __$HucreAraRequestModelCopyWithImpl(this._self, this._then);

  final _HucreAraRequestModel _self;
  final $Res Function(_HucreAraRequestModel) _then;

/// Create a copy of HucreAraRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? barkod = freezed,Object? ekranTipi = freezed,Object? filtreKodu = freezed,Object? hucreMiktarArray = freezed,Object? menuKodu = freezed,}) {
  return _then(_HucreAraRequestModel(
barkod: freezed == barkod ? _self.barkod : barkod // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,hucreMiktarArray: freezed == hucreMiktarArray ? _self.hucreMiktarArray : hucreMiktarArray // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
