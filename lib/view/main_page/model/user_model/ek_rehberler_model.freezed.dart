// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ek_rehberler_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EkRehberlerModel {

 int? get id; String? get baslik; String? get ekran; String? get alan;
/// Create a copy of EkRehberlerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EkRehberlerModelCopyWith<EkRehberlerModel> get copyWith => _$EkRehberlerModelCopyWithImpl<EkRehberlerModel>(this as EkRehberlerModel, _$identity);

  /// Serializes this EkRehberlerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EkRehberlerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.baslik, baslik) || other.baslik == baslik)&&(identical(other.ekran, ekran) || other.ekran == ekran)&&(identical(other.alan, alan) || other.alan == alan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,baslik,ekran,alan);



}

/// @nodoc
abstract mixin class $EkRehberlerModelCopyWith<$Res>  {
  factory $EkRehberlerModelCopyWith(EkRehberlerModel value, $Res Function(EkRehberlerModel) _then) = _$EkRehberlerModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? baslik, String? ekran, String? alan
});




}
/// @nodoc
class _$EkRehberlerModelCopyWithImpl<$Res>
    implements $EkRehberlerModelCopyWith<$Res> {
  _$EkRehberlerModelCopyWithImpl(this._self, this._then);

  final EkRehberlerModel _self;
  final $Res Function(EkRehberlerModel) _then;

/// Create a copy of EkRehberlerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? baslik = freezed,Object? ekran = freezed,Object? alan = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,baslik: freezed == baslik ? _self.baslik : baslik // ignore: cast_nullable_to_non_nullable
as String?,ekran: freezed == ekran ? _self.ekran : ekran // ignore: cast_nullable_to_non_nullable
as String?,alan: freezed == alan ? _self.alan : alan // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EkRehberlerModel].
extension EkRehberlerModelPatterns on EkRehberlerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EkRehberlerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EkRehberlerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EkRehberlerModel value)  $default,){
final _that = this;
switch (_that) {
case _EkRehberlerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EkRehberlerModel value)?  $default,){
final _that = this;
switch (_that) {
case _EkRehberlerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? baslik,  String? ekran,  String? alan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EkRehberlerModel() when $default != null:
return $default(_that.id,_that.baslik,_that.ekran,_that.alan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? baslik,  String? ekran,  String? alan)  $default,) {final _that = this;
switch (_that) {
case _EkRehberlerModel():
return $default(_that.id,_that.baslik,_that.ekran,_that.alan);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? baslik,  String? ekran,  String? alan)?  $default,) {final _that = this;
switch (_that) {
case _EkRehberlerModel() when $default != null:
return $default(_that.id,_that.baslik,_that.ekran,_that.alan);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createFactory: true)
class _EkRehberlerModel implements EkRehberlerModel {
  const _EkRehberlerModel({this.id, this.baslik, this.ekran, this.alan});
  factory _EkRehberlerModel.fromJson(Map<String, dynamic> json) => _$EkRehberlerModelFromJson(json);

@override final  int? id;
@override final  String? baslik;
@override final  String? ekran;
@override final  String? alan;

/// Create a copy of EkRehberlerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EkRehberlerModelCopyWith<_EkRehberlerModel> get copyWith => __$EkRehberlerModelCopyWithImpl<_EkRehberlerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EkRehberlerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EkRehberlerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.baslik, baslik) || other.baslik == baslik)&&(identical(other.ekran, ekran) || other.ekran == ekran)&&(identical(other.alan, alan) || other.alan == alan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,baslik,ekran,alan);



}

/// @nodoc
abstract mixin class _$EkRehberlerModelCopyWith<$Res> implements $EkRehberlerModelCopyWith<$Res> {
  factory _$EkRehberlerModelCopyWith(_EkRehberlerModel value, $Res Function(_EkRehberlerModel) _then) = __$EkRehberlerModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? baslik, String? ekran, String? alan
});




}
/// @nodoc
class __$EkRehberlerModelCopyWithImpl<$Res>
    implements _$EkRehberlerModelCopyWith<$Res> {
  __$EkRehberlerModelCopyWithImpl(this._self, this._then);

  final _EkRehberlerModel _self;
  final $Res Function(_EkRehberlerModel) _then;

/// Create a copy of EkRehberlerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? baslik = freezed,Object? ekran = freezed,Object? alan = freezed,}) {
  return _then(_EkRehberlerModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,baslik: freezed == baslik ? _self.baslik : baslik // ignore: cast_nullable_to_non_nullable
as String?,ekran: freezed == ekran ? _self.ekran : ekran // ignore: cast_nullable_to_non_nullable
as String?,alan: freezed == alan ? _self.alan : alan // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
