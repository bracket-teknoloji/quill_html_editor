// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finans_ozet_rapor_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FinansOzetRaporRequestModel {

 String? get plasiyerKodu; set plasiyerKodu(String? value); String? get cariKodu; set cariKodu(String? value); String? get tarihTipi; set tarihTipi(String? value); String? get cariKoduIleBaslar; set cariKoduIleBaslar(String? value);@JsonKey(name: "KDVDahil") bool? get kdvDahil;@JsonKey(name: "KDVDahil") set kdvDahil(bool? value); String? get baslamaTarihi; set baslamaTarihi(String? value); String? get bitisTarihi; set bitisTarihi(String? value); String? get iadeDurumu; set iadeDurumu(String? value);
/// Create a copy of FinansOzetRaporRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinansOzetRaporRequestModelCopyWith<FinansOzetRaporRequestModel> get copyWith => _$FinansOzetRaporRequestModelCopyWithImpl<FinansOzetRaporRequestModel>(this as FinansOzetRaporRequestModel, _$identity);

  /// Serializes this FinansOzetRaporRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $FinansOzetRaporRequestModelCopyWith<$Res>  {
  factory $FinansOzetRaporRequestModelCopyWith(FinansOzetRaporRequestModel value, $Res Function(FinansOzetRaporRequestModel) _then) = _$FinansOzetRaporRequestModelCopyWithImpl;
@useResult
$Res call({
 String? plasiyerKodu, String? cariKodu, String? tarihTipi, String? cariKoduIleBaslar,@JsonKey(name: "KDVDahil") bool? kdvDahil, String? baslamaTarihi, String? bitisTarihi, String? iadeDurumu
});




}
/// @nodoc
class _$FinansOzetRaporRequestModelCopyWithImpl<$Res>
    implements $FinansOzetRaporRequestModelCopyWith<$Res> {
  _$FinansOzetRaporRequestModelCopyWithImpl(this._self, this._then);

  final FinansOzetRaporRequestModel _self;
  final $Res Function(FinansOzetRaporRequestModel) _then;

/// Create a copy of FinansOzetRaporRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plasiyerKodu = freezed,Object? cariKodu = freezed,Object? tarihTipi = freezed,Object? cariKoduIleBaslar = freezed,Object? kdvDahil = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? iadeDurumu = freezed,}) {
  return _then(_self.copyWith(
plasiyerKodu: freezed == plasiyerKodu ? _self.plasiyerKodu : plasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,tarihTipi: freezed == tarihTipi ? _self.tarihTipi : tarihTipi // ignore: cast_nullable_to_non_nullable
as String?,cariKoduIleBaslar: freezed == cariKoduIleBaslar ? _self.cariKoduIleBaslar : cariKoduIleBaslar // ignore: cast_nullable_to_non_nullable
as String?,kdvDahil: freezed == kdvDahil ? _self.kdvDahil : kdvDahil // ignore: cast_nullable_to_non_nullable
as bool?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,iadeDurumu: freezed == iadeDurumu ? _self.iadeDurumu : iadeDurumu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FinansOzetRaporRequestModel].
extension FinansOzetRaporRequestModelPatterns on FinansOzetRaporRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinansOzetRaporRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinansOzetRaporRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinansOzetRaporRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _FinansOzetRaporRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinansOzetRaporRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _FinansOzetRaporRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? plasiyerKodu,  String? cariKodu,  String? tarihTipi,  String? cariKoduIleBaslar, @JsonKey(name: "KDVDahil")  bool? kdvDahil,  String? baslamaTarihi,  String? bitisTarihi,  String? iadeDurumu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinansOzetRaporRequestModel() when $default != null:
return $default(_that.plasiyerKodu,_that.cariKodu,_that.tarihTipi,_that.cariKoduIleBaslar,_that.kdvDahil,_that.baslamaTarihi,_that.bitisTarihi,_that.iadeDurumu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? plasiyerKodu,  String? cariKodu,  String? tarihTipi,  String? cariKoduIleBaslar, @JsonKey(name: "KDVDahil")  bool? kdvDahil,  String? baslamaTarihi,  String? bitisTarihi,  String? iadeDurumu)  $default,) {final _that = this;
switch (_that) {
case _FinansOzetRaporRequestModel():
return $default(_that.plasiyerKodu,_that.cariKodu,_that.tarihTipi,_that.cariKoduIleBaslar,_that.kdvDahil,_that.baslamaTarihi,_that.bitisTarihi,_that.iadeDurumu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? plasiyerKodu,  String? cariKodu,  String? tarihTipi,  String? cariKoduIleBaslar, @JsonKey(name: "KDVDahil")  bool? kdvDahil,  String? baslamaTarihi,  String? bitisTarihi,  String? iadeDurumu)?  $default,) {final _that = this;
switch (_that) {
case _FinansOzetRaporRequestModel() when $default != null:
return $default(_that.plasiyerKodu,_that.cariKodu,_that.tarihTipi,_that.cariKoduIleBaslar,_that.kdvDahil,_that.baslamaTarihi,_that.bitisTarihi,_that.iadeDurumu);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _FinansOzetRaporRequestModel implements FinansOzetRaporRequestModel {
   _FinansOzetRaporRequestModel({this.plasiyerKodu, this.cariKodu, this.tarihTipi, this.cariKoduIleBaslar, @JsonKey(name: "KDVDahil") this.kdvDahil, this.baslamaTarihi, this.bitisTarihi, this.iadeDurumu});
  factory _FinansOzetRaporRequestModel.fromJson(Map<String, dynamic> json) => _$FinansOzetRaporRequestModelFromJson(json);

@override  String? plasiyerKodu;
@override  String? cariKodu;
@override  String? tarihTipi;
@override  String? cariKoduIleBaslar;
@override@JsonKey(name: "KDVDahil")  bool? kdvDahil;
@override  String? baslamaTarihi;
@override  String? bitisTarihi;
@override  String? iadeDurumu;

/// Create a copy of FinansOzetRaporRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinansOzetRaporRequestModelCopyWith<_FinansOzetRaporRequestModel> get copyWith => __$FinansOzetRaporRequestModelCopyWithImpl<_FinansOzetRaporRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinansOzetRaporRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$FinansOzetRaporRequestModelCopyWith<$Res> implements $FinansOzetRaporRequestModelCopyWith<$Res> {
  factory _$FinansOzetRaporRequestModelCopyWith(_FinansOzetRaporRequestModel value, $Res Function(_FinansOzetRaporRequestModel) _then) = __$FinansOzetRaporRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? plasiyerKodu, String? cariKodu, String? tarihTipi, String? cariKoduIleBaslar,@JsonKey(name: "KDVDahil") bool? kdvDahil, String? baslamaTarihi, String? bitisTarihi, String? iadeDurumu
});




}
/// @nodoc
class __$FinansOzetRaporRequestModelCopyWithImpl<$Res>
    implements _$FinansOzetRaporRequestModelCopyWith<$Res> {
  __$FinansOzetRaporRequestModelCopyWithImpl(this._self, this._then);

  final _FinansOzetRaporRequestModel _self;
  final $Res Function(_FinansOzetRaporRequestModel) _then;

/// Create a copy of FinansOzetRaporRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plasiyerKodu = freezed,Object? cariKodu = freezed,Object? tarihTipi = freezed,Object? cariKoduIleBaslar = freezed,Object? kdvDahil = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? iadeDurumu = freezed,}) {
  return _then(_FinansOzetRaporRequestModel(
plasiyerKodu: freezed == plasiyerKodu ? _self.plasiyerKodu : plasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,tarihTipi: freezed == tarihTipi ? _self.tarihTipi : tarihTipi // ignore: cast_nullable_to_non_nullable
as String?,cariKoduIleBaslar: freezed == cariKoduIleBaslar ? _self.cariKoduIleBaslar : cariKoduIleBaslar // ignore: cast_nullable_to_non_nullable
as String?,kdvDahil: freezed == kdvDahil ? _self.kdvDahil : kdvDahil // ignore: cast_nullable_to_non_nullable
as bool?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,iadeDurumu: freezed == iadeDurumu ? _self.iadeDurumu : iadeDurumu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
