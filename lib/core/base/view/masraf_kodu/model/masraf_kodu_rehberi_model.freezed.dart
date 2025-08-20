// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'masraf_kodu_rehberi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MasrafKoduRehberiModel {

 String? get masrafKodu; set masrafKodu(String? value); String? get masrafAdi; set masrafAdi(String? value);
/// Create a copy of MasrafKoduRehberiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MasrafKoduRehberiModelCopyWith<MasrafKoduRehberiModel> get copyWith => _$MasrafKoduRehberiModelCopyWithImpl<MasrafKoduRehberiModel>(this as MasrafKoduRehberiModel, _$identity);

  /// Serializes this MasrafKoduRehberiModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $MasrafKoduRehberiModelCopyWith<$Res>  {
  factory $MasrafKoduRehberiModelCopyWith(MasrafKoduRehberiModel value, $Res Function(MasrafKoduRehberiModel) _then) = _$MasrafKoduRehberiModelCopyWithImpl;
@useResult
$Res call({
 String? masrafKodu, String? masrafAdi
});




}
/// @nodoc
class _$MasrafKoduRehberiModelCopyWithImpl<$Res>
    implements $MasrafKoduRehberiModelCopyWith<$Res> {
  _$MasrafKoduRehberiModelCopyWithImpl(this._self, this._then);

  final MasrafKoduRehberiModel _self;
  final $Res Function(MasrafKoduRehberiModel) _then;

/// Create a copy of MasrafKoduRehberiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? masrafKodu = freezed,Object? masrafAdi = freezed,}) {
  return _then(_self.copyWith(
masrafKodu: freezed == masrafKodu ? _self.masrafKodu : masrafKodu // ignore: cast_nullable_to_non_nullable
as String?,masrafAdi: freezed == masrafAdi ? _self.masrafAdi : masrafAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MasrafKoduRehberiModel].
extension MasrafKoduRehberiModelPatterns on MasrafKoduRehberiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MasrafKoduRehberiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MasrafKoduRehberiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MasrafKoduRehberiModel value)  $default,){
final _that = this;
switch (_that) {
case _MasrafKoduRehberiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MasrafKoduRehberiModel value)?  $default,){
final _that = this;
switch (_that) {
case _MasrafKoduRehberiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? masrafKodu,  String? masrafAdi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MasrafKoduRehberiModel() when $default != null:
return $default(_that.masrafKodu,_that.masrafAdi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? masrafKodu,  String? masrafAdi)  $default,) {final _that = this;
switch (_that) {
case _MasrafKoduRehberiModel():
return $default(_that.masrafKodu,_that.masrafAdi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? masrafKodu,  String? masrafAdi)?  $default,) {final _that = this;
switch (_that) {
case _MasrafKoduRehberiModel() when $default != null:
return $default(_that.masrafKodu,_that.masrafAdi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MasrafKoduRehberiModel extends MasrafKoduRehberiModel {
   _MasrafKoduRehberiModel({this.masrafKodu, this.masrafAdi}): super._();
  factory _MasrafKoduRehberiModel.fromJson(Map<String, dynamic> json) => _$MasrafKoduRehberiModelFromJson(json);

@override  String? masrafKodu;
@override  String? masrafAdi;

/// Create a copy of MasrafKoduRehberiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MasrafKoduRehberiModelCopyWith<_MasrafKoduRehberiModel> get copyWith => __$MasrafKoduRehberiModelCopyWithImpl<_MasrafKoduRehberiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MasrafKoduRehberiModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$MasrafKoduRehberiModelCopyWith<$Res> implements $MasrafKoduRehberiModelCopyWith<$Res> {
  factory _$MasrafKoduRehberiModelCopyWith(_MasrafKoduRehberiModel value, $Res Function(_MasrafKoduRehberiModel) _then) = __$MasrafKoduRehberiModelCopyWithImpl;
@override @useResult
$Res call({
 String? masrafKodu, String? masrafAdi
});




}
/// @nodoc
class __$MasrafKoduRehberiModelCopyWithImpl<$Res>
    implements _$MasrafKoduRehberiModelCopyWith<$Res> {
  __$MasrafKoduRehberiModelCopyWithImpl(this._self, this._then);

  final _MasrafKoduRehberiModel _self;
  final $Res Function(_MasrafKoduRehberiModel) _then;

/// Create a copy of MasrafKoduRehberiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? masrafKodu = freezed,Object? masrafAdi = freezed,}) {
  return _then(_MasrafKoduRehberiModel(
masrafKodu: freezed == masrafKodu ? _self.masrafKodu : masrafKodu // ignore: cast_nullable_to_non_nullable
as String?,masrafAdi: freezed == masrafAdi ? _self.masrafAdi : masrafAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
