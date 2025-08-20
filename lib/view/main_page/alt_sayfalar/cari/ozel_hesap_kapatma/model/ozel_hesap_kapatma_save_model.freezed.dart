// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ozel_hesap_kapatma_save_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OzelHesapKapatmaSaveModel {

 List<int>? get arrHedefInckeyno; set arrHedefInckeyno(List<int>? value); String? get cariKodu; set cariKodu(String? value); int? get kaynakInckeyno; set kaynakInckeyno(int? value);
/// Create a copy of OzelHesapKapatmaSaveModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OzelHesapKapatmaSaveModelCopyWith<OzelHesapKapatmaSaveModel> get copyWith => _$OzelHesapKapatmaSaveModelCopyWithImpl<OzelHesapKapatmaSaveModel>(this as OzelHesapKapatmaSaveModel, _$identity);

  /// Serializes this OzelHesapKapatmaSaveModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OzelHesapKapatmaSaveModelCopyWith<$Res>  {
  factory $OzelHesapKapatmaSaveModelCopyWith(OzelHesapKapatmaSaveModel value, $Res Function(OzelHesapKapatmaSaveModel) _then) = _$OzelHesapKapatmaSaveModelCopyWithImpl;
@useResult
$Res call({
 List<int>? arrHedefInckeyno, String? cariKodu, int? kaynakInckeyno
});




}
/// @nodoc
class _$OzelHesapKapatmaSaveModelCopyWithImpl<$Res>
    implements $OzelHesapKapatmaSaveModelCopyWith<$Res> {
  _$OzelHesapKapatmaSaveModelCopyWithImpl(this._self, this._then);

  final OzelHesapKapatmaSaveModel _self;
  final $Res Function(OzelHesapKapatmaSaveModel) _then;

/// Create a copy of OzelHesapKapatmaSaveModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? arrHedefInckeyno = freezed,Object? cariKodu = freezed,Object? kaynakInckeyno = freezed,}) {
  return _then(_self.copyWith(
arrHedefInckeyno: freezed == arrHedefInckeyno ? _self.arrHedefInckeyno : arrHedefInckeyno // ignore: cast_nullable_to_non_nullable
as List<int>?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,kaynakInckeyno: freezed == kaynakInckeyno ? _self.kaynakInckeyno : kaynakInckeyno // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OzelHesapKapatmaSaveModel].
extension OzelHesapKapatmaSaveModelPatterns on OzelHesapKapatmaSaveModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OzelHesapKapatmaSaveModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OzelHesapKapatmaSaveModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OzelHesapKapatmaSaveModel value)  $default,){
final _that = this;
switch (_that) {
case _OzelHesapKapatmaSaveModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OzelHesapKapatmaSaveModel value)?  $default,){
final _that = this;
switch (_that) {
case _OzelHesapKapatmaSaveModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int>? arrHedefInckeyno,  String? cariKodu,  int? kaynakInckeyno)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OzelHesapKapatmaSaveModel() when $default != null:
return $default(_that.arrHedefInckeyno,_that.cariKodu,_that.kaynakInckeyno);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int>? arrHedefInckeyno,  String? cariKodu,  int? kaynakInckeyno)  $default,) {final _that = this;
switch (_that) {
case _OzelHesapKapatmaSaveModel():
return $default(_that.arrHedefInckeyno,_that.cariKodu,_that.kaynakInckeyno);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int>? arrHedefInckeyno,  String? cariKodu,  int? kaynakInckeyno)?  $default,) {final _that = this;
switch (_that) {
case _OzelHesapKapatmaSaveModel() when $default != null:
return $default(_that.arrHedefInckeyno,_that.cariKodu,_that.kaynakInckeyno);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OzelHesapKapatmaSaveModel extends OzelHesapKapatmaSaveModel {
   _OzelHesapKapatmaSaveModel({this.arrHedefInckeyno, this.cariKodu, this.kaynakInckeyno}): super._();
  factory _OzelHesapKapatmaSaveModel.fromJson(Map<String, dynamic> json) => _$OzelHesapKapatmaSaveModelFromJson(json);

@override  List<int>? arrHedefInckeyno;
@override  String? cariKodu;
@override  int? kaynakInckeyno;

/// Create a copy of OzelHesapKapatmaSaveModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OzelHesapKapatmaSaveModelCopyWith<_OzelHesapKapatmaSaveModel> get copyWith => __$OzelHesapKapatmaSaveModelCopyWithImpl<_OzelHesapKapatmaSaveModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OzelHesapKapatmaSaveModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OzelHesapKapatmaSaveModelCopyWith<$Res> implements $OzelHesapKapatmaSaveModelCopyWith<$Res> {
  factory _$OzelHesapKapatmaSaveModelCopyWith(_OzelHesapKapatmaSaveModel value, $Res Function(_OzelHesapKapatmaSaveModel) _then) = __$OzelHesapKapatmaSaveModelCopyWithImpl;
@override @useResult
$Res call({
 List<int>? arrHedefInckeyno, String? cariKodu, int? kaynakInckeyno
});




}
/// @nodoc
class __$OzelHesapKapatmaSaveModelCopyWithImpl<$Res>
    implements _$OzelHesapKapatmaSaveModelCopyWith<$Res> {
  __$OzelHesapKapatmaSaveModelCopyWithImpl(this._self, this._then);

  final _OzelHesapKapatmaSaveModel _self;
  final $Res Function(_OzelHesapKapatmaSaveModel) _then;

/// Create a copy of OzelHesapKapatmaSaveModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? arrHedefInckeyno = freezed,Object? cariKodu = freezed,Object? kaynakInckeyno = freezed,}) {
  return _then(_OzelHesapKapatmaSaveModel(
arrHedefInckeyno: freezed == arrHedefInckeyno ? _self.arrHedefInckeyno : arrHedefInckeyno // ignore: cast_nullable_to_non_nullable
as List<int>?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,kaynakInckeyno: freezed == kaynakInckeyno ? _self.kaynakInckeyno : kaynakInckeyno // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
