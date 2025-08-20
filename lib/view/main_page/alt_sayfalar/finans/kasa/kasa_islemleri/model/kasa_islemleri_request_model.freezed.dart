// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kasa_islemleri_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KasaIslemleriRequestModel {

 String? get baslamaTarihi; set baslamaTarihi(String? value); String? get bitisTarihi; set bitisTarihi(String? value); String? get menuKodu; set menuKodu(String? value); int? get sayfa; set sayfa(int? value); String? get plasiyerKodu; set plasiyerKodu(String? value); String? get hesapTipi; set hesapTipi(String? value); String? get hesapKodu; set hesapKodu(String? value); String? get kasaKodu; set kasaKodu(String? value); String? get gc; set gc(String? value); bool? get kisitYok; set kisitYok(bool? value); String? get refKey; set refKey(String? value);
/// Create a copy of KasaIslemleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KasaIslemleriRequestModelCopyWith<KasaIslemleriRequestModel> get copyWith => _$KasaIslemleriRequestModelCopyWithImpl<KasaIslemleriRequestModel>(this as KasaIslemleriRequestModel, _$identity);

  /// Serializes this KasaIslemleriRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $KasaIslemleriRequestModelCopyWith<$Res>  {
  factory $KasaIslemleriRequestModelCopyWith(KasaIslemleriRequestModel value, $Res Function(KasaIslemleriRequestModel) _then) = _$KasaIslemleriRequestModelCopyWithImpl;
@useResult
$Res call({
 String? baslamaTarihi, String? bitisTarihi, String? menuKodu, int? sayfa, String? plasiyerKodu, String? hesapTipi, String? hesapKodu, String? kasaKodu, String? gc, bool? kisitYok, String? refKey
});




}
/// @nodoc
class _$KasaIslemleriRequestModelCopyWithImpl<$Res>
    implements $KasaIslemleriRequestModelCopyWith<$Res> {
  _$KasaIslemleriRequestModelCopyWithImpl(this._self, this._then);

  final KasaIslemleriRequestModel _self;
  final $Res Function(KasaIslemleriRequestModel) _then;

/// Create a copy of KasaIslemleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? menuKodu = freezed,Object? sayfa = freezed,Object? plasiyerKodu = freezed,Object? hesapTipi = freezed,Object? hesapKodu = freezed,Object? kasaKodu = freezed,Object? gc = freezed,Object? kisitYok = freezed,Object? refKey = freezed,}) {
  return _then(_self.copyWith(
baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,plasiyerKodu: freezed == plasiyerKodu ? _self.plasiyerKodu : plasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,hesapTipi: freezed == hesapTipi ? _self.hesapTipi : hesapTipi // ignore: cast_nullable_to_non_nullable
as String?,hesapKodu: freezed == hesapKodu ? _self.hesapKodu : hesapKodu // ignore: cast_nullable_to_non_nullable
as String?,kasaKodu: freezed == kasaKodu ? _self.kasaKodu : kasaKodu // ignore: cast_nullable_to_non_nullable
as String?,gc: freezed == gc ? _self.gc : gc // ignore: cast_nullable_to_non_nullable
as String?,kisitYok: freezed == kisitYok ? _self.kisitYok : kisitYok // ignore: cast_nullable_to_non_nullable
as bool?,refKey: freezed == refKey ? _self.refKey : refKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [KasaIslemleriRequestModel].
extension KasaIslemleriRequestModelPatterns on KasaIslemleriRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KasaIslemleriRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KasaIslemleriRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KasaIslemleriRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _KasaIslemleriRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KasaIslemleriRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _KasaIslemleriRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? baslamaTarihi,  String? bitisTarihi,  String? menuKodu,  int? sayfa,  String? plasiyerKodu,  String? hesapTipi,  String? hesapKodu,  String? kasaKodu,  String? gc,  bool? kisitYok,  String? refKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KasaIslemleriRequestModel() when $default != null:
return $default(_that.baslamaTarihi,_that.bitisTarihi,_that.menuKodu,_that.sayfa,_that.plasiyerKodu,_that.hesapTipi,_that.hesapKodu,_that.kasaKodu,_that.gc,_that.kisitYok,_that.refKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? baslamaTarihi,  String? bitisTarihi,  String? menuKodu,  int? sayfa,  String? plasiyerKodu,  String? hesapTipi,  String? hesapKodu,  String? kasaKodu,  String? gc,  bool? kisitYok,  String? refKey)  $default,) {final _that = this;
switch (_that) {
case _KasaIslemleriRequestModel():
return $default(_that.baslamaTarihi,_that.bitisTarihi,_that.menuKodu,_that.sayfa,_that.plasiyerKodu,_that.hesapTipi,_that.hesapKodu,_that.kasaKodu,_that.gc,_that.kisitYok,_that.refKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? baslamaTarihi,  String? bitisTarihi,  String? menuKodu,  int? sayfa,  String? plasiyerKodu,  String? hesapTipi,  String? hesapKodu,  String? kasaKodu,  String? gc,  bool? kisitYok,  String? refKey)?  $default,) {final _that = this;
switch (_that) {
case _KasaIslemleriRequestModel() when $default != null:
return $default(_that.baslamaTarihi,_that.bitisTarihi,_that.menuKodu,_that.sayfa,_that.plasiyerKodu,_that.hesapTipi,_that.hesapKodu,_that.kasaKodu,_that.gc,_that.kisitYok,_that.refKey);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _KasaIslemleriRequestModel implements KasaIslemleriRequestModel {
   _KasaIslemleriRequestModel({this.baslamaTarihi, this.bitisTarihi, this.menuKodu, this.sayfa, this.plasiyerKodu, this.hesapTipi, this.hesapKodu, this.kasaKodu, this.gc, this.kisitYok, this.refKey});
  factory _KasaIslemleriRequestModel.fromJson(Map<String, dynamic> json) => _$KasaIslemleriRequestModelFromJson(json);

@override  String? baslamaTarihi;
@override  String? bitisTarihi;
@override  String? menuKodu;
@override  int? sayfa;
@override  String? plasiyerKodu;
@override  String? hesapTipi;
@override  String? hesapKodu;
@override  String? kasaKodu;
@override  String? gc;
@override  bool? kisitYok;
@override  String? refKey;

/// Create a copy of KasaIslemleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KasaIslemleriRequestModelCopyWith<_KasaIslemleriRequestModel> get copyWith => __$KasaIslemleriRequestModelCopyWithImpl<_KasaIslemleriRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KasaIslemleriRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$KasaIslemleriRequestModelCopyWith<$Res> implements $KasaIslemleriRequestModelCopyWith<$Res> {
  factory _$KasaIslemleriRequestModelCopyWith(_KasaIslemleriRequestModel value, $Res Function(_KasaIslemleriRequestModel) _then) = __$KasaIslemleriRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? baslamaTarihi, String? bitisTarihi, String? menuKodu, int? sayfa, String? plasiyerKodu, String? hesapTipi, String? hesapKodu, String? kasaKodu, String? gc, bool? kisitYok, String? refKey
});




}
/// @nodoc
class __$KasaIslemleriRequestModelCopyWithImpl<$Res>
    implements _$KasaIslemleriRequestModelCopyWith<$Res> {
  __$KasaIslemleriRequestModelCopyWithImpl(this._self, this._then);

  final _KasaIslemleriRequestModel _self;
  final $Res Function(_KasaIslemleriRequestModel) _then;

/// Create a copy of KasaIslemleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? menuKodu = freezed,Object? sayfa = freezed,Object? plasiyerKodu = freezed,Object? hesapTipi = freezed,Object? hesapKodu = freezed,Object? kasaKodu = freezed,Object? gc = freezed,Object? kisitYok = freezed,Object? refKey = freezed,}) {
  return _then(_KasaIslemleriRequestModel(
baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,plasiyerKodu: freezed == plasiyerKodu ? _self.plasiyerKodu : plasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,hesapTipi: freezed == hesapTipi ? _self.hesapTipi : hesapTipi // ignore: cast_nullable_to_non_nullable
as String?,hesapKodu: freezed == hesapKodu ? _self.hesapKodu : hesapKodu // ignore: cast_nullable_to_non_nullable
as String?,kasaKodu: freezed == kasaKodu ? _self.kasaKodu : kasaKodu // ignore: cast_nullable_to_non_nullable
as String?,gc: freezed == gc ? _self.gc : gc // ignore: cast_nullable_to_non_nullable
as String?,kisitYok: freezed == kisitYok ? _self.kisitYok : kisitYok // ignore: cast_nullable_to_non_nullable
as bool?,refKey: freezed == refKey ? _self.refKey : refKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
