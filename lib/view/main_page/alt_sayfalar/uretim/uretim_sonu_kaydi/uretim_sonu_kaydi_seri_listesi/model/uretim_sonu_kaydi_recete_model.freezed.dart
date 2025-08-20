// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uretim_sonu_kaydi_recete_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UskReceteModel {

 String? get mamulKodu; set mamulKodu(String? value); String? get stokKodu; set stokKodu(String? value); String? get stokAdi; set stokAdi(String? value); String? get sonOperasyon; set sonOperasyon(String? value); String? get ob; set ob(String? value); double? get miktar; set miktar(double? value); String? get cikistaSeri; set cikistaSeri(String? value); String? get seriMiktarKadar; set seriMiktarKadar(String? value); String? get seriBakiyeKontrol; set seriBakiyeKontrol(String? value); String? get seriCikistaOtomatik; set seriCikistaOtomatik(String? value); String? get seriGiristeOtomatik; set seriGiristeOtomatik(String? value); String? get sira; set sira(String? value); String? get otorec; set otorec(String? value); List<SeriList>? get seriList; set seriList(List<SeriList>? value); String? get giristeSeri; set giristeSeri(String? value);
/// Create a copy of UskReceteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UskReceteModelCopyWith<UskReceteModel> get copyWith => _$UskReceteModelCopyWithImpl<UskReceteModel>(this as UskReceteModel, _$identity);

  /// Serializes this UskReceteModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $UskReceteModelCopyWith<$Res>  {
  factory $UskReceteModelCopyWith(UskReceteModel value, $Res Function(UskReceteModel) _then) = _$UskReceteModelCopyWithImpl;
@useResult
$Res call({
 String? mamulKodu, String? stokKodu, String? stokAdi, String? sonOperasyon, String? ob, double? miktar, String? cikistaSeri, String? seriMiktarKadar, String? seriBakiyeKontrol, String? seriCikistaOtomatik, String? seriGiristeOtomatik, String? sira, String? otorec, List<SeriList>? seriList, String? giristeSeri
});




}
/// @nodoc
class _$UskReceteModelCopyWithImpl<$Res>
    implements $UskReceteModelCopyWith<$Res> {
  _$UskReceteModelCopyWithImpl(this._self, this._then);

  final UskReceteModel _self;
  final $Res Function(UskReceteModel) _then;

/// Create a copy of UskReceteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mamulKodu = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? sonOperasyon = freezed,Object? ob = freezed,Object? miktar = freezed,Object? cikistaSeri = freezed,Object? seriMiktarKadar = freezed,Object? seriBakiyeKontrol = freezed,Object? seriCikistaOtomatik = freezed,Object? seriGiristeOtomatik = freezed,Object? sira = freezed,Object? otorec = freezed,Object? seriList = freezed,Object? giristeSeri = freezed,}) {
  return _then(_self.copyWith(
mamulKodu: freezed == mamulKodu ? _self.mamulKodu : mamulKodu // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,sonOperasyon: freezed == sonOperasyon ? _self.sonOperasyon : sonOperasyon // ignore: cast_nullable_to_non_nullable
as String?,ob: freezed == ob ? _self.ob : ob // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,cikistaSeri: freezed == cikistaSeri ? _self.cikistaSeri : cikistaSeri // ignore: cast_nullable_to_non_nullable
as String?,seriMiktarKadar: freezed == seriMiktarKadar ? _self.seriMiktarKadar : seriMiktarKadar // ignore: cast_nullable_to_non_nullable
as String?,seriBakiyeKontrol: freezed == seriBakiyeKontrol ? _self.seriBakiyeKontrol : seriBakiyeKontrol // ignore: cast_nullable_to_non_nullable
as String?,seriCikistaOtomatik: freezed == seriCikistaOtomatik ? _self.seriCikistaOtomatik : seriCikistaOtomatik // ignore: cast_nullable_to_non_nullable
as String?,seriGiristeOtomatik: freezed == seriGiristeOtomatik ? _self.seriGiristeOtomatik : seriGiristeOtomatik // ignore: cast_nullable_to_non_nullable
as String?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as String?,otorec: freezed == otorec ? _self.otorec : otorec // ignore: cast_nullable_to_non_nullable
as String?,seriList: freezed == seriList ? _self.seriList : seriList // ignore: cast_nullable_to_non_nullable
as List<SeriList>?,giristeSeri: freezed == giristeSeri ? _self.giristeSeri : giristeSeri // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UskReceteModel].
extension UskReceteModelPatterns on UskReceteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UskReceteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UskReceteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UskReceteModel value)  $default,){
final _that = this;
switch (_that) {
case _UskReceteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UskReceteModel value)?  $default,){
final _that = this;
switch (_that) {
case _UskReceteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? mamulKodu,  String? stokKodu,  String? stokAdi,  String? sonOperasyon,  String? ob,  double? miktar,  String? cikistaSeri,  String? seriMiktarKadar,  String? seriBakiyeKontrol,  String? seriCikistaOtomatik,  String? seriGiristeOtomatik,  String? sira,  String? otorec,  List<SeriList>? seriList,  String? giristeSeri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UskReceteModel() when $default != null:
return $default(_that.mamulKodu,_that.stokKodu,_that.stokAdi,_that.sonOperasyon,_that.ob,_that.miktar,_that.cikistaSeri,_that.seriMiktarKadar,_that.seriBakiyeKontrol,_that.seriCikistaOtomatik,_that.seriGiristeOtomatik,_that.sira,_that.otorec,_that.seriList,_that.giristeSeri);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? mamulKodu,  String? stokKodu,  String? stokAdi,  String? sonOperasyon,  String? ob,  double? miktar,  String? cikistaSeri,  String? seriMiktarKadar,  String? seriBakiyeKontrol,  String? seriCikistaOtomatik,  String? seriGiristeOtomatik,  String? sira,  String? otorec,  List<SeriList>? seriList,  String? giristeSeri)  $default,) {final _that = this;
switch (_that) {
case _UskReceteModel():
return $default(_that.mamulKodu,_that.stokKodu,_that.stokAdi,_that.sonOperasyon,_that.ob,_that.miktar,_that.cikistaSeri,_that.seriMiktarKadar,_that.seriBakiyeKontrol,_that.seriCikistaOtomatik,_that.seriGiristeOtomatik,_that.sira,_that.otorec,_that.seriList,_that.giristeSeri);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? mamulKodu,  String? stokKodu,  String? stokAdi,  String? sonOperasyon,  String? ob,  double? miktar,  String? cikistaSeri,  String? seriMiktarKadar,  String? seriBakiyeKontrol,  String? seriCikistaOtomatik,  String? seriGiristeOtomatik,  String? sira,  String? otorec,  List<SeriList>? seriList,  String? giristeSeri)?  $default,) {final _that = this;
switch (_that) {
case _UskReceteModel() when $default != null:
return $default(_that.mamulKodu,_that.stokKodu,_that.stokAdi,_that.sonOperasyon,_that.ob,_that.miktar,_that.cikistaSeri,_that.seriMiktarKadar,_that.seriBakiyeKontrol,_that.seriCikistaOtomatik,_that.seriGiristeOtomatik,_that.sira,_that.otorec,_that.seriList,_that.giristeSeri);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UskReceteModel extends UskReceteModel {
   _UskReceteModel({this.mamulKodu, this.stokKodu, this.stokAdi, this.sonOperasyon, this.ob, this.miktar, this.cikistaSeri, this.seriMiktarKadar, this.seriBakiyeKontrol, this.seriCikistaOtomatik, this.seriGiristeOtomatik, this.sira, this.otorec, this.seriList, this.giristeSeri}): super._();
  factory _UskReceteModel.fromJson(Map<String, dynamic> json) => _$UskReceteModelFromJson(json);

@override  String? mamulKodu;
@override  String? stokKodu;
@override  String? stokAdi;
@override  String? sonOperasyon;
@override  String? ob;
@override  double? miktar;
@override  String? cikistaSeri;
@override  String? seriMiktarKadar;
@override  String? seriBakiyeKontrol;
@override  String? seriCikistaOtomatik;
@override  String? seriGiristeOtomatik;
@override  String? sira;
@override  String? otorec;
@override  List<SeriList>? seriList;
@override  String? giristeSeri;

/// Create a copy of UskReceteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UskReceteModelCopyWith<_UskReceteModel> get copyWith => __$UskReceteModelCopyWithImpl<_UskReceteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UskReceteModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$UskReceteModelCopyWith<$Res> implements $UskReceteModelCopyWith<$Res> {
  factory _$UskReceteModelCopyWith(_UskReceteModel value, $Res Function(_UskReceteModel) _then) = __$UskReceteModelCopyWithImpl;
@override @useResult
$Res call({
 String? mamulKodu, String? stokKodu, String? stokAdi, String? sonOperasyon, String? ob, double? miktar, String? cikistaSeri, String? seriMiktarKadar, String? seriBakiyeKontrol, String? seriCikistaOtomatik, String? seriGiristeOtomatik, String? sira, String? otorec, List<SeriList>? seriList, String? giristeSeri
});




}
/// @nodoc
class __$UskReceteModelCopyWithImpl<$Res>
    implements _$UskReceteModelCopyWith<$Res> {
  __$UskReceteModelCopyWithImpl(this._self, this._then);

  final _UskReceteModel _self;
  final $Res Function(_UskReceteModel) _then;

/// Create a copy of UskReceteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mamulKodu = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? sonOperasyon = freezed,Object? ob = freezed,Object? miktar = freezed,Object? cikistaSeri = freezed,Object? seriMiktarKadar = freezed,Object? seriBakiyeKontrol = freezed,Object? seriCikistaOtomatik = freezed,Object? seriGiristeOtomatik = freezed,Object? sira = freezed,Object? otorec = freezed,Object? seriList = freezed,Object? giristeSeri = freezed,}) {
  return _then(_UskReceteModel(
mamulKodu: freezed == mamulKodu ? _self.mamulKodu : mamulKodu // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,sonOperasyon: freezed == sonOperasyon ? _self.sonOperasyon : sonOperasyon // ignore: cast_nullable_to_non_nullable
as String?,ob: freezed == ob ? _self.ob : ob // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,cikistaSeri: freezed == cikistaSeri ? _self.cikistaSeri : cikistaSeri // ignore: cast_nullable_to_non_nullable
as String?,seriMiktarKadar: freezed == seriMiktarKadar ? _self.seriMiktarKadar : seriMiktarKadar // ignore: cast_nullable_to_non_nullable
as String?,seriBakiyeKontrol: freezed == seriBakiyeKontrol ? _self.seriBakiyeKontrol : seriBakiyeKontrol // ignore: cast_nullable_to_non_nullable
as String?,seriCikistaOtomatik: freezed == seriCikistaOtomatik ? _self.seriCikistaOtomatik : seriCikistaOtomatik // ignore: cast_nullable_to_non_nullable
as String?,seriGiristeOtomatik: freezed == seriGiristeOtomatik ? _self.seriGiristeOtomatik : seriGiristeOtomatik // ignore: cast_nullable_to_non_nullable
as String?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as String?,otorec: freezed == otorec ? _self.otorec : otorec // ignore: cast_nullable_to_non_nullable
as String?,seriList: freezed == seriList ? _self.seriList : seriList // ignore: cast_nullable_to_non_nullable
as List<SeriList>?,giristeSeri: freezed == giristeSeri ? _self.giristeSeri : giristeSeri // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
