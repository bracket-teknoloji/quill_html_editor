// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ortalama_vade_tarihi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrtalamaVadeTarihiModel {

 DateTime? get vadeTarihi; set vadeTarihi(DateTime? value); double? get tutar; set tutar(double? value);
/// Create a copy of OrtalamaVadeTarihiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrtalamaVadeTarihiModelCopyWith<OrtalamaVadeTarihiModel> get copyWith => _$OrtalamaVadeTarihiModelCopyWithImpl<OrtalamaVadeTarihiModel>(this as OrtalamaVadeTarihiModel, _$identity);

  /// Serializes this OrtalamaVadeTarihiModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OrtalamaVadeTarihiModelCopyWith<$Res>  {
  factory $OrtalamaVadeTarihiModelCopyWith(OrtalamaVadeTarihiModel value, $Res Function(OrtalamaVadeTarihiModel) _then) = _$OrtalamaVadeTarihiModelCopyWithImpl;
@useResult
$Res call({
 DateTime? vadeTarihi, double? tutar
});




}
/// @nodoc
class _$OrtalamaVadeTarihiModelCopyWithImpl<$Res>
    implements $OrtalamaVadeTarihiModelCopyWith<$Res> {
  _$OrtalamaVadeTarihiModelCopyWithImpl(this._self, this._then);

  final OrtalamaVadeTarihiModel _self;
  final $Res Function(OrtalamaVadeTarihiModel) _then;

/// Create a copy of OrtalamaVadeTarihiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vadeTarihi = freezed,Object? tutar = freezed,}) {
  return _then(_self.copyWith(
vadeTarihi: freezed == vadeTarihi ? _self.vadeTarihi : vadeTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrtalamaVadeTarihiModel].
extension OrtalamaVadeTarihiModelPatterns on OrtalamaVadeTarihiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrtalamaVadeTarihiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrtalamaVadeTarihiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrtalamaVadeTarihiModel value)  $default,){
final _that = this;
switch (_that) {
case _OrtalamaVadeTarihiModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrtalamaVadeTarihiModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrtalamaVadeTarihiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? vadeTarihi,  double? tutar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrtalamaVadeTarihiModel() when $default != null:
return $default(_that.vadeTarihi,_that.tutar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? vadeTarihi,  double? tutar)  $default,) {final _that = this;
switch (_that) {
case _OrtalamaVadeTarihiModel():
return $default(_that.vadeTarihi,_that.tutar);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? vadeTarihi,  double? tutar)?  $default,) {final _that = this;
switch (_that) {
case _OrtalamaVadeTarihiModel() when $default != null:
return $default(_that.vadeTarihi,_that.tutar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrtalamaVadeTarihiModel implements OrtalamaVadeTarihiModel {
   _OrtalamaVadeTarihiModel({this.vadeTarihi, this.tutar});
  factory _OrtalamaVadeTarihiModel.fromJson(Map<String, dynamic> json) => _$OrtalamaVadeTarihiModelFromJson(json);

@override  DateTime? vadeTarihi;
@override  double? tutar;

/// Create a copy of OrtalamaVadeTarihiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrtalamaVadeTarihiModelCopyWith<_OrtalamaVadeTarihiModel> get copyWith => __$OrtalamaVadeTarihiModelCopyWithImpl<_OrtalamaVadeTarihiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrtalamaVadeTarihiModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OrtalamaVadeTarihiModelCopyWith<$Res> implements $OrtalamaVadeTarihiModelCopyWith<$Res> {
  factory _$OrtalamaVadeTarihiModelCopyWith(_OrtalamaVadeTarihiModel value, $Res Function(_OrtalamaVadeTarihiModel) _then) = __$OrtalamaVadeTarihiModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime? vadeTarihi, double? tutar
});




}
/// @nodoc
class __$OrtalamaVadeTarihiModelCopyWithImpl<$Res>
    implements _$OrtalamaVadeTarihiModelCopyWith<$Res> {
  __$OrtalamaVadeTarihiModelCopyWithImpl(this._self, this._then);

  final _OrtalamaVadeTarihiModel _self;
  final $Res Function(_OrtalamaVadeTarihiModel) _then;

/// Create a copy of OrtalamaVadeTarihiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vadeTarihi = freezed,Object? tutar = freezed,}) {
  return _then(_OrtalamaVadeTarihiModel(
vadeTarihi: freezed == vadeTarihi ? _self.vadeTarihi : vadeTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
