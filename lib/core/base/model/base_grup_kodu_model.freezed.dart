// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_grup_kodu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseGrupKoduModel {

 String? get modul; set modul(String? value); int? get grupNo; set grupNo(int? value); String? get grupKodu; set grupKodu(String? value); String? get grupAdi; set grupAdi(String? value); String? get tip; set tip(String? value); String? get kod1; set kod1(String? value); String? get kod2; set kod2(String? value); String? get kod3; set kod3(String? value); String? get kod4; set kod4(String? value); String? get kod5; set kod5(String? value); String? get kod1Adi; set kod1Adi(String? value); String? get kod2Adi; set kod2Adi(String? value); String? get kod3Adi; set kod3Adi(String? value); String? get kod4Adi; set kod4Adi(String? value); String? get kod5Adi; set kod5Adi(String? value);
/// Create a copy of BaseGrupKoduModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseGrupKoduModelCopyWith<BaseGrupKoduModel> get copyWith => _$BaseGrupKoduModelCopyWithImpl<BaseGrupKoduModel>(this as BaseGrupKoduModel, _$identity);

  /// Serializes this BaseGrupKoduModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $BaseGrupKoduModelCopyWith<$Res>  {
  factory $BaseGrupKoduModelCopyWith(BaseGrupKoduModel value, $Res Function(BaseGrupKoduModel) _then) = _$BaseGrupKoduModelCopyWithImpl;
@useResult
$Res call({
 String? modul, int? grupNo, String? grupKodu, String? grupAdi, String? tip, String? kod1, String? kod2, String? kod3, String? kod4, String? kod5, String? kod1Adi, String? kod2Adi, String? kod3Adi, String? kod4Adi, String? kod5Adi
});




}
/// @nodoc
class _$BaseGrupKoduModelCopyWithImpl<$Res>
    implements $BaseGrupKoduModelCopyWith<$Res> {
  _$BaseGrupKoduModelCopyWithImpl(this._self, this._then);

  final BaseGrupKoduModel _self;
  final $Res Function(BaseGrupKoduModel) _then;

/// Create a copy of BaseGrupKoduModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modul = freezed,Object? grupNo = freezed,Object? grupKodu = freezed,Object? grupAdi = freezed,Object? tip = freezed,Object? kod1 = freezed,Object? kod2 = freezed,Object? kod3 = freezed,Object? kod4 = freezed,Object? kod5 = freezed,Object? kod1Adi = freezed,Object? kod2Adi = freezed,Object? kod3Adi = freezed,Object? kod4Adi = freezed,Object? kod5Adi = freezed,}) {
  return _then(_self.copyWith(
modul: freezed == modul ? _self.modul : modul // ignore: cast_nullable_to_non_nullable
as String?,grupNo: freezed == grupNo ? _self.grupNo : grupNo // ignore: cast_nullable_to_non_nullable
as int?,grupKodu: freezed == grupKodu ? _self.grupKodu : grupKodu // ignore: cast_nullable_to_non_nullable
as String?,grupAdi: freezed == grupAdi ? _self.grupAdi : grupAdi // ignore: cast_nullable_to_non_nullable
as String?,tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as String?,kod1: freezed == kod1 ? _self.kod1 : kod1 // ignore: cast_nullable_to_non_nullable
as String?,kod2: freezed == kod2 ? _self.kod2 : kod2 // ignore: cast_nullable_to_non_nullable
as String?,kod3: freezed == kod3 ? _self.kod3 : kod3 // ignore: cast_nullable_to_non_nullable
as String?,kod4: freezed == kod4 ? _self.kod4 : kod4 // ignore: cast_nullable_to_non_nullable
as String?,kod5: freezed == kod5 ? _self.kod5 : kod5 // ignore: cast_nullable_to_non_nullable
as String?,kod1Adi: freezed == kod1Adi ? _self.kod1Adi : kod1Adi // ignore: cast_nullable_to_non_nullable
as String?,kod2Adi: freezed == kod2Adi ? _self.kod2Adi : kod2Adi // ignore: cast_nullable_to_non_nullable
as String?,kod3Adi: freezed == kod3Adi ? _self.kod3Adi : kod3Adi // ignore: cast_nullable_to_non_nullable
as String?,kod4Adi: freezed == kod4Adi ? _self.kod4Adi : kod4Adi // ignore: cast_nullable_to_non_nullable
as String?,kod5Adi: freezed == kod5Adi ? _self.kod5Adi : kod5Adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseGrupKoduModel].
extension BaseGrupKoduModelPatterns on BaseGrupKoduModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseGrupKoduModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseGrupKoduModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseGrupKoduModel value)  $default,){
final _that = this;
switch (_that) {
case _BaseGrupKoduModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseGrupKoduModel value)?  $default,){
final _that = this;
switch (_that) {
case _BaseGrupKoduModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? modul,  int? grupNo,  String? grupKodu,  String? grupAdi,  String? tip,  String? kod1,  String? kod2,  String? kod3,  String? kod4,  String? kod5,  String? kod1Adi,  String? kod2Adi,  String? kod3Adi,  String? kod4Adi,  String? kod5Adi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseGrupKoduModel() when $default != null:
return $default(_that.modul,_that.grupNo,_that.grupKodu,_that.grupAdi,_that.tip,_that.kod1,_that.kod2,_that.kod3,_that.kod4,_that.kod5,_that.kod1Adi,_that.kod2Adi,_that.kod3Adi,_that.kod4Adi,_that.kod5Adi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? modul,  int? grupNo,  String? grupKodu,  String? grupAdi,  String? tip,  String? kod1,  String? kod2,  String? kod3,  String? kod4,  String? kod5,  String? kod1Adi,  String? kod2Adi,  String? kod3Adi,  String? kod4Adi,  String? kod5Adi)  $default,) {final _that = this;
switch (_that) {
case _BaseGrupKoduModel():
return $default(_that.modul,_that.grupNo,_that.grupKodu,_that.grupAdi,_that.tip,_that.kod1,_that.kod2,_that.kod3,_that.kod4,_that.kod5,_that.kod1Adi,_that.kod2Adi,_that.kod3Adi,_that.kod4Adi,_that.kod5Adi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? modul,  int? grupNo,  String? grupKodu,  String? grupAdi,  String? tip,  String? kod1,  String? kod2,  String? kod3,  String? kod4,  String? kod5,  String? kod1Adi,  String? kod2Adi,  String? kod3Adi,  String? kod4Adi,  String? kod5Adi)?  $default,) {final _that = this;
switch (_that) {
case _BaseGrupKoduModel() when $default != null:
return $default(_that.modul,_that.grupNo,_that.grupKodu,_that.grupAdi,_that.tip,_that.kod1,_that.kod2,_that.kod3,_that.kod4,_that.kod5,_that.kod1Adi,_that.kod2Adi,_that.kod3Adi,_that.kod4Adi,_that.kod5Adi);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(createFactory: true)
class _BaseGrupKoduModel extends BaseGrupKoduModel {
   _BaseGrupKoduModel({this.modul, this.grupNo, this.grupKodu, this.grupAdi, this.tip, this.kod1, this.kod2, this.kod3, this.kod4, this.kod5, this.kod1Adi, this.kod2Adi, this.kod3Adi, this.kod4Adi, this.kod5Adi}): super._();
  factory _BaseGrupKoduModel.fromJson(Map<String, dynamic> json) => _$BaseGrupKoduModelFromJson(json);

@override  String? modul;
@override  int? grupNo;
@override  String? grupKodu;
@override  String? grupAdi;
@override  String? tip;
@override  String? kod1;
@override  String? kod2;
@override  String? kod3;
@override  String? kod4;
@override  String? kod5;
@override  String? kod1Adi;
@override  String? kod2Adi;
@override  String? kod3Adi;
@override  String? kod4Adi;
@override  String? kod5Adi;

/// Create a copy of BaseGrupKoduModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseGrupKoduModelCopyWith<_BaseGrupKoduModel> get copyWith => __$BaseGrupKoduModelCopyWithImpl<_BaseGrupKoduModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BaseGrupKoduModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$BaseGrupKoduModelCopyWith<$Res> implements $BaseGrupKoduModelCopyWith<$Res> {
  factory _$BaseGrupKoduModelCopyWith(_BaseGrupKoduModel value, $Res Function(_BaseGrupKoduModel) _then) = __$BaseGrupKoduModelCopyWithImpl;
@override @useResult
$Res call({
 String? modul, int? grupNo, String? grupKodu, String? grupAdi, String? tip, String? kod1, String? kod2, String? kod3, String? kod4, String? kod5, String? kod1Adi, String? kod2Adi, String? kod3Adi, String? kod4Adi, String? kod5Adi
});




}
/// @nodoc
class __$BaseGrupKoduModelCopyWithImpl<$Res>
    implements _$BaseGrupKoduModelCopyWith<$Res> {
  __$BaseGrupKoduModelCopyWithImpl(this._self, this._then);

  final _BaseGrupKoduModel _self;
  final $Res Function(_BaseGrupKoduModel) _then;

/// Create a copy of BaseGrupKoduModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modul = freezed,Object? grupNo = freezed,Object? grupKodu = freezed,Object? grupAdi = freezed,Object? tip = freezed,Object? kod1 = freezed,Object? kod2 = freezed,Object? kod3 = freezed,Object? kod4 = freezed,Object? kod5 = freezed,Object? kod1Adi = freezed,Object? kod2Adi = freezed,Object? kod3Adi = freezed,Object? kod4Adi = freezed,Object? kod5Adi = freezed,}) {
  return _then(_BaseGrupKoduModel(
modul: freezed == modul ? _self.modul : modul // ignore: cast_nullable_to_non_nullable
as String?,grupNo: freezed == grupNo ? _self.grupNo : grupNo // ignore: cast_nullable_to_non_nullable
as int?,grupKodu: freezed == grupKodu ? _self.grupKodu : grupKodu // ignore: cast_nullable_to_non_nullable
as String?,grupAdi: freezed == grupAdi ? _self.grupAdi : grupAdi // ignore: cast_nullable_to_non_nullable
as String?,tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as String?,kod1: freezed == kod1 ? _self.kod1 : kod1 // ignore: cast_nullable_to_non_nullable
as String?,kod2: freezed == kod2 ? _self.kod2 : kod2 // ignore: cast_nullable_to_non_nullable
as String?,kod3: freezed == kod3 ? _self.kod3 : kod3 // ignore: cast_nullable_to_non_nullable
as String?,kod4: freezed == kod4 ? _self.kod4 : kod4 // ignore: cast_nullable_to_non_nullable
as String?,kod5: freezed == kod5 ? _self.kod5 : kod5 // ignore: cast_nullable_to_non_nullable
as String?,kod1Adi: freezed == kod1Adi ? _self.kod1Adi : kod1Adi // ignore: cast_nullable_to_non_nullable
as String?,kod2Adi: freezed == kod2Adi ? _self.kod2Adi : kod2Adi // ignore: cast_nullable_to_non_nullable
as String?,kod3Adi: freezed == kod3Adi ? _self.kod3Adi : kod3Adi // ignore: cast_nullable_to_non_nullable
as String?,kod4Adi: freezed == kod4Adi ? _self.kod4Adi : kod4Adi // ignore: cast_nullable_to_non_nullable
as String?,kod5Adi: freezed == kod5Adi ? _self.kod5Adi : kod5Adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
