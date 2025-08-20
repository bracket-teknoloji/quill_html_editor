// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cek_senet_hareketleri_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CekSenetHareketleriModel {

 int? get inckeyno; set inckeyno(int? value); String? get belgeTipi; set belgeTipi(String? value); String? get belgeNo; set belgeNo(String? value); String? get yeri; set yeri(String? value); String? get durum; set durum(String? value); DateTime? get tarih; set tarih(DateTime? value); String? get hesapKodu; set hesapKodu(String? value); int? get islemKodu; set islemKodu(int? value); String? get islemAdi; set islemAdi(String? value); String? get alinanBordroNo; set alinanBordroNo(String? value); String? get verilenBordroNo; set verilenBordroNo(String? value); String? get devir; set devir(String? value); String? get nereye; set nereye(String? value); String? get kayityapankul; set kayityapankul(String? value); String? get kayittarihi; set kayittarihi(String? value);
/// Create a copy of CekSenetHareketleriModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CekSenetHareketleriModelCopyWith<CekSenetHareketleriModel> get copyWith => _$CekSenetHareketleriModelCopyWithImpl<CekSenetHareketleriModel>(this as CekSenetHareketleriModel, _$identity);

  /// Serializes this CekSenetHareketleriModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $CekSenetHareketleriModelCopyWith<$Res>  {
  factory $CekSenetHareketleriModelCopyWith(CekSenetHareketleriModel value, $Res Function(CekSenetHareketleriModel) _then) = _$CekSenetHareketleriModelCopyWithImpl;
@useResult
$Res call({
 int? inckeyno, String? belgeTipi, String? belgeNo, String? yeri, String? durum, DateTime? tarih, String? hesapKodu, int? islemKodu, String? islemAdi, String? alinanBordroNo, String? verilenBordroNo, String? devir, String? nereye, String? kayityapankul, String? kayittarihi
});




}
/// @nodoc
class _$CekSenetHareketleriModelCopyWithImpl<$Res>
    implements $CekSenetHareketleriModelCopyWith<$Res> {
  _$CekSenetHareketleriModelCopyWithImpl(this._self, this._then);

  final CekSenetHareketleriModel _self;
  final $Res Function(CekSenetHareketleriModel) _then;

/// Create a copy of CekSenetHareketleriModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inckeyno = freezed,Object? belgeTipi = freezed,Object? belgeNo = freezed,Object? yeri = freezed,Object? durum = freezed,Object? tarih = freezed,Object? hesapKodu = freezed,Object? islemKodu = freezed,Object? islemAdi = freezed,Object? alinanBordroNo = freezed,Object? verilenBordroNo = freezed,Object? devir = freezed,Object? nereye = freezed,Object? kayityapankul = freezed,Object? kayittarihi = freezed,}) {
  return _then(_self.copyWith(
inckeyno: freezed == inckeyno ? _self.inckeyno : inckeyno // ignore: cast_nullable_to_non_nullable
as int?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,yeri: freezed == yeri ? _self.yeri : yeri // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,hesapKodu: freezed == hesapKodu ? _self.hesapKodu : hesapKodu // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,islemAdi: freezed == islemAdi ? _self.islemAdi : islemAdi // ignore: cast_nullable_to_non_nullable
as String?,alinanBordroNo: freezed == alinanBordroNo ? _self.alinanBordroNo : alinanBordroNo // ignore: cast_nullable_to_non_nullable
as String?,verilenBordroNo: freezed == verilenBordroNo ? _self.verilenBordroNo : verilenBordroNo // ignore: cast_nullable_to_non_nullable
as String?,devir: freezed == devir ? _self.devir : devir // ignore: cast_nullable_to_non_nullable
as String?,nereye: freezed == nereye ? _self.nereye : nereye // ignore: cast_nullable_to_non_nullable
as String?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CekSenetHareketleriModel].
extension CekSenetHareketleriModelPatterns on CekSenetHareketleriModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CekSenetHareketleriModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CekSenetHareketleriModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CekSenetHareketleriModel value)  $default,){
final _that = this;
switch (_that) {
case _CekSenetHareketleriModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CekSenetHareketleriModel value)?  $default,){
final _that = this;
switch (_that) {
case _CekSenetHareketleriModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? inckeyno,  String? belgeTipi,  String? belgeNo,  String? yeri,  String? durum,  DateTime? tarih,  String? hesapKodu,  int? islemKodu,  String? islemAdi,  String? alinanBordroNo,  String? verilenBordroNo,  String? devir,  String? nereye,  String? kayityapankul,  String? kayittarihi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CekSenetHareketleriModel() when $default != null:
return $default(_that.inckeyno,_that.belgeTipi,_that.belgeNo,_that.yeri,_that.durum,_that.tarih,_that.hesapKodu,_that.islemKodu,_that.islemAdi,_that.alinanBordroNo,_that.verilenBordroNo,_that.devir,_that.nereye,_that.kayityapankul,_that.kayittarihi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? inckeyno,  String? belgeTipi,  String? belgeNo,  String? yeri,  String? durum,  DateTime? tarih,  String? hesapKodu,  int? islemKodu,  String? islemAdi,  String? alinanBordroNo,  String? verilenBordroNo,  String? devir,  String? nereye,  String? kayityapankul,  String? kayittarihi)  $default,) {final _that = this;
switch (_that) {
case _CekSenetHareketleriModel():
return $default(_that.inckeyno,_that.belgeTipi,_that.belgeNo,_that.yeri,_that.durum,_that.tarih,_that.hesapKodu,_that.islemKodu,_that.islemAdi,_that.alinanBordroNo,_that.verilenBordroNo,_that.devir,_that.nereye,_that.kayityapankul,_that.kayittarihi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? inckeyno,  String? belgeTipi,  String? belgeNo,  String? yeri,  String? durum,  DateTime? tarih,  String? hesapKodu,  int? islemKodu,  String? islemAdi,  String? alinanBordroNo,  String? verilenBordroNo,  String? devir,  String? nereye,  String? kayityapankul,  String? kayittarihi)?  $default,) {final _that = this;
switch (_that) {
case _CekSenetHareketleriModel() when $default != null:
return $default(_that.inckeyno,_that.belgeTipi,_that.belgeNo,_that.yeri,_that.durum,_that.tarih,_that.hesapKodu,_that.islemKodu,_that.islemAdi,_that.alinanBordroNo,_that.verilenBordroNo,_that.devir,_that.nereye,_that.kayityapankul,_that.kayittarihi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CekSenetHareketleriModel extends CekSenetHareketleriModel {
   _CekSenetHareketleriModel({this.inckeyno, this.belgeTipi, this.belgeNo, this.yeri, this.durum, this.tarih, this.hesapKodu, this.islemKodu, this.islemAdi, this.alinanBordroNo, this.verilenBordroNo, this.devir, this.nereye, this.kayityapankul, this.kayittarihi}): super._();
  factory _CekSenetHareketleriModel.fromJson(Map<String, dynamic> json) => _$CekSenetHareketleriModelFromJson(json);

@override  int? inckeyno;
@override  String? belgeTipi;
@override  String? belgeNo;
@override  String? yeri;
@override  String? durum;
@override  DateTime? tarih;
@override  String? hesapKodu;
@override  int? islemKodu;
@override  String? islemAdi;
@override  String? alinanBordroNo;
@override  String? verilenBordroNo;
@override  String? devir;
@override  String? nereye;
@override  String? kayityapankul;
@override  String? kayittarihi;

/// Create a copy of CekSenetHareketleriModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CekSenetHareketleriModelCopyWith<_CekSenetHareketleriModel> get copyWith => __$CekSenetHareketleriModelCopyWithImpl<_CekSenetHareketleriModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CekSenetHareketleriModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$CekSenetHareketleriModelCopyWith<$Res> implements $CekSenetHareketleriModelCopyWith<$Res> {
  factory _$CekSenetHareketleriModelCopyWith(_CekSenetHareketleriModel value, $Res Function(_CekSenetHareketleriModel) _then) = __$CekSenetHareketleriModelCopyWithImpl;
@override @useResult
$Res call({
 int? inckeyno, String? belgeTipi, String? belgeNo, String? yeri, String? durum, DateTime? tarih, String? hesapKodu, int? islemKodu, String? islemAdi, String? alinanBordroNo, String? verilenBordroNo, String? devir, String? nereye, String? kayityapankul, String? kayittarihi
});




}
/// @nodoc
class __$CekSenetHareketleriModelCopyWithImpl<$Res>
    implements _$CekSenetHareketleriModelCopyWith<$Res> {
  __$CekSenetHareketleriModelCopyWithImpl(this._self, this._then);

  final _CekSenetHareketleriModel _self;
  final $Res Function(_CekSenetHareketleriModel) _then;

/// Create a copy of CekSenetHareketleriModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inckeyno = freezed,Object? belgeTipi = freezed,Object? belgeNo = freezed,Object? yeri = freezed,Object? durum = freezed,Object? tarih = freezed,Object? hesapKodu = freezed,Object? islemKodu = freezed,Object? islemAdi = freezed,Object? alinanBordroNo = freezed,Object? verilenBordroNo = freezed,Object? devir = freezed,Object? nereye = freezed,Object? kayityapankul = freezed,Object? kayittarihi = freezed,}) {
  return _then(_CekSenetHareketleriModel(
inckeyno: freezed == inckeyno ? _self.inckeyno : inckeyno // ignore: cast_nullable_to_non_nullable
as int?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,yeri: freezed == yeri ? _self.yeri : yeri // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,hesapKodu: freezed == hesapKodu ? _self.hesapKodu : hesapKodu // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,islemAdi: freezed == islemAdi ? _self.islemAdi : islemAdi // ignore: cast_nullable_to_non_nullable
as String?,alinanBordroNo: freezed == alinanBordroNo ? _self.alinanBordroNo : alinanBordroNo // ignore: cast_nullable_to_non_nullable
as String?,verilenBordroNo: freezed == verilenBordroNo ? _self.verilenBordroNo : verilenBordroNo // ignore: cast_nullable_to_non_nullable
as String?,devir: freezed == devir ? _self.devir : devir // ignore: cast_nullable_to_non_nullable
as String?,nereye: freezed == nereye ? _self.nereye : nereye // ignore: cast_nullable_to_non_nullable
as String?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
