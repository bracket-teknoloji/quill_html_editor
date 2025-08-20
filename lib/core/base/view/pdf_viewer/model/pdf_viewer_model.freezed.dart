// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_viewer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PdfModel {

 String? get raporOzelKod; set raporOzelKod(String? value); bool? get standart; set standart(bool? value); DicParams? get dicParams; set dicParams(DicParams? value);@JsonKey(name: "DicParams", includeToJson: false) Map<String, dynamic>? get dicParamsMap;@JsonKey(name: "DicParams", includeToJson: false) set dicParamsMap(Map<String, dynamic>? value); int? get dizaynId; set dizaynId(int? value); int? get etiketSayisi; set etiketSayisi(int? value);
/// Create a copy of PdfModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PdfModelCopyWith<PdfModel> get copyWith => _$PdfModelCopyWithImpl<PdfModel>(this as PdfModel, _$identity);

  /// Serializes this PdfModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $PdfModelCopyWith<$Res>  {
  factory $PdfModelCopyWith(PdfModel value, $Res Function(PdfModel) _then) = _$PdfModelCopyWithImpl;
@useResult
$Res call({
 String? raporOzelKod, bool? standart, DicParams? dicParams,@JsonKey(name: "DicParams", includeToJson: false) Map<String, dynamic>? dicParamsMap, int? dizaynId, int? etiketSayisi
});


$DicParamsCopyWith<$Res>? get dicParams;

}
/// @nodoc
class _$PdfModelCopyWithImpl<$Res>
    implements $PdfModelCopyWith<$Res> {
  _$PdfModelCopyWithImpl(this._self, this._then);

  final PdfModel _self;
  final $Res Function(PdfModel) _then;

/// Create a copy of PdfModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? raporOzelKod = freezed,Object? standart = freezed,Object? dicParams = freezed,Object? dicParamsMap = freezed,Object? dizaynId = freezed,Object? etiketSayisi = freezed,}) {
  return _then(_self.copyWith(
raporOzelKod: freezed == raporOzelKod ? _self.raporOzelKod : raporOzelKod // ignore: cast_nullable_to_non_nullable
as String?,standart: freezed == standart ? _self.standart : standart // ignore: cast_nullable_to_non_nullable
as bool?,dicParams: freezed == dicParams ? _self.dicParams : dicParams // ignore: cast_nullable_to_non_nullable
as DicParams?,dicParamsMap: freezed == dicParamsMap ? _self.dicParamsMap : dicParamsMap // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,dizaynId: freezed == dizaynId ? _self.dizaynId : dizaynId // ignore: cast_nullable_to_non_nullable
as int?,etiketSayisi: freezed == etiketSayisi ? _self.etiketSayisi : etiketSayisi // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of PdfModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DicParamsCopyWith<$Res>? get dicParams {
    if (_self.dicParams == null) {
    return null;
  }

  return $DicParamsCopyWith<$Res>(_self.dicParams!, (value) {
    return _then(_self.copyWith(dicParams: value));
  });
}
}


/// Adds pattern-matching-related methods to [PdfModel].
extension PdfModelPatterns on PdfModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PdfModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PdfModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PdfModel value)  $default,){
final _that = this;
switch (_that) {
case _PdfModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PdfModel value)?  $default,){
final _that = this;
switch (_that) {
case _PdfModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? raporOzelKod,  bool? standart,  DicParams? dicParams, @JsonKey(name: "DicParams", includeToJson: false)  Map<String, dynamic>? dicParamsMap,  int? dizaynId,  int? etiketSayisi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PdfModel() when $default != null:
return $default(_that.raporOzelKod,_that.standart,_that.dicParams,_that.dicParamsMap,_that.dizaynId,_that.etiketSayisi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? raporOzelKod,  bool? standart,  DicParams? dicParams, @JsonKey(name: "DicParams", includeToJson: false)  Map<String, dynamic>? dicParamsMap,  int? dizaynId,  int? etiketSayisi)  $default,) {final _that = this;
switch (_that) {
case _PdfModel():
return $default(_that.raporOzelKod,_that.standart,_that.dicParams,_that.dicParamsMap,_that.dizaynId,_that.etiketSayisi);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? raporOzelKod,  bool? standart,  DicParams? dicParams, @JsonKey(name: "DicParams", includeToJson: false)  Map<String, dynamic>? dicParamsMap,  int? dizaynId,  int? etiketSayisi)?  $default,) {final _that = this;
switch (_that) {
case _PdfModel() when $default != null:
return $default(_that.raporOzelKod,_that.standart,_that.dicParams,_that.dicParamsMap,_that.dizaynId,_that.etiketSayisi);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createFactory: true, explicitToJson: true, createToJson: true)
class _PdfModel extends PdfModel {
   _PdfModel({this.raporOzelKod, this.standart, this.dicParams, @JsonKey(name: "DicParams", includeToJson: false) this.dicParamsMap, this.dizaynId, this.etiketSayisi}): super._();
  factory _PdfModel.fromJson(Map<String, dynamic> json) => _$PdfModelFromJson(json);

@override  String? raporOzelKod;
@override  bool? standart;
@override  DicParams? dicParams;
@override@JsonKey(name: "DicParams", includeToJson: false)  Map<String, dynamic>? dicParamsMap;
@override  int? dizaynId;
@override  int? etiketSayisi;

/// Create a copy of PdfModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PdfModelCopyWith<_PdfModel> get copyWith => __$PdfModelCopyWithImpl<_PdfModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PdfModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$PdfModelCopyWith<$Res> implements $PdfModelCopyWith<$Res> {
  factory _$PdfModelCopyWith(_PdfModel value, $Res Function(_PdfModel) _then) = __$PdfModelCopyWithImpl;
@override @useResult
$Res call({
 String? raporOzelKod, bool? standart, DicParams? dicParams,@JsonKey(name: "DicParams", includeToJson: false) Map<String, dynamic>? dicParamsMap, int? dizaynId, int? etiketSayisi
});


@override $DicParamsCopyWith<$Res>? get dicParams;

}
/// @nodoc
class __$PdfModelCopyWithImpl<$Res>
    implements _$PdfModelCopyWith<$Res> {
  __$PdfModelCopyWithImpl(this._self, this._then);

  final _PdfModel _self;
  final $Res Function(_PdfModel) _then;

/// Create a copy of PdfModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? raporOzelKod = freezed,Object? standart = freezed,Object? dicParams = freezed,Object? dicParamsMap = freezed,Object? dizaynId = freezed,Object? etiketSayisi = freezed,}) {
  return _then(_PdfModel(
raporOzelKod: freezed == raporOzelKod ? _self.raporOzelKod : raporOzelKod // ignore: cast_nullable_to_non_nullable
as String?,standart: freezed == standart ? _self.standart : standart // ignore: cast_nullable_to_non_nullable
as bool?,dicParams: freezed == dicParams ? _self.dicParams : dicParams // ignore: cast_nullable_to_non_nullable
as DicParams?,dicParamsMap: freezed == dicParamsMap ? _self.dicParamsMap : dicParamsMap // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,dizaynId: freezed == dizaynId ? _self.dizaynId : dizaynId // ignore: cast_nullable_to_non_nullable
as int?,etiketSayisi: freezed == etiketSayisi ? _self.etiketSayisi : etiketSayisi // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of PdfModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DicParamsCopyWith<$Res>? get dicParams {
    if (_self.dicParams == null) {
    return null;
  }

  return $DicParamsCopyWith<$Res>(_self.dicParams!, (value) {
    return _then(_self.copyWith(dicParams: value));
  });
}
}


/// @nodoc
mixin _$DicParams {

 String get belgeNo; set belgeNo(String value); String? get cariKodu; set cariKodu(String? value); String? get teslimCariKodu; set teslimCariKodu(String? value); String? get stokKodu; set stokKodu(String? value); String? get sifirHaric; set sifirHaric(String? value); String? get maliyetTipi; set maliyetTipi(String? value); String? get tlHarDokulsun; set tlHarDokulsun(String? value); String? get depoKodlari; set depoKodlari(String? value); String? get haricStokKodlari; set haricStokKodlari(String? value); String? get haricStokGrupKodlari; set haricStokGrupKodlari(String? value); String? get dovizTipi; set dovizTipi(String? value); String? get bastar; set bastar(String? value); String? get bittar; set bittar(String? value); String? get grupKodu; set grupKodu(String? value); String? get borcAlacak; set borcAlacak(String? value); String? get refTarih; set refTarih(String? value); String? get tarihTipi; set tarihTipi(String? value); String? get kod1; set kod1(String? value); String? get kod2; set kod2(String? value); String? get kod3; set kod3(String? value); String? get kod4; set kod4(String? value); String? get kod5; set kod5(String? value); String? get kapali; set kapali(String? value); String? get durum; set durum(String? value); String? get vergiNo; set vergiNo(String? value); String? get plasiyerKodu; set plasiyerKodu(String? value); String? get aralikTipi; set aralikTipi(String? value); String? get sirala; set sirala(String? value); String? get bakiyeDurumu; set bakiyeDurumu(String? value); String? get caharInckey; set caharInckey(String? value); String? get belgeTipi; set belgeTipi(String? value); String? get isemriNo; set isemriNo(String? value); String? get dinamikParam; set dinamikParam(String? value); String? get kasaharInckey; set kasaharInckey(String? value); String? get uretimFiyatiDahil; set uretimFiyatiDahil(String? value); String? get fiyatTipi; set fiyatTipi(String? value); String? get tblnfStokfiyatgecmisiId; set tblnfStokfiyatgecmisiId(String? value); String? get gorunecekAlanlar; set gorunecekAlanlar(String? value); int? get miktar; set miktar(int? value); String? get yapkod; set yapkod(String? value); String? get opkodu; set opkodu(String? value); String? get kasaKodu; set kasaKodu(String? value); String? get muhasebeKodu; set muhasebeKodu(String? value); String? get filtre; set filtre(String? value); String? get depoKodu; set depoKodu(String? value); String? get hucreKodu; set hucreKodu(String? value); String? get kalemId; set kalemId(String? value); String? get tempBelgeId; set tempBelgeId(String? value); String? get irsDahil; set irsDahil(String? value);@JsonKey(toJson: _dovizTipleriToJson) List<int>? get dovizTipleri;@JsonKey(toJson: _dovizTipleriToJson) set dovizTipleri(List<int>? value); String? get plasiyerKirilimi; set plasiyerKirilimi(String? value);
/// Create a copy of DicParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DicParamsCopyWith<DicParams> get copyWith => _$DicParamsCopyWithImpl<DicParams>(this as DicParams, _$identity);

  /// Serializes this DicParams to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $DicParamsCopyWith<$Res>  {
  factory $DicParamsCopyWith(DicParams value, $Res Function(DicParams) _then) = _$DicParamsCopyWithImpl;
@useResult
$Res call({
 String belgeNo, String? cariKodu, String? teslimCariKodu, String? stokKodu, String? sifirHaric, String? maliyetTipi, String? tlHarDokulsun, String? depoKodlari, String? haricStokKodlari, String? haricStokGrupKodlari, String? dovizTipi, String? bastar, String? bittar, String? grupKodu, String? borcAlacak, String? refTarih, String? tarihTipi, String? kod1, String? kod2, String? kod3, String? kod4, String? kod5, String? kapali, String? durum, String? vergiNo, String? plasiyerKodu, String? aralikTipi, String? sirala, String? bakiyeDurumu, String? caharInckey, String? belgeTipi, String? isemriNo, String? dinamikParam, String? kasaharInckey, String? uretimFiyatiDahil, String? fiyatTipi, String? tblnfStokfiyatgecmisiId, String? gorunecekAlanlar, int? miktar, String? yapkod, String? opkodu, String? kasaKodu, String? muhasebeKodu, String? filtre, String? depoKodu, String? hucreKodu, String? kalemId, String? tempBelgeId, String? irsDahil,@JsonKey(toJson: _dovizTipleriToJson) List<int>? dovizTipleri, String? plasiyerKirilimi
});




}
/// @nodoc
class _$DicParamsCopyWithImpl<$Res>
    implements $DicParamsCopyWith<$Res> {
  _$DicParamsCopyWithImpl(this._self, this._then);

  final DicParams _self;
  final $Res Function(DicParams) _then;

/// Create a copy of DicParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeNo = null,Object? cariKodu = freezed,Object? teslimCariKodu = freezed,Object? stokKodu = freezed,Object? sifirHaric = freezed,Object? maliyetTipi = freezed,Object? tlHarDokulsun = freezed,Object? depoKodlari = freezed,Object? haricStokKodlari = freezed,Object? haricStokGrupKodlari = freezed,Object? dovizTipi = freezed,Object? bastar = freezed,Object? bittar = freezed,Object? grupKodu = freezed,Object? borcAlacak = freezed,Object? refTarih = freezed,Object? tarihTipi = freezed,Object? kod1 = freezed,Object? kod2 = freezed,Object? kod3 = freezed,Object? kod4 = freezed,Object? kod5 = freezed,Object? kapali = freezed,Object? durum = freezed,Object? vergiNo = freezed,Object? plasiyerKodu = freezed,Object? aralikTipi = freezed,Object? sirala = freezed,Object? bakiyeDurumu = freezed,Object? caharInckey = freezed,Object? belgeTipi = freezed,Object? isemriNo = freezed,Object? dinamikParam = freezed,Object? kasaharInckey = freezed,Object? uretimFiyatiDahil = freezed,Object? fiyatTipi = freezed,Object? tblnfStokfiyatgecmisiId = freezed,Object? gorunecekAlanlar = freezed,Object? miktar = freezed,Object? yapkod = freezed,Object? opkodu = freezed,Object? kasaKodu = freezed,Object? muhasebeKodu = freezed,Object? filtre = freezed,Object? depoKodu = freezed,Object? hucreKodu = freezed,Object? kalemId = freezed,Object? tempBelgeId = freezed,Object? irsDahil = freezed,Object? dovizTipleri = freezed,Object? plasiyerKirilimi = freezed,}) {
  return _then(_self.copyWith(
belgeNo: null == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,teslimCariKodu: freezed == teslimCariKodu ? _self.teslimCariKodu : teslimCariKodu // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,sifirHaric: freezed == sifirHaric ? _self.sifirHaric : sifirHaric // ignore: cast_nullable_to_non_nullable
as String?,maliyetTipi: freezed == maliyetTipi ? _self.maliyetTipi : maliyetTipi // ignore: cast_nullable_to_non_nullable
as String?,tlHarDokulsun: freezed == tlHarDokulsun ? _self.tlHarDokulsun : tlHarDokulsun // ignore: cast_nullable_to_non_nullable
as String?,depoKodlari: freezed == depoKodlari ? _self.depoKodlari : depoKodlari // ignore: cast_nullable_to_non_nullable
as String?,haricStokKodlari: freezed == haricStokKodlari ? _self.haricStokKodlari : haricStokKodlari // ignore: cast_nullable_to_non_nullable
as String?,haricStokGrupKodlari: freezed == haricStokGrupKodlari ? _self.haricStokGrupKodlari : haricStokGrupKodlari // ignore: cast_nullable_to_non_nullable
as String?,dovizTipi: freezed == dovizTipi ? _self.dovizTipi : dovizTipi // ignore: cast_nullable_to_non_nullable
as String?,bastar: freezed == bastar ? _self.bastar : bastar // ignore: cast_nullable_to_non_nullable
as String?,bittar: freezed == bittar ? _self.bittar : bittar // ignore: cast_nullable_to_non_nullable
as String?,grupKodu: freezed == grupKodu ? _self.grupKodu : grupKodu // ignore: cast_nullable_to_non_nullable
as String?,borcAlacak: freezed == borcAlacak ? _self.borcAlacak : borcAlacak // ignore: cast_nullable_to_non_nullable
as String?,refTarih: freezed == refTarih ? _self.refTarih : refTarih // ignore: cast_nullable_to_non_nullable
as String?,tarihTipi: freezed == tarihTipi ? _self.tarihTipi : tarihTipi // ignore: cast_nullable_to_non_nullable
as String?,kod1: freezed == kod1 ? _self.kod1 : kod1 // ignore: cast_nullable_to_non_nullable
as String?,kod2: freezed == kod2 ? _self.kod2 : kod2 // ignore: cast_nullable_to_non_nullable
as String?,kod3: freezed == kod3 ? _self.kod3 : kod3 // ignore: cast_nullable_to_non_nullable
as String?,kod4: freezed == kod4 ? _self.kod4 : kod4 // ignore: cast_nullable_to_non_nullable
as String?,kod5: freezed == kod5 ? _self.kod5 : kod5 // ignore: cast_nullable_to_non_nullable
as String?,kapali: freezed == kapali ? _self.kapali : kapali // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,vergiNo: freezed == vergiNo ? _self.vergiNo : vergiNo // ignore: cast_nullable_to_non_nullable
as String?,plasiyerKodu: freezed == plasiyerKodu ? _self.plasiyerKodu : plasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,aralikTipi: freezed == aralikTipi ? _self.aralikTipi : aralikTipi // ignore: cast_nullable_to_non_nullable
as String?,sirala: freezed == sirala ? _self.sirala : sirala // ignore: cast_nullable_to_non_nullable
as String?,bakiyeDurumu: freezed == bakiyeDurumu ? _self.bakiyeDurumu : bakiyeDurumu // ignore: cast_nullable_to_non_nullable
as String?,caharInckey: freezed == caharInckey ? _self.caharInckey : caharInckey // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,isemriNo: freezed == isemriNo ? _self.isemriNo : isemriNo // ignore: cast_nullable_to_non_nullable
as String?,dinamikParam: freezed == dinamikParam ? _self.dinamikParam : dinamikParam // ignore: cast_nullable_to_non_nullable
as String?,kasaharInckey: freezed == kasaharInckey ? _self.kasaharInckey : kasaharInckey // ignore: cast_nullable_to_non_nullable
as String?,uretimFiyatiDahil: freezed == uretimFiyatiDahil ? _self.uretimFiyatiDahil : uretimFiyatiDahil // ignore: cast_nullable_to_non_nullable
as String?,fiyatTipi: freezed == fiyatTipi ? _self.fiyatTipi : fiyatTipi // ignore: cast_nullable_to_non_nullable
as String?,tblnfStokfiyatgecmisiId: freezed == tblnfStokfiyatgecmisiId ? _self.tblnfStokfiyatgecmisiId : tblnfStokfiyatgecmisiId // ignore: cast_nullable_to_non_nullable
as String?,gorunecekAlanlar: freezed == gorunecekAlanlar ? _self.gorunecekAlanlar : gorunecekAlanlar // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as int?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,opkodu: freezed == opkodu ? _self.opkodu : opkodu // ignore: cast_nullable_to_non_nullable
as String?,kasaKodu: freezed == kasaKodu ? _self.kasaKodu : kasaKodu // ignore: cast_nullable_to_non_nullable
as String?,muhasebeKodu: freezed == muhasebeKodu ? _self.muhasebeKodu : muhasebeKodu // ignore: cast_nullable_to_non_nullable
as String?,filtre: freezed == filtre ? _self.filtre : filtre // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as String?,hucreKodu: freezed == hucreKodu ? _self.hucreKodu : hucreKodu // ignore: cast_nullable_to_non_nullable
as String?,kalemId: freezed == kalemId ? _self.kalemId : kalemId // ignore: cast_nullable_to_non_nullable
as String?,tempBelgeId: freezed == tempBelgeId ? _self.tempBelgeId : tempBelgeId // ignore: cast_nullable_to_non_nullable
as String?,irsDahil: freezed == irsDahil ? _self.irsDahil : irsDahil // ignore: cast_nullable_to_non_nullable
as String?,dovizTipleri: freezed == dovizTipleri ? _self.dovizTipleri : dovizTipleri // ignore: cast_nullable_to_non_nullable
as List<int>?,plasiyerKirilimi: freezed == plasiyerKirilimi ? _self.plasiyerKirilimi : plasiyerKirilimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DicParams].
extension DicParamsPatterns on DicParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DicParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DicParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DicParams value)  $default,){
final _that = this;
switch (_that) {
case _DicParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DicParams value)?  $default,){
final _that = this;
switch (_that) {
case _DicParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String belgeNo,  String? cariKodu,  String? teslimCariKodu,  String? stokKodu,  String? sifirHaric,  String? maliyetTipi,  String? tlHarDokulsun,  String? depoKodlari,  String? haricStokKodlari,  String? haricStokGrupKodlari,  String? dovizTipi,  String? bastar,  String? bittar,  String? grupKodu,  String? borcAlacak,  String? refTarih,  String? tarihTipi,  String? kod1,  String? kod2,  String? kod3,  String? kod4,  String? kod5,  String? kapali,  String? durum,  String? vergiNo,  String? plasiyerKodu,  String? aralikTipi,  String? sirala,  String? bakiyeDurumu,  String? caharInckey,  String? belgeTipi,  String? isemriNo,  String? dinamikParam,  String? kasaharInckey,  String? uretimFiyatiDahil,  String? fiyatTipi,  String? tblnfStokfiyatgecmisiId,  String? gorunecekAlanlar,  int? miktar,  String? yapkod,  String? opkodu,  String? kasaKodu,  String? muhasebeKodu,  String? filtre,  String? depoKodu,  String? hucreKodu,  String? kalemId,  String? tempBelgeId,  String? irsDahil, @JsonKey(toJson: _dovizTipleriToJson)  List<int>? dovizTipleri,  String? plasiyerKirilimi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DicParams() when $default != null:
return $default(_that.belgeNo,_that.cariKodu,_that.teslimCariKodu,_that.stokKodu,_that.sifirHaric,_that.maliyetTipi,_that.tlHarDokulsun,_that.depoKodlari,_that.haricStokKodlari,_that.haricStokGrupKodlari,_that.dovizTipi,_that.bastar,_that.bittar,_that.grupKodu,_that.borcAlacak,_that.refTarih,_that.tarihTipi,_that.kod1,_that.kod2,_that.kod3,_that.kod4,_that.kod5,_that.kapali,_that.durum,_that.vergiNo,_that.plasiyerKodu,_that.aralikTipi,_that.sirala,_that.bakiyeDurumu,_that.caharInckey,_that.belgeTipi,_that.isemriNo,_that.dinamikParam,_that.kasaharInckey,_that.uretimFiyatiDahil,_that.fiyatTipi,_that.tblnfStokfiyatgecmisiId,_that.gorunecekAlanlar,_that.miktar,_that.yapkod,_that.opkodu,_that.kasaKodu,_that.muhasebeKodu,_that.filtre,_that.depoKodu,_that.hucreKodu,_that.kalemId,_that.tempBelgeId,_that.irsDahil,_that.dovizTipleri,_that.plasiyerKirilimi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String belgeNo,  String? cariKodu,  String? teslimCariKodu,  String? stokKodu,  String? sifirHaric,  String? maliyetTipi,  String? tlHarDokulsun,  String? depoKodlari,  String? haricStokKodlari,  String? haricStokGrupKodlari,  String? dovizTipi,  String? bastar,  String? bittar,  String? grupKodu,  String? borcAlacak,  String? refTarih,  String? tarihTipi,  String? kod1,  String? kod2,  String? kod3,  String? kod4,  String? kod5,  String? kapali,  String? durum,  String? vergiNo,  String? plasiyerKodu,  String? aralikTipi,  String? sirala,  String? bakiyeDurumu,  String? caharInckey,  String? belgeTipi,  String? isemriNo,  String? dinamikParam,  String? kasaharInckey,  String? uretimFiyatiDahil,  String? fiyatTipi,  String? tblnfStokfiyatgecmisiId,  String? gorunecekAlanlar,  int? miktar,  String? yapkod,  String? opkodu,  String? kasaKodu,  String? muhasebeKodu,  String? filtre,  String? depoKodu,  String? hucreKodu,  String? kalemId,  String? tempBelgeId,  String? irsDahil, @JsonKey(toJson: _dovizTipleriToJson)  List<int>? dovizTipleri,  String? plasiyerKirilimi)  $default,) {final _that = this;
switch (_that) {
case _DicParams():
return $default(_that.belgeNo,_that.cariKodu,_that.teslimCariKodu,_that.stokKodu,_that.sifirHaric,_that.maliyetTipi,_that.tlHarDokulsun,_that.depoKodlari,_that.haricStokKodlari,_that.haricStokGrupKodlari,_that.dovizTipi,_that.bastar,_that.bittar,_that.grupKodu,_that.borcAlacak,_that.refTarih,_that.tarihTipi,_that.kod1,_that.kod2,_that.kod3,_that.kod4,_that.kod5,_that.kapali,_that.durum,_that.vergiNo,_that.plasiyerKodu,_that.aralikTipi,_that.sirala,_that.bakiyeDurumu,_that.caharInckey,_that.belgeTipi,_that.isemriNo,_that.dinamikParam,_that.kasaharInckey,_that.uretimFiyatiDahil,_that.fiyatTipi,_that.tblnfStokfiyatgecmisiId,_that.gorunecekAlanlar,_that.miktar,_that.yapkod,_that.opkodu,_that.kasaKodu,_that.muhasebeKodu,_that.filtre,_that.depoKodu,_that.hucreKodu,_that.kalemId,_that.tempBelgeId,_that.irsDahil,_that.dovizTipleri,_that.plasiyerKirilimi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String belgeNo,  String? cariKodu,  String? teslimCariKodu,  String? stokKodu,  String? sifirHaric,  String? maliyetTipi,  String? tlHarDokulsun,  String? depoKodlari,  String? haricStokKodlari,  String? haricStokGrupKodlari,  String? dovizTipi,  String? bastar,  String? bittar,  String? grupKodu,  String? borcAlacak,  String? refTarih,  String? tarihTipi,  String? kod1,  String? kod2,  String? kod3,  String? kod4,  String? kod5,  String? kapali,  String? durum,  String? vergiNo,  String? plasiyerKodu,  String? aralikTipi,  String? sirala,  String? bakiyeDurumu,  String? caharInckey,  String? belgeTipi,  String? isemriNo,  String? dinamikParam,  String? kasaharInckey,  String? uretimFiyatiDahil,  String? fiyatTipi,  String? tblnfStokfiyatgecmisiId,  String? gorunecekAlanlar,  int? miktar,  String? yapkod,  String? opkodu,  String? kasaKodu,  String? muhasebeKodu,  String? filtre,  String? depoKodu,  String? hucreKodu,  String? kalemId,  String? tempBelgeId,  String? irsDahil, @JsonKey(toJson: _dovizTipleriToJson)  List<int>? dovizTipleri,  String? plasiyerKirilimi)?  $default,) {final _that = this;
switch (_that) {
case _DicParams() when $default != null:
return $default(_that.belgeNo,_that.cariKodu,_that.teslimCariKodu,_that.stokKodu,_that.sifirHaric,_that.maliyetTipi,_that.tlHarDokulsun,_that.depoKodlari,_that.haricStokKodlari,_that.haricStokGrupKodlari,_that.dovizTipi,_that.bastar,_that.bittar,_that.grupKodu,_that.borcAlacak,_that.refTarih,_that.tarihTipi,_that.kod1,_that.kod2,_that.kod3,_that.kod4,_that.kod5,_that.kapali,_that.durum,_that.vergiNo,_that.plasiyerKodu,_that.aralikTipi,_that.sirala,_that.bakiyeDurumu,_that.caharInckey,_that.belgeTipi,_that.isemriNo,_that.dinamikParam,_that.kasaharInckey,_that.uretimFiyatiDahil,_that.fiyatTipi,_that.tblnfStokfiyatgecmisiId,_that.gorunecekAlanlar,_that.miktar,_that.yapkod,_that.opkodu,_that.kasaKodu,_that.muhasebeKodu,_that.filtre,_that.depoKodu,_that.hucreKodu,_that.kalemId,_that.tempBelgeId,_that.irsDahil,_that.dovizTipleri,_that.plasiyerKirilimi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DicParams implements DicParams {
   _DicParams({required this.belgeNo, this.cariKodu, this.teslimCariKodu, this.stokKodu, this.sifirHaric, this.maliyetTipi, this.tlHarDokulsun, this.depoKodlari, this.haricStokKodlari, this.haricStokGrupKodlari, this.dovizTipi, this.bastar, this.bittar, this.grupKodu, this.borcAlacak, this.refTarih, this.tarihTipi, this.kod1, this.kod2, this.kod3, this.kod4, this.kod5, this.kapali, this.durum, this.vergiNo, this.plasiyerKodu, this.aralikTipi, this.sirala, this.bakiyeDurumu, this.caharInckey, this.belgeTipi, this.isemriNo, this.dinamikParam, this.kasaharInckey, this.uretimFiyatiDahil, this.fiyatTipi, this.tblnfStokfiyatgecmisiId, this.gorunecekAlanlar, this.miktar, this.yapkod, this.opkodu, this.kasaKodu, this.muhasebeKodu, this.filtre, this.depoKodu, this.hucreKodu, this.kalemId, this.tempBelgeId, this.irsDahil, @JsonKey(toJson: _dovizTipleriToJson) this.dovizTipleri, this.plasiyerKirilimi});
  factory _DicParams.fromJson(Map<String, dynamic> json) => _$DicParamsFromJson(json);

@override  String belgeNo;
@override  String? cariKodu;
@override  String? teslimCariKodu;
@override  String? stokKodu;
@override  String? sifirHaric;
@override  String? maliyetTipi;
@override  String? tlHarDokulsun;
@override  String? depoKodlari;
@override  String? haricStokKodlari;
@override  String? haricStokGrupKodlari;
@override  String? dovizTipi;
@override  String? bastar;
@override  String? bittar;
@override  String? grupKodu;
@override  String? borcAlacak;
@override  String? refTarih;
@override  String? tarihTipi;
@override  String? kod1;
@override  String? kod2;
@override  String? kod3;
@override  String? kod4;
@override  String? kod5;
@override  String? kapali;
@override  String? durum;
@override  String? vergiNo;
@override  String? plasiyerKodu;
@override  String? aralikTipi;
@override  String? sirala;
@override  String? bakiyeDurumu;
@override  String? caharInckey;
@override  String? belgeTipi;
@override  String? isemriNo;
@override  String? dinamikParam;
@override  String? kasaharInckey;
@override  String? uretimFiyatiDahil;
@override  String? fiyatTipi;
@override  String? tblnfStokfiyatgecmisiId;
@override  String? gorunecekAlanlar;
@override  int? miktar;
@override  String? yapkod;
@override  String? opkodu;
@override  String? kasaKodu;
@override  String? muhasebeKodu;
@override  String? filtre;
@override  String? depoKodu;
@override  String? hucreKodu;
@override  String? kalemId;
@override  String? tempBelgeId;
@override  String? irsDahil;
@override@JsonKey(toJson: _dovizTipleriToJson)  List<int>? dovizTipleri;
@override  String? plasiyerKirilimi;

/// Create a copy of DicParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DicParamsCopyWith<_DicParams> get copyWith => __$DicParamsCopyWithImpl<_DicParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DicParamsToJson(this, );
}





}

/// @nodoc
abstract mixin class _$DicParamsCopyWith<$Res> implements $DicParamsCopyWith<$Res> {
  factory _$DicParamsCopyWith(_DicParams value, $Res Function(_DicParams) _then) = __$DicParamsCopyWithImpl;
@override @useResult
$Res call({
 String belgeNo, String? cariKodu, String? teslimCariKodu, String? stokKodu, String? sifirHaric, String? maliyetTipi, String? tlHarDokulsun, String? depoKodlari, String? haricStokKodlari, String? haricStokGrupKodlari, String? dovizTipi, String? bastar, String? bittar, String? grupKodu, String? borcAlacak, String? refTarih, String? tarihTipi, String? kod1, String? kod2, String? kod3, String? kod4, String? kod5, String? kapali, String? durum, String? vergiNo, String? plasiyerKodu, String? aralikTipi, String? sirala, String? bakiyeDurumu, String? caharInckey, String? belgeTipi, String? isemriNo, String? dinamikParam, String? kasaharInckey, String? uretimFiyatiDahil, String? fiyatTipi, String? tblnfStokfiyatgecmisiId, String? gorunecekAlanlar, int? miktar, String? yapkod, String? opkodu, String? kasaKodu, String? muhasebeKodu, String? filtre, String? depoKodu, String? hucreKodu, String? kalemId, String? tempBelgeId, String? irsDahil,@JsonKey(toJson: _dovizTipleriToJson) List<int>? dovizTipleri, String? plasiyerKirilimi
});




}
/// @nodoc
class __$DicParamsCopyWithImpl<$Res>
    implements _$DicParamsCopyWith<$Res> {
  __$DicParamsCopyWithImpl(this._self, this._then);

  final _DicParams _self;
  final $Res Function(_DicParams) _then;

/// Create a copy of DicParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeNo = null,Object? cariKodu = freezed,Object? teslimCariKodu = freezed,Object? stokKodu = freezed,Object? sifirHaric = freezed,Object? maliyetTipi = freezed,Object? tlHarDokulsun = freezed,Object? depoKodlari = freezed,Object? haricStokKodlari = freezed,Object? haricStokGrupKodlari = freezed,Object? dovizTipi = freezed,Object? bastar = freezed,Object? bittar = freezed,Object? grupKodu = freezed,Object? borcAlacak = freezed,Object? refTarih = freezed,Object? tarihTipi = freezed,Object? kod1 = freezed,Object? kod2 = freezed,Object? kod3 = freezed,Object? kod4 = freezed,Object? kod5 = freezed,Object? kapali = freezed,Object? durum = freezed,Object? vergiNo = freezed,Object? plasiyerKodu = freezed,Object? aralikTipi = freezed,Object? sirala = freezed,Object? bakiyeDurumu = freezed,Object? caharInckey = freezed,Object? belgeTipi = freezed,Object? isemriNo = freezed,Object? dinamikParam = freezed,Object? kasaharInckey = freezed,Object? uretimFiyatiDahil = freezed,Object? fiyatTipi = freezed,Object? tblnfStokfiyatgecmisiId = freezed,Object? gorunecekAlanlar = freezed,Object? miktar = freezed,Object? yapkod = freezed,Object? opkodu = freezed,Object? kasaKodu = freezed,Object? muhasebeKodu = freezed,Object? filtre = freezed,Object? depoKodu = freezed,Object? hucreKodu = freezed,Object? kalemId = freezed,Object? tempBelgeId = freezed,Object? irsDahil = freezed,Object? dovizTipleri = freezed,Object? plasiyerKirilimi = freezed,}) {
  return _then(_DicParams(
belgeNo: null == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,teslimCariKodu: freezed == teslimCariKodu ? _self.teslimCariKodu : teslimCariKodu // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,sifirHaric: freezed == sifirHaric ? _self.sifirHaric : sifirHaric // ignore: cast_nullable_to_non_nullable
as String?,maliyetTipi: freezed == maliyetTipi ? _self.maliyetTipi : maliyetTipi // ignore: cast_nullable_to_non_nullable
as String?,tlHarDokulsun: freezed == tlHarDokulsun ? _self.tlHarDokulsun : tlHarDokulsun // ignore: cast_nullable_to_non_nullable
as String?,depoKodlari: freezed == depoKodlari ? _self.depoKodlari : depoKodlari // ignore: cast_nullable_to_non_nullable
as String?,haricStokKodlari: freezed == haricStokKodlari ? _self.haricStokKodlari : haricStokKodlari // ignore: cast_nullable_to_non_nullable
as String?,haricStokGrupKodlari: freezed == haricStokGrupKodlari ? _self.haricStokGrupKodlari : haricStokGrupKodlari // ignore: cast_nullable_to_non_nullable
as String?,dovizTipi: freezed == dovizTipi ? _self.dovizTipi : dovizTipi // ignore: cast_nullable_to_non_nullable
as String?,bastar: freezed == bastar ? _self.bastar : bastar // ignore: cast_nullable_to_non_nullable
as String?,bittar: freezed == bittar ? _self.bittar : bittar // ignore: cast_nullable_to_non_nullable
as String?,grupKodu: freezed == grupKodu ? _self.grupKodu : grupKodu // ignore: cast_nullable_to_non_nullable
as String?,borcAlacak: freezed == borcAlacak ? _self.borcAlacak : borcAlacak // ignore: cast_nullable_to_non_nullable
as String?,refTarih: freezed == refTarih ? _self.refTarih : refTarih // ignore: cast_nullable_to_non_nullable
as String?,tarihTipi: freezed == tarihTipi ? _self.tarihTipi : tarihTipi // ignore: cast_nullable_to_non_nullable
as String?,kod1: freezed == kod1 ? _self.kod1 : kod1 // ignore: cast_nullable_to_non_nullable
as String?,kod2: freezed == kod2 ? _self.kod2 : kod2 // ignore: cast_nullable_to_non_nullable
as String?,kod3: freezed == kod3 ? _self.kod3 : kod3 // ignore: cast_nullable_to_non_nullable
as String?,kod4: freezed == kod4 ? _self.kod4 : kod4 // ignore: cast_nullable_to_non_nullable
as String?,kod5: freezed == kod5 ? _self.kod5 : kod5 // ignore: cast_nullable_to_non_nullable
as String?,kapali: freezed == kapali ? _self.kapali : kapali // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,vergiNo: freezed == vergiNo ? _self.vergiNo : vergiNo // ignore: cast_nullable_to_non_nullable
as String?,plasiyerKodu: freezed == plasiyerKodu ? _self.plasiyerKodu : plasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,aralikTipi: freezed == aralikTipi ? _self.aralikTipi : aralikTipi // ignore: cast_nullable_to_non_nullable
as String?,sirala: freezed == sirala ? _self.sirala : sirala // ignore: cast_nullable_to_non_nullable
as String?,bakiyeDurumu: freezed == bakiyeDurumu ? _self.bakiyeDurumu : bakiyeDurumu // ignore: cast_nullable_to_non_nullable
as String?,caharInckey: freezed == caharInckey ? _self.caharInckey : caharInckey // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,isemriNo: freezed == isemriNo ? _self.isemriNo : isemriNo // ignore: cast_nullable_to_non_nullable
as String?,dinamikParam: freezed == dinamikParam ? _self.dinamikParam : dinamikParam // ignore: cast_nullable_to_non_nullable
as String?,kasaharInckey: freezed == kasaharInckey ? _self.kasaharInckey : kasaharInckey // ignore: cast_nullable_to_non_nullable
as String?,uretimFiyatiDahil: freezed == uretimFiyatiDahil ? _self.uretimFiyatiDahil : uretimFiyatiDahil // ignore: cast_nullable_to_non_nullable
as String?,fiyatTipi: freezed == fiyatTipi ? _self.fiyatTipi : fiyatTipi // ignore: cast_nullable_to_non_nullable
as String?,tblnfStokfiyatgecmisiId: freezed == tblnfStokfiyatgecmisiId ? _self.tblnfStokfiyatgecmisiId : tblnfStokfiyatgecmisiId // ignore: cast_nullable_to_non_nullable
as String?,gorunecekAlanlar: freezed == gorunecekAlanlar ? _self.gorunecekAlanlar : gorunecekAlanlar // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as int?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,opkodu: freezed == opkodu ? _self.opkodu : opkodu // ignore: cast_nullable_to_non_nullable
as String?,kasaKodu: freezed == kasaKodu ? _self.kasaKodu : kasaKodu // ignore: cast_nullable_to_non_nullable
as String?,muhasebeKodu: freezed == muhasebeKodu ? _self.muhasebeKodu : muhasebeKodu // ignore: cast_nullable_to_non_nullable
as String?,filtre: freezed == filtre ? _self.filtre : filtre // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as String?,hucreKodu: freezed == hucreKodu ? _self.hucreKodu : hucreKodu // ignore: cast_nullable_to_non_nullable
as String?,kalemId: freezed == kalemId ? _self.kalemId : kalemId // ignore: cast_nullable_to_non_nullable
as String?,tempBelgeId: freezed == tempBelgeId ? _self.tempBelgeId : tempBelgeId // ignore: cast_nullable_to_non_nullable
as String?,irsDahil: freezed == irsDahil ? _self.irsDahil : irsDahil // ignore: cast_nullable_to_non_nullable
as String?,dovizTipleri: freezed == dovizTipleri ? _self.dovizTipleri : dovizTipleri // ignore: cast_nullable_to_non_nullable
as List<int>?,plasiyerKirilimi: freezed == plasiyerKirilimi ? _self.plasiyerKirilimi : plasiyerKirilimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
