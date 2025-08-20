// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cek_senet_evrak_ekle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CekSenetEvrakEkleModel {

 String? get aciklama; set aciklama(String? value); String? get base64Data; set base64Data(String? value); String? get belgeNo; set belgeNo(String? value); String? get belgeTipi; set belgeTipi(String? value); int? get boyutByte; set boyutByte(int? value); int? get islemKodu; set islemKodu(int? value);
/// Create a copy of CekSenetEvrakEkleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CekSenetEvrakEkleModelCopyWith<CekSenetEvrakEkleModel> get copyWith => _$CekSenetEvrakEkleModelCopyWithImpl<CekSenetEvrakEkleModel>(this as CekSenetEvrakEkleModel, _$identity);

  /// Serializes this CekSenetEvrakEkleModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $CekSenetEvrakEkleModelCopyWith<$Res>  {
  factory $CekSenetEvrakEkleModelCopyWith(CekSenetEvrakEkleModel value, $Res Function(CekSenetEvrakEkleModel) _then) = _$CekSenetEvrakEkleModelCopyWithImpl;
@useResult
$Res call({
 String? aciklama, String? base64Data, String? belgeNo, String? belgeTipi, int? boyutByte, int? islemKodu
});




}
/// @nodoc
class _$CekSenetEvrakEkleModelCopyWithImpl<$Res>
    implements $CekSenetEvrakEkleModelCopyWith<$Res> {
  _$CekSenetEvrakEkleModelCopyWithImpl(this._self, this._then);

  final CekSenetEvrakEkleModel _self;
  final $Res Function(CekSenetEvrakEkleModel) _then;

/// Create a copy of CekSenetEvrakEkleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aciklama = freezed,Object? base64Data = freezed,Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? boyutByte = freezed,Object? islemKodu = freezed,}) {
  return _then(_self.copyWith(
aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,base64Data: freezed == base64Data ? _self.base64Data : base64Data // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,boyutByte: freezed == boyutByte ? _self.boyutByte : boyutByte // ignore: cast_nullable_to_non_nullable
as int?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CekSenetEvrakEkleModel].
extension CekSenetEvrakEkleModelPatterns on CekSenetEvrakEkleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CekSenetEvrakEkleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CekSenetEvrakEkleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CekSenetEvrakEkleModel value)  $default,){
final _that = this;
switch (_that) {
case _CekSenetEvrakEkleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CekSenetEvrakEkleModel value)?  $default,){
final _that = this;
switch (_that) {
case _CekSenetEvrakEkleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? aciklama,  String? base64Data,  String? belgeNo,  String? belgeTipi,  int? boyutByte,  int? islemKodu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CekSenetEvrakEkleModel() when $default != null:
return $default(_that.aciklama,_that.base64Data,_that.belgeNo,_that.belgeTipi,_that.boyutByte,_that.islemKodu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? aciklama,  String? base64Data,  String? belgeNo,  String? belgeTipi,  int? boyutByte,  int? islemKodu)  $default,) {final _that = this;
switch (_that) {
case _CekSenetEvrakEkleModel():
return $default(_that.aciklama,_that.base64Data,_that.belgeNo,_that.belgeTipi,_that.boyutByte,_that.islemKodu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? aciklama,  String? base64Data,  String? belgeNo,  String? belgeTipi,  int? boyutByte,  int? islemKodu)?  $default,) {final _that = this;
switch (_that) {
case _CekSenetEvrakEkleModel() when $default != null:
return $default(_that.aciklama,_that.base64Data,_that.belgeNo,_that.belgeTipi,_that.boyutByte,_that.islemKodu);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CekSenetEvrakEkleModel implements CekSenetEvrakEkleModel {
   _CekSenetEvrakEkleModel({this.aciklama, this.base64Data, this.belgeNo, this.belgeTipi, this.boyutByte, this.islemKodu});
  factory _CekSenetEvrakEkleModel.fromJson(Map<String, dynamic> json) => _$CekSenetEvrakEkleModelFromJson(json);

@override  String? aciklama;
@override  String? base64Data;
@override  String? belgeNo;
@override  String? belgeTipi;
@override  int? boyutByte;
@override  int? islemKodu;

/// Create a copy of CekSenetEvrakEkleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CekSenetEvrakEkleModelCopyWith<_CekSenetEvrakEkleModel> get copyWith => __$CekSenetEvrakEkleModelCopyWithImpl<_CekSenetEvrakEkleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CekSenetEvrakEkleModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$CekSenetEvrakEkleModelCopyWith<$Res> implements $CekSenetEvrakEkleModelCopyWith<$Res> {
  factory _$CekSenetEvrakEkleModelCopyWith(_CekSenetEvrakEkleModel value, $Res Function(_CekSenetEvrakEkleModel) _then) = __$CekSenetEvrakEkleModelCopyWithImpl;
@override @useResult
$Res call({
 String? aciklama, String? base64Data, String? belgeNo, String? belgeTipi, int? boyutByte, int? islemKodu
});




}
/// @nodoc
class __$CekSenetEvrakEkleModelCopyWithImpl<$Res>
    implements _$CekSenetEvrakEkleModelCopyWith<$Res> {
  __$CekSenetEvrakEkleModelCopyWithImpl(this._self, this._then);

  final _CekSenetEvrakEkleModel _self;
  final $Res Function(_CekSenetEvrakEkleModel) _then;

/// Create a copy of CekSenetEvrakEkleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aciklama = freezed,Object? base64Data = freezed,Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? boyutByte = freezed,Object? islemKodu = freezed,}) {
  return _then(_CekSenetEvrakEkleModel(
aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,base64Data: freezed == base64Data ? _self.base64Data : base64Data // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,boyutByte: freezed == boyutByte ? _self.boyutByte : boyutByte // ignore: cast_nullable_to_non_nullable
as int?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
