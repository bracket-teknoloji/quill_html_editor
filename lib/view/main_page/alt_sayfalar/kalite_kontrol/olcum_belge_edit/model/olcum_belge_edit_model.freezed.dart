// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olcum_belge_edit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OlcumBelgeEditModel {

 String? get belgeNo; set belgeNo(String? value); String? get belgeTipi; set belgeTipi(String? value); int? get belgeSira; set belgeSira(int? value); String? get seriNo; set seriNo(String? value); String? get stokKodu; set stokKodu(String? value); String? get yapkod; set yapkod(String? value); String? get opkodu; set opkodu(String? value); String? get kayitOperator; set kayitOperator(String? value); String? get kayitOperatorKodu; set kayitOperatorKodu(String? value); List<OlcumBelgeModel>? get belge; set belge(List<OlcumBelgeModel>? value); List<OlcumOlcumlerModel>? get olcumler; set olcumler(List<OlcumOlcumlerModel>? value); List<OlcumProsesModel>? get prosesler; set prosesler(List<OlcumProsesModel>? value);
/// Create a copy of OlcumBelgeEditModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumBelgeEditModelCopyWith<OlcumBelgeEditModel> get copyWith => _$OlcumBelgeEditModelCopyWithImpl<OlcumBelgeEditModel>(this as OlcumBelgeEditModel, _$identity);

  /// Serializes this OlcumBelgeEditModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OlcumBelgeEditModelCopyWith<$Res>  {
  factory $OlcumBelgeEditModelCopyWith(OlcumBelgeEditModel value, $Res Function(OlcumBelgeEditModel) _then) = _$OlcumBelgeEditModelCopyWithImpl;
@useResult
$Res call({
 String? belgeNo, String? belgeTipi, int? belgeSira, String? seriNo, String? stokKodu, String? yapkod, String? opkodu, String? kayitOperator, String? kayitOperatorKodu, List<OlcumBelgeModel>? belge, List<OlcumOlcumlerModel>? olcumler, List<OlcumProsesModel>? prosesler
});




}
/// @nodoc
class _$OlcumBelgeEditModelCopyWithImpl<$Res>
    implements $OlcumBelgeEditModelCopyWith<$Res> {
  _$OlcumBelgeEditModelCopyWithImpl(this._self, this._then);

  final OlcumBelgeEditModel _self;
  final $Res Function(OlcumBelgeEditModel) _then;

/// Create a copy of OlcumBelgeEditModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? belgeSira = freezed,Object? seriNo = freezed,Object? stokKodu = freezed,Object? yapkod = freezed,Object? opkodu = freezed,Object? kayitOperator = freezed,Object? kayitOperatorKodu = freezed,Object? belge = freezed,Object? olcumler = freezed,Object? prosesler = freezed,}) {
  return _then(_self.copyWith(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeSira: freezed == belgeSira ? _self.belgeSira : belgeSira // ignore: cast_nullable_to_non_nullable
as int?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,opkodu: freezed == opkodu ? _self.opkodu : opkodu // ignore: cast_nullable_to_non_nullable
as String?,kayitOperator: freezed == kayitOperator ? _self.kayitOperator : kayitOperator // ignore: cast_nullable_to_non_nullable
as String?,kayitOperatorKodu: freezed == kayitOperatorKodu ? _self.kayitOperatorKodu : kayitOperatorKodu // ignore: cast_nullable_to_non_nullable
as String?,belge: freezed == belge ? _self.belge : belge // ignore: cast_nullable_to_non_nullable
as List<OlcumBelgeModel>?,olcumler: freezed == olcumler ? _self.olcumler : olcumler // ignore: cast_nullable_to_non_nullable
as List<OlcumOlcumlerModel>?,prosesler: freezed == prosesler ? _self.prosesler : prosesler // ignore: cast_nullable_to_non_nullable
as List<OlcumProsesModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OlcumBelgeEditModel].
extension OlcumBelgeEditModelPatterns on OlcumBelgeEditModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumBelgeEditModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumBelgeEditModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumBelgeEditModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumBelgeEditModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumBelgeEditModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumBelgeEditModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? belgeNo,  String? belgeTipi,  int? belgeSira,  String? seriNo,  String? stokKodu,  String? yapkod,  String? opkodu,  String? kayitOperator,  String? kayitOperatorKodu,  List<OlcumBelgeModel>? belge,  List<OlcumOlcumlerModel>? olcumler,  List<OlcumProsesModel>? prosesler)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumBelgeEditModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTipi,_that.belgeSira,_that.seriNo,_that.stokKodu,_that.yapkod,_that.opkodu,_that.kayitOperator,_that.kayitOperatorKodu,_that.belge,_that.olcumler,_that.prosesler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? belgeNo,  String? belgeTipi,  int? belgeSira,  String? seriNo,  String? stokKodu,  String? yapkod,  String? opkodu,  String? kayitOperator,  String? kayitOperatorKodu,  List<OlcumBelgeModel>? belge,  List<OlcumOlcumlerModel>? olcumler,  List<OlcumProsesModel>? prosesler)  $default,) {final _that = this;
switch (_that) {
case _OlcumBelgeEditModel():
return $default(_that.belgeNo,_that.belgeTipi,_that.belgeSira,_that.seriNo,_that.stokKodu,_that.yapkod,_that.opkodu,_that.kayitOperator,_that.kayitOperatorKodu,_that.belge,_that.olcumler,_that.prosesler);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? belgeNo,  String? belgeTipi,  int? belgeSira,  String? seriNo,  String? stokKodu,  String? yapkod,  String? opkodu,  String? kayitOperator,  String? kayitOperatorKodu,  List<OlcumBelgeModel>? belge,  List<OlcumOlcumlerModel>? olcumler,  List<OlcumProsesModel>? prosesler)?  $default,) {final _that = this;
switch (_that) {
case _OlcumBelgeEditModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTipi,_that.belgeSira,_that.seriNo,_that.stokKodu,_that.yapkod,_that.opkodu,_that.kayitOperator,_that.kayitOperatorKodu,_that.belge,_that.olcumler,_that.prosesler);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlcumBelgeEditModel extends OlcumBelgeEditModel {
   _OlcumBelgeEditModel({this.belgeNo, this.belgeTipi, this.belgeSira, this.seriNo, this.stokKodu, this.yapkod, this.opkodu, this.kayitOperator, this.kayitOperatorKodu, this.belge, this.olcumler, this.prosesler}): super._();
  factory _OlcumBelgeEditModel.fromJson(Map<String, dynamic> json) => _$OlcumBelgeEditModelFromJson(json);

@override  String? belgeNo;
@override  String? belgeTipi;
@override  int? belgeSira;
@override  String? seriNo;
@override  String? stokKodu;
@override  String? yapkod;
@override  String? opkodu;
@override  String? kayitOperator;
@override  String? kayitOperatorKodu;
@override  List<OlcumBelgeModel>? belge;
@override  List<OlcumOlcumlerModel>? olcumler;
@override  List<OlcumProsesModel>? prosesler;

/// Create a copy of OlcumBelgeEditModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumBelgeEditModelCopyWith<_OlcumBelgeEditModel> get copyWith => __$OlcumBelgeEditModelCopyWithImpl<_OlcumBelgeEditModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumBelgeEditModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OlcumBelgeEditModelCopyWith<$Res> implements $OlcumBelgeEditModelCopyWith<$Res> {
  factory _$OlcumBelgeEditModelCopyWith(_OlcumBelgeEditModel value, $Res Function(_OlcumBelgeEditModel) _then) = __$OlcumBelgeEditModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeNo, String? belgeTipi, int? belgeSira, String? seriNo, String? stokKodu, String? yapkod, String? opkodu, String? kayitOperator, String? kayitOperatorKodu, List<OlcumBelgeModel>? belge, List<OlcumOlcumlerModel>? olcumler, List<OlcumProsesModel>? prosesler
});




}
/// @nodoc
class __$OlcumBelgeEditModelCopyWithImpl<$Res>
    implements _$OlcumBelgeEditModelCopyWith<$Res> {
  __$OlcumBelgeEditModelCopyWithImpl(this._self, this._then);

  final _OlcumBelgeEditModel _self;
  final $Res Function(_OlcumBelgeEditModel) _then;

/// Create a copy of OlcumBelgeEditModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? belgeSira = freezed,Object? seriNo = freezed,Object? stokKodu = freezed,Object? yapkod = freezed,Object? opkodu = freezed,Object? kayitOperator = freezed,Object? kayitOperatorKodu = freezed,Object? belge = freezed,Object? olcumler = freezed,Object? prosesler = freezed,}) {
  return _then(_OlcumBelgeEditModel(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeSira: freezed == belgeSira ? _self.belgeSira : belgeSira // ignore: cast_nullable_to_non_nullable
as int?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,opkodu: freezed == opkodu ? _self.opkodu : opkodu // ignore: cast_nullable_to_non_nullable
as String?,kayitOperator: freezed == kayitOperator ? _self.kayitOperator : kayitOperator // ignore: cast_nullable_to_non_nullable
as String?,kayitOperatorKodu: freezed == kayitOperatorKodu ? _self.kayitOperatorKodu : kayitOperatorKodu // ignore: cast_nullable_to_non_nullable
as String?,belge: freezed == belge ? _self.belge : belge // ignore: cast_nullable_to_non_nullable
as List<OlcumBelgeModel>?,olcumler: freezed == olcumler ? _self.olcumler : olcumler // ignore: cast_nullable_to_non_nullable
as List<OlcumOlcumlerModel>?,prosesler: freezed == prosesler ? _self.prosesler : prosesler // ignore: cast_nullable_to_non_nullable
as List<OlcumProsesModel>?,
  ));
}


}


/// @nodoc
mixin _$OlcumBelgeModel {

 String? get belgeNo; set belgeNo(String? value); String? get belgeTipi; set belgeTipi(String? value); int? get belgeSira; set belgeSira(int? value); DateTime? get tarih; set tarih(DateTime? value); int? get sira; set sira(int? value); String? get stokKodu; set stokKodu(String? value); String? get stokAdi; set stokAdi(String? value); double? get miktar; set miktar(double? value); String? get yapkod; set yapkod(String? value); String? get yapacik; set yapacik(String? value); double? get olcumAdedi; set olcumAdedi(double? value); double? get kabulAdet; set kabulAdet(double? value); double? get sartliAdet; set sartliAdet(double? value); double? get retAdet; set retAdet(double? value); String? get opkodu; set opkodu(String? value); String? get cariKodu; set cariKodu(String? value); String? get cariAdi; set cariAdi(String? value); String? get belgeTuru; set belgeTuru(String? value); int? get kalemAdedi; set kalemAdedi(int? value); String? get seriNo; set seriNo(String? value); String? get prosesVar; set prosesVar(String? value); String? get teknikResimVarmi; set teknikResimVarmi(String? value); String? get kontrolPlaniVarmi; set kontrolPlaniVarmi(String? value); String? get yarimOlcumYapabilirmi; set yarimOlcumYapabilirmi(String? value); String? get opkoduTanimi; set opkoduTanimi(String? value); String? get istasyonKodu; set istasyonKodu(String? value); String? get istasyonTanimi; set istasyonTanimi(String? value); int? get datAdedi; set datAdedi(int? value); String? get seriSorulsunmu; set seriSorulsunmu(String? value); String? get tur; set tur(String? value);@JsonKey(name: "SearchText") String? get searchText;@JsonKey(name: "SearchText") set searchText(String? value);@JsonKey(name: "Sayfa") int? get sayfa;@JsonKey(name: "Sayfa") set sayfa(int? value);
/// Create a copy of OlcumBelgeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumBelgeModelCopyWith<OlcumBelgeModel> get copyWith => _$OlcumBelgeModelCopyWithImpl<OlcumBelgeModel>(this as OlcumBelgeModel, _$identity);

  /// Serializes this OlcumBelgeModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OlcumBelgeModelCopyWith<$Res>  {
  factory $OlcumBelgeModelCopyWith(OlcumBelgeModel value, $Res Function(OlcumBelgeModel) _then) = _$OlcumBelgeModelCopyWithImpl;
@useResult
$Res call({
 String? belgeNo, String? belgeTipi, int? belgeSira, DateTime? tarih, int? sira, String? stokKodu, String? stokAdi, double? miktar, String? yapkod, String? yapacik, double? olcumAdedi, double? kabulAdet, double? sartliAdet, double? retAdet, String? opkodu, String? cariKodu, String? cariAdi, String? belgeTuru, int? kalemAdedi, String? seriNo, String? prosesVar, String? teknikResimVarmi, String? kontrolPlaniVarmi, String? yarimOlcumYapabilirmi, String? opkoduTanimi, String? istasyonKodu, String? istasyonTanimi, int? datAdedi, String? seriSorulsunmu, String? tur,@JsonKey(name: "SearchText") String? searchText,@JsonKey(name: "Sayfa") int? sayfa
});




}
/// @nodoc
class _$OlcumBelgeModelCopyWithImpl<$Res>
    implements $OlcumBelgeModelCopyWith<$Res> {
  _$OlcumBelgeModelCopyWithImpl(this._self, this._then);

  final OlcumBelgeModel _self;
  final $Res Function(OlcumBelgeModel) _then;

/// Create a copy of OlcumBelgeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? belgeSira = freezed,Object? tarih = freezed,Object? sira = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? miktar = freezed,Object? yapkod = freezed,Object? yapacik = freezed,Object? olcumAdedi = freezed,Object? kabulAdet = freezed,Object? sartliAdet = freezed,Object? retAdet = freezed,Object? opkodu = freezed,Object? cariKodu = freezed,Object? cariAdi = freezed,Object? belgeTuru = freezed,Object? kalemAdedi = freezed,Object? seriNo = freezed,Object? prosesVar = freezed,Object? teknikResimVarmi = freezed,Object? kontrolPlaniVarmi = freezed,Object? yarimOlcumYapabilirmi = freezed,Object? opkoduTanimi = freezed,Object? istasyonKodu = freezed,Object? istasyonTanimi = freezed,Object? datAdedi = freezed,Object? seriSorulsunmu = freezed,Object? tur = freezed,Object? searchText = freezed,Object? sayfa = freezed,}) {
  return _then(_self.copyWith(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeSira: freezed == belgeSira ? _self.belgeSira : belgeSira // ignore: cast_nullable_to_non_nullable
as int?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,yapacik: freezed == yapacik ? _self.yapacik : yapacik // ignore: cast_nullable_to_non_nullable
as String?,olcumAdedi: freezed == olcumAdedi ? _self.olcumAdedi : olcumAdedi // ignore: cast_nullable_to_non_nullable
as double?,kabulAdet: freezed == kabulAdet ? _self.kabulAdet : kabulAdet // ignore: cast_nullable_to_non_nullable
as double?,sartliAdet: freezed == sartliAdet ? _self.sartliAdet : sartliAdet // ignore: cast_nullable_to_non_nullable
as double?,retAdet: freezed == retAdet ? _self.retAdet : retAdet // ignore: cast_nullable_to_non_nullable
as double?,opkodu: freezed == opkodu ? _self.opkodu : opkodu // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,cariAdi: freezed == cariAdi ? _self.cariAdi : cariAdi // ignore: cast_nullable_to_non_nullable
as String?,belgeTuru: freezed == belgeTuru ? _self.belgeTuru : belgeTuru // ignore: cast_nullable_to_non_nullable
as String?,kalemAdedi: freezed == kalemAdedi ? _self.kalemAdedi : kalemAdedi // ignore: cast_nullable_to_non_nullable
as int?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,prosesVar: freezed == prosesVar ? _self.prosesVar : prosesVar // ignore: cast_nullable_to_non_nullable
as String?,teknikResimVarmi: freezed == teknikResimVarmi ? _self.teknikResimVarmi : teknikResimVarmi // ignore: cast_nullable_to_non_nullable
as String?,kontrolPlaniVarmi: freezed == kontrolPlaniVarmi ? _self.kontrolPlaniVarmi : kontrolPlaniVarmi // ignore: cast_nullable_to_non_nullable
as String?,yarimOlcumYapabilirmi: freezed == yarimOlcumYapabilirmi ? _self.yarimOlcumYapabilirmi : yarimOlcumYapabilirmi // ignore: cast_nullable_to_non_nullable
as String?,opkoduTanimi: freezed == opkoduTanimi ? _self.opkoduTanimi : opkoduTanimi // ignore: cast_nullable_to_non_nullable
as String?,istasyonKodu: freezed == istasyonKodu ? _self.istasyonKodu : istasyonKodu // ignore: cast_nullable_to_non_nullable
as String?,istasyonTanimi: freezed == istasyonTanimi ? _self.istasyonTanimi : istasyonTanimi // ignore: cast_nullable_to_non_nullable
as String?,datAdedi: freezed == datAdedi ? _self.datAdedi : datAdedi // ignore: cast_nullable_to_non_nullable
as int?,seriSorulsunmu: freezed == seriSorulsunmu ? _self.seriSorulsunmu : seriSorulsunmu // ignore: cast_nullable_to_non_nullable
as String?,tur: freezed == tur ? _self.tur : tur // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OlcumBelgeModel].
extension OlcumBelgeModelPatterns on OlcumBelgeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumBelgeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumBelgeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumBelgeModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumBelgeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumBelgeModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumBelgeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? belgeNo,  String? belgeTipi,  int? belgeSira,  DateTime? tarih,  int? sira,  String? stokKodu,  String? stokAdi,  double? miktar,  String? yapkod,  String? yapacik,  double? olcumAdedi,  double? kabulAdet,  double? sartliAdet,  double? retAdet,  String? opkodu,  String? cariKodu,  String? cariAdi,  String? belgeTuru,  int? kalemAdedi,  String? seriNo,  String? prosesVar,  String? teknikResimVarmi,  String? kontrolPlaniVarmi,  String? yarimOlcumYapabilirmi,  String? opkoduTanimi,  String? istasyonKodu,  String? istasyonTanimi,  int? datAdedi,  String? seriSorulsunmu,  String? tur, @JsonKey(name: "SearchText")  String? searchText, @JsonKey(name: "Sayfa")  int? sayfa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumBelgeModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTipi,_that.belgeSira,_that.tarih,_that.sira,_that.stokKodu,_that.stokAdi,_that.miktar,_that.yapkod,_that.yapacik,_that.olcumAdedi,_that.kabulAdet,_that.sartliAdet,_that.retAdet,_that.opkodu,_that.cariKodu,_that.cariAdi,_that.belgeTuru,_that.kalemAdedi,_that.seriNo,_that.prosesVar,_that.teknikResimVarmi,_that.kontrolPlaniVarmi,_that.yarimOlcumYapabilirmi,_that.opkoduTanimi,_that.istasyonKodu,_that.istasyonTanimi,_that.datAdedi,_that.seriSorulsunmu,_that.tur,_that.searchText,_that.sayfa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? belgeNo,  String? belgeTipi,  int? belgeSira,  DateTime? tarih,  int? sira,  String? stokKodu,  String? stokAdi,  double? miktar,  String? yapkod,  String? yapacik,  double? olcumAdedi,  double? kabulAdet,  double? sartliAdet,  double? retAdet,  String? opkodu,  String? cariKodu,  String? cariAdi,  String? belgeTuru,  int? kalemAdedi,  String? seriNo,  String? prosesVar,  String? teknikResimVarmi,  String? kontrolPlaniVarmi,  String? yarimOlcumYapabilirmi,  String? opkoduTanimi,  String? istasyonKodu,  String? istasyonTanimi,  int? datAdedi,  String? seriSorulsunmu,  String? tur, @JsonKey(name: "SearchText")  String? searchText, @JsonKey(name: "Sayfa")  int? sayfa)  $default,) {final _that = this;
switch (_that) {
case _OlcumBelgeModel():
return $default(_that.belgeNo,_that.belgeTipi,_that.belgeSira,_that.tarih,_that.sira,_that.stokKodu,_that.stokAdi,_that.miktar,_that.yapkod,_that.yapacik,_that.olcumAdedi,_that.kabulAdet,_that.sartliAdet,_that.retAdet,_that.opkodu,_that.cariKodu,_that.cariAdi,_that.belgeTuru,_that.kalemAdedi,_that.seriNo,_that.prosesVar,_that.teknikResimVarmi,_that.kontrolPlaniVarmi,_that.yarimOlcumYapabilirmi,_that.opkoduTanimi,_that.istasyonKodu,_that.istasyonTanimi,_that.datAdedi,_that.seriSorulsunmu,_that.tur,_that.searchText,_that.sayfa);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? belgeNo,  String? belgeTipi,  int? belgeSira,  DateTime? tarih,  int? sira,  String? stokKodu,  String? stokAdi,  double? miktar,  String? yapkod,  String? yapacik,  double? olcumAdedi,  double? kabulAdet,  double? sartliAdet,  double? retAdet,  String? opkodu,  String? cariKodu,  String? cariAdi,  String? belgeTuru,  int? kalemAdedi,  String? seriNo,  String? prosesVar,  String? teknikResimVarmi,  String? kontrolPlaniVarmi,  String? yarimOlcumYapabilirmi,  String? opkoduTanimi,  String? istasyonKodu,  String? istasyonTanimi,  int? datAdedi,  String? seriSorulsunmu,  String? tur, @JsonKey(name: "SearchText")  String? searchText, @JsonKey(name: "Sayfa")  int? sayfa)?  $default,) {final _that = this;
switch (_that) {
case _OlcumBelgeModel() when $default != null:
return $default(_that.belgeNo,_that.belgeTipi,_that.belgeSira,_that.tarih,_that.sira,_that.stokKodu,_that.stokAdi,_that.miktar,_that.yapkod,_that.yapacik,_that.olcumAdedi,_that.kabulAdet,_that.sartliAdet,_that.retAdet,_that.opkodu,_that.cariKodu,_that.cariAdi,_that.belgeTuru,_that.kalemAdedi,_that.seriNo,_that.prosesVar,_that.teknikResimVarmi,_that.kontrolPlaniVarmi,_that.yarimOlcumYapabilirmi,_that.opkoduTanimi,_that.istasyonKodu,_that.istasyonTanimi,_that.datAdedi,_that.seriSorulsunmu,_that.tur,_that.searchText,_that.sayfa);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlcumBelgeModel extends OlcumBelgeModel {
   _OlcumBelgeModel({this.belgeNo, this.belgeTipi, this.belgeSira, this.tarih, this.sira, this.stokKodu, this.stokAdi, this.miktar, this.yapkod, this.yapacik, this.olcumAdedi, this.kabulAdet, this.sartliAdet, this.retAdet, this.opkodu, this.cariKodu, this.cariAdi, this.belgeTuru, this.kalemAdedi, this.seriNo, this.prosesVar, this.teknikResimVarmi, this.kontrolPlaniVarmi, this.yarimOlcumYapabilirmi, this.opkoduTanimi, this.istasyonKodu, this.istasyonTanimi, this.datAdedi, this.seriSorulsunmu, this.tur, @JsonKey(name: "SearchText") this.searchText, @JsonKey(name: "Sayfa") this.sayfa}): super._();
  factory _OlcumBelgeModel.fromJson(Map<String, dynamic> json) => _$OlcumBelgeModelFromJson(json);

@override  String? belgeNo;
@override  String? belgeTipi;
@override  int? belgeSira;
@override  DateTime? tarih;
@override  int? sira;
@override  String? stokKodu;
@override  String? stokAdi;
@override  double? miktar;
@override  String? yapkod;
@override  String? yapacik;
@override  double? olcumAdedi;
@override  double? kabulAdet;
@override  double? sartliAdet;
@override  double? retAdet;
@override  String? opkodu;
@override  String? cariKodu;
@override  String? cariAdi;
@override  String? belgeTuru;
@override  int? kalemAdedi;
@override  String? seriNo;
@override  String? prosesVar;
@override  String? teknikResimVarmi;
@override  String? kontrolPlaniVarmi;
@override  String? yarimOlcumYapabilirmi;
@override  String? opkoduTanimi;
@override  String? istasyonKodu;
@override  String? istasyonTanimi;
@override  int? datAdedi;
@override  String? seriSorulsunmu;
@override  String? tur;
@override@JsonKey(name: "SearchText")  String? searchText;
@override@JsonKey(name: "Sayfa")  int? sayfa;

/// Create a copy of OlcumBelgeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumBelgeModelCopyWith<_OlcumBelgeModel> get copyWith => __$OlcumBelgeModelCopyWithImpl<_OlcumBelgeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumBelgeModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OlcumBelgeModelCopyWith<$Res> implements $OlcumBelgeModelCopyWith<$Res> {
  factory _$OlcumBelgeModelCopyWith(_OlcumBelgeModel value, $Res Function(_OlcumBelgeModel) _then) = __$OlcumBelgeModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeNo, String? belgeTipi, int? belgeSira, DateTime? tarih, int? sira, String? stokKodu, String? stokAdi, double? miktar, String? yapkod, String? yapacik, double? olcumAdedi, double? kabulAdet, double? sartliAdet, double? retAdet, String? opkodu, String? cariKodu, String? cariAdi, String? belgeTuru, int? kalemAdedi, String? seriNo, String? prosesVar, String? teknikResimVarmi, String? kontrolPlaniVarmi, String? yarimOlcumYapabilirmi, String? opkoduTanimi, String? istasyonKodu, String? istasyonTanimi, int? datAdedi, String? seriSorulsunmu, String? tur,@JsonKey(name: "SearchText") String? searchText,@JsonKey(name: "Sayfa") int? sayfa
});




}
/// @nodoc
class __$OlcumBelgeModelCopyWithImpl<$Res>
    implements _$OlcumBelgeModelCopyWith<$Res> {
  __$OlcumBelgeModelCopyWithImpl(this._self, this._then);

  final _OlcumBelgeModel _self;
  final $Res Function(_OlcumBelgeModel) _then;

/// Create a copy of OlcumBelgeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? belgeSira = freezed,Object? tarih = freezed,Object? sira = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? miktar = freezed,Object? yapkod = freezed,Object? yapacik = freezed,Object? olcumAdedi = freezed,Object? kabulAdet = freezed,Object? sartliAdet = freezed,Object? retAdet = freezed,Object? opkodu = freezed,Object? cariKodu = freezed,Object? cariAdi = freezed,Object? belgeTuru = freezed,Object? kalemAdedi = freezed,Object? seriNo = freezed,Object? prosesVar = freezed,Object? teknikResimVarmi = freezed,Object? kontrolPlaniVarmi = freezed,Object? yarimOlcumYapabilirmi = freezed,Object? opkoduTanimi = freezed,Object? istasyonKodu = freezed,Object? istasyonTanimi = freezed,Object? datAdedi = freezed,Object? seriSorulsunmu = freezed,Object? tur = freezed,Object? searchText = freezed,Object? sayfa = freezed,}) {
  return _then(_OlcumBelgeModel(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,belgeSira: freezed == belgeSira ? _self.belgeSira : belgeSira // ignore: cast_nullable_to_non_nullable
as int?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,yapacik: freezed == yapacik ? _self.yapacik : yapacik // ignore: cast_nullable_to_non_nullable
as String?,olcumAdedi: freezed == olcumAdedi ? _self.olcumAdedi : olcumAdedi // ignore: cast_nullable_to_non_nullable
as double?,kabulAdet: freezed == kabulAdet ? _self.kabulAdet : kabulAdet // ignore: cast_nullable_to_non_nullable
as double?,sartliAdet: freezed == sartliAdet ? _self.sartliAdet : sartliAdet // ignore: cast_nullable_to_non_nullable
as double?,retAdet: freezed == retAdet ? _self.retAdet : retAdet // ignore: cast_nullable_to_non_nullable
as double?,opkodu: freezed == opkodu ? _self.opkodu : opkodu // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,cariAdi: freezed == cariAdi ? _self.cariAdi : cariAdi // ignore: cast_nullable_to_non_nullable
as String?,belgeTuru: freezed == belgeTuru ? _self.belgeTuru : belgeTuru // ignore: cast_nullable_to_non_nullable
as String?,kalemAdedi: freezed == kalemAdedi ? _self.kalemAdedi : kalemAdedi // ignore: cast_nullable_to_non_nullable
as int?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,prosesVar: freezed == prosesVar ? _self.prosesVar : prosesVar // ignore: cast_nullable_to_non_nullable
as String?,teknikResimVarmi: freezed == teknikResimVarmi ? _self.teknikResimVarmi : teknikResimVarmi // ignore: cast_nullable_to_non_nullable
as String?,kontrolPlaniVarmi: freezed == kontrolPlaniVarmi ? _self.kontrolPlaniVarmi : kontrolPlaniVarmi // ignore: cast_nullable_to_non_nullable
as String?,yarimOlcumYapabilirmi: freezed == yarimOlcumYapabilirmi ? _self.yarimOlcumYapabilirmi : yarimOlcumYapabilirmi // ignore: cast_nullable_to_non_nullable
as String?,opkoduTanimi: freezed == opkoduTanimi ? _self.opkoduTanimi : opkoduTanimi // ignore: cast_nullable_to_non_nullable
as String?,istasyonKodu: freezed == istasyonKodu ? _self.istasyonKodu : istasyonKodu // ignore: cast_nullable_to_non_nullable
as String?,istasyonTanimi: freezed == istasyonTanimi ? _self.istasyonTanimi : istasyonTanimi // ignore: cast_nullable_to_non_nullable
as String?,datAdedi: freezed == datAdedi ? _self.datAdedi : datAdedi // ignore: cast_nullable_to_non_nullable
as int?,seriSorulsunmu: freezed == seriSorulsunmu ? _self.seriSorulsunmu : seriSorulsunmu // ignore: cast_nullable_to_non_nullable
as String?,tur: freezed == tur ? _self.tur : tur // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$OlcumOlcumlerModel {

 int? get id; set id(int? value); int? get belgeSira; set belgeSira(int? value); String? get stokKodu; set stokKodu(String? value); String? get stokAdi; set stokAdi(String? value); String? get olcumlerOperator; set olcumlerOperator(String? value); String? get kayityapankul; set kayityapankul(String? value); String? get kayitOperator; set kayitOperator(String? value); String? get kayitOperatorKodu; set kayitOperatorKodu(String? value); DateTime? get kayittarihi; set kayittarihi(DateTime? value); double? get kabulAdet; set kabulAdet(double? value); double? get sartliAdet; set sartliAdet(double? value); double? get retAdet; set retAdet(double? value); String? get seriNo; set seriNo(String? value); String? get tamamlandi; set tamamlandi(String? value);
/// Create a copy of OlcumOlcumlerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumOlcumlerModelCopyWith<OlcumOlcumlerModel> get copyWith => _$OlcumOlcumlerModelCopyWithImpl<OlcumOlcumlerModel>(this as OlcumOlcumlerModel, _$identity);

  /// Serializes this OlcumOlcumlerModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OlcumOlcumlerModelCopyWith<$Res>  {
  factory $OlcumOlcumlerModelCopyWith(OlcumOlcumlerModel value, $Res Function(OlcumOlcumlerModel) _then) = _$OlcumOlcumlerModelCopyWithImpl;
@useResult
$Res call({
 int? id, int? belgeSira, String? stokKodu, String? stokAdi, String? olcumlerOperator, String? kayityapankul, String? kayitOperator, String? kayitOperatorKodu, DateTime? kayittarihi, double? kabulAdet, double? sartliAdet, double? retAdet, String? seriNo, String? tamamlandi
});




}
/// @nodoc
class _$OlcumOlcumlerModelCopyWithImpl<$Res>
    implements $OlcumOlcumlerModelCopyWith<$Res> {
  _$OlcumOlcumlerModelCopyWithImpl(this._self, this._then);

  final OlcumOlcumlerModel _self;
  final $Res Function(OlcumOlcumlerModel) _then;

/// Create a copy of OlcumOlcumlerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? belgeSira = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? olcumlerOperator = freezed,Object? kayityapankul = freezed,Object? kayitOperator = freezed,Object? kayitOperatorKodu = freezed,Object? kayittarihi = freezed,Object? kabulAdet = freezed,Object? sartliAdet = freezed,Object? retAdet = freezed,Object? seriNo = freezed,Object? tamamlandi = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,belgeSira: freezed == belgeSira ? _self.belgeSira : belgeSira // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,olcumlerOperator: freezed == olcumlerOperator ? _self.olcumlerOperator : olcumlerOperator // ignore: cast_nullable_to_non_nullable
as String?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,kayitOperator: freezed == kayitOperator ? _self.kayitOperator : kayitOperator // ignore: cast_nullable_to_non_nullable
as String?,kayitOperatorKodu: freezed == kayitOperatorKodu ? _self.kayitOperatorKodu : kayitOperatorKodu // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kabulAdet: freezed == kabulAdet ? _self.kabulAdet : kabulAdet // ignore: cast_nullable_to_non_nullable
as double?,sartliAdet: freezed == sartliAdet ? _self.sartliAdet : sartliAdet // ignore: cast_nullable_to_non_nullable
as double?,retAdet: freezed == retAdet ? _self.retAdet : retAdet // ignore: cast_nullable_to_non_nullable
as double?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,tamamlandi: freezed == tamamlandi ? _self.tamamlandi : tamamlandi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OlcumOlcumlerModel].
extension OlcumOlcumlerModelPatterns on OlcumOlcumlerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumOlcumlerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumOlcumlerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumOlcumlerModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumOlcumlerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumOlcumlerModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumOlcumlerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? belgeSira,  String? stokKodu,  String? stokAdi,  String? olcumlerOperator,  String? kayityapankul,  String? kayitOperator,  String? kayitOperatorKodu,  DateTime? kayittarihi,  double? kabulAdet,  double? sartliAdet,  double? retAdet,  String? seriNo,  String? tamamlandi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumOlcumlerModel() when $default != null:
return $default(_that.id,_that.belgeSira,_that.stokKodu,_that.stokAdi,_that.olcumlerOperator,_that.kayityapankul,_that.kayitOperator,_that.kayitOperatorKodu,_that.kayittarihi,_that.kabulAdet,_that.sartliAdet,_that.retAdet,_that.seriNo,_that.tamamlandi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? belgeSira,  String? stokKodu,  String? stokAdi,  String? olcumlerOperator,  String? kayityapankul,  String? kayitOperator,  String? kayitOperatorKodu,  DateTime? kayittarihi,  double? kabulAdet,  double? sartliAdet,  double? retAdet,  String? seriNo,  String? tamamlandi)  $default,) {final _that = this;
switch (_that) {
case _OlcumOlcumlerModel():
return $default(_that.id,_that.belgeSira,_that.stokKodu,_that.stokAdi,_that.olcumlerOperator,_that.kayityapankul,_that.kayitOperator,_that.kayitOperatorKodu,_that.kayittarihi,_that.kabulAdet,_that.sartliAdet,_that.retAdet,_that.seriNo,_that.tamamlandi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? belgeSira,  String? stokKodu,  String? stokAdi,  String? olcumlerOperator,  String? kayityapankul,  String? kayitOperator,  String? kayitOperatorKodu,  DateTime? kayittarihi,  double? kabulAdet,  double? sartliAdet,  double? retAdet,  String? seriNo,  String? tamamlandi)?  $default,) {final _that = this;
switch (_that) {
case _OlcumOlcumlerModel() when $default != null:
return $default(_that.id,_that.belgeSira,_that.stokKodu,_that.stokAdi,_that.olcumlerOperator,_that.kayityapankul,_that.kayitOperator,_that.kayitOperatorKodu,_that.kayittarihi,_that.kabulAdet,_that.sartliAdet,_that.retAdet,_that.seriNo,_that.tamamlandi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlcumOlcumlerModel extends OlcumOlcumlerModel {
   _OlcumOlcumlerModel({this.id, this.belgeSira, this.stokKodu, this.stokAdi, this.olcumlerOperator, this.kayityapankul, this.kayitOperator, this.kayitOperatorKodu, this.kayittarihi, this.kabulAdet, this.sartliAdet, this.retAdet, this.seriNo, this.tamamlandi}): super._();
  factory _OlcumOlcumlerModel.fromJson(Map<String, dynamic> json) => _$OlcumOlcumlerModelFromJson(json);

@override  int? id;
@override  int? belgeSira;
@override  String? stokKodu;
@override  String? stokAdi;
@override  String? olcumlerOperator;
@override  String? kayityapankul;
@override  String? kayitOperator;
@override  String? kayitOperatorKodu;
@override  DateTime? kayittarihi;
@override  double? kabulAdet;
@override  double? sartliAdet;
@override  double? retAdet;
@override  String? seriNo;
@override  String? tamamlandi;

/// Create a copy of OlcumOlcumlerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumOlcumlerModelCopyWith<_OlcumOlcumlerModel> get copyWith => __$OlcumOlcumlerModelCopyWithImpl<_OlcumOlcumlerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumOlcumlerModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OlcumOlcumlerModelCopyWith<$Res> implements $OlcumOlcumlerModelCopyWith<$Res> {
  factory _$OlcumOlcumlerModelCopyWith(_OlcumOlcumlerModel value, $Res Function(_OlcumOlcumlerModel) _then) = __$OlcumOlcumlerModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? belgeSira, String? stokKodu, String? stokAdi, String? olcumlerOperator, String? kayityapankul, String? kayitOperator, String? kayitOperatorKodu, DateTime? kayittarihi, double? kabulAdet, double? sartliAdet, double? retAdet, String? seriNo, String? tamamlandi
});




}
/// @nodoc
class __$OlcumOlcumlerModelCopyWithImpl<$Res>
    implements _$OlcumOlcumlerModelCopyWith<$Res> {
  __$OlcumOlcumlerModelCopyWithImpl(this._self, this._then);

  final _OlcumOlcumlerModel _self;
  final $Res Function(_OlcumOlcumlerModel) _then;

/// Create a copy of OlcumOlcumlerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? belgeSira = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? olcumlerOperator = freezed,Object? kayityapankul = freezed,Object? kayitOperator = freezed,Object? kayitOperatorKodu = freezed,Object? kayittarihi = freezed,Object? kabulAdet = freezed,Object? sartliAdet = freezed,Object? retAdet = freezed,Object? seriNo = freezed,Object? tamamlandi = freezed,}) {
  return _then(_OlcumOlcumlerModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,belgeSira: freezed == belgeSira ? _self.belgeSira : belgeSira // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,olcumlerOperator: freezed == olcumlerOperator ? _self.olcumlerOperator : olcumlerOperator // ignore: cast_nullable_to_non_nullable
as String?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,kayitOperator: freezed == kayitOperator ? _self.kayitOperator : kayitOperator // ignore: cast_nullable_to_non_nullable
as String?,kayitOperatorKodu: freezed == kayitOperatorKodu ? _self.kayitOperatorKodu : kayitOperatorKodu // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kabulAdet: freezed == kabulAdet ? _self.kabulAdet : kabulAdet // ignore: cast_nullable_to_non_nullable
as double?,sartliAdet: freezed == sartliAdet ? _self.sartliAdet : sartliAdet // ignore: cast_nullable_to_non_nullable
as double?,retAdet: freezed == retAdet ? _self.retAdet : retAdet // ignore: cast_nullable_to_non_nullable
as double?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,tamamlandi: freezed == tamamlandi ? _self.tamamlandi : tamamlandi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OlcumProsesModel {

 int? get id; set id(int? value); int? get sira; set sira(int? value); String? get proses; set proses(String? value); String? get kriter; set kriter(String? value); String? get kabulSarti; set kabulSarti(String? value); String? get tolerans; set tolerans(String? value); String? get ekipman; set ekipman(String? value); String? get olculecekmi; set olculecekmi(String? value); String? get onemlimi; set onemlimi(String? value); double? get altSinir; set altSinir(double? value); double? get ustSinir; set ustSinir(double? value); String? get tur; set tur(String? value); int? get olcumSikligi; set olcumSikligi(int? value); int? get numuneMiktari; set numuneMiktari(int? value); int? get detayId; set detayId(int? value); String? get prosesTipi; set prosesTipi(String? value); String? get sonuc; set sonuc(String? value); String? get sartliKabulNedeni; set sartliKabulNedeni(String? value); String? get sartliKabulNedeniAciklama; set sartliKabulNedeniAciklama(String? value); String? get olcumOperatorModelOperator; set olcumOperatorModelOperator(String? value); String? get oncekiOlcudeSartlivarmi; set oncekiOlcudeSartlivarmi(String? value);@JsonKey(includeToJson: false, includeFromJson: false) OlcumProsesModel? get numuneler;@JsonKey(includeToJson: false, includeFromJson: false) set numuneler(OlcumProsesModel? value); int? get prosesId; set prosesId(int? value); String? get aciklama; set aciklama(String? value); String? get kayitOperator; set kayitOperator(String? value); String? get olcuBirimi; set olcuBirimi(String? value); String? get talno; set talno(String? value); String? get form; set form(String? value); String? get detayAciklama; set detayAciklama(String? value); List<OlcumEkleDetayModel>? get olcumler; set olcumler(List<OlcumEkleDetayModel>? value);
/// Create a copy of OlcumProsesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumProsesModelCopyWith<OlcumProsesModel> get copyWith => _$OlcumProsesModelCopyWithImpl<OlcumProsesModel>(this as OlcumProsesModel, _$identity);

  /// Serializes this OlcumProsesModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OlcumProsesModelCopyWith<$Res>  {
  factory $OlcumProsesModelCopyWith(OlcumProsesModel value, $Res Function(OlcumProsesModel) _then) = _$OlcumProsesModelCopyWithImpl;
@useResult
$Res call({
 int? id, int? sira, String? proses, String? kriter, String? kabulSarti, String? tolerans, String? ekipman, String? olculecekmi, String? onemlimi, double? altSinir, double? ustSinir, String? tur, int? olcumSikligi, int? numuneMiktari, int? detayId, String? prosesTipi, String? sonuc, String? sartliKabulNedeni, String? sartliKabulNedeniAciklama, String? olcumOperatorModelOperator, String? oncekiOlcudeSartlivarmi,@JsonKey(includeToJson: false, includeFromJson: false) OlcumProsesModel? numuneler, int? prosesId, String? aciklama, String? kayitOperator, String? olcuBirimi, String? talno, String? form, String? detayAciklama, List<OlcumEkleDetayModel>? olcumler
});


$OlcumProsesModelCopyWith<$Res>? get numuneler;

}
/// @nodoc
class _$OlcumProsesModelCopyWithImpl<$Res>
    implements $OlcumProsesModelCopyWith<$Res> {
  _$OlcumProsesModelCopyWithImpl(this._self, this._then);

  final OlcumProsesModel _self;
  final $Res Function(OlcumProsesModel) _then;

/// Create a copy of OlcumProsesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? sira = freezed,Object? proses = freezed,Object? kriter = freezed,Object? kabulSarti = freezed,Object? tolerans = freezed,Object? ekipman = freezed,Object? olculecekmi = freezed,Object? onemlimi = freezed,Object? altSinir = freezed,Object? ustSinir = freezed,Object? tur = freezed,Object? olcumSikligi = freezed,Object? numuneMiktari = freezed,Object? detayId = freezed,Object? prosesTipi = freezed,Object? sonuc = freezed,Object? sartliKabulNedeni = freezed,Object? sartliKabulNedeniAciklama = freezed,Object? olcumOperatorModelOperator = freezed,Object? oncekiOlcudeSartlivarmi = freezed,Object? numuneler = freezed,Object? prosesId = freezed,Object? aciklama = freezed,Object? kayitOperator = freezed,Object? olcuBirimi = freezed,Object? talno = freezed,Object? form = freezed,Object? detayAciklama = freezed,Object? olcumler = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,proses: freezed == proses ? _self.proses : proses // ignore: cast_nullable_to_non_nullable
as String?,kriter: freezed == kriter ? _self.kriter : kriter // ignore: cast_nullable_to_non_nullable
as String?,kabulSarti: freezed == kabulSarti ? _self.kabulSarti : kabulSarti // ignore: cast_nullable_to_non_nullable
as String?,tolerans: freezed == tolerans ? _self.tolerans : tolerans // ignore: cast_nullable_to_non_nullable
as String?,ekipman: freezed == ekipman ? _self.ekipman : ekipman // ignore: cast_nullable_to_non_nullable
as String?,olculecekmi: freezed == olculecekmi ? _self.olculecekmi : olculecekmi // ignore: cast_nullable_to_non_nullable
as String?,onemlimi: freezed == onemlimi ? _self.onemlimi : onemlimi // ignore: cast_nullable_to_non_nullable
as String?,altSinir: freezed == altSinir ? _self.altSinir : altSinir // ignore: cast_nullable_to_non_nullable
as double?,ustSinir: freezed == ustSinir ? _self.ustSinir : ustSinir // ignore: cast_nullable_to_non_nullable
as double?,tur: freezed == tur ? _self.tur : tur // ignore: cast_nullable_to_non_nullable
as String?,olcumSikligi: freezed == olcumSikligi ? _self.olcumSikligi : olcumSikligi // ignore: cast_nullable_to_non_nullable
as int?,numuneMiktari: freezed == numuneMiktari ? _self.numuneMiktari : numuneMiktari // ignore: cast_nullable_to_non_nullable
as int?,detayId: freezed == detayId ? _self.detayId : detayId // ignore: cast_nullable_to_non_nullable
as int?,prosesTipi: freezed == prosesTipi ? _self.prosesTipi : prosesTipi // ignore: cast_nullable_to_non_nullable
as String?,sonuc: freezed == sonuc ? _self.sonuc : sonuc // ignore: cast_nullable_to_non_nullable
as String?,sartliKabulNedeni: freezed == sartliKabulNedeni ? _self.sartliKabulNedeni : sartliKabulNedeni // ignore: cast_nullable_to_non_nullable
as String?,sartliKabulNedeniAciklama: freezed == sartliKabulNedeniAciklama ? _self.sartliKabulNedeniAciklama : sartliKabulNedeniAciklama // ignore: cast_nullable_to_non_nullable
as String?,olcumOperatorModelOperator: freezed == olcumOperatorModelOperator ? _self.olcumOperatorModelOperator : olcumOperatorModelOperator // ignore: cast_nullable_to_non_nullable
as String?,oncekiOlcudeSartlivarmi: freezed == oncekiOlcudeSartlivarmi ? _self.oncekiOlcudeSartlivarmi : oncekiOlcudeSartlivarmi // ignore: cast_nullable_to_non_nullable
as String?,numuneler: freezed == numuneler ? _self.numuneler : numuneler // ignore: cast_nullable_to_non_nullable
as OlcumProsesModel?,prosesId: freezed == prosesId ? _self.prosesId : prosesId // ignore: cast_nullable_to_non_nullable
as int?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,kayitOperator: freezed == kayitOperator ? _self.kayitOperator : kayitOperator // ignore: cast_nullable_to_non_nullable
as String?,olcuBirimi: freezed == olcuBirimi ? _self.olcuBirimi : olcuBirimi // ignore: cast_nullable_to_non_nullable
as String?,talno: freezed == talno ? _self.talno : talno // ignore: cast_nullable_to_non_nullable
as String?,form: freezed == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as String?,detayAciklama: freezed == detayAciklama ? _self.detayAciklama : detayAciklama // ignore: cast_nullable_to_non_nullable
as String?,olcumler: freezed == olcumler ? _self.olcumler : olcumler // ignore: cast_nullable_to_non_nullable
as List<OlcumEkleDetayModel>?,
  ));
}
/// Create a copy of OlcumProsesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OlcumProsesModelCopyWith<$Res>? get numuneler {
    if (_self.numuneler == null) {
    return null;
  }

  return $OlcumProsesModelCopyWith<$Res>(_self.numuneler!, (value) {
    return _then(_self.copyWith(numuneler: value));
  });
}
}


/// Adds pattern-matching-related methods to [OlcumProsesModel].
extension OlcumProsesModelPatterns on OlcumProsesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumProsesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumProsesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumProsesModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumProsesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumProsesModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumProsesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? sira,  String? proses,  String? kriter,  String? kabulSarti,  String? tolerans,  String? ekipman,  String? olculecekmi,  String? onemlimi,  double? altSinir,  double? ustSinir,  String? tur,  int? olcumSikligi,  int? numuneMiktari,  int? detayId,  String? prosesTipi,  String? sonuc,  String? sartliKabulNedeni,  String? sartliKabulNedeniAciklama,  String? olcumOperatorModelOperator,  String? oncekiOlcudeSartlivarmi, @JsonKey(includeToJson: false, includeFromJson: false)  OlcumProsesModel? numuneler,  int? prosesId,  String? aciklama,  String? kayitOperator,  String? olcuBirimi,  String? talno,  String? form,  String? detayAciklama,  List<OlcumEkleDetayModel>? olcumler)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumProsesModel() when $default != null:
return $default(_that.id,_that.sira,_that.proses,_that.kriter,_that.kabulSarti,_that.tolerans,_that.ekipman,_that.olculecekmi,_that.onemlimi,_that.altSinir,_that.ustSinir,_that.tur,_that.olcumSikligi,_that.numuneMiktari,_that.detayId,_that.prosesTipi,_that.sonuc,_that.sartliKabulNedeni,_that.sartliKabulNedeniAciklama,_that.olcumOperatorModelOperator,_that.oncekiOlcudeSartlivarmi,_that.numuneler,_that.prosesId,_that.aciklama,_that.kayitOperator,_that.olcuBirimi,_that.talno,_that.form,_that.detayAciklama,_that.olcumler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? sira,  String? proses,  String? kriter,  String? kabulSarti,  String? tolerans,  String? ekipman,  String? olculecekmi,  String? onemlimi,  double? altSinir,  double? ustSinir,  String? tur,  int? olcumSikligi,  int? numuneMiktari,  int? detayId,  String? prosesTipi,  String? sonuc,  String? sartliKabulNedeni,  String? sartliKabulNedeniAciklama,  String? olcumOperatorModelOperator,  String? oncekiOlcudeSartlivarmi, @JsonKey(includeToJson: false, includeFromJson: false)  OlcumProsesModel? numuneler,  int? prosesId,  String? aciklama,  String? kayitOperator,  String? olcuBirimi,  String? talno,  String? form,  String? detayAciklama,  List<OlcumEkleDetayModel>? olcumler)  $default,) {final _that = this;
switch (_that) {
case _OlcumProsesModel():
return $default(_that.id,_that.sira,_that.proses,_that.kriter,_that.kabulSarti,_that.tolerans,_that.ekipman,_that.olculecekmi,_that.onemlimi,_that.altSinir,_that.ustSinir,_that.tur,_that.olcumSikligi,_that.numuneMiktari,_that.detayId,_that.prosesTipi,_that.sonuc,_that.sartliKabulNedeni,_that.sartliKabulNedeniAciklama,_that.olcumOperatorModelOperator,_that.oncekiOlcudeSartlivarmi,_that.numuneler,_that.prosesId,_that.aciklama,_that.kayitOperator,_that.olcuBirimi,_that.talno,_that.form,_that.detayAciklama,_that.olcumler);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? sira,  String? proses,  String? kriter,  String? kabulSarti,  String? tolerans,  String? ekipman,  String? olculecekmi,  String? onemlimi,  double? altSinir,  double? ustSinir,  String? tur,  int? olcumSikligi,  int? numuneMiktari,  int? detayId,  String? prosesTipi,  String? sonuc,  String? sartliKabulNedeni,  String? sartliKabulNedeniAciklama,  String? olcumOperatorModelOperator,  String? oncekiOlcudeSartlivarmi, @JsonKey(includeToJson: false, includeFromJson: false)  OlcumProsesModel? numuneler,  int? prosesId,  String? aciklama,  String? kayitOperator,  String? olcuBirimi,  String? talno,  String? form,  String? detayAciklama,  List<OlcumEkleDetayModel>? olcumler)?  $default,) {final _that = this;
switch (_that) {
case _OlcumProsesModel() when $default != null:
return $default(_that.id,_that.sira,_that.proses,_that.kriter,_that.kabulSarti,_that.tolerans,_that.ekipman,_that.olculecekmi,_that.onemlimi,_that.altSinir,_that.ustSinir,_that.tur,_that.olcumSikligi,_that.numuneMiktari,_that.detayId,_that.prosesTipi,_that.sonuc,_that.sartliKabulNedeni,_that.sartliKabulNedeniAciklama,_that.olcumOperatorModelOperator,_that.oncekiOlcudeSartlivarmi,_that.numuneler,_that.prosesId,_that.aciklama,_that.kayitOperator,_that.olcuBirimi,_that.talno,_that.form,_that.detayAciklama,_that.olcumler);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlcumProsesModel extends OlcumProsesModel {
   _OlcumProsesModel({this.id, this.sira, this.proses, this.kriter, this.kabulSarti, this.tolerans, this.ekipman, this.olculecekmi, this.onemlimi, this.altSinir, this.ustSinir, this.tur, this.olcumSikligi, this.numuneMiktari, this.detayId, this.prosesTipi, this.sonuc, this.sartliKabulNedeni, this.sartliKabulNedeniAciklama, this.olcumOperatorModelOperator, this.oncekiOlcudeSartlivarmi, @JsonKey(includeToJson: false, includeFromJson: false) this.numuneler, this.prosesId, this.aciklama, this.kayitOperator, this.olcuBirimi, this.talno, this.form, this.detayAciklama, this.olcumler}): super._();
  factory _OlcumProsesModel.fromJson(Map<String, dynamic> json) => _$OlcumProsesModelFromJson(json);

@override  int? id;
@override  int? sira;
@override  String? proses;
@override  String? kriter;
@override  String? kabulSarti;
@override  String? tolerans;
@override  String? ekipman;
@override  String? olculecekmi;
@override  String? onemlimi;
@override  double? altSinir;
@override  double? ustSinir;
@override  String? tur;
@override  int? olcumSikligi;
@override  int? numuneMiktari;
@override  int? detayId;
@override  String? prosesTipi;
@override  String? sonuc;
@override  String? sartliKabulNedeni;
@override  String? sartliKabulNedeniAciklama;
@override  String? olcumOperatorModelOperator;
@override  String? oncekiOlcudeSartlivarmi;
@override@JsonKey(includeToJson: false, includeFromJson: false)  OlcumProsesModel? numuneler;
@override  int? prosesId;
@override  String? aciklama;
@override  String? kayitOperator;
@override  String? olcuBirimi;
@override  String? talno;
@override  String? form;
@override  String? detayAciklama;
@override  List<OlcumEkleDetayModel>? olcumler;

/// Create a copy of OlcumProsesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumProsesModelCopyWith<_OlcumProsesModel> get copyWith => __$OlcumProsesModelCopyWithImpl<_OlcumProsesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumProsesModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OlcumProsesModelCopyWith<$Res> implements $OlcumProsesModelCopyWith<$Res> {
  factory _$OlcumProsesModelCopyWith(_OlcumProsesModel value, $Res Function(_OlcumProsesModel) _then) = __$OlcumProsesModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? sira, String? proses, String? kriter, String? kabulSarti, String? tolerans, String? ekipman, String? olculecekmi, String? onemlimi, double? altSinir, double? ustSinir, String? tur, int? olcumSikligi, int? numuneMiktari, int? detayId, String? prosesTipi, String? sonuc, String? sartliKabulNedeni, String? sartliKabulNedeniAciklama, String? olcumOperatorModelOperator, String? oncekiOlcudeSartlivarmi,@JsonKey(includeToJson: false, includeFromJson: false) OlcumProsesModel? numuneler, int? prosesId, String? aciklama, String? kayitOperator, String? olcuBirimi, String? talno, String? form, String? detayAciklama, List<OlcumEkleDetayModel>? olcumler
});


@override $OlcumProsesModelCopyWith<$Res>? get numuneler;

}
/// @nodoc
class __$OlcumProsesModelCopyWithImpl<$Res>
    implements _$OlcumProsesModelCopyWith<$Res> {
  __$OlcumProsesModelCopyWithImpl(this._self, this._then);

  final _OlcumProsesModel _self;
  final $Res Function(_OlcumProsesModel) _then;

/// Create a copy of OlcumProsesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? sira = freezed,Object? proses = freezed,Object? kriter = freezed,Object? kabulSarti = freezed,Object? tolerans = freezed,Object? ekipman = freezed,Object? olculecekmi = freezed,Object? onemlimi = freezed,Object? altSinir = freezed,Object? ustSinir = freezed,Object? tur = freezed,Object? olcumSikligi = freezed,Object? numuneMiktari = freezed,Object? detayId = freezed,Object? prosesTipi = freezed,Object? sonuc = freezed,Object? sartliKabulNedeni = freezed,Object? sartliKabulNedeniAciklama = freezed,Object? olcumOperatorModelOperator = freezed,Object? oncekiOlcudeSartlivarmi = freezed,Object? numuneler = freezed,Object? prosesId = freezed,Object? aciklama = freezed,Object? kayitOperator = freezed,Object? olcuBirimi = freezed,Object? talno = freezed,Object? form = freezed,Object? detayAciklama = freezed,Object? olcumler = freezed,}) {
  return _then(_OlcumProsesModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,proses: freezed == proses ? _self.proses : proses // ignore: cast_nullable_to_non_nullable
as String?,kriter: freezed == kriter ? _self.kriter : kriter // ignore: cast_nullable_to_non_nullable
as String?,kabulSarti: freezed == kabulSarti ? _self.kabulSarti : kabulSarti // ignore: cast_nullable_to_non_nullable
as String?,tolerans: freezed == tolerans ? _self.tolerans : tolerans // ignore: cast_nullable_to_non_nullable
as String?,ekipman: freezed == ekipman ? _self.ekipman : ekipman // ignore: cast_nullable_to_non_nullable
as String?,olculecekmi: freezed == olculecekmi ? _self.olculecekmi : olculecekmi // ignore: cast_nullable_to_non_nullable
as String?,onemlimi: freezed == onemlimi ? _self.onemlimi : onemlimi // ignore: cast_nullable_to_non_nullable
as String?,altSinir: freezed == altSinir ? _self.altSinir : altSinir // ignore: cast_nullable_to_non_nullable
as double?,ustSinir: freezed == ustSinir ? _self.ustSinir : ustSinir // ignore: cast_nullable_to_non_nullable
as double?,tur: freezed == tur ? _self.tur : tur // ignore: cast_nullable_to_non_nullable
as String?,olcumSikligi: freezed == olcumSikligi ? _self.olcumSikligi : olcumSikligi // ignore: cast_nullable_to_non_nullable
as int?,numuneMiktari: freezed == numuneMiktari ? _self.numuneMiktari : numuneMiktari // ignore: cast_nullable_to_non_nullable
as int?,detayId: freezed == detayId ? _self.detayId : detayId // ignore: cast_nullable_to_non_nullable
as int?,prosesTipi: freezed == prosesTipi ? _self.prosesTipi : prosesTipi // ignore: cast_nullable_to_non_nullable
as String?,sonuc: freezed == sonuc ? _self.sonuc : sonuc // ignore: cast_nullable_to_non_nullable
as String?,sartliKabulNedeni: freezed == sartliKabulNedeni ? _self.sartliKabulNedeni : sartliKabulNedeni // ignore: cast_nullable_to_non_nullable
as String?,sartliKabulNedeniAciklama: freezed == sartliKabulNedeniAciklama ? _self.sartliKabulNedeniAciklama : sartliKabulNedeniAciklama // ignore: cast_nullable_to_non_nullable
as String?,olcumOperatorModelOperator: freezed == olcumOperatorModelOperator ? _self.olcumOperatorModelOperator : olcumOperatorModelOperator // ignore: cast_nullable_to_non_nullable
as String?,oncekiOlcudeSartlivarmi: freezed == oncekiOlcudeSartlivarmi ? _self.oncekiOlcudeSartlivarmi : oncekiOlcudeSartlivarmi // ignore: cast_nullable_to_non_nullable
as String?,numuneler: freezed == numuneler ? _self.numuneler : numuneler // ignore: cast_nullable_to_non_nullable
as OlcumProsesModel?,prosesId: freezed == prosesId ? _self.prosesId : prosesId // ignore: cast_nullable_to_non_nullable
as int?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,kayitOperator: freezed == kayitOperator ? _self.kayitOperator : kayitOperator // ignore: cast_nullable_to_non_nullable
as String?,olcuBirimi: freezed == olcuBirimi ? _self.olcuBirimi : olcuBirimi // ignore: cast_nullable_to_non_nullable
as String?,talno: freezed == talno ? _self.talno : talno // ignore: cast_nullable_to_non_nullable
as String?,form: freezed == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as String?,detayAciklama: freezed == detayAciklama ? _self.detayAciklama : detayAciklama // ignore: cast_nullable_to_non_nullable
as String?,olcumler: freezed == olcumler ? _self.olcumler : olcumler // ignore: cast_nullable_to_non_nullable
as List<OlcumEkleDetayModel>?,
  ));
}

/// Create a copy of OlcumProsesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OlcumProsesModelCopyWith<$Res>? get numuneler {
    if (_self.numuneler == null) {
    return null;
  }

  return $OlcumProsesModelCopyWith<$Res>(_self.numuneler!, (value) {
    return _then(_self.copyWith(numuneler: value));
  });
}
}


/// @nodoc
mixin _$OlcumEkleDetayModel {

 double? get deger; set deger(double? value); int? get detayId; set detayId(int? value); DateTime? get zaman; set zaman(DateTime? value);
/// Create a copy of OlcumEkleDetayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumEkleDetayModelCopyWith<OlcumEkleDetayModel> get copyWith => _$OlcumEkleDetayModelCopyWithImpl<OlcumEkleDetayModel>(this as OlcumEkleDetayModel, _$identity);

  /// Serializes this OlcumEkleDetayModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OlcumEkleDetayModelCopyWith<$Res>  {
  factory $OlcumEkleDetayModelCopyWith(OlcumEkleDetayModel value, $Res Function(OlcumEkleDetayModel) _then) = _$OlcumEkleDetayModelCopyWithImpl;
@useResult
$Res call({
 double? deger, int? detayId, DateTime? zaman
});




}
/// @nodoc
class _$OlcumEkleDetayModelCopyWithImpl<$Res>
    implements $OlcumEkleDetayModelCopyWith<$Res> {
  _$OlcumEkleDetayModelCopyWithImpl(this._self, this._then);

  final OlcumEkleDetayModel _self;
  final $Res Function(OlcumEkleDetayModel) _then;

/// Create a copy of OlcumEkleDetayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deger = freezed,Object? detayId = freezed,Object? zaman = freezed,}) {
  return _then(_self.copyWith(
deger: freezed == deger ? _self.deger : deger // ignore: cast_nullable_to_non_nullable
as double?,detayId: freezed == detayId ? _self.detayId : detayId // ignore: cast_nullable_to_non_nullable
as int?,zaman: freezed == zaman ? _self.zaman : zaman // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [OlcumEkleDetayModel].
extension OlcumEkleDetayModelPatterns on OlcumEkleDetayModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumEkleDetayModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumEkleDetayModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumEkleDetayModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumEkleDetayModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumEkleDetayModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumEkleDetayModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? deger,  int? detayId,  DateTime? zaman)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumEkleDetayModel() when $default != null:
return $default(_that.deger,_that.detayId,_that.zaman);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? deger,  int? detayId,  DateTime? zaman)  $default,) {final _that = this;
switch (_that) {
case _OlcumEkleDetayModel():
return $default(_that.deger,_that.detayId,_that.zaman);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? deger,  int? detayId,  DateTime? zaman)?  $default,) {final _that = this;
switch (_that) {
case _OlcumEkleDetayModel() when $default != null:
return $default(_that.deger,_that.detayId,_that.zaman);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlcumEkleDetayModel implements OlcumEkleDetayModel {
   _OlcumEkleDetayModel({this.deger, this.detayId, this.zaman});
  factory _OlcumEkleDetayModel.fromJson(Map<String, dynamic> json) => _$OlcumEkleDetayModelFromJson(json);

@override  double? deger;
@override  int? detayId;
@override  DateTime? zaman;

/// Create a copy of OlcumEkleDetayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumEkleDetayModelCopyWith<_OlcumEkleDetayModel> get copyWith => __$OlcumEkleDetayModelCopyWithImpl<_OlcumEkleDetayModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumEkleDetayModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OlcumEkleDetayModelCopyWith<$Res> implements $OlcumEkleDetayModelCopyWith<$Res> {
  factory _$OlcumEkleDetayModelCopyWith(_OlcumEkleDetayModel value, $Res Function(_OlcumEkleDetayModel) _then) = __$OlcumEkleDetayModelCopyWithImpl;
@override @useResult
$Res call({
 double? deger, int? detayId, DateTime? zaman
});




}
/// @nodoc
class __$OlcumEkleDetayModelCopyWithImpl<$Res>
    implements _$OlcumEkleDetayModelCopyWith<$Res> {
  __$OlcumEkleDetayModelCopyWithImpl(this._self, this._then);

  final _OlcumEkleDetayModel _self;
  final $Res Function(_OlcumEkleDetayModel) _then;

/// Create a copy of OlcumEkleDetayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deger = freezed,Object? detayId = freezed,Object? zaman = freezed,}) {
  return _then(_OlcumEkleDetayModel(
deger: freezed == deger ? _self.deger : deger // ignore: cast_nullable_to_non_nullable
as double?,detayId: freezed == detayId ? _self.detayId : detayId // ignore: cast_nullable_to_non_nullable
as int?,zaman: freezed == zaman ? _self.zaman : zaman // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
