// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kullanicilar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KullanicilarModel {

 String? get kodu; String? get adi;
/// Create a copy of KullanicilarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KullanicilarModelCopyWith<KullanicilarModel> get copyWith => _$KullanicilarModelCopyWithImpl<KullanicilarModel>(this as KullanicilarModel, _$identity);

  /// Serializes this KullanicilarModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KullanicilarModel&&super == other&&(identical(other.kodu, kodu) || other.kodu == kodu)&&(identical(other.adi, adi) || other.adi == adi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kodu,adi);



}

/// @nodoc
abstract mixin class $KullanicilarModelCopyWith<$Res>  {
  factory $KullanicilarModelCopyWith(KullanicilarModel value, $Res Function(KullanicilarModel) _then) = _$KullanicilarModelCopyWithImpl;
@useResult
$Res call({
 String? kodu, String? adi
});




}
/// @nodoc
class _$KullanicilarModelCopyWithImpl<$Res>
    implements $KullanicilarModelCopyWith<$Res> {
  _$KullanicilarModelCopyWithImpl(this._self, this._then);

  final KullanicilarModel _self;
  final $Res Function(KullanicilarModel) _then;

/// Create a copy of KullanicilarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kodu = freezed,Object? adi = freezed,}) {
  return _then(_self.copyWith(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [KullanicilarModel].
extension KullanicilarModelPatterns on KullanicilarModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KullanicilarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KullanicilarModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KullanicilarModel value)  $default,){
final _that = this;
switch (_that) {
case _KullanicilarModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KullanicilarModel value)?  $default,){
final _that = this;
switch (_that) {
case _KullanicilarModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? kodu,  String? adi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KullanicilarModel() when $default != null:
return $default(_that.kodu,_that.adi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? kodu,  String? adi)  $default,) {final _that = this;
switch (_that) {
case _KullanicilarModel():
return $default(_that.kodu,_that.adi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? kodu,  String? adi)?  $default,) {final _that = this;
switch (_that) {
case _KullanicilarModel() when $default != null:
return $default(_that.kodu,_that.adi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KullanicilarModel extends KullanicilarModel {
  const _KullanicilarModel({this.kodu, this.adi}): super._();
  factory _KullanicilarModel.fromJson(Map<String, dynamic> json) => _$KullanicilarModelFromJson(json);

@override final  String? kodu;
@override final  String? adi;

/// Create a copy of KullanicilarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KullanicilarModelCopyWith<_KullanicilarModel> get copyWith => __$KullanicilarModelCopyWithImpl<_KullanicilarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KullanicilarModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KullanicilarModel&&super == other&&(identical(other.kodu, kodu) || other.kodu == kodu)&&(identical(other.adi, adi) || other.adi == adi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kodu,adi);



}

/// @nodoc
abstract mixin class _$KullanicilarModelCopyWith<$Res> implements $KullanicilarModelCopyWith<$Res> {
  factory _$KullanicilarModelCopyWith(_KullanicilarModel value, $Res Function(_KullanicilarModel) _then) = __$KullanicilarModelCopyWithImpl;
@override @useResult
$Res call({
 String? kodu, String? adi
});




}
/// @nodoc
class __$KullanicilarModelCopyWithImpl<$Res>
    implements _$KullanicilarModelCopyWith<$Res> {
  __$KullanicilarModelCopyWithImpl(this._self, this._then);

  final _KullanicilarModel _self;
  final $Res Function(_KullanicilarModel) _then;

/// Create a copy of KullanicilarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kodu = freezed,Object? adi = freezed,}) {
  return _then(_KullanicilarModel(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
