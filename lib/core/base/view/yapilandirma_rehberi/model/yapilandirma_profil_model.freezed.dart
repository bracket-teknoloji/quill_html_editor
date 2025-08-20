// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yapilandirma_profil_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YapilandirmaProfilModel {

 int? get sira; set sira(int? value); String? get ozellikKodu; set ozellikKodu(String? value); String? get aciklama; set aciklama(String? value); List<YapilandirmaRehberiModel?>? get deger; set deger(List<YapilandirmaRehberiModel?>? value);
/// Create a copy of YapilandirmaProfilModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YapilandirmaProfilModelCopyWith<YapilandirmaProfilModel> get copyWith => _$YapilandirmaProfilModelCopyWithImpl<YapilandirmaProfilModel>(this as YapilandirmaProfilModel, _$identity);

  /// Serializes this YapilandirmaProfilModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $YapilandirmaProfilModelCopyWith<$Res>  {
  factory $YapilandirmaProfilModelCopyWith(YapilandirmaProfilModel value, $Res Function(YapilandirmaProfilModel) _then) = _$YapilandirmaProfilModelCopyWithImpl;
@useResult
$Res call({
 int? sira, String? ozellikKodu, String? aciklama, List<YapilandirmaRehberiModel?>? deger
});




}
/// @nodoc
class _$YapilandirmaProfilModelCopyWithImpl<$Res>
    implements $YapilandirmaProfilModelCopyWith<$Res> {
  _$YapilandirmaProfilModelCopyWithImpl(this._self, this._then);

  final YapilandirmaProfilModel _self;
  final $Res Function(YapilandirmaProfilModel) _then;

/// Create a copy of YapilandirmaProfilModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sira = freezed,Object? ozellikKodu = freezed,Object? aciklama = freezed,Object? deger = freezed,}) {
  return _then(_self.copyWith(
sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,ozellikKodu: freezed == ozellikKodu ? _self.ozellikKodu : ozellikKodu // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,deger: freezed == deger ? _self.deger : deger // ignore: cast_nullable_to_non_nullable
as List<YapilandirmaRehberiModel?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [YapilandirmaProfilModel].
extension YapilandirmaProfilModelPatterns on YapilandirmaProfilModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YapilandirmaProfilModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YapilandirmaProfilModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YapilandirmaProfilModel value)  $default,){
final _that = this;
switch (_that) {
case _YapilandirmaProfilModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YapilandirmaProfilModel value)?  $default,){
final _that = this;
switch (_that) {
case _YapilandirmaProfilModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sira,  String? ozellikKodu,  String? aciklama,  List<YapilandirmaRehberiModel?>? deger)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YapilandirmaProfilModel() when $default != null:
return $default(_that.sira,_that.ozellikKodu,_that.aciklama,_that.deger);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sira,  String? ozellikKodu,  String? aciklama,  List<YapilandirmaRehberiModel?>? deger)  $default,) {final _that = this;
switch (_that) {
case _YapilandirmaProfilModel():
return $default(_that.sira,_that.ozellikKodu,_that.aciklama,_that.deger);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sira,  String? ozellikKodu,  String? aciklama,  List<YapilandirmaRehberiModel?>? deger)?  $default,) {final _that = this;
switch (_that) {
case _YapilandirmaProfilModel() when $default != null:
return $default(_that.sira,_that.ozellikKodu,_that.aciklama,_that.deger);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _YapilandirmaProfilModel extends YapilandirmaProfilModel {
   _YapilandirmaProfilModel({this.sira, this.ozellikKodu, this.aciklama, this.deger}): super._();
  factory _YapilandirmaProfilModel.fromJson(Map<String, dynamic> json) => _$YapilandirmaProfilModelFromJson(json);

@override  int? sira;
@override  String? ozellikKodu;
@override  String? aciklama;
@override  List<YapilandirmaRehberiModel?>? deger;

/// Create a copy of YapilandirmaProfilModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YapilandirmaProfilModelCopyWith<_YapilandirmaProfilModel> get copyWith => __$YapilandirmaProfilModelCopyWithImpl<_YapilandirmaProfilModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YapilandirmaProfilModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$YapilandirmaProfilModelCopyWith<$Res> implements $YapilandirmaProfilModelCopyWith<$Res> {
  factory _$YapilandirmaProfilModelCopyWith(_YapilandirmaProfilModel value, $Res Function(_YapilandirmaProfilModel) _then) = __$YapilandirmaProfilModelCopyWithImpl;
@override @useResult
$Res call({
 int? sira, String? ozellikKodu, String? aciklama, List<YapilandirmaRehberiModel?>? deger
});




}
/// @nodoc
class __$YapilandirmaProfilModelCopyWithImpl<$Res>
    implements _$YapilandirmaProfilModelCopyWith<$Res> {
  __$YapilandirmaProfilModelCopyWithImpl(this._self, this._then);

  final _YapilandirmaProfilModel _self;
  final $Res Function(_YapilandirmaProfilModel) _then;

/// Create a copy of YapilandirmaProfilModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sira = freezed,Object? ozellikKodu = freezed,Object? aciklama = freezed,Object? deger = freezed,}) {
  return _then(_YapilandirmaProfilModel(
sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,ozellikKodu: freezed == ozellikKodu ? _self.ozellikKodu : ozellikKodu // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,deger: freezed == deger ? _self.deger : deger // ignore: cast_nullable_to_non_nullable
as List<YapilandirmaRehberiModel?>?,
  ));
}


}

// dart format on
