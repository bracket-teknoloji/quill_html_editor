// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_fatura_ozel_kod_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EFaturaOzelKodModel {

 int? get tip; set tip(int? value); String? get tipAdi; set tipAdi(String? value); int? get kod; set kod(int? value); String? get aciklama; set aciklama(String? value);
/// Create a copy of EFaturaOzelKodModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EFaturaOzelKodModelCopyWith<EFaturaOzelKodModel> get copyWith => _$EFaturaOzelKodModelCopyWithImpl<EFaturaOzelKodModel>(this as EFaturaOzelKodModel, _$identity);

  /// Serializes this EFaturaOzelKodModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $EFaturaOzelKodModelCopyWith<$Res>  {
  factory $EFaturaOzelKodModelCopyWith(EFaturaOzelKodModel value, $Res Function(EFaturaOzelKodModel) _then) = _$EFaturaOzelKodModelCopyWithImpl;
@useResult
$Res call({
 int? tip, String? tipAdi, int? kod, String? aciklama
});




}
/// @nodoc
class _$EFaturaOzelKodModelCopyWithImpl<$Res>
    implements $EFaturaOzelKodModelCopyWith<$Res> {
  _$EFaturaOzelKodModelCopyWithImpl(this._self, this._then);

  final EFaturaOzelKodModel _self;
  final $Res Function(EFaturaOzelKodModel) _then;

/// Create a copy of EFaturaOzelKodModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tip = freezed,Object? tipAdi = freezed,Object? kod = freezed,Object? aciklama = freezed,}) {
  return _then(_self.copyWith(
tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as int?,tipAdi: freezed == tipAdi ? _self.tipAdi : tipAdi // ignore: cast_nullable_to_non_nullable
as String?,kod: freezed == kod ? _self.kod : kod // ignore: cast_nullable_to_non_nullable
as int?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EFaturaOzelKodModel].
extension EFaturaOzelKodModelPatterns on EFaturaOzelKodModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EFaturaOzelKodModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EFaturaOzelKodModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EFaturaOzelKodModel value)  $default,){
final _that = this;
switch (_that) {
case _EFaturaOzelKodModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EFaturaOzelKodModel value)?  $default,){
final _that = this;
switch (_that) {
case _EFaturaOzelKodModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? tip,  String? tipAdi,  int? kod,  String? aciklama)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EFaturaOzelKodModel() when $default != null:
return $default(_that.tip,_that.tipAdi,_that.kod,_that.aciklama);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? tip,  String? tipAdi,  int? kod,  String? aciklama)  $default,) {final _that = this;
switch (_that) {
case _EFaturaOzelKodModel():
return $default(_that.tip,_that.tipAdi,_that.kod,_that.aciklama);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? tip,  String? tipAdi,  int? kod,  String? aciklama)?  $default,) {final _that = this;
switch (_that) {
case _EFaturaOzelKodModel() when $default != null:
return $default(_that.tip,_that.tipAdi,_that.kod,_that.aciklama);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EFaturaOzelKodModel extends EFaturaOzelKodModel {
   _EFaturaOzelKodModel({this.tip, this.tipAdi, this.kod, this.aciklama}): super._();
  factory _EFaturaOzelKodModel.fromJson(Map<String, dynamic> json) => _$EFaturaOzelKodModelFromJson(json);

@override  int? tip;
@override  String? tipAdi;
@override  int? kod;
@override  String? aciklama;

/// Create a copy of EFaturaOzelKodModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EFaturaOzelKodModelCopyWith<_EFaturaOzelKodModel> get copyWith => __$EFaturaOzelKodModelCopyWithImpl<_EFaturaOzelKodModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EFaturaOzelKodModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$EFaturaOzelKodModelCopyWith<$Res> implements $EFaturaOzelKodModelCopyWith<$Res> {
  factory _$EFaturaOzelKodModelCopyWith(_EFaturaOzelKodModel value, $Res Function(_EFaturaOzelKodModel) _then) = __$EFaturaOzelKodModelCopyWithImpl;
@override @useResult
$Res call({
 int? tip, String? tipAdi, int? kod, String? aciklama
});




}
/// @nodoc
class __$EFaturaOzelKodModelCopyWithImpl<$Res>
    implements _$EFaturaOzelKodModelCopyWith<$Res> {
  __$EFaturaOzelKodModelCopyWithImpl(this._self, this._then);

  final _EFaturaOzelKodModel _self;
  final $Res Function(_EFaturaOzelKodModel) _then;

/// Create a copy of EFaturaOzelKodModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tip = freezed,Object? tipAdi = freezed,Object? kod = freezed,Object? aciklama = freezed,}) {
  return _then(_EFaturaOzelKodModel(
tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as int?,tipAdi: freezed == tipAdi ? _self.tipAdi : tipAdi // ignore: cast_nullable_to_non_nullable
as String?,kod: freezed == kod ? _self.kod : kod // ignore: cast_nullable_to_non_nullable
as int?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
