// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yapilandirma_rehberi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YapilandirmaRehberiModel {

 String? get yapkod; set yapkod(String? value); String? get yapacik; set yapacik(String? value); String? get kod; set kod(String? value); String? get kodAciklama; set kodAciklama(String? value); String? get deger; set deger(String? value); String? get degerAciklama; set degerAciklama(String? value); int? get ozellikSira; set ozellikSira(int? value);
/// Create a copy of YapilandirmaRehberiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YapilandirmaRehberiModelCopyWith<YapilandirmaRehberiModel> get copyWith => _$YapilandirmaRehberiModelCopyWithImpl<YapilandirmaRehberiModel>(this as YapilandirmaRehberiModel, _$identity);

  /// Serializes this YapilandirmaRehberiModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $YapilandirmaRehberiModelCopyWith<$Res>  {
  factory $YapilandirmaRehberiModelCopyWith(YapilandirmaRehberiModel value, $Res Function(YapilandirmaRehberiModel) _then) = _$YapilandirmaRehberiModelCopyWithImpl;
@useResult
$Res call({
 String? yapkod, String? yapacik, String? kod, String? kodAciklama, String? deger, String? degerAciklama, int? ozellikSira
});




}
/// @nodoc
class _$YapilandirmaRehberiModelCopyWithImpl<$Res>
    implements $YapilandirmaRehberiModelCopyWith<$Res> {
  _$YapilandirmaRehberiModelCopyWithImpl(this._self, this._then);

  final YapilandirmaRehberiModel _self;
  final $Res Function(YapilandirmaRehberiModel) _then;

/// Create a copy of YapilandirmaRehberiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? yapkod = freezed,Object? yapacik = freezed,Object? kod = freezed,Object? kodAciklama = freezed,Object? deger = freezed,Object? degerAciklama = freezed,Object? ozellikSira = freezed,}) {
  return _then(_self.copyWith(
yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,yapacik: freezed == yapacik ? _self.yapacik : yapacik // ignore: cast_nullable_to_non_nullable
as String?,kod: freezed == kod ? _self.kod : kod // ignore: cast_nullable_to_non_nullable
as String?,kodAciklama: freezed == kodAciklama ? _self.kodAciklama : kodAciklama // ignore: cast_nullable_to_non_nullable
as String?,deger: freezed == deger ? _self.deger : deger // ignore: cast_nullable_to_non_nullable
as String?,degerAciklama: freezed == degerAciklama ? _self.degerAciklama : degerAciklama // ignore: cast_nullable_to_non_nullable
as String?,ozellikSira: freezed == ozellikSira ? _self.ozellikSira : ozellikSira // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [YapilandirmaRehberiModel].
extension YapilandirmaRehberiModelPatterns on YapilandirmaRehberiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YapilandirmaRehberiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YapilandirmaRehberiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YapilandirmaRehberiModel value)  $default,){
final _that = this;
switch (_that) {
case _YapilandirmaRehberiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YapilandirmaRehberiModel value)?  $default,){
final _that = this;
switch (_that) {
case _YapilandirmaRehberiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? yapkod,  String? yapacik,  String? kod,  String? kodAciklama,  String? deger,  String? degerAciklama,  int? ozellikSira)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YapilandirmaRehberiModel() when $default != null:
return $default(_that.yapkod,_that.yapacik,_that.kod,_that.kodAciklama,_that.deger,_that.degerAciklama,_that.ozellikSira);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? yapkod,  String? yapacik,  String? kod,  String? kodAciklama,  String? deger,  String? degerAciklama,  int? ozellikSira)  $default,) {final _that = this;
switch (_that) {
case _YapilandirmaRehberiModel():
return $default(_that.yapkod,_that.yapacik,_that.kod,_that.kodAciklama,_that.deger,_that.degerAciklama,_that.ozellikSira);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? yapkod,  String? yapacik,  String? kod,  String? kodAciklama,  String? deger,  String? degerAciklama,  int? ozellikSira)?  $default,) {final _that = this;
switch (_that) {
case _YapilandirmaRehberiModel() when $default != null:
return $default(_that.yapkod,_that.yapacik,_that.kod,_that.kodAciklama,_that.deger,_that.degerAciklama,_that.ozellikSira);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _YapilandirmaRehberiModel extends YapilandirmaRehberiModel {
   _YapilandirmaRehberiModel({this.yapkod, this.yapacik, this.kod, this.kodAciklama, this.deger, this.degerAciklama, this.ozellikSira}): super._();
  factory _YapilandirmaRehberiModel.fromJson(Map<String, dynamic> json) => _$YapilandirmaRehberiModelFromJson(json);

@override  String? yapkod;
@override  String? yapacik;
@override  String? kod;
@override  String? kodAciklama;
@override  String? deger;
@override  String? degerAciklama;
@override  int? ozellikSira;

/// Create a copy of YapilandirmaRehberiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YapilandirmaRehberiModelCopyWith<_YapilandirmaRehberiModel> get copyWith => __$YapilandirmaRehberiModelCopyWithImpl<_YapilandirmaRehberiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YapilandirmaRehberiModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$YapilandirmaRehberiModelCopyWith<$Res> implements $YapilandirmaRehberiModelCopyWith<$Res> {
  factory _$YapilandirmaRehberiModelCopyWith(_YapilandirmaRehberiModel value, $Res Function(_YapilandirmaRehberiModel) _then) = __$YapilandirmaRehberiModelCopyWithImpl;
@override @useResult
$Res call({
 String? yapkod, String? yapacik, String? kod, String? kodAciklama, String? deger, String? degerAciklama, int? ozellikSira
});




}
/// @nodoc
class __$YapilandirmaRehberiModelCopyWithImpl<$Res>
    implements _$YapilandirmaRehberiModelCopyWith<$Res> {
  __$YapilandirmaRehberiModelCopyWithImpl(this._self, this._then);

  final _YapilandirmaRehberiModel _self;
  final $Res Function(_YapilandirmaRehberiModel) _then;

/// Create a copy of YapilandirmaRehberiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? yapkod = freezed,Object? yapacik = freezed,Object? kod = freezed,Object? kodAciklama = freezed,Object? deger = freezed,Object? degerAciklama = freezed,Object? ozellikSira = freezed,}) {
  return _then(_YapilandirmaRehberiModel(
yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,yapacik: freezed == yapacik ? _self.yapacik : yapacik // ignore: cast_nullable_to_non_nullable
as String?,kod: freezed == kod ? _self.kod : kod // ignore: cast_nullable_to_non_nullable
as String?,kodAciklama: freezed == kodAciklama ? _self.kodAciklama : kodAciklama // ignore: cast_nullable_to_non_nullable
as String?,deger: freezed == deger ? _self.deger : deger // ignore: cast_nullable_to_non_nullable
as String?,degerAciklama: freezed == degerAciklama ? _self.degerAciklama : degerAciklama // ignore: cast_nullable_to_non_nullable
as String?,ozellikSira: freezed == ozellikSira ? _self.ozellikSira : ozellikSira // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
