// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hucredeki_stoklar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HucredekiStoklarModel {

 String? get hucreKodu; int? get depoKodu; String? get stokKodu; String? get stokAdi; double? get netMiktar; String? get yapkod; String? get yapacik; double? get bakiye; double? get miktar; String? get olcuBirimi;
/// Create a copy of HucredekiStoklarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HucredekiStoklarModelCopyWith<HucredekiStoklarModel> get copyWith => _$HucredekiStoklarModelCopyWithImpl<HucredekiStoklarModel>(this as HucredekiStoklarModel, _$identity);

  /// Serializes this HucredekiStoklarModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HucredekiStoklarModel&&super == other&&(identical(other.hucreKodu, hucreKodu) || other.hucreKodu == hucreKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi)&&(identical(other.netMiktar, netMiktar) || other.netMiktar == netMiktar)&&(identical(other.yapkod, yapkod) || other.yapkod == yapkod)&&(identical(other.yapacik, yapacik) || other.yapacik == yapacik)&&(identical(other.bakiye, bakiye) || other.bakiye == bakiye)&&(identical(other.miktar, miktar) || other.miktar == miktar)&&(identical(other.olcuBirimi, olcuBirimi) || other.olcuBirimi == olcuBirimi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hucreKodu,depoKodu,stokKodu,stokAdi,netMiktar,yapkod,yapacik,bakiye,miktar,olcuBirimi);



}

/// @nodoc
abstract mixin class $HucredekiStoklarModelCopyWith<$Res>  {
  factory $HucredekiStoklarModelCopyWith(HucredekiStoklarModel value, $Res Function(HucredekiStoklarModel) _then) = _$HucredekiStoklarModelCopyWithImpl;
@useResult
$Res call({
 String? hucreKodu, int? depoKodu, String? stokKodu, String? stokAdi, double? netMiktar, String? yapkod, String? yapacik, double? bakiye, double? miktar, String? olcuBirimi
});




}
/// @nodoc
class _$HucredekiStoklarModelCopyWithImpl<$Res>
    implements $HucredekiStoklarModelCopyWith<$Res> {
  _$HucredekiStoklarModelCopyWithImpl(this._self, this._then);

  final HucredekiStoklarModel _self;
  final $Res Function(HucredekiStoklarModel) _then;

/// Create a copy of HucredekiStoklarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hucreKodu = freezed,Object? depoKodu = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? netMiktar = freezed,Object? yapkod = freezed,Object? yapacik = freezed,Object? bakiye = freezed,Object? miktar = freezed,Object? olcuBirimi = freezed,}) {
  return _then(_self.copyWith(
hucreKodu: freezed == hucreKodu ? _self.hucreKodu : hucreKodu // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,netMiktar: freezed == netMiktar ? _self.netMiktar : netMiktar // ignore: cast_nullable_to_non_nullable
as double?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,yapacik: freezed == yapacik ? _self.yapacik : yapacik // ignore: cast_nullable_to_non_nullable
as String?,bakiye: freezed == bakiye ? _self.bakiye : bakiye // ignore: cast_nullable_to_non_nullable
as double?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,olcuBirimi: freezed == olcuBirimi ? _self.olcuBirimi : olcuBirimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HucredekiStoklarModel].
extension HucredekiStoklarModelPatterns on HucredekiStoklarModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HucredekiStoklarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HucredekiStoklarModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HucredekiStoklarModel value)  $default,){
final _that = this;
switch (_that) {
case _HucredekiStoklarModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HucredekiStoklarModel value)?  $default,){
final _that = this;
switch (_that) {
case _HucredekiStoklarModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? hucreKodu,  int? depoKodu,  String? stokKodu,  String? stokAdi,  double? netMiktar,  String? yapkod,  String? yapacik,  double? bakiye,  double? miktar,  String? olcuBirimi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HucredekiStoklarModel() when $default != null:
return $default(_that.hucreKodu,_that.depoKodu,_that.stokKodu,_that.stokAdi,_that.netMiktar,_that.yapkod,_that.yapacik,_that.bakiye,_that.miktar,_that.olcuBirimi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? hucreKodu,  int? depoKodu,  String? stokKodu,  String? stokAdi,  double? netMiktar,  String? yapkod,  String? yapacik,  double? bakiye,  double? miktar,  String? olcuBirimi)  $default,) {final _that = this;
switch (_that) {
case _HucredekiStoklarModel():
return $default(_that.hucreKodu,_that.depoKodu,_that.stokKodu,_that.stokAdi,_that.netMiktar,_that.yapkod,_that.yapacik,_that.bakiye,_that.miktar,_that.olcuBirimi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? hucreKodu,  int? depoKodu,  String? stokKodu,  String? stokAdi,  double? netMiktar,  String? yapkod,  String? yapacik,  double? bakiye,  double? miktar,  String? olcuBirimi)?  $default,) {final _that = this;
switch (_that) {
case _HucredekiStoklarModel() when $default != null:
return $default(_that.hucreKodu,_that.depoKodu,_that.stokKodu,_that.stokAdi,_that.netMiktar,_that.yapkod,_that.yapacik,_that.bakiye,_that.miktar,_that.olcuBirimi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HucredekiStoklarModel extends HucredekiStoklarModel {
   _HucredekiStoklarModel({this.hucreKodu, this.depoKodu, this.stokKodu, this.stokAdi, this.netMiktar, this.yapkod, this.yapacik, this.bakiye, this.miktar, this.olcuBirimi}): super._();
  factory _HucredekiStoklarModel.fromJson(Map<String, dynamic> json) => _$HucredekiStoklarModelFromJson(json);

@override final  String? hucreKodu;
@override final  int? depoKodu;
@override final  String? stokKodu;
@override final  String? stokAdi;
@override final  double? netMiktar;
@override final  String? yapkod;
@override final  String? yapacik;
@override final  double? bakiye;
@override final  double? miktar;
@override final  String? olcuBirimi;

/// Create a copy of HucredekiStoklarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HucredekiStoklarModelCopyWith<_HucredekiStoklarModel> get copyWith => __$HucredekiStoklarModelCopyWithImpl<_HucredekiStoklarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HucredekiStoklarModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HucredekiStoklarModel&&super == other&&(identical(other.hucreKodu, hucreKodu) || other.hucreKodu == hucreKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi)&&(identical(other.netMiktar, netMiktar) || other.netMiktar == netMiktar)&&(identical(other.yapkod, yapkod) || other.yapkod == yapkod)&&(identical(other.yapacik, yapacik) || other.yapacik == yapacik)&&(identical(other.bakiye, bakiye) || other.bakiye == bakiye)&&(identical(other.miktar, miktar) || other.miktar == miktar)&&(identical(other.olcuBirimi, olcuBirimi) || other.olcuBirimi == olcuBirimi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hucreKodu,depoKodu,stokKodu,stokAdi,netMiktar,yapkod,yapacik,bakiye,miktar,olcuBirimi);



}

/// @nodoc
abstract mixin class _$HucredekiStoklarModelCopyWith<$Res> implements $HucredekiStoklarModelCopyWith<$Res> {
  factory _$HucredekiStoklarModelCopyWith(_HucredekiStoklarModel value, $Res Function(_HucredekiStoklarModel) _then) = __$HucredekiStoklarModelCopyWithImpl;
@override @useResult
$Res call({
 String? hucreKodu, int? depoKodu, String? stokKodu, String? stokAdi, double? netMiktar, String? yapkod, String? yapacik, double? bakiye, double? miktar, String? olcuBirimi
});




}
/// @nodoc
class __$HucredekiStoklarModelCopyWithImpl<$Res>
    implements _$HucredekiStoklarModelCopyWith<$Res> {
  __$HucredekiStoklarModelCopyWithImpl(this._self, this._then);

  final _HucredekiStoklarModel _self;
  final $Res Function(_HucredekiStoklarModel) _then;

/// Create a copy of HucredekiStoklarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hucreKodu = freezed,Object? depoKodu = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? netMiktar = freezed,Object? yapkod = freezed,Object? yapacik = freezed,Object? bakiye = freezed,Object? miktar = freezed,Object? olcuBirimi = freezed,}) {
  return _then(_HucredekiStoklarModel(
hucreKodu: freezed == hucreKodu ? _self.hucreKodu : hucreKodu // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,netMiktar: freezed == netMiktar ? _self.netMiktar : netMiktar // ignore: cast_nullable_to_non_nullable
as double?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,yapacik: freezed == yapacik ? _self.yapacik : yapacik // ignore: cast_nullable_to_non_nullable
as String?,bakiye: freezed == bakiye ? _self.bakiye : bakiye // ignore: cast_nullable_to_non_nullable
as double?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,olcuBirimi: freezed == olcuBirimi ? _self.olcuBirimi : olcuBirimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
