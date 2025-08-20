// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'is_emri_hammadde_takibi_detay_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IsEmriHammaddeTakibiDetayRequestModel {

 int? get takipno; set takipno(int? value); String? get tip; set tip(String? value); String? get barcode; set barcode(String? value); int? get islemKodu; set islemKodu(int? value); String? get referansStokKodu; set referansStokKodu(String? value);
/// Create a copy of IsEmriHammaddeTakibiDetayRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsEmriHammaddeTakibiDetayRequestModelCopyWith<IsEmriHammaddeTakibiDetayRequestModel> get copyWith => _$IsEmriHammaddeTakibiDetayRequestModelCopyWithImpl<IsEmriHammaddeTakibiDetayRequestModel>(this as IsEmriHammaddeTakibiDetayRequestModel, _$identity);

  /// Serializes this IsEmriHammaddeTakibiDetayRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $IsEmriHammaddeTakibiDetayRequestModelCopyWith<$Res>  {
  factory $IsEmriHammaddeTakibiDetayRequestModelCopyWith(IsEmriHammaddeTakibiDetayRequestModel value, $Res Function(IsEmriHammaddeTakibiDetayRequestModel) _then) = _$IsEmriHammaddeTakibiDetayRequestModelCopyWithImpl;
@useResult
$Res call({
 int? takipno, String? tip, String? barcode, int? islemKodu, String? referansStokKodu
});




}
/// @nodoc
class _$IsEmriHammaddeTakibiDetayRequestModelCopyWithImpl<$Res>
    implements $IsEmriHammaddeTakibiDetayRequestModelCopyWith<$Res> {
  _$IsEmriHammaddeTakibiDetayRequestModelCopyWithImpl(this._self, this._then);

  final IsEmriHammaddeTakibiDetayRequestModel _self;
  final $Res Function(IsEmriHammaddeTakibiDetayRequestModel) _then;

/// Create a copy of IsEmriHammaddeTakibiDetayRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? takipno = freezed,Object? tip = freezed,Object? barcode = freezed,Object? islemKodu = freezed,Object? referansStokKodu = freezed,}) {
  return _then(_self.copyWith(
takipno: freezed == takipno ? _self.takipno : takipno // ignore: cast_nullable_to_non_nullable
as int?,tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as String?,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,referansStokKodu: freezed == referansStokKodu ? _self.referansStokKodu : referansStokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IsEmriHammaddeTakibiDetayRequestModel].
extension IsEmriHammaddeTakibiDetayRequestModelPatterns on IsEmriHammaddeTakibiDetayRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IsEmriHammaddeTakibiDetayRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiDetayRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IsEmriHammaddeTakibiDetayRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiDetayRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IsEmriHammaddeTakibiDetayRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiDetayRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? takipno,  String? tip,  String? barcode,  int? islemKodu,  String? referansStokKodu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiDetayRequestModel() when $default != null:
return $default(_that.takipno,_that.tip,_that.barcode,_that.islemKodu,_that.referansStokKodu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? takipno,  String? tip,  String? barcode,  int? islemKodu,  String? referansStokKodu)  $default,) {final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiDetayRequestModel():
return $default(_that.takipno,_that.tip,_that.barcode,_that.islemKodu,_that.referansStokKodu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? takipno,  String? tip,  String? barcode,  int? islemKodu,  String? referansStokKodu)?  $default,) {final _that = this;
switch (_that) {
case _IsEmriHammaddeTakibiDetayRequestModel() when $default != null:
return $default(_that.takipno,_that.tip,_that.barcode,_that.islemKodu,_that.referansStokKodu);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IsEmriHammaddeTakibiDetayRequestModel implements IsEmriHammaddeTakibiDetayRequestModel {
   _IsEmriHammaddeTakibiDetayRequestModel({this.takipno, this.tip, this.barcode, this.islemKodu, this.referansStokKodu});
  factory _IsEmriHammaddeTakibiDetayRequestModel.fromJson(Map<String, dynamic> json) => _$IsEmriHammaddeTakibiDetayRequestModelFromJson(json);

@override  int? takipno;
@override  String? tip;
@override  String? barcode;
@override  int? islemKodu;
@override  String? referansStokKodu;

/// Create a copy of IsEmriHammaddeTakibiDetayRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsEmriHammaddeTakibiDetayRequestModelCopyWith<_IsEmriHammaddeTakibiDetayRequestModel> get copyWith => __$IsEmriHammaddeTakibiDetayRequestModelCopyWithImpl<_IsEmriHammaddeTakibiDetayRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IsEmriHammaddeTakibiDetayRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$IsEmriHammaddeTakibiDetayRequestModelCopyWith<$Res> implements $IsEmriHammaddeTakibiDetayRequestModelCopyWith<$Res> {
  factory _$IsEmriHammaddeTakibiDetayRequestModelCopyWith(_IsEmriHammaddeTakibiDetayRequestModel value, $Res Function(_IsEmriHammaddeTakibiDetayRequestModel) _then) = __$IsEmriHammaddeTakibiDetayRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? takipno, String? tip, String? barcode, int? islemKodu, String? referansStokKodu
});




}
/// @nodoc
class __$IsEmriHammaddeTakibiDetayRequestModelCopyWithImpl<$Res>
    implements _$IsEmriHammaddeTakibiDetayRequestModelCopyWith<$Res> {
  __$IsEmriHammaddeTakibiDetayRequestModelCopyWithImpl(this._self, this._then);

  final _IsEmriHammaddeTakibiDetayRequestModel _self;
  final $Res Function(_IsEmriHammaddeTakibiDetayRequestModel) _then;

/// Create a copy of IsEmriHammaddeTakibiDetayRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? takipno = freezed,Object? tip = freezed,Object? barcode = freezed,Object? islemKodu = freezed,Object? referansStokKodu = freezed,}) {
  return _then(_IsEmriHammaddeTakibiDetayRequestModel(
takipno: freezed == takipno ? _self.takipno : takipno // ignore: cast_nullable_to_non_nullable
as int?,tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as String?,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,referansStokKodu: freezed == referansStokKodu ? _self.referansStokKodu : referansStokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
