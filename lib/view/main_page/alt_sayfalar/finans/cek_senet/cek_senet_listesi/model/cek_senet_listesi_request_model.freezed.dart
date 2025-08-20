// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cek_senet_listesi_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CekSenetListesiRequestModel {

 String? get verenKodu; set verenKodu(String? value); String? get sirala; set sirala(String? value); String? get ekranTipi; set ekranTipi(String? value); String? get yer; set yer(String? value); String? get donemTipi; set donemTipi(String? value); String? get tarihTipi; set tarihTipi(String? value); String? get tipi; set tipi(String? value); String? get verilenKodu; set verilenKodu(String? value); String? get durum; set durum(String? value); String? get searchText; set searchText(String? value); String? get baslangicTarihi; set baslangicTarihi(String? value); String? get bitisTarihi; set bitisTarihi(String? value);
/// Create a copy of CekSenetListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CekSenetListesiRequestModelCopyWith<CekSenetListesiRequestModel> get copyWith => _$CekSenetListesiRequestModelCopyWithImpl<CekSenetListesiRequestModel>(this as CekSenetListesiRequestModel, _$identity);

  /// Serializes this CekSenetListesiRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $CekSenetListesiRequestModelCopyWith<$Res>  {
  factory $CekSenetListesiRequestModelCopyWith(CekSenetListesiRequestModel value, $Res Function(CekSenetListesiRequestModel) _then) = _$CekSenetListesiRequestModelCopyWithImpl;
@useResult
$Res call({
 String? verenKodu, String? sirala, String? ekranTipi, String? yer, String? donemTipi, String? tarihTipi, String? tipi, String? verilenKodu, String? durum, String? searchText, String? baslangicTarihi, String? bitisTarihi
});




}
/// @nodoc
class _$CekSenetListesiRequestModelCopyWithImpl<$Res>
    implements $CekSenetListesiRequestModelCopyWith<$Res> {
  _$CekSenetListesiRequestModelCopyWithImpl(this._self, this._then);

  final CekSenetListesiRequestModel _self;
  final $Res Function(CekSenetListesiRequestModel) _then;

/// Create a copy of CekSenetListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verenKodu = freezed,Object? sirala = freezed,Object? ekranTipi = freezed,Object? yer = freezed,Object? donemTipi = freezed,Object? tarihTipi = freezed,Object? tipi = freezed,Object? verilenKodu = freezed,Object? durum = freezed,Object? searchText = freezed,Object? baslangicTarihi = freezed,Object? bitisTarihi = freezed,}) {
  return _then(_self.copyWith(
verenKodu: freezed == verenKodu ? _self.verenKodu : verenKodu // ignore: cast_nullable_to_non_nullable
as String?,sirala: freezed == sirala ? _self.sirala : sirala // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,yer: freezed == yer ? _self.yer : yer // ignore: cast_nullable_to_non_nullable
as String?,donemTipi: freezed == donemTipi ? _self.donemTipi : donemTipi // ignore: cast_nullable_to_non_nullable
as String?,tarihTipi: freezed == tarihTipi ? _self.tarihTipi : tarihTipi // ignore: cast_nullable_to_non_nullable
as String?,tipi: freezed == tipi ? _self.tipi : tipi // ignore: cast_nullable_to_non_nullable
as String?,verilenKodu: freezed == verilenKodu ? _self.verilenKodu : verilenKodu // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,baslangicTarihi: freezed == baslangicTarihi ? _self.baslangicTarihi : baslangicTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CekSenetListesiRequestModel].
extension CekSenetListesiRequestModelPatterns on CekSenetListesiRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CekSenetListesiRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CekSenetListesiRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CekSenetListesiRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CekSenetListesiRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CekSenetListesiRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CekSenetListesiRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? verenKodu,  String? sirala,  String? ekranTipi,  String? yer,  String? donemTipi,  String? tarihTipi,  String? tipi,  String? verilenKodu,  String? durum,  String? searchText,  String? baslangicTarihi,  String? bitisTarihi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CekSenetListesiRequestModel() when $default != null:
return $default(_that.verenKodu,_that.sirala,_that.ekranTipi,_that.yer,_that.donemTipi,_that.tarihTipi,_that.tipi,_that.verilenKodu,_that.durum,_that.searchText,_that.baslangicTarihi,_that.bitisTarihi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? verenKodu,  String? sirala,  String? ekranTipi,  String? yer,  String? donemTipi,  String? tarihTipi,  String? tipi,  String? verilenKodu,  String? durum,  String? searchText,  String? baslangicTarihi,  String? bitisTarihi)  $default,) {final _that = this;
switch (_that) {
case _CekSenetListesiRequestModel():
return $default(_that.verenKodu,_that.sirala,_that.ekranTipi,_that.yer,_that.donemTipi,_that.tarihTipi,_that.tipi,_that.verilenKodu,_that.durum,_that.searchText,_that.baslangicTarihi,_that.bitisTarihi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? verenKodu,  String? sirala,  String? ekranTipi,  String? yer,  String? donemTipi,  String? tarihTipi,  String? tipi,  String? verilenKodu,  String? durum,  String? searchText,  String? baslangicTarihi,  String? bitisTarihi)?  $default,) {final _that = this;
switch (_that) {
case _CekSenetListesiRequestModel() when $default != null:
return $default(_that.verenKodu,_that.sirala,_that.ekranTipi,_that.yer,_that.donemTipi,_that.tarihTipi,_that.tipi,_that.verilenKodu,_that.durum,_that.searchText,_that.baslangicTarihi,_that.bitisTarihi);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _CekSenetListesiRequestModel implements CekSenetListesiRequestModel {
   _CekSenetListesiRequestModel({this.verenKodu, this.sirala, this.ekranTipi, this.yer, this.donemTipi, this.tarihTipi, this.tipi, this.verilenKodu, this.durum, this.searchText, this.baslangicTarihi, this.bitisTarihi});
  factory _CekSenetListesiRequestModel.fromJson(Map<String, dynamic> json) => _$CekSenetListesiRequestModelFromJson(json);

@override  String? verenKodu;
@override  String? sirala;
@override  String? ekranTipi;
@override  String? yer;
@override  String? donemTipi;
@override  String? tarihTipi;
@override  String? tipi;
@override  String? verilenKodu;
@override  String? durum;
@override  String? searchText;
@override  String? baslangicTarihi;
@override  String? bitisTarihi;

/// Create a copy of CekSenetListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CekSenetListesiRequestModelCopyWith<_CekSenetListesiRequestModel> get copyWith => __$CekSenetListesiRequestModelCopyWithImpl<_CekSenetListesiRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CekSenetListesiRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$CekSenetListesiRequestModelCopyWith<$Res> implements $CekSenetListesiRequestModelCopyWith<$Res> {
  factory _$CekSenetListesiRequestModelCopyWith(_CekSenetListesiRequestModel value, $Res Function(_CekSenetListesiRequestModel) _then) = __$CekSenetListesiRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? verenKodu, String? sirala, String? ekranTipi, String? yer, String? donemTipi, String? tarihTipi, String? tipi, String? verilenKodu, String? durum, String? searchText, String? baslangicTarihi, String? bitisTarihi
});




}
/// @nodoc
class __$CekSenetListesiRequestModelCopyWithImpl<$Res>
    implements _$CekSenetListesiRequestModelCopyWith<$Res> {
  __$CekSenetListesiRequestModelCopyWithImpl(this._self, this._then);

  final _CekSenetListesiRequestModel _self;
  final $Res Function(_CekSenetListesiRequestModel) _then;

/// Create a copy of CekSenetListesiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verenKodu = freezed,Object? sirala = freezed,Object? ekranTipi = freezed,Object? yer = freezed,Object? donemTipi = freezed,Object? tarihTipi = freezed,Object? tipi = freezed,Object? verilenKodu = freezed,Object? durum = freezed,Object? searchText = freezed,Object? baslangicTarihi = freezed,Object? bitisTarihi = freezed,}) {
  return _then(_CekSenetListesiRequestModel(
verenKodu: freezed == verenKodu ? _self.verenKodu : verenKodu // ignore: cast_nullable_to_non_nullable
as String?,sirala: freezed == sirala ? _self.sirala : sirala // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,yer: freezed == yer ? _self.yer : yer // ignore: cast_nullable_to_non_nullable
as String?,donemTipi: freezed == donemTipi ? _self.donemTipi : donemTipi // ignore: cast_nullable_to_non_nullable
as String?,tarihTipi: freezed == tarihTipi ? _self.tarihTipi : tarihTipi // ignore: cast_nullable_to_non_nullable
as String?,tipi: freezed == tipi ? _self.tipi : tipi // ignore: cast_nullable_to_non_nullable
as String?,verilenKodu: freezed == verilenKodu ? _self.verilenKodu : verilenKodu // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,baslangicTarihi: freezed == baslangicTarihi ? _self.baslangicTarihi : baslangicTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
