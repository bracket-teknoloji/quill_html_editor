// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genel_rehber_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenelRehberModel {

 String? get kodu; set kodu(String? value); String? get aciklama; set aciklama(String? value); String? get adi; set adi(String? value);
/// Create a copy of GenelRehberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenelRehberModelCopyWith<GenelRehberModel> get copyWith => _$GenelRehberModelCopyWithImpl<GenelRehberModel>(this as GenelRehberModel, _$identity);

  /// Serializes this GenelRehberModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $GenelRehberModelCopyWith<$Res>  {
  factory $GenelRehberModelCopyWith(GenelRehberModel value, $Res Function(GenelRehberModel) _then) = _$GenelRehberModelCopyWithImpl;
@useResult
$Res call({
 String? kodu, String? aciklama, String? adi
});




}
/// @nodoc
class _$GenelRehberModelCopyWithImpl<$Res>
    implements $GenelRehberModelCopyWith<$Res> {
  _$GenelRehberModelCopyWithImpl(this._self, this._then);

  final GenelRehberModel _self;
  final $Res Function(GenelRehberModel) _then;

/// Create a copy of GenelRehberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kodu = freezed,Object? aciklama = freezed,Object? adi = freezed,}) {
  return _then(_self.copyWith(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GenelRehberModel].
extension GenelRehberModelPatterns on GenelRehberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GenelRehberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GenelRehberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GenelRehberModel value)  $default,){
final _that = this;
switch (_that) {
case _GenelRehberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GenelRehberModel value)?  $default,){
final _that = this;
switch (_that) {
case _GenelRehberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? kodu,  String? aciklama,  String? adi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GenelRehberModel() when $default != null:
return $default(_that.kodu,_that.aciklama,_that.adi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? kodu,  String? aciklama,  String? adi)  $default,) {final _that = this;
switch (_that) {
case _GenelRehberModel():
return $default(_that.kodu,_that.aciklama,_that.adi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? kodu,  String? aciklama,  String? adi)?  $default,) {final _that = this;
switch (_that) {
case _GenelRehberModel() when $default != null:
return $default(_that.kodu,_that.aciklama,_that.adi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GenelRehberModel extends GenelRehberModel {
   _GenelRehberModel({this.kodu, this.aciklama, this.adi}): super._();
  factory _GenelRehberModel.fromJson(Map<String, dynamic> json) => _$GenelRehberModelFromJson(json);

@override  String? kodu;
@override  String? aciklama;
@override  String? adi;

/// Create a copy of GenelRehberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenelRehberModelCopyWith<_GenelRehberModel> get copyWith => __$GenelRehberModelCopyWithImpl<_GenelRehberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenelRehberModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$GenelRehberModelCopyWith<$Res> implements $GenelRehberModelCopyWith<$Res> {
  factory _$GenelRehberModelCopyWith(_GenelRehberModel value, $Res Function(_GenelRehberModel) _then) = __$GenelRehberModelCopyWithImpl;
@override @useResult
$Res call({
 String? kodu, String? aciklama, String? adi
});




}
/// @nodoc
class __$GenelRehberModelCopyWithImpl<$Res>
    implements _$GenelRehberModelCopyWith<$Res> {
  __$GenelRehberModelCopyWithImpl(this._self, this._then);

  final _GenelRehberModel _self;
  final $Res Function(_GenelRehberModel) _then;

/// Create a copy of GenelRehberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kodu = freezed,Object? aciklama = freezed,Object? adi = freezed,}) {
  return _then(_GenelRehberModel(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
