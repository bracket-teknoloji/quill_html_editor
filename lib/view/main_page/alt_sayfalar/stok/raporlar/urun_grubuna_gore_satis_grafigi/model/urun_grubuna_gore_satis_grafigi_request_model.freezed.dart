// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'urun_grubuna_gore_satis_grafigi_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UrunGrubunaGoreSatisGrafigiRequestModel {

 List<String>? get arrPlasiyerKodu; set arrPlasiyerKodu(List<String>? value); String? get baslamaTarihi; set baslamaTarihi(String? value); String? get bitisTarihi; set bitisTarihi(String? value); String? get cariKodu; set cariKodu(String? value); String? get donemTipi; set donemTipi(String? value); int? get grupNo; set grupNo(int? value); String? get irsDahil; set irsDahil(String? value); String? get grupla; set grupla(String? value); String? get projeKodu; set projeKodu(String? value); String? get tipi; set tipi(String? value);
/// Create a copy of UrunGrubunaGoreSatisGrafigiRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UrunGrubunaGoreSatisGrafigiRequestModelCopyWith<UrunGrubunaGoreSatisGrafigiRequestModel> get copyWith => _$UrunGrubunaGoreSatisGrafigiRequestModelCopyWithImpl<UrunGrubunaGoreSatisGrafigiRequestModel>(this as UrunGrubunaGoreSatisGrafigiRequestModel, _$identity);

  /// Serializes this UrunGrubunaGoreSatisGrafigiRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $UrunGrubunaGoreSatisGrafigiRequestModelCopyWith<$Res>  {
  factory $UrunGrubunaGoreSatisGrafigiRequestModelCopyWith(UrunGrubunaGoreSatisGrafigiRequestModel value, $Res Function(UrunGrubunaGoreSatisGrafigiRequestModel) _then) = _$UrunGrubunaGoreSatisGrafigiRequestModelCopyWithImpl;
@useResult
$Res call({
 List<String>? arrPlasiyerKodu, String? baslamaTarihi, String? bitisTarihi, String? cariKodu, String? donemTipi, int? grupNo, String? irsDahil, String? grupla, String? projeKodu, String? tipi
});




}
/// @nodoc
class _$UrunGrubunaGoreSatisGrafigiRequestModelCopyWithImpl<$Res>
    implements $UrunGrubunaGoreSatisGrafigiRequestModelCopyWith<$Res> {
  _$UrunGrubunaGoreSatisGrafigiRequestModelCopyWithImpl(this._self, this._then);

  final UrunGrubunaGoreSatisGrafigiRequestModel _self;
  final $Res Function(UrunGrubunaGoreSatisGrafigiRequestModel) _then;

/// Create a copy of UrunGrubunaGoreSatisGrafigiRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? arrPlasiyerKodu = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? cariKodu = freezed,Object? donemTipi = freezed,Object? grupNo = freezed,Object? irsDahil = freezed,Object? grupla = freezed,Object? projeKodu = freezed,Object? tipi = freezed,}) {
  return _then(_self.copyWith(
arrPlasiyerKodu: freezed == arrPlasiyerKodu ? _self.arrPlasiyerKodu : arrPlasiyerKodu // ignore: cast_nullable_to_non_nullable
as List<String>?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,donemTipi: freezed == donemTipi ? _self.donemTipi : donemTipi // ignore: cast_nullable_to_non_nullable
as String?,grupNo: freezed == grupNo ? _self.grupNo : grupNo // ignore: cast_nullable_to_non_nullable
as int?,irsDahil: freezed == irsDahil ? _self.irsDahil : irsDahil // ignore: cast_nullable_to_non_nullable
as String?,grupla: freezed == grupla ? _self.grupla : grupla // ignore: cast_nullable_to_non_nullable
as String?,projeKodu: freezed == projeKodu ? _self.projeKodu : projeKodu // ignore: cast_nullable_to_non_nullable
as String?,tipi: freezed == tipi ? _self.tipi : tipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UrunGrubunaGoreSatisGrafigiRequestModel].
extension UrunGrubunaGoreSatisGrafigiRequestModelPatterns on UrunGrubunaGoreSatisGrafigiRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UrunGrubunaGoreSatisGrafigiRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UrunGrubunaGoreSatisGrafigiRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UrunGrubunaGoreSatisGrafigiRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _UrunGrubunaGoreSatisGrafigiRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UrunGrubunaGoreSatisGrafigiRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _UrunGrubunaGoreSatisGrafigiRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? arrPlasiyerKodu,  String? baslamaTarihi,  String? bitisTarihi,  String? cariKodu,  String? donemTipi,  int? grupNo,  String? irsDahil,  String? grupla,  String? projeKodu,  String? tipi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UrunGrubunaGoreSatisGrafigiRequestModel() when $default != null:
return $default(_that.arrPlasiyerKodu,_that.baslamaTarihi,_that.bitisTarihi,_that.cariKodu,_that.donemTipi,_that.grupNo,_that.irsDahil,_that.grupla,_that.projeKodu,_that.tipi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? arrPlasiyerKodu,  String? baslamaTarihi,  String? bitisTarihi,  String? cariKodu,  String? donemTipi,  int? grupNo,  String? irsDahil,  String? grupla,  String? projeKodu,  String? tipi)  $default,) {final _that = this;
switch (_that) {
case _UrunGrubunaGoreSatisGrafigiRequestModel():
return $default(_that.arrPlasiyerKodu,_that.baslamaTarihi,_that.bitisTarihi,_that.cariKodu,_that.donemTipi,_that.grupNo,_that.irsDahil,_that.grupla,_that.projeKodu,_that.tipi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? arrPlasiyerKodu,  String? baslamaTarihi,  String? bitisTarihi,  String? cariKodu,  String? donemTipi,  int? grupNo,  String? irsDahil,  String? grupla,  String? projeKodu,  String? tipi)?  $default,) {final _that = this;
switch (_that) {
case _UrunGrubunaGoreSatisGrafigiRequestModel() when $default != null:
return $default(_that.arrPlasiyerKodu,_that.baslamaTarihi,_that.bitisTarihi,_that.cariKodu,_that.donemTipi,_that.grupNo,_that.irsDahil,_that.grupla,_that.projeKodu,_that.tipi);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _UrunGrubunaGoreSatisGrafigiRequestModel extends UrunGrubunaGoreSatisGrafigiRequestModel {
   _UrunGrubunaGoreSatisGrafigiRequestModel({this.arrPlasiyerKodu, this.baslamaTarihi, this.bitisTarihi, this.cariKodu, this.donemTipi, this.grupNo, this.irsDahil, this.grupla, this.projeKodu, this.tipi}): super._();
  factory _UrunGrubunaGoreSatisGrafigiRequestModel.fromJson(Map<String, dynamic> json) => _$UrunGrubunaGoreSatisGrafigiRequestModelFromJson(json);

@override  List<String>? arrPlasiyerKodu;
@override  String? baslamaTarihi;
@override  String? bitisTarihi;
@override  String? cariKodu;
@override  String? donemTipi;
@override  int? grupNo;
@override  String? irsDahil;
@override  String? grupla;
@override  String? projeKodu;
@override  String? tipi;

/// Create a copy of UrunGrubunaGoreSatisGrafigiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UrunGrubunaGoreSatisGrafigiRequestModelCopyWith<_UrunGrubunaGoreSatisGrafigiRequestModel> get copyWith => __$UrunGrubunaGoreSatisGrafigiRequestModelCopyWithImpl<_UrunGrubunaGoreSatisGrafigiRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UrunGrubunaGoreSatisGrafigiRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$UrunGrubunaGoreSatisGrafigiRequestModelCopyWith<$Res> implements $UrunGrubunaGoreSatisGrafigiRequestModelCopyWith<$Res> {
  factory _$UrunGrubunaGoreSatisGrafigiRequestModelCopyWith(_UrunGrubunaGoreSatisGrafigiRequestModel value, $Res Function(_UrunGrubunaGoreSatisGrafigiRequestModel) _then) = __$UrunGrubunaGoreSatisGrafigiRequestModelCopyWithImpl;
@override @useResult
$Res call({
 List<String>? arrPlasiyerKodu, String? baslamaTarihi, String? bitisTarihi, String? cariKodu, String? donemTipi, int? grupNo, String? irsDahil, String? grupla, String? projeKodu, String? tipi
});




}
/// @nodoc
class __$UrunGrubunaGoreSatisGrafigiRequestModelCopyWithImpl<$Res>
    implements _$UrunGrubunaGoreSatisGrafigiRequestModelCopyWith<$Res> {
  __$UrunGrubunaGoreSatisGrafigiRequestModelCopyWithImpl(this._self, this._then);

  final _UrunGrubunaGoreSatisGrafigiRequestModel _self;
  final $Res Function(_UrunGrubunaGoreSatisGrafigiRequestModel) _then;

/// Create a copy of UrunGrubunaGoreSatisGrafigiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? arrPlasiyerKodu = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? cariKodu = freezed,Object? donemTipi = freezed,Object? grupNo = freezed,Object? irsDahil = freezed,Object? grupla = freezed,Object? projeKodu = freezed,Object? tipi = freezed,}) {
  return _then(_UrunGrubunaGoreSatisGrafigiRequestModel(
arrPlasiyerKodu: freezed == arrPlasiyerKodu ? _self.arrPlasiyerKodu : arrPlasiyerKodu // ignore: cast_nullable_to_non_nullable
as List<String>?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,donemTipi: freezed == donemTipi ? _self.donemTipi : donemTipi // ignore: cast_nullable_to_non_nullable
as String?,grupNo: freezed == grupNo ? _self.grupNo : grupNo // ignore: cast_nullable_to_non_nullable
as int?,irsDahil: freezed == irsDahil ? _self.irsDahil : irsDahil // ignore: cast_nullable_to_non_nullable
as String?,grupla: freezed == grupla ? _self.grupla : grupla // ignore: cast_nullable_to_non_nullable
as String?,projeKodu: freezed == projeKodu ? _self.projeKodu : projeKodu // ignore: cast_nullable_to_non_nullable
as String?,tipi: freezed == tipi ? _self.tipi : tipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
