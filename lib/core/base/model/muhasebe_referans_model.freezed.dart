// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'muhasebe_referans_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MuhasebeReferansModel {

 String? get kodu; set kodu(String? value); String? get tanimi; set tanimi(String? value);
/// Create a copy of MuhasebeReferansModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuhasebeReferansModelCopyWith<MuhasebeReferansModel> get copyWith => _$MuhasebeReferansModelCopyWithImpl<MuhasebeReferansModel>(this as MuhasebeReferansModel, _$identity);

  /// Serializes this MuhasebeReferansModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $MuhasebeReferansModelCopyWith<$Res>  {
  factory $MuhasebeReferansModelCopyWith(MuhasebeReferansModel value, $Res Function(MuhasebeReferansModel) _then) = _$MuhasebeReferansModelCopyWithImpl;
@useResult
$Res call({
 String? kodu, String? tanimi
});




}
/// @nodoc
class _$MuhasebeReferansModelCopyWithImpl<$Res>
    implements $MuhasebeReferansModelCopyWith<$Res> {
  _$MuhasebeReferansModelCopyWithImpl(this._self, this._then);

  final MuhasebeReferansModel _self;
  final $Res Function(MuhasebeReferansModel) _then;

/// Create a copy of MuhasebeReferansModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kodu = freezed,Object? tanimi = freezed,}) {
  return _then(_self.copyWith(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,tanimi: freezed == tanimi ? _self.tanimi : tanimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MuhasebeReferansModel].
extension MuhasebeReferansModelPatterns on MuhasebeReferansModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MuhasebeReferansModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MuhasebeReferansModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MuhasebeReferansModel value)  $default,){
final _that = this;
switch (_that) {
case _MuhasebeReferansModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MuhasebeReferansModel value)?  $default,){
final _that = this;
switch (_that) {
case _MuhasebeReferansModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? kodu,  String? tanimi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MuhasebeReferansModel() when $default != null:
return $default(_that.kodu,_that.tanimi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? kodu,  String? tanimi)  $default,) {final _that = this;
switch (_that) {
case _MuhasebeReferansModel():
return $default(_that.kodu,_that.tanimi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? kodu,  String? tanimi)?  $default,) {final _that = this;
switch (_that) {
case _MuhasebeReferansModel() when $default != null:
return $default(_that.kodu,_that.tanimi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MuhasebeReferansModel extends MuhasebeReferansModel {
   _MuhasebeReferansModel({this.kodu, this.tanimi}): super._();
  factory _MuhasebeReferansModel.fromJson(Map<String, dynamic> json) => _$MuhasebeReferansModelFromJson(json);

@override  String? kodu;
@override  String? tanimi;

/// Create a copy of MuhasebeReferansModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuhasebeReferansModelCopyWith<_MuhasebeReferansModel> get copyWith => __$MuhasebeReferansModelCopyWithImpl<_MuhasebeReferansModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MuhasebeReferansModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$MuhasebeReferansModelCopyWith<$Res> implements $MuhasebeReferansModelCopyWith<$Res> {
  factory _$MuhasebeReferansModelCopyWith(_MuhasebeReferansModel value, $Res Function(_MuhasebeReferansModel) _then) = __$MuhasebeReferansModelCopyWithImpl;
@override @useResult
$Res call({
 String? kodu, String? tanimi
});




}
/// @nodoc
class __$MuhasebeReferansModelCopyWithImpl<$Res>
    implements _$MuhasebeReferansModelCopyWith<$Res> {
  __$MuhasebeReferansModelCopyWithImpl(this._self, this._then);

  final _MuhasebeReferansModel _self;
  final $Res Function(_MuhasebeReferansModel) _then;

/// Create a copy of MuhasebeReferansModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kodu = freezed,Object? tanimi = freezed,}) {
  return _then(_MuhasebeReferansModel(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,tanimi: freezed == tanimi ? _self.tanimi : tanimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
