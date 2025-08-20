// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sayim_kalem_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SayimKalemRequestModel {

 int? get id; int? get depoKodu; String? get belgeNo;
/// Create a copy of SayimKalemRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SayimKalemRequestModelCopyWith<SayimKalemRequestModel> get copyWith => _$SayimKalemRequestModelCopyWithImpl<SayimKalemRequestModel>(this as SayimKalemRequestModel, _$identity);

  /// Serializes this SayimKalemRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SayimKalemRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,depoKodu,belgeNo);



}

/// @nodoc
abstract mixin class $SayimKalemRequestModelCopyWith<$Res>  {
  factory $SayimKalemRequestModelCopyWith(SayimKalemRequestModel value, $Res Function(SayimKalemRequestModel) _then) = _$SayimKalemRequestModelCopyWithImpl;
@useResult
$Res call({
 int? id, int? depoKodu, String? belgeNo
});




}
/// @nodoc
class _$SayimKalemRequestModelCopyWithImpl<$Res>
    implements $SayimKalemRequestModelCopyWith<$Res> {
  _$SayimKalemRequestModelCopyWithImpl(this._self, this._then);

  final SayimKalemRequestModel _self;
  final $Res Function(SayimKalemRequestModel) _then;

/// Create a copy of SayimKalemRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? depoKodu = freezed,Object? belgeNo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SayimKalemRequestModel].
extension SayimKalemRequestModelPatterns on SayimKalemRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SayimKalemRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SayimKalemRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SayimKalemRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _SayimKalemRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SayimKalemRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _SayimKalemRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? depoKodu,  String? belgeNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SayimKalemRequestModel() when $default != null:
return $default(_that.id,_that.depoKodu,_that.belgeNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? depoKodu,  String? belgeNo)  $default,) {final _that = this;
switch (_that) {
case _SayimKalemRequestModel():
return $default(_that.id,_that.depoKodu,_that.belgeNo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? depoKodu,  String? belgeNo)?  $default,) {final _that = this;
switch (_that) {
case _SayimKalemRequestModel() when $default != null:
return $default(_that.id,_that.depoKodu,_that.belgeNo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SayimKalemRequestModel implements SayimKalemRequestModel {
  const _SayimKalemRequestModel({this.id, this.depoKodu, this.belgeNo});
  factory _SayimKalemRequestModel.fromJson(Map<String, dynamic> json) => _$SayimKalemRequestModelFromJson(json);

@override final  int? id;
@override final  int? depoKodu;
@override final  String? belgeNo;

/// Create a copy of SayimKalemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SayimKalemRequestModelCopyWith<_SayimKalemRequestModel> get copyWith => __$SayimKalemRequestModelCopyWithImpl<_SayimKalemRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SayimKalemRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SayimKalemRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,depoKodu,belgeNo);



}

/// @nodoc
abstract mixin class _$SayimKalemRequestModelCopyWith<$Res> implements $SayimKalemRequestModelCopyWith<$Res> {
  factory _$SayimKalemRequestModelCopyWith(_SayimKalemRequestModel value, $Res Function(_SayimKalemRequestModel) _then) = __$SayimKalemRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? depoKodu, String? belgeNo
});




}
/// @nodoc
class __$SayimKalemRequestModelCopyWithImpl<$Res>
    implements _$SayimKalemRequestModelCopyWith<$Res> {
  __$SayimKalemRequestModelCopyWithImpl(this._self, this._then);

  final _SayimKalemRequestModel _self;
  final $Res Function(_SayimKalemRequestModel) _then;

/// Create a copy of SayimKalemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? depoKodu = freezed,Object? belgeNo = freezed,}) {
  return _then(_SayimKalemRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
