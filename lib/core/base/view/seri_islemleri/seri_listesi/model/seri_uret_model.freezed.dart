// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_uret_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriUretModel {

 String? get seriNo; set seriNo(String? value); String? get stokKodu; set stokKodu(String? value); int? get sonNo; set sonNo(int? value);
/// Create a copy of SeriUretModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriUretModelCopyWith<SeriUretModel> get copyWith => _$SeriUretModelCopyWithImpl<SeriUretModel>(this as SeriUretModel, _$identity);

  /// Serializes this SeriUretModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $SeriUretModelCopyWith<$Res>  {
  factory $SeriUretModelCopyWith(SeriUretModel value, $Res Function(SeriUretModel) _then) = _$SeriUretModelCopyWithImpl;
@useResult
$Res call({
 String? seriNo, String? stokKodu, int? sonNo
});




}
/// @nodoc
class _$SeriUretModelCopyWithImpl<$Res>
    implements $SeriUretModelCopyWith<$Res> {
  _$SeriUretModelCopyWithImpl(this._self, this._then);

  final SeriUretModel _self;
  final $Res Function(SeriUretModel) _then;

/// Create a copy of SeriUretModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seriNo = freezed,Object? stokKodu = freezed,Object? sonNo = freezed,}) {
  return _then(_self.copyWith(
seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,sonNo: freezed == sonNo ? _self.sonNo : sonNo // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriUretModel].
extension SeriUretModelPatterns on SeriUretModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriUretModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriUretModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriUretModel value)  $default,){
final _that = this;
switch (_that) {
case _SeriUretModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriUretModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeriUretModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? seriNo,  String? stokKodu,  int? sonNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriUretModel() when $default != null:
return $default(_that.seriNo,_that.stokKodu,_that.sonNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? seriNo,  String? stokKodu,  int? sonNo)  $default,) {final _that = this;
switch (_that) {
case _SeriUretModel():
return $default(_that.seriNo,_that.stokKodu,_that.sonNo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? seriNo,  String? stokKodu,  int? sonNo)?  $default,) {final _that = this;
switch (_that) {
case _SeriUretModel() when $default != null:
return $default(_that.seriNo,_that.stokKodu,_that.sonNo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriUretModel extends SeriUretModel {
   _SeriUretModel({this.seriNo, this.stokKodu, this.sonNo}): super._();
  factory _SeriUretModel.fromJson(Map<String, dynamic> json) => _$SeriUretModelFromJson(json);

@override  String? seriNo;
@override  String? stokKodu;
@override  int? sonNo;

/// Create a copy of SeriUretModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriUretModelCopyWith<_SeriUretModel> get copyWith => __$SeriUretModelCopyWithImpl<_SeriUretModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriUretModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$SeriUretModelCopyWith<$Res> implements $SeriUretModelCopyWith<$Res> {
  factory _$SeriUretModelCopyWith(_SeriUretModel value, $Res Function(_SeriUretModel) _then) = __$SeriUretModelCopyWithImpl;
@override @useResult
$Res call({
 String? seriNo, String? stokKodu, int? sonNo
});




}
/// @nodoc
class __$SeriUretModelCopyWithImpl<$Res>
    implements _$SeriUretModelCopyWith<$Res> {
  __$SeriUretModelCopyWithImpl(this._self, this._then);

  final _SeriUretModel _self;
  final $Res Function(_SeriUretModel) _then;

/// Create a copy of SeriUretModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seriNo = freezed,Object? stokKodu = freezed,Object? sonNo = freezed,}) {
  return _then(_SeriUretModel(
seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,sonNo: freezed == sonNo ? _self.sonNo : sonNo // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
