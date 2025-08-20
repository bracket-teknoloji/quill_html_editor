// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tcmb_bankalar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TcmbBankalarModel {

 String? get bankakodu; set bankakodu(String? value); String? get bankaadi; set bankaadi(String? value); String? get subekodu; set subekodu(String? value); String? get subeadi; set subeadi(String? value); String? get sehiradi; set sehiradi(String? value);
/// Create a copy of TcmbBankalarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TcmbBankalarModelCopyWith<TcmbBankalarModel> get copyWith => _$TcmbBankalarModelCopyWithImpl<TcmbBankalarModel>(this as TcmbBankalarModel, _$identity);

  /// Serializes this TcmbBankalarModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $TcmbBankalarModelCopyWith<$Res>  {
  factory $TcmbBankalarModelCopyWith(TcmbBankalarModel value, $Res Function(TcmbBankalarModel) _then) = _$TcmbBankalarModelCopyWithImpl;
@useResult
$Res call({
 String? bankakodu, String? bankaadi, String? subekodu, String? subeadi, String? sehiradi
});




}
/// @nodoc
class _$TcmbBankalarModelCopyWithImpl<$Res>
    implements $TcmbBankalarModelCopyWith<$Res> {
  _$TcmbBankalarModelCopyWithImpl(this._self, this._then);

  final TcmbBankalarModel _self;
  final $Res Function(TcmbBankalarModel) _then;

/// Create a copy of TcmbBankalarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bankakodu = freezed,Object? bankaadi = freezed,Object? subekodu = freezed,Object? subeadi = freezed,Object? sehiradi = freezed,}) {
  return _then(_self.copyWith(
bankakodu: freezed == bankakodu ? _self.bankakodu : bankakodu // ignore: cast_nullable_to_non_nullable
as String?,bankaadi: freezed == bankaadi ? _self.bankaadi : bankaadi // ignore: cast_nullable_to_non_nullable
as String?,subekodu: freezed == subekodu ? _self.subekodu : subekodu // ignore: cast_nullable_to_non_nullable
as String?,subeadi: freezed == subeadi ? _self.subeadi : subeadi // ignore: cast_nullable_to_non_nullable
as String?,sehiradi: freezed == sehiradi ? _self.sehiradi : sehiradi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TcmbBankalarModel].
extension TcmbBankalarModelPatterns on TcmbBankalarModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TcmbBankalarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TcmbBankalarModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TcmbBankalarModel value)  $default,){
final _that = this;
switch (_that) {
case _TcmbBankalarModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TcmbBankalarModel value)?  $default,){
final _that = this;
switch (_that) {
case _TcmbBankalarModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? bankakodu,  String? bankaadi,  String? subekodu,  String? subeadi,  String? sehiradi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TcmbBankalarModel() when $default != null:
return $default(_that.bankakodu,_that.bankaadi,_that.subekodu,_that.subeadi,_that.sehiradi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? bankakodu,  String? bankaadi,  String? subekodu,  String? subeadi,  String? sehiradi)  $default,) {final _that = this;
switch (_that) {
case _TcmbBankalarModel():
return $default(_that.bankakodu,_that.bankaadi,_that.subekodu,_that.subeadi,_that.sehiradi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? bankakodu,  String? bankaadi,  String? subekodu,  String? subeadi,  String? sehiradi)?  $default,) {final _that = this;
switch (_that) {
case _TcmbBankalarModel() when $default != null:
return $default(_that.bankakodu,_that.bankaadi,_that.subekodu,_that.subeadi,_that.sehiradi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TcmbBankalarModel extends TcmbBankalarModel {
   _TcmbBankalarModel({this.bankakodu, this.bankaadi, this.subekodu, this.subeadi, this.sehiradi}): super._();
  factory _TcmbBankalarModel.fromJson(Map<String, dynamic> json) => _$TcmbBankalarModelFromJson(json);

@override  String? bankakodu;
@override  String? bankaadi;
@override  String? subekodu;
@override  String? subeadi;
@override  String? sehiradi;

/// Create a copy of TcmbBankalarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TcmbBankalarModelCopyWith<_TcmbBankalarModel> get copyWith => __$TcmbBankalarModelCopyWithImpl<_TcmbBankalarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TcmbBankalarModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$TcmbBankalarModelCopyWith<$Res> implements $TcmbBankalarModelCopyWith<$Res> {
  factory _$TcmbBankalarModelCopyWith(_TcmbBankalarModel value, $Res Function(_TcmbBankalarModel) _then) = __$TcmbBankalarModelCopyWithImpl;
@override @useResult
$Res call({
 String? bankakodu, String? bankaadi, String? subekodu, String? subeadi, String? sehiradi
});




}
/// @nodoc
class __$TcmbBankalarModelCopyWithImpl<$Res>
    implements _$TcmbBankalarModelCopyWith<$Res> {
  __$TcmbBankalarModelCopyWithImpl(this._self, this._then);

  final _TcmbBankalarModel _self;
  final $Res Function(_TcmbBankalarModel) _then;

/// Create a copy of TcmbBankalarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bankakodu = freezed,Object? bankaadi = freezed,Object? subekodu = freezed,Object? subeadi = freezed,Object? sehiradi = freezed,}) {
  return _then(_TcmbBankalarModel(
bankakodu: freezed == bankakodu ? _self.bankakodu : bankakodu // ignore: cast_nullable_to_non_nullable
as String?,bankaadi: freezed == bankaadi ? _self.bankaadi : bankaadi // ignore: cast_nullable_to_non_nullable
as String?,subekodu: freezed == subekodu ? _self.subekodu : subekodu // ignore: cast_nullable_to_non_nullable
as String?,subeadi: freezed == subeadi ? _self.subeadi : subeadi // ignore: cast_nullable_to_non_nullable
as String?,sehiradi: freezed == sehiradi ? _self.sehiradi : sehiradi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
