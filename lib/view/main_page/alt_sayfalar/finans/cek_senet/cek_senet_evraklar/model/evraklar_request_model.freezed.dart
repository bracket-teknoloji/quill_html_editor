// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evraklar_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EvraklarRequestModel {

 String? get belgeTipi; set belgeTipi(String? value); String? get urlGetir; set urlGetir(String? value); String? get belgeNo; set belgeNo(String? value);
/// Create a copy of EvraklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvraklarRequestModelCopyWith<EvraklarRequestModel> get copyWith => _$EvraklarRequestModelCopyWithImpl<EvraklarRequestModel>(this as EvraklarRequestModel, _$identity);

  /// Serializes this EvraklarRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $EvraklarRequestModelCopyWith<$Res>  {
  factory $EvraklarRequestModelCopyWith(EvraklarRequestModel value, $Res Function(EvraklarRequestModel) _then) = _$EvraklarRequestModelCopyWithImpl;
@useResult
$Res call({
 String? belgeTipi, String? urlGetir, String? belgeNo
});




}
/// @nodoc
class _$EvraklarRequestModelCopyWithImpl<$Res>
    implements $EvraklarRequestModelCopyWith<$Res> {
  _$EvraklarRequestModelCopyWithImpl(this._self, this._then);

  final EvraklarRequestModel _self;
  final $Res Function(EvraklarRequestModel) _then;

/// Create a copy of EvraklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeTipi = freezed,Object? urlGetir = freezed,Object? belgeNo = freezed,}) {
  return _then(_self.copyWith(
belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,urlGetir: freezed == urlGetir ? _self.urlGetir : urlGetir // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EvraklarRequestModel].
extension EvraklarRequestModelPatterns on EvraklarRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EvraklarRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EvraklarRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EvraklarRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _EvraklarRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EvraklarRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _EvraklarRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? belgeTipi,  String? urlGetir,  String? belgeNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EvraklarRequestModel() when $default != null:
return $default(_that.belgeTipi,_that.urlGetir,_that.belgeNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? belgeTipi,  String? urlGetir,  String? belgeNo)  $default,) {final _that = this;
switch (_that) {
case _EvraklarRequestModel():
return $default(_that.belgeTipi,_that.urlGetir,_that.belgeNo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? belgeTipi,  String? urlGetir,  String? belgeNo)?  $default,) {final _that = this;
switch (_that) {
case _EvraklarRequestModel() when $default != null:
return $default(_that.belgeTipi,_that.urlGetir,_that.belgeNo);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _EvraklarRequestModel extends EvraklarRequestModel {
   _EvraklarRequestModel({this.belgeTipi, this.urlGetir, this.belgeNo}): super._();
  factory _EvraklarRequestModel.fromJson(Map<String, dynamic> json) => _$EvraklarRequestModelFromJson(json);

@override  String? belgeTipi;
@override  String? urlGetir;
@override  String? belgeNo;

/// Create a copy of EvraklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvraklarRequestModelCopyWith<_EvraklarRequestModel> get copyWith => __$EvraklarRequestModelCopyWithImpl<_EvraklarRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EvraklarRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$EvraklarRequestModelCopyWith<$Res> implements $EvraklarRequestModelCopyWith<$Res> {
  factory _$EvraklarRequestModelCopyWith(_EvraklarRequestModel value, $Res Function(_EvraklarRequestModel) _then) = __$EvraklarRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeTipi, String? urlGetir, String? belgeNo
});




}
/// @nodoc
class __$EvraklarRequestModelCopyWithImpl<$Res>
    implements _$EvraklarRequestModelCopyWith<$Res> {
  __$EvraklarRequestModelCopyWithImpl(this._self, this._then);

  final _EvraklarRequestModel _self;
  final $Res Function(_EvraklarRequestModel) _then;

/// Create a copy of EvraklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeTipi = freezed,Object? urlGetir = freezed,Object? belgeNo = freezed,}) {
  return _then(_EvraklarRequestModel(
belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,urlGetir: freezed == urlGetir ? _self.urlGetir : urlGetir // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
