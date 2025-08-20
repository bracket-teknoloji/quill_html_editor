// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barkod_tanimla_kayitlari_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BarkodTanimlaKayitlariRequestModel {

 String? get stokKodu; String? get kayitTipi;
/// Create a copy of BarkodTanimlaKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BarkodTanimlaKayitlariRequestModelCopyWith<BarkodTanimlaKayitlariRequestModel> get copyWith => _$BarkodTanimlaKayitlariRequestModelCopyWithImpl<BarkodTanimlaKayitlariRequestModel>(this as BarkodTanimlaKayitlariRequestModel, _$identity);

  /// Serializes this BarkodTanimlaKayitlariRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BarkodTanimlaKayitlariRequestModel&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.kayitTipi, kayitTipi) || other.kayitTipi == kayitTipi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,kayitTipi);



}

/// @nodoc
abstract mixin class $BarkodTanimlaKayitlariRequestModelCopyWith<$Res>  {
  factory $BarkodTanimlaKayitlariRequestModelCopyWith(BarkodTanimlaKayitlariRequestModel value, $Res Function(BarkodTanimlaKayitlariRequestModel) _then) = _$BarkodTanimlaKayitlariRequestModelCopyWithImpl;
@useResult
$Res call({
 String? stokKodu, String? kayitTipi
});




}
/// @nodoc
class _$BarkodTanimlaKayitlariRequestModelCopyWithImpl<$Res>
    implements $BarkodTanimlaKayitlariRequestModelCopyWith<$Res> {
  _$BarkodTanimlaKayitlariRequestModelCopyWithImpl(this._self, this._then);

  final BarkodTanimlaKayitlariRequestModel _self;
  final $Res Function(BarkodTanimlaKayitlariRequestModel) _then;

/// Create a copy of BarkodTanimlaKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stokKodu = freezed,Object? kayitTipi = freezed,}) {
  return _then(_self.copyWith(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,kayitTipi: freezed == kayitTipi ? _self.kayitTipi : kayitTipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BarkodTanimlaKayitlariRequestModel].
extension BarkodTanimlaKayitlariRequestModelPatterns on BarkodTanimlaKayitlariRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BarkodTanimlaKayitlariRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BarkodTanimlaKayitlariRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BarkodTanimlaKayitlariRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _BarkodTanimlaKayitlariRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BarkodTanimlaKayitlariRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _BarkodTanimlaKayitlariRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? stokKodu,  String? kayitTipi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BarkodTanimlaKayitlariRequestModel() when $default != null:
return $default(_that.stokKodu,_that.kayitTipi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? stokKodu,  String? kayitTipi)  $default,) {final _that = this;
switch (_that) {
case _BarkodTanimlaKayitlariRequestModel():
return $default(_that.stokKodu,_that.kayitTipi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? stokKodu,  String? kayitTipi)?  $default,) {final _that = this;
switch (_that) {
case _BarkodTanimlaKayitlariRequestModel() when $default != null:
return $default(_that.stokKodu,_that.kayitTipi);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _BarkodTanimlaKayitlariRequestModel implements BarkodTanimlaKayitlariRequestModel {
   _BarkodTanimlaKayitlariRequestModel({this.stokKodu, this.kayitTipi});
  factory _BarkodTanimlaKayitlariRequestModel.fromJson(Map<String, dynamic> json) => _$BarkodTanimlaKayitlariRequestModelFromJson(json);

@override final  String? stokKodu;
@override final  String? kayitTipi;

/// Create a copy of BarkodTanimlaKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BarkodTanimlaKayitlariRequestModelCopyWith<_BarkodTanimlaKayitlariRequestModel> get copyWith => __$BarkodTanimlaKayitlariRequestModelCopyWithImpl<_BarkodTanimlaKayitlariRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BarkodTanimlaKayitlariRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BarkodTanimlaKayitlariRequestModel&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.kayitTipi, kayitTipi) || other.kayitTipi == kayitTipi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,kayitTipi);



}

/// @nodoc
abstract mixin class _$BarkodTanimlaKayitlariRequestModelCopyWith<$Res> implements $BarkodTanimlaKayitlariRequestModelCopyWith<$Res> {
  factory _$BarkodTanimlaKayitlariRequestModelCopyWith(_BarkodTanimlaKayitlariRequestModel value, $Res Function(_BarkodTanimlaKayitlariRequestModel) _then) = __$BarkodTanimlaKayitlariRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? stokKodu, String? kayitTipi
});




}
/// @nodoc
class __$BarkodTanimlaKayitlariRequestModelCopyWithImpl<$Res>
    implements _$BarkodTanimlaKayitlariRequestModelCopyWith<$Res> {
  __$BarkodTanimlaKayitlariRequestModelCopyWithImpl(this._self, this._then);

  final _BarkodTanimlaKayitlariRequestModel _self;
  final $Res Function(_BarkodTanimlaKayitlariRequestModel) _then;

/// Create a copy of BarkodTanimlaKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stokKodu = freezed,Object? kayitTipi = freezed,}) {
  return _then(_BarkodTanimlaKayitlariRequestModel(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,kayitTipi: freezed == kayitTipi ? _self.kayitTipi : kayitTipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
