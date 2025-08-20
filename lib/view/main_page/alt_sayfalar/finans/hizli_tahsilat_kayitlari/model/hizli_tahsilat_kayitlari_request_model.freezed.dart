// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hizli_tahsilat_kayitlari_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HizliTahsilatKayitlariRequestModel {

 String? get baslamaTarihi; set baslamaTarihi(String? value); String? get bitisTarihi; set bitisTarihi(String? value); String? get ekranTipi; set ekranTipi(String? value); int? get sayfa; set sayfa(int? value);
/// Create a copy of HizliTahsilatKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HizliTahsilatKayitlariRequestModelCopyWith<HizliTahsilatKayitlariRequestModel> get copyWith => _$HizliTahsilatKayitlariRequestModelCopyWithImpl<HizliTahsilatKayitlariRequestModel>(this as HizliTahsilatKayitlariRequestModel, _$identity);

  /// Serializes this HizliTahsilatKayitlariRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $HizliTahsilatKayitlariRequestModelCopyWith<$Res>  {
  factory $HizliTahsilatKayitlariRequestModelCopyWith(HizliTahsilatKayitlariRequestModel value, $Res Function(HizliTahsilatKayitlariRequestModel) _then) = _$HizliTahsilatKayitlariRequestModelCopyWithImpl;
@useResult
$Res call({
 String? baslamaTarihi, String? bitisTarihi, String? ekranTipi, int? sayfa
});




}
/// @nodoc
class _$HizliTahsilatKayitlariRequestModelCopyWithImpl<$Res>
    implements $HizliTahsilatKayitlariRequestModelCopyWith<$Res> {
  _$HizliTahsilatKayitlariRequestModelCopyWithImpl(this._self, this._then);

  final HizliTahsilatKayitlariRequestModel _self;
  final $Res Function(HizliTahsilatKayitlariRequestModel) _then;

/// Create a copy of HizliTahsilatKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? ekranTipi = freezed,Object? sayfa = freezed,}) {
  return _then(_self.copyWith(
baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [HizliTahsilatKayitlariRequestModel].
extension HizliTahsilatKayitlariRequestModelPatterns on HizliTahsilatKayitlariRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HizliTahsilatKayitlariRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HizliTahsilatKayitlariRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HizliTahsilatKayitlariRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _HizliTahsilatKayitlariRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HizliTahsilatKayitlariRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _HizliTahsilatKayitlariRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? baslamaTarihi,  String? bitisTarihi,  String? ekranTipi,  int? sayfa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HizliTahsilatKayitlariRequestModel() when $default != null:
return $default(_that.baslamaTarihi,_that.bitisTarihi,_that.ekranTipi,_that.sayfa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? baslamaTarihi,  String? bitisTarihi,  String? ekranTipi,  int? sayfa)  $default,) {final _that = this;
switch (_that) {
case _HizliTahsilatKayitlariRequestModel():
return $default(_that.baslamaTarihi,_that.bitisTarihi,_that.ekranTipi,_that.sayfa);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? baslamaTarihi,  String? bitisTarihi,  String? ekranTipi,  int? sayfa)?  $default,) {final _that = this;
switch (_that) {
case _HizliTahsilatKayitlariRequestModel() when $default != null:
return $default(_that.baslamaTarihi,_that.bitisTarihi,_that.ekranTipi,_that.sayfa);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _HizliTahsilatKayitlariRequestModel implements HizliTahsilatKayitlariRequestModel {
   _HizliTahsilatKayitlariRequestModel({this.baslamaTarihi, this.bitisTarihi, this.ekranTipi, this.sayfa = 1});
  factory _HizliTahsilatKayitlariRequestModel.fromJson(Map<String, dynamic> json) => _$HizliTahsilatKayitlariRequestModelFromJson(json);

@override  String? baslamaTarihi;
@override  String? bitisTarihi;
@override  String? ekranTipi;
@override@JsonKey()  int? sayfa;

/// Create a copy of HizliTahsilatKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HizliTahsilatKayitlariRequestModelCopyWith<_HizliTahsilatKayitlariRequestModel> get copyWith => __$HizliTahsilatKayitlariRequestModelCopyWithImpl<_HizliTahsilatKayitlariRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HizliTahsilatKayitlariRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$HizliTahsilatKayitlariRequestModelCopyWith<$Res> implements $HizliTahsilatKayitlariRequestModelCopyWith<$Res> {
  factory _$HizliTahsilatKayitlariRequestModelCopyWith(_HizliTahsilatKayitlariRequestModel value, $Res Function(_HizliTahsilatKayitlariRequestModel) _then) = __$HizliTahsilatKayitlariRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? baslamaTarihi, String? bitisTarihi, String? ekranTipi, int? sayfa
});




}
/// @nodoc
class __$HizliTahsilatKayitlariRequestModelCopyWithImpl<$Res>
    implements _$HizliTahsilatKayitlariRequestModelCopyWith<$Res> {
  __$HizliTahsilatKayitlariRequestModelCopyWithImpl(this._self, this._then);

  final _HizliTahsilatKayitlariRequestModel _self;
  final $Res Function(_HizliTahsilatKayitlariRequestModel) _then;

/// Create a copy of HizliTahsilatKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? ekranTipi = freezed,Object? sayfa = freezed,}) {
  return _then(_HizliTahsilatKayitlariRequestModel(
baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
