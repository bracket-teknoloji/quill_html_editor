// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ek_alanlar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EkAlanlarModel {

 String? get tabloAdi; set tabloAdi(String? value); String? get alanKodu; set alanKodu(String? value); String? get alanAciklama; set alanAciklama(String? value); String? get zorunlu; set zorunlu(String? value); String? get aktif; set aktif(String? value); int? get sira; set sira(int? value); int? get veriTipi; set veriTipi(int? value); int? get uzunluk; set uzunluk(int? value); int? get componentTipi; set componentTipi(int? value);@JsonKey(name: "SecimListesi") List<String>? get secimListesi;@JsonKey(name: "SecimListesi") set secimListesi(List<String>? value); String? get ondeger; set ondeger(String? value);
/// Create a copy of EkAlanlarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EkAlanlarModelCopyWith<EkAlanlarModel> get copyWith => _$EkAlanlarModelCopyWithImpl<EkAlanlarModel>(this as EkAlanlarModel, _$identity);

  /// Serializes this EkAlanlarModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $EkAlanlarModelCopyWith<$Res>  {
  factory $EkAlanlarModelCopyWith(EkAlanlarModel value, $Res Function(EkAlanlarModel) _then) = _$EkAlanlarModelCopyWithImpl;
@useResult
$Res call({
 String? tabloAdi, String? alanKodu, String? alanAciklama, String? zorunlu, String? aktif, int? sira, int? veriTipi, int? uzunluk, int? componentTipi,@JsonKey(name: "SecimListesi") List<String>? secimListesi, String? ondeger
});




}
/// @nodoc
class _$EkAlanlarModelCopyWithImpl<$Res>
    implements $EkAlanlarModelCopyWith<$Res> {
  _$EkAlanlarModelCopyWithImpl(this._self, this._then);

  final EkAlanlarModel _self;
  final $Res Function(EkAlanlarModel) _then;

/// Create a copy of EkAlanlarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tabloAdi = freezed,Object? alanKodu = freezed,Object? alanAciklama = freezed,Object? zorunlu = freezed,Object? aktif = freezed,Object? sira = freezed,Object? veriTipi = freezed,Object? uzunluk = freezed,Object? componentTipi = freezed,Object? secimListesi = freezed,Object? ondeger = freezed,}) {
  return _then(_self.copyWith(
tabloAdi: freezed == tabloAdi ? _self.tabloAdi : tabloAdi // ignore: cast_nullable_to_non_nullable
as String?,alanKodu: freezed == alanKodu ? _self.alanKodu : alanKodu // ignore: cast_nullable_to_non_nullable
as String?,alanAciklama: freezed == alanAciklama ? _self.alanAciklama : alanAciklama // ignore: cast_nullable_to_non_nullable
as String?,zorunlu: freezed == zorunlu ? _self.zorunlu : zorunlu // ignore: cast_nullable_to_non_nullable
as String?,aktif: freezed == aktif ? _self.aktif : aktif // ignore: cast_nullable_to_non_nullable
as String?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,veriTipi: freezed == veriTipi ? _self.veriTipi : veriTipi // ignore: cast_nullable_to_non_nullable
as int?,uzunluk: freezed == uzunluk ? _self.uzunluk : uzunluk // ignore: cast_nullable_to_non_nullable
as int?,componentTipi: freezed == componentTipi ? _self.componentTipi : componentTipi // ignore: cast_nullable_to_non_nullable
as int?,secimListesi: freezed == secimListesi ? _self.secimListesi : secimListesi // ignore: cast_nullable_to_non_nullable
as List<String>?,ondeger: freezed == ondeger ? _self.ondeger : ondeger // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EkAlanlarModel].
extension EkAlanlarModelPatterns on EkAlanlarModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EkAlanlarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EkAlanlarModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EkAlanlarModel value)  $default,){
final _that = this;
switch (_that) {
case _EkAlanlarModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EkAlanlarModel value)?  $default,){
final _that = this;
switch (_that) {
case _EkAlanlarModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tabloAdi,  String? alanKodu,  String? alanAciklama,  String? zorunlu,  String? aktif,  int? sira,  int? veriTipi,  int? uzunluk,  int? componentTipi, @JsonKey(name: "SecimListesi")  List<String>? secimListesi,  String? ondeger)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EkAlanlarModel() when $default != null:
return $default(_that.tabloAdi,_that.alanKodu,_that.alanAciklama,_that.zorunlu,_that.aktif,_that.sira,_that.veriTipi,_that.uzunluk,_that.componentTipi,_that.secimListesi,_that.ondeger);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tabloAdi,  String? alanKodu,  String? alanAciklama,  String? zorunlu,  String? aktif,  int? sira,  int? veriTipi,  int? uzunluk,  int? componentTipi, @JsonKey(name: "SecimListesi")  List<String>? secimListesi,  String? ondeger)  $default,) {final _that = this;
switch (_that) {
case _EkAlanlarModel():
return $default(_that.tabloAdi,_that.alanKodu,_that.alanAciklama,_that.zorunlu,_that.aktif,_that.sira,_that.veriTipi,_that.uzunluk,_that.componentTipi,_that.secimListesi,_that.ondeger);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tabloAdi,  String? alanKodu,  String? alanAciklama,  String? zorunlu,  String? aktif,  int? sira,  int? veriTipi,  int? uzunluk,  int? componentTipi, @JsonKey(name: "SecimListesi")  List<String>? secimListesi,  String? ondeger)?  $default,) {final _that = this;
switch (_that) {
case _EkAlanlarModel() when $default != null:
return $default(_that.tabloAdi,_that.alanKodu,_that.alanAciklama,_that.zorunlu,_that.aktif,_that.sira,_that.veriTipi,_that.uzunluk,_that.componentTipi,_that.secimListesi,_that.ondeger);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EkAlanlarModel extends EkAlanlarModel {
   _EkAlanlarModel({this.tabloAdi, this.alanKodu, this.alanAciklama, this.zorunlu, this.aktif, this.sira, this.veriTipi, this.uzunluk, this.componentTipi, @JsonKey(name: "SecimListesi") this.secimListesi, this.ondeger}): super._();
  factory _EkAlanlarModel.fromJson(Map<String, dynamic> json) => _$EkAlanlarModelFromJson(json);

@override  String? tabloAdi;
@override  String? alanKodu;
@override  String? alanAciklama;
@override  String? zorunlu;
@override  String? aktif;
@override  int? sira;
@override  int? veriTipi;
@override  int? uzunluk;
@override  int? componentTipi;
@override@JsonKey(name: "SecimListesi")  List<String>? secimListesi;
@override  String? ondeger;

/// Create a copy of EkAlanlarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EkAlanlarModelCopyWith<_EkAlanlarModel> get copyWith => __$EkAlanlarModelCopyWithImpl<_EkAlanlarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EkAlanlarModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$EkAlanlarModelCopyWith<$Res> implements $EkAlanlarModelCopyWith<$Res> {
  factory _$EkAlanlarModelCopyWith(_EkAlanlarModel value, $Res Function(_EkAlanlarModel) _then) = __$EkAlanlarModelCopyWithImpl;
@override @useResult
$Res call({
 String? tabloAdi, String? alanKodu, String? alanAciklama, String? zorunlu, String? aktif, int? sira, int? veriTipi, int? uzunluk, int? componentTipi,@JsonKey(name: "SecimListesi") List<String>? secimListesi, String? ondeger
});




}
/// @nodoc
class __$EkAlanlarModelCopyWithImpl<$Res>
    implements _$EkAlanlarModelCopyWith<$Res> {
  __$EkAlanlarModelCopyWithImpl(this._self, this._then);

  final _EkAlanlarModel _self;
  final $Res Function(_EkAlanlarModel) _then;

/// Create a copy of EkAlanlarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tabloAdi = freezed,Object? alanKodu = freezed,Object? alanAciklama = freezed,Object? zorunlu = freezed,Object? aktif = freezed,Object? sira = freezed,Object? veriTipi = freezed,Object? uzunluk = freezed,Object? componentTipi = freezed,Object? secimListesi = freezed,Object? ondeger = freezed,}) {
  return _then(_EkAlanlarModel(
tabloAdi: freezed == tabloAdi ? _self.tabloAdi : tabloAdi // ignore: cast_nullable_to_non_nullable
as String?,alanKodu: freezed == alanKodu ? _self.alanKodu : alanKodu // ignore: cast_nullable_to_non_nullable
as String?,alanAciklama: freezed == alanAciklama ? _self.alanAciklama : alanAciklama // ignore: cast_nullable_to_non_nullable
as String?,zorunlu: freezed == zorunlu ? _self.zorunlu : zorunlu // ignore: cast_nullable_to_non_nullable
as String?,aktif: freezed == aktif ? _self.aktif : aktif // ignore: cast_nullable_to_non_nullable
as String?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,veriTipi: freezed == veriTipi ? _self.veriTipi : veriTipi // ignore: cast_nullable_to_non_nullable
as int?,uzunluk: freezed == uzunluk ? _self.uzunluk : uzunluk // ignore: cast_nullable_to_non_nullable
as int?,componentTipi: freezed == componentTipi ? _self.componentTipi : componentTipi // ignore: cast_nullable_to_non_nullable
as int?,secimListesi: freezed == secimListesi ? _self.secimListesi : secimListesi // ignore: cast_nullable_to_non_nullable
as List<String>?,ondeger: freezed == ondeger ? _self.ondeger : ondeger // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
