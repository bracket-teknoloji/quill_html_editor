// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olcum_ekle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OlcumEkleModel {

 String? get belgeNo; set belgeNo(String? value); String? get belgeTipi; set belgeTipi(String? value); int? get belgeSira; set belgeSira(int? value); String? get stokKodu; set stokKodu(String? value); String? get yapkod; set yapkod(String? value); String? get opkodu; set opkodu(String? value); String? get kayitOperator; set kayitOperator(String? value); DateTime? get tarih; set tarih(DateTime? value); int? get sira; set sira(int? value); String? get stokAdi; set stokAdi(String? value); String? get seriNo; set seriNo(String? value); double? get miktar; set miktar(double? value); int? get belgeId; set belgeId(int? value); bool? get tamamlandi; set tamamlandi(bool? value); List<OlcumProsesModel>? get prosesler; set prosesler(List<OlcumProsesModel>? value);
/// Create a copy of OlcumEkleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumEkleModelCopyWith<OlcumEkleModel> get copyWith => _$OlcumEkleModelCopyWithImpl<OlcumEkleModel>(this as OlcumEkleModel, _$identity);

  /// Serializes this OlcumEkleModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OlcumEkleModelCopyWith<$Res>  {
  factory $OlcumEkleModelCopyWith(OlcumEkleModel value, $Res Function(OlcumEkleModel) _then) = _$OlcumEkleModelCopyWithImpl;
@useResult
$Res call({
 String? belgeNo, String? belgeTipi, int? belgeSira, String? stokKodu, String? yapkod, String? opkodu, String? kayitOperator, DateTime? tarih, int? sira, String? stokAdi, String? seriNo, double? miktar, int? belgeId, bool? tamamlandi, List<OlcumProsesModel>? prosesler
});




}
/// @nodoc
class _$OlcumEkleModelCopyWithImpl<$Res>
    implements $OlcumEkleModelCopyWith<$Res> {
  _$OlcumEkleModelCopyWithImpl(this._self, this._then);

  final OlcumEkleModel _self;
  final $Res Function(OlcumEkleModel) _then;

/// Create a copy of OlcumEkleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? belgeSira = freezed,Object? stokKodu = freezed,Object? yapkod = freezed,Object? opkodu = freezed,Object? kayitOperator = freezed,Object? tarih = freezed,Object? sira = freezed,Object? stokAdi = freezed,Object? seriNo = freezed,Object? miktar = freezed,Object? belgeId = freezed,Object? tamamlandi = freezed,Object? prosesler = freezed,}) {
  return _then(_self.copyWith(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeSira: freezed == belgeSira ? _self.belgeSira : belgeSira // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,opkodu: freezed == opkodu ? _self.opkodu : opkodu // ignore: cast_nullable_to_non_nullable
as String?,kayitOperator: freezed == kayitOperator ? _self.kayitOperator : kayitOperator // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,belgeId: freezed == belgeId ? _self.belgeId : belgeId // ignore: cast_nullable_to_non_nullable
as int?,tamamlandi: freezed == tamamlandi ? _self.tamamlandi : tamamlandi // ignore: cast_nullable_to_non_nullable
as bool?,prosesler: freezed == prosesler ? _self.prosesler : prosesler // ignore: cast_nullable_to_non_nullable
as List<OlcumProsesModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OlcumEkleModel].
extension OlcumEkleModelPatterns on OlcumEkleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumEkleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumEkleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumEkleModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumEkleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumEkleModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumEkleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? belgeNo,  String? belgeTipi,  int? belgeSira,  String? stokKodu,  String? yapkod,  String? opkodu,  String? kayitOperator,  DateTime? tarih,  int? sira,  String? stokAdi,  String? seriNo,  double? miktar,  int? belgeId,  bool? tamamlandi,  List<OlcumProsesModel>? prosesler)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumEkleModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTipi,_that.belgeSira,_that.stokKodu,_that.yapkod,_that.opkodu,_that.kayitOperator,_that.tarih,_that.sira,_that.stokAdi,_that.seriNo,_that.miktar,_that.belgeId,_that.tamamlandi,_that.prosesler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? belgeNo,  String? belgeTipi,  int? belgeSira,  String? stokKodu,  String? yapkod,  String? opkodu,  String? kayitOperator,  DateTime? tarih,  int? sira,  String? stokAdi,  String? seriNo,  double? miktar,  int? belgeId,  bool? tamamlandi,  List<OlcumProsesModel>? prosesler)  $default,) {final _that = this;
switch (_that) {
case _OlcumEkleModel():
return $default(_that.belgeNo,_that.belgeTipi,_that.belgeSira,_that.stokKodu,_that.yapkod,_that.opkodu,_that.kayitOperator,_that.tarih,_that.sira,_that.stokAdi,_that.seriNo,_that.miktar,_that.belgeId,_that.tamamlandi,_that.prosesler);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? belgeNo,  String? belgeTipi,  int? belgeSira,  String? stokKodu,  String? yapkod,  String? opkodu,  String? kayitOperator,  DateTime? tarih,  int? sira,  String? stokAdi,  String? seriNo,  double? miktar,  int? belgeId,  bool? tamamlandi,  List<OlcumProsesModel>? prosesler)?  $default,) {final _that = this;
switch (_that) {
case _OlcumEkleModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTipi,_that.belgeSira,_that.stokKodu,_that.yapkod,_that.opkodu,_that.kayitOperator,_that.tarih,_that.sira,_that.stokAdi,_that.seriNo,_that.miktar,_that.belgeId,_that.tamamlandi,_that.prosesler);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlcumEkleModel extends OlcumEkleModel {
   _OlcumEkleModel({this.belgeNo, this.belgeTipi, this.belgeSira, this.stokKodu, this.yapkod, this.opkodu, this.kayitOperator, this.tarih, this.sira, this.stokAdi, this.seriNo, this.miktar, this.belgeId, this.tamamlandi, this.prosesler}): super._();
  factory _OlcumEkleModel.fromJson(Map<String, dynamic> json) => _$OlcumEkleModelFromJson(json);

@override  String? belgeNo;
@override  String? belgeTipi;
@override  int? belgeSira;
@override  String? stokKodu;
@override  String? yapkod;
@override  String? opkodu;
@override  String? kayitOperator;
@override  DateTime? tarih;
@override  int? sira;
@override  String? stokAdi;
@override  String? seriNo;
@override  double? miktar;
@override  int? belgeId;
@override  bool? tamamlandi;
@override  List<OlcumProsesModel>? prosesler;

/// Create a copy of OlcumEkleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumEkleModelCopyWith<_OlcumEkleModel> get copyWith => __$OlcumEkleModelCopyWithImpl<_OlcumEkleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumEkleModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OlcumEkleModelCopyWith<$Res> implements $OlcumEkleModelCopyWith<$Res> {
  factory _$OlcumEkleModelCopyWith(_OlcumEkleModel value, $Res Function(_OlcumEkleModel) _then) = __$OlcumEkleModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeNo, String? belgeTipi, int? belgeSira, String? stokKodu, String? yapkod, String? opkodu, String? kayitOperator, DateTime? tarih, int? sira, String? stokAdi, String? seriNo, double? miktar, int? belgeId, bool? tamamlandi, List<OlcumProsesModel>? prosesler
});




}
/// @nodoc
class __$OlcumEkleModelCopyWithImpl<$Res>
    implements _$OlcumEkleModelCopyWith<$Res> {
  __$OlcumEkleModelCopyWithImpl(this._self, this._then);

  final _OlcumEkleModel _self;
  final $Res Function(_OlcumEkleModel) _then;

/// Create a copy of OlcumEkleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? belgeSira = freezed,Object? stokKodu = freezed,Object? yapkod = freezed,Object? opkodu = freezed,Object? kayitOperator = freezed,Object? tarih = freezed,Object? sira = freezed,Object? stokAdi = freezed,Object? seriNo = freezed,Object? miktar = freezed,Object? belgeId = freezed,Object? tamamlandi = freezed,Object? prosesler = freezed,}) {
  return _then(_OlcumEkleModel(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeSira: freezed == belgeSira ? _self.belgeSira : belgeSira // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,opkodu: freezed == opkodu ? _self.opkodu : opkodu // ignore: cast_nullable_to_non_nullable
as String?,kayitOperator: freezed == kayitOperator ? _self.kayitOperator : kayitOperator // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,belgeId: freezed == belgeId ? _self.belgeId : belgeId // ignore: cast_nullable_to_non_nullable
as int?,tamamlandi: freezed == tamamlandi ? _self.tamamlandi : tamamlandi // ignore: cast_nullable_to_non_nullable
as bool?,prosesler: freezed == prosesler ? _self.prosesler : prosesler // ignore: cast_nullable_to_non_nullable
as List<OlcumProsesModel>?,
  ));
}


}

// dart format on
