// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dizayn_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DizaynRequestModel {

@JsonKey(name: "ModulID") int? get modulId;@JsonKey(name: "ERPDizaynlari") bool? get erpDizaynlari;
/// Create a copy of DizaynRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DizaynRequestModelCopyWith<DizaynRequestModel> get copyWith => _$DizaynRequestModelCopyWithImpl<DizaynRequestModel>(this as DizaynRequestModel, _$identity);

  /// Serializes this DizaynRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DizaynRequestModel&&(identical(other.modulId, modulId) || other.modulId == modulId)&&(identical(other.erpDizaynlari, erpDizaynlari) || other.erpDizaynlari == erpDizaynlari));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modulId,erpDizaynlari);



}

/// @nodoc
abstract mixin class $DizaynRequestModelCopyWith<$Res>  {
  factory $DizaynRequestModelCopyWith(DizaynRequestModel value, $Res Function(DizaynRequestModel) _then) = _$DizaynRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "ModulID") int? modulId,@JsonKey(name: "ERPDizaynlari") bool? erpDizaynlari
});




}
/// @nodoc
class _$DizaynRequestModelCopyWithImpl<$Res>
    implements $DizaynRequestModelCopyWith<$Res> {
  _$DizaynRequestModelCopyWithImpl(this._self, this._then);

  final DizaynRequestModel _self;
  final $Res Function(DizaynRequestModel) _then;

/// Create a copy of DizaynRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modulId = freezed,Object? erpDizaynlari = freezed,}) {
  return _then(_self.copyWith(
modulId: freezed == modulId ? _self.modulId : modulId // ignore: cast_nullable_to_non_nullable
as int?,erpDizaynlari: freezed == erpDizaynlari ? _self.erpDizaynlari : erpDizaynlari // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [DizaynRequestModel].
extension DizaynRequestModelPatterns on DizaynRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DizaynRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DizaynRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DizaynRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _DizaynRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DizaynRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _DizaynRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "ModulID")  int? modulId, @JsonKey(name: "ERPDizaynlari")  bool? erpDizaynlari)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DizaynRequestModel() when $default != null:
return $default(_that.modulId,_that.erpDizaynlari);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "ModulID")  int? modulId, @JsonKey(name: "ERPDizaynlari")  bool? erpDizaynlari)  $default,) {final _that = this;
switch (_that) {
case _DizaynRequestModel():
return $default(_that.modulId,_that.erpDizaynlari);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "ModulID")  int? modulId, @JsonKey(name: "ERPDizaynlari")  bool? erpDizaynlari)?  $default,) {final _that = this;
switch (_that) {
case _DizaynRequestModel() when $default != null:
return $default(_that.modulId,_that.erpDizaynlari);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DizaynRequestModel implements DizaynRequestModel {
  const _DizaynRequestModel({@JsonKey(name: "ModulID") this.modulId, @JsonKey(name: "ERPDizaynlari") this.erpDizaynlari});
  factory _DizaynRequestModel.fromJson(Map<String, dynamic> json) => _$DizaynRequestModelFromJson(json);

@override@JsonKey(name: "ModulID") final  int? modulId;
@override@JsonKey(name: "ERPDizaynlari") final  bool? erpDizaynlari;

/// Create a copy of DizaynRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DizaynRequestModelCopyWith<_DizaynRequestModel> get copyWith => __$DizaynRequestModelCopyWithImpl<_DizaynRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DizaynRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DizaynRequestModel&&(identical(other.modulId, modulId) || other.modulId == modulId)&&(identical(other.erpDizaynlari, erpDizaynlari) || other.erpDizaynlari == erpDizaynlari));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,modulId,erpDizaynlari);



}

/// @nodoc
abstract mixin class _$DizaynRequestModelCopyWith<$Res> implements $DizaynRequestModelCopyWith<$Res> {
  factory _$DizaynRequestModelCopyWith(_DizaynRequestModel value, $Res Function(_DizaynRequestModel) _then) = __$DizaynRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "ModulID") int? modulId,@JsonKey(name: "ERPDizaynlari") bool? erpDizaynlari
});




}
/// @nodoc
class __$DizaynRequestModelCopyWithImpl<$Res>
    implements _$DizaynRequestModelCopyWith<$Res> {
  __$DizaynRequestModelCopyWithImpl(this._self, this._then);

  final _DizaynRequestModel _self;
  final $Res Function(_DizaynRequestModel) _then;

/// Create a copy of DizaynRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modulId = freezed,Object? erpDizaynlari = freezed,}) {
  return _then(_DizaynRequestModel(
modulId: freezed == modulId ? _self.modulId : modulId // ignore: cast_nullable_to_non_nullable
as int?,erpDizaynlari: freezed == erpDizaynlari ? _self.erpDizaynlari : erpDizaynlari // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
