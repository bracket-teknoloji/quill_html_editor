// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banka_islemleri_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankaIslemleriRequestModel {

 String? get baslamaTarihi; set baslamaTarihi(String? value); String? get bitisTarihi; set bitisTarihi(String? value); String? get menuKodu; set menuKodu(String? value); String? get hesapTipi; set hesapTipi(String? value); String? get hesapKodu; set hesapKodu(String? value);
/// Create a copy of BankaIslemleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankaIslemleriRequestModelCopyWith<BankaIslemleriRequestModel> get copyWith => _$BankaIslemleriRequestModelCopyWithImpl<BankaIslemleriRequestModel>(this as BankaIslemleriRequestModel, _$identity);

  /// Serializes this BankaIslemleriRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $BankaIslemleriRequestModelCopyWith<$Res>  {
  factory $BankaIslemleriRequestModelCopyWith(BankaIslemleriRequestModel value, $Res Function(BankaIslemleriRequestModel) _then) = _$BankaIslemleriRequestModelCopyWithImpl;
@useResult
$Res call({
 String? baslamaTarihi, String? bitisTarihi, String? menuKodu, String? hesapTipi, String? hesapKodu
});




}
/// @nodoc
class _$BankaIslemleriRequestModelCopyWithImpl<$Res>
    implements $BankaIslemleriRequestModelCopyWith<$Res> {
  _$BankaIslemleriRequestModelCopyWithImpl(this._self, this._then);

  final BankaIslemleriRequestModel _self;
  final $Res Function(BankaIslemleriRequestModel) _then;

/// Create a copy of BankaIslemleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? menuKodu = freezed,Object? hesapTipi = freezed,Object? hesapKodu = freezed,}) {
  return _then(_self.copyWith(
baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,hesapTipi: freezed == hesapTipi ? _self.hesapTipi : hesapTipi // ignore: cast_nullable_to_non_nullable
as String?,hesapKodu: freezed == hesapKodu ? _self.hesapKodu : hesapKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BankaIslemleriRequestModel].
extension BankaIslemleriRequestModelPatterns on BankaIslemleriRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankaIslemleriRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankaIslemleriRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankaIslemleriRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _BankaIslemleriRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankaIslemleriRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _BankaIslemleriRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? baslamaTarihi,  String? bitisTarihi,  String? menuKodu,  String? hesapTipi,  String? hesapKodu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankaIslemleriRequestModel() when $default != null:
return $default(_that.baslamaTarihi,_that.bitisTarihi,_that.menuKodu,_that.hesapTipi,_that.hesapKodu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? baslamaTarihi,  String? bitisTarihi,  String? menuKodu,  String? hesapTipi,  String? hesapKodu)  $default,) {final _that = this;
switch (_that) {
case _BankaIslemleriRequestModel():
return $default(_that.baslamaTarihi,_that.bitisTarihi,_that.menuKodu,_that.hesapTipi,_that.hesapKodu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? baslamaTarihi,  String? bitisTarihi,  String? menuKodu,  String? hesapTipi,  String? hesapKodu)?  $default,) {final _that = this;
switch (_that) {
case _BankaIslemleriRequestModel() when $default != null:
return $default(_that.baslamaTarihi,_that.bitisTarihi,_that.menuKodu,_that.hesapTipi,_that.hesapKodu);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _BankaIslemleriRequestModel implements BankaIslemleriRequestModel {
   _BankaIslemleriRequestModel({this.baslamaTarihi, this.bitisTarihi, this.menuKodu, this.hesapTipi, this.hesapKodu});
  factory _BankaIslemleriRequestModel.fromJson(Map<String, dynamic> json) => _$BankaIslemleriRequestModelFromJson(json);

@override  String? baslamaTarihi;
@override  String? bitisTarihi;
@override  String? menuKodu;
@override  String? hesapTipi;
@override  String? hesapKodu;

/// Create a copy of BankaIslemleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankaIslemleriRequestModelCopyWith<_BankaIslemleriRequestModel> get copyWith => __$BankaIslemleriRequestModelCopyWithImpl<_BankaIslemleriRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankaIslemleriRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$BankaIslemleriRequestModelCopyWith<$Res> implements $BankaIslemleriRequestModelCopyWith<$Res> {
  factory _$BankaIslemleriRequestModelCopyWith(_BankaIslemleriRequestModel value, $Res Function(_BankaIslemleriRequestModel) _then) = __$BankaIslemleriRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? baslamaTarihi, String? bitisTarihi, String? menuKodu, String? hesapTipi, String? hesapKodu
});




}
/// @nodoc
class __$BankaIslemleriRequestModelCopyWithImpl<$Res>
    implements _$BankaIslemleriRequestModelCopyWith<$Res> {
  __$BankaIslemleriRequestModelCopyWithImpl(this._self, this._then);

  final _BankaIslemleriRequestModel _self;
  final $Res Function(_BankaIslemleriRequestModel) _then;

/// Create a copy of BankaIslemleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? menuKodu = freezed,Object? hesapTipi = freezed,Object? hesapKodu = freezed,}) {
  return _then(_BankaIslemleriRequestModel(
baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,hesapTipi: freezed == hesapTipi ? _self.hesapTipi : hesapTipi // ignore: cast_nullable_to_non_nullable
as String?,hesapKodu: freezed == hesapKodu ? _self.hesapKodu : hesapKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
