// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stok_fiyat_ozeti_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StokFiyatOzetiModel {

 int? get sira; String? get grup; String? get tip; String? get cariKodu; String? get cariAdi; DateTime? get tarih; double? get fiyat; double? get dovizFiyati; String? get dovizAdi; int? get dovizTipi; double? get brutFiyat; double? get brutDovizFiyati;
/// Create a copy of StokFiyatOzetiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StokFiyatOzetiModelCopyWith<StokFiyatOzetiModel> get copyWith => _$StokFiyatOzetiModelCopyWithImpl<StokFiyatOzetiModel>(this as StokFiyatOzetiModel, _$identity);

  /// Serializes this StokFiyatOzetiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StokFiyatOzetiModel&&super == other&&(identical(other.sira, sira) || other.sira == sira)&&(identical(other.grup, grup) || other.grup == grup)&&(identical(other.tip, tip) || other.tip == tip)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.cariAdi, cariAdi) || other.cariAdi == cariAdi)&&(identical(other.tarih, tarih) || other.tarih == tarih)&&(identical(other.fiyat, fiyat) || other.fiyat == fiyat)&&(identical(other.dovizFiyati, dovizFiyati) || other.dovizFiyati == dovizFiyati)&&(identical(other.dovizAdi, dovizAdi) || other.dovizAdi == dovizAdi)&&(identical(other.dovizTipi, dovizTipi) || other.dovizTipi == dovizTipi)&&(identical(other.brutFiyat, brutFiyat) || other.brutFiyat == brutFiyat)&&(identical(other.brutDovizFiyati, brutDovizFiyati) || other.brutDovizFiyati == brutDovizFiyati));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sira,grup,tip,cariKodu,cariAdi,tarih,fiyat,dovizFiyati,dovizAdi,dovizTipi,brutFiyat,brutDovizFiyati);



}

/// @nodoc
abstract mixin class $StokFiyatOzetiModelCopyWith<$Res>  {
  factory $StokFiyatOzetiModelCopyWith(StokFiyatOzetiModel value, $Res Function(StokFiyatOzetiModel) _then) = _$StokFiyatOzetiModelCopyWithImpl;
@useResult
$Res call({
 int? sira, String? grup, String? tip, String? cariKodu, String? cariAdi, DateTime? tarih, double? fiyat, double? dovizFiyati, String? dovizAdi, int? dovizTipi, double? brutFiyat, double? brutDovizFiyati
});




}
/// @nodoc
class _$StokFiyatOzetiModelCopyWithImpl<$Res>
    implements $StokFiyatOzetiModelCopyWith<$Res> {
  _$StokFiyatOzetiModelCopyWithImpl(this._self, this._then);

  final StokFiyatOzetiModel _self;
  final $Res Function(StokFiyatOzetiModel) _then;

/// Create a copy of StokFiyatOzetiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sira = freezed,Object? grup = freezed,Object? tip = freezed,Object? cariKodu = freezed,Object? cariAdi = freezed,Object? tarih = freezed,Object? fiyat = freezed,Object? dovizFiyati = freezed,Object? dovizAdi = freezed,Object? dovizTipi = freezed,Object? brutFiyat = freezed,Object? brutDovizFiyati = freezed,}) {
  return _then(_self.copyWith(
sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,grup: freezed == grup ? _self.grup : grup // ignore: cast_nullable_to_non_nullable
as String?,tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,cariAdi: freezed == cariAdi ? _self.cariAdi : cariAdi // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,fiyat: freezed == fiyat ? _self.fiyat : fiyat // ignore: cast_nullable_to_non_nullable
as double?,dovizFiyati: freezed == dovizFiyati ? _self.dovizFiyati : dovizFiyati // ignore: cast_nullable_to_non_nullable
as double?,dovizAdi: freezed == dovizAdi ? _self.dovizAdi : dovizAdi // ignore: cast_nullable_to_non_nullable
as String?,dovizTipi: freezed == dovizTipi ? _self.dovizTipi : dovizTipi // ignore: cast_nullable_to_non_nullable
as int?,brutFiyat: freezed == brutFiyat ? _self.brutFiyat : brutFiyat // ignore: cast_nullable_to_non_nullable
as double?,brutDovizFiyati: freezed == brutDovizFiyati ? _self.brutDovizFiyati : brutDovizFiyati // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [StokFiyatOzetiModel].
extension StokFiyatOzetiModelPatterns on StokFiyatOzetiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StokFiyatOzetiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StokFiyatOzetiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StokFiyatOzetiModel value)  $default,){
final _that = this;
switch (_that) {
case _StokFiyatOzetiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StokFiyatOzetiModel value)?  $default,){
final _that = this;
switch (_that) {
case _StokFiyatOzetiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sira,  String? grup,  String? tip,  String? cariKodu,  String? cariAdi,  DateTime? tarih,  double? fiyat,  double? dovizFiyati,  String? dovizAdi,  int? dovizTipi,  double? brutFiyat,  double? brutDovizFiyati)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StokFiyatOzetiModel() when $default != null:
return $default(_that.sira,_that.grup,_that.tip,_that.cariKodu,_that.cariAdi,_that.tarih,_that.fiyat,_that.dovizFiyati,_that.dovizAdi,_that.dovizTipi,_that.brutFiyat,_that.brutDovizFiyati);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sira,  String? grup,  String? tip,  String? cariKodu,  String? cariAdi,  DateTime? tarih,  double? fiyat,  double? dovizFiyati,  String? dovizAdi,  int? dovizTipi,  double? brutFiyat,  double? brutDovizFiyati)  $default,) {final _that = this;
switch (_that) {
case _StokFiyatOzetiModel():
return $default(_that.sira,_that.grup,_that.tip,_that.cariKodu,_that.cariAdi,_that.tarih,_that.fiyat,_that.dovizFiyati,_that.dovizAdi,_that.dovizTipi,_that.brutFiyat,_that.brutDovizFiyati);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sira,  String? grup,  String? tip,  String? cariKodu,  String? cariAdi,  DateTime? tarih,  double? fiyat,  double? dovizFiyati,  String? dovizAdi,  int? dovizTipi,  double? brutFiyat,  double? brutDovizFiyati)?  $default,) {final _that = this;
switch (_that) {
case _StokFiyatOzetiModel() when $default != null:
return $default(_that.sira,_that.grup,_that.tip,_that.cariKodu,_that.cariAdi,_that.tarih,_that.fiyat,_that.dovizFiyati,_that.dovizAdi,_that.dovizTipi,_that.brutFiyat,_that.brutDovizFiyati);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StokFiyatOzetiModel extends StokFiyatOzetiModel {
  const _StokFiyatOzetiModel({this.sira, this.grup, this.tip, this.cariKodu, this.cariAdi, this.tarih, this.fiyat, this.dovizFiyati, this.dovizAdi, this.dovizTipi, this.brutFiyat, this.brutDovizFiyati}): super._();
  factory _StokFiyatOzetiModel.fromJson(Map<String, dynamic> json) => _$StokFiyatOzetiModelFromJson(json);

@override final  int? sira;
@override final  String? grup;
@override final  String? tip;
@override final  String? cariKodu;
@override final  String? cariAdi;
@override final  DateTime? tarih;
@override final  double? fiyat;
@override final  double? dovizFiyati;
@override final  String? dovizAdi;
@override final  int? dovizTipi;
@override final  double? brutFiyat;
@override final  double? brutDovizFiyati;

/// Create a copy of StokFiyatOzetiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StokFiyatOzetiModelCopyWith<_StokFiyatOzetiModel> get copyWith => __$StokFiyatOzetiModelCopyWithImpl<_StokFiyatOzetiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StokFiyatOzetiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StokFiyatOzetiModel&&super == other&&(identical(other.sira, sira) || other.sira == sira)&&(identical(other.grup, grup) || other.grup == grup)&&(identical(other.tip, tip) || other.tip == tip)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.cariAdi, cariAdi) || other.cariAdi == cariAdi)&&(identical(other.tarih, tarih) || other.tarih == tarih)&&(identical(other.fiyat, fiyat) || other.fiyat == fiyat)&&(identical(other.dovizFiyati, dovizFiyati) || other.dovizFiyati == dovizFiyati)&&(identical(other.dovizAdi, dovizAdi) || other.dovizAdi == dovizAdi)&&(identical(other.dovizTipi, dovizTipi) || other.dovizTipi == dovizTipi)&&(identical(other.brutFiyat, brutFiyat) || other.brutFiyat == brutFiyat)&&(identical(other.brutDovizFiyati, brutDovizFiyati) || other.brutDovizFiyati == brutDovizFiyati));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sira,grup,tip,cariKodu,cariAdi,tarih,fiyat,dovizFiyati,dovizAdi,dovizTipi,brutFiyat,brutDovizFiyati);



}

/// @nodoc
abstract mixin class _$StokFiyatOzetiModelCopyWith<$Res> implements $StokFiyatOzetiModelCopyWith<$Res> {
  factory _$StokFiyatOzetiModelCopyWith(_StokFiyatOzetiModel value, $Res Function(_StokFiyatOzetiModel) _then) = __$StokFiyatOzetiModelCopyWithImpl;
@override @useResult
$Res call({
 int? sira, String? grup, String? tip, String? cariKodu, String? cariAdi, DateTime? tarih, double? fiyat, double? dovizFiyati, String? dovizAdi, int? dovizTipi, double? brutFiyat, double? brutDovizFiyati
});




}
/// @nodoc
class __$StokFiyatOzetiModelCopyWithImpl<$Res>
    implements _$StokFiyatOzetiModelCopyWith<$Res> {
  __$StokFiyatOzetiModelCopyWithImpl(this._self, this._then);

  final _StokFiyatOzetiModel _self;
  final $Res Function(_StokFiyatOzetiModel) _then;

/// Create a copy of StokFiyatOzetiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sira = freezed,Object? grup = freezed,Object? tip = freezed,Object? cariKodu = freezed,Object? cariAdi = freezed,Object? tarih = freezed,Object? fiyat = freezed,Object? dovizFiyati = freezed,Object? dovizAdi = freezed,Object? dovizTipi = freezed,Object? brutFiyat = freezed,Object? brutDovizFiyati = freezed,}) {
  return _then(_StokFiyatOzetiModel(
sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,grup: freezed == grup ? _self.grup : grup // ignore: cast_nullable_to_non_nullable
as String?,tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,cariAdi: freezed == cariAdi ? _self.cariAdi : cariAdi // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,fiyat: freezed == fiyat ? _self.fiyat : fiyat // ignore: cast_nullable_to_non_nullable
as double?,dovizFiyati: freezed == dovizFiyati ? _self.dovizFiyati : dovizFiyati // ignore: cast_nullable_to_non_nullable
as double?,dovizAdi: freezed == dovizAdi ? _self.dovizAdi : dovizAdi // ignore: cast_nullable_to_non_nullable
as String?,dovizTipi: freezed == dovizTipi ? _self.dovizTipi : dovizTipi // ignore: cast_nullable_to_non_nullable
as int?,brutFiyat: freezed == brutFiyat ? _self.brutFiyat : brutFiyat // ignore: cast_nullable_to_non_nullable
as double?,brutDovizFiyati: freezed == brutDovizFiyati ? _self.brutDovizFiyati : brutDovizFiyati // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
