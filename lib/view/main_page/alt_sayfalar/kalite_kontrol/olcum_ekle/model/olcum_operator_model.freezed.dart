// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olcum_operator_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OlcumOperatorModel {

 int? get id; set id(int? value); String? get isyeri; set isyeri(String? value); String? get adi; set adi(String? value); String? get istasyonKodu; set istasyonKodu(String? value); String? get istasyonTanimi; set istasyonTanimi(String? value); String? get durum; set durum(String? value); String? get sicilno; set sicilno(String? value); String? get adiSoyadi; set adiSoyadi(String? value); String? get soyadi; set soyadi(String? value); int? get isletmeKodu; set isletmeKodu(int? value); String? get kartid; set kartid(String? value); String? get resim; set resim(String? value);
/// Create a copy of OlcumOperatorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumOperatorModelCopyWith<OlcumOperatorModel> get copyWith => _$OlcumOperatorModelCopyWithImpl<OlcumOperatorModel>(this as OlcumOperatorModel, _$identity);

  /// Serializes this OlcumOperatorModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OlcumOperatorModelCopyWith<$Res>  {
  factory $OlcumOperatorModelCopyWith(OlcumOperatorModel value, $Res Function(OlcumOperatorModel) _then) = _$OlcumOperatorModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? isyeri, String? adi, String? istasyonKodu, String? istasyonTanimi, String? durum, String? sicilno, String? adiSoyadi, String? soyadi, int? isletmeKodu, String? kartid, String? resim
});




}
/// @nodoc
class _$OlcumOperatorModelCopyWithImpl<$Res>
    implements $OlcumOperatorModelCopyWith<$Res> {
  _$OlcumOperatorModelCopyWithImpl(this._self, this._then);

  final OlcumOperatorModel _self;
  final $Res Function(OlcumOperatorModel) _then;

/// Create a copy of OlcumOperatorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? isyeri = freezed,Object? adi = freezed,Object? istasyonKodu = freezed,Object? istasyonTanimi = freezed,Object? durum = freezed,Object? sicilno = freezed,Object? adiSoyadi = freezed,Object? soyadi = freezed,Object? isletmeKodu = freezed,Object? kartid = freezed,Object? resim = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,isyeri: freezed == isyeri ? _self.isyeri : isyeri // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,istasyonKodu: freezed == istasyonKodu ? _self.istasyonKodu : istasyonKodu // ignore: cast_nullable_to_non_nullable
as String?,istasyonTanimi: freezed == istasyonTanimi ? _self.istasyonTanimi : istasyonTanimi // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,sicilno: freezed == sicilno ? _self.sicilno : sicilno // ignore: cast_nullable_to_non_nullable
as String?,adiSoyadi: freezed == adiSoyadi ? _self.adiSoyadi : adiSoyadi // ignore: cast_nullable_to_non_nullable
as String?,soyadi: freezed == soyadi ? _self.soyadi : soyadi // ignore: cast_nullable_to_non_nullable
as String?,isletmeKodu: freezed == isletmeKodu ? _self.isletmeKodu : isletmeKodu // ignore: cast_nullable_to_non_nullable
as int?,kartid: freezed == kartid ? _self.kartid : kartid // ignore: cast_nullable_to_non_nullable
as String?,resim: freezed == resim ? _self.resim : resim // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OlcumOperatorModel].
extension OlcumOperatorModelPatterns on OlcumOperatorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumOperatorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumOperatorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumOperatorModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumOperatorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumOperatorModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumOperatorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? isyeri,  String? adi,  String? istasyonKodu,  String? istasyonTanimi,  String? durum,  String? sicilno,  String? adiSoyadi,  String? soyadi,  int? isletmeKodu,  String? kartid,  String? resim)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumOperatorModel() when $default != null:
return $default(_that.id,_that.isyeri,_that.adi,_that.istasyonKodu,_that.istasyonTanimi,_that.durum,_that.sicilno,_that.adiSoyadi,_that.soyadi,_that.isletmeKodu,_that.kartid,_that.resim);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? isyeri,  String? adi,  String? istasyonKodu,  String? istasyonTanimi,  String? durum,  String? sicilno,  String? adiSoyadi,  String? soyadi,  int? isletmeKodu,  String? kartid,  String? resim)  $default,) {final _that = this;
switch (_that) {
case _OlcumOperatorModel():
return $default(_that.id,_that.isyeri,_that.adi,_that.istasyonKodu,_that.istasyonTanimi,_that.durum,_that.sicilno,_that.adiSoyadi,_that.soyadi,_that.isletmeKodu,_that.kartid,_that.resim);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? isyeri,  String? adi,  String? istasyonKodu,  String? istasyonTanimi,  String? durum,  String? sicilno,  String? adiSoyadi,  String? soyadi,  int? isletmeKodu,  String? kartid,  String? resim)?  $default,) {final _that = this;
switch (_that) {
case _OlcumOperatorModel() when $default != null:
return $default(_that.id,_that.isyeri,_that.adi,_that.istasyonKodu,_that.istasyonTanimi,_that.durum,_that.sicilno,_that.adiSoyadi,_that.soyadi,_that.isletmeKodu,_that.kartid,_that.resim);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlcumOperatorModel extends OlcumOperatorModel {
   _OlcumOperatorModel({this.id, this.isyeri, this.adi, this.istasyonKodu, this.istasyonTanimi, this.durum, this.sicilno, this.adiSoyadi, this.soyadi, this.isletmeKodu, this.kartid, this.resim}): super._();
  factory _OlcumOperatorModel.fromJson(Map<String, dynamic> json) => _$OlcumOperatorModelFromJson(json);

@override  int? id;
@override  String? isyeri;
@override  String? adi;
@override  String? istasyonKodu;
@override  String? istasyonTanimi;
@override  String? durum;
@override  String? sicilno;
@override  String? adiSoyadi;
@override  String? soyadi;
@override  int? isletmeKodu;
@override  String? kartid;
@override  String? resim;

/// Create a copy of OlcumOperatorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumOperatorModelCopyWith<_OlcumOperatorModel> get copyWith => __$OlcumOperatorModelCopyWithImpl<_OlcumOperatorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumOperatorModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OlcumOperatorModelCopyWith<$Res> implements $OlcumOperatorModelCopyWith<$Res> {
  factory _$OlcumOperatorModelCopyWith(_OlcumOperatorModel value, $Res Function(_OlcumOperatorModel) _then) = __$OlcumOperatorModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? isyeri, String? adi, String? istasyonKodu, String? istasyonTanimi, String? durum, String? sicilno, String? adiSoyadi, String? soyadi, int? isletmeKodu, String? kartid, String? resim
});




}
/// @nodoc
class __$OlcumOperatorModelCopyWithImpl<$Res>
    implements _$OlcumOperatorModelCopyWith<$Res> {
  __$OlcumOperatorModelCopyWithImpl(this._self, this._then);

  final _OlcumOperatorModel _self;
  final $Res Function(_OlcumOperatorModel) _then;

/// Create a copy of OlcumOperatorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? isyeri = freezed,Object? adi = freezed,Object? istasyonKodu = freezed,Object? istasyonTanimi = freezed,Object? durum = freezed,Object? sicilno = freezed,Object? adiSoyadi = freezed,Object? soyadi = freezed,Object? isletmeKodu = freezed,Object? kartid = freezed,Object? resim = freezed,}) {
  return _then(_OlcumOperatorModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,isyeri: freezed == isyeri ? _self.isyeri : isyeri // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,istasyonKodu: freezed == istasyonKodu ? _self.istasyonKodu : istasyonKodu // ignore: cast_nullable_to_non_nullable
as String?,istasyonTanimi: freezed == istasyonTanimi ? _self.istasyonTanimi : istasyonTanimi // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,sicilno: freezed == sicilno ? _self.sicilno : sicilno // ignore: cast_nullable_to_non_nullable
as String?,adiSoyadi: freezed == adiSoyadi ? _self.adiSoyadi : adiSoyadi // ignore: cast_nullable_to_non_nullable
as String?,soyadi: freezed == soyadi ? _self.soyadi : soyadi // ignore: cast_nullable_to_non_nullable
as String?,isletmeKodu: freezed == isletmeKodu ? _self.isletmeKodu : isletmeKodu // ignore: cast_nullable_to_non_nullable
as int?,kartid: freezed == kartid ? _self.kartid : kartid // ignore: cast_nullable_to_non_nullable
as String?,resim: freezed == resim ? _self.resim : resim // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
