// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evraklar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EvraklarModel {

 int? get id; set id(int? value); String? get belgeNo; set belgeNo(String? value); String? get aciklama; set aciklama(String? value); String? get belgeTipi; set belgeTipi(String? value); String? get resimUrl; set resimUrl(String? value); String? get resimUrlKucuk; set resimUrlKucuk(String? value); int? get boyutByte; set boyutByte(int? value); int? get islemKodu; set islemKodu(int? value);
/// Create a copy of EvraklarModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvraklarModelCopyWith<EvraklarModel> get copyWith => _$EvraklarModelCopyWithImpl<EvraklarModel>(this as EvraklarModel, _$identity);

  /// Serializes this EvraklarModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $EvraklarModelCopyWith<$Res>  {
  factory $EvraklarModelCopyWith(EvraklarModel value, $Res Function(EvraklarModel) _then) = _$EvraklarModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? belgeNo, String? aciklama, String? belgeTipi, String? resimUrl, String? resimUrlKucuk, int? boyutByte, int? islemKodu
});




}
/// @nodoc
class _$EvraklarModelCopyWithImpl<$Res>
    implements $EvraklarModelCopyWith<$Res> {
  _$EvraklarModelCopyWithImpl(this._self, this._then);

  final EvraklarModel _self;
  final $Res Function(EvraklarModel) _then;

/// Create a copy of EvraklarModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? belgeNo = freezed,Object? aciklama = freezed,Object? belgeTipi = freezed,Object? resimUrl = freezed,Object? resimUrlKucuk = freezed,Object? boyutByte = freezed,Object? islemKodu = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,resimUrl: freezed == resimUrl ? _self.resimUrl : resimUrl // ignore: cast_nullable_to_non_nullable
as String?,resimUrlKucuk: freezed == resimUrlKucuk ? _self.resimUrlKucuk : resimUrlKucuk // ignore: cast_nullable_to_non_nullable
as String?,boyutByte: freezed == boyutByte ? _self.boyutByte : boyutByte // ignore: cast_nullable_to_non_nullable
as int?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [EvraklarModel].
extension EvraklarModelPatterns on EvraklarModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EvraklarModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EvraklarModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EvraklarModel value)  $default,){
final _that = this;
switch (_that) {
case _EvraklarModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EvraklarModel value)?  $default,){
final _that = this;
switch (_that) {
case _EvraklarModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? belgeNo,  String? aciklama,  String? belgeTipi,  String? resimUrl,  String? resimUrlKucuk,  int? boyutByte,  int? islemKodu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EvraklarModel() when $default != null:
return $default(_that.id,_that.belgeNo,_that.aciklama,_that.belgeTipi,_that.resimUrl,_that.resimUrlKucuk,_that.boyutByte,_that.islemKodu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? belgeNo,  String? aciklama,  String? belgeTipi,  String? resimUrl,  String? resimUrlKucuk,  int? boyutByte,  int? islemKodu)  $default,) {final _that = this;
switch (_that) {
case _EvraklarModel():
return $default(_that.id,_that.belgeNo,_that.aciklama,_that.belgeTipi,_that.resimUrl,_that.resimUrlKucuk,_that.boyutByte,_that.islemKodu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? belgeNo,  String? aciklama,  String? belgeTipi,  String? resimUrl,  String? resimUrlKucuk,  int? boyutByte,  int? islemKodu)?  $default,) {final _that = this;
switch (_that) {
case _EvraklarModel() when $default != null:
return $default(_that.id,_that.belgeNo,_that.aciklama,_that.belgeTipi,_that.resimUrl,_that.resimUrlKucuk,_that.boyutByte,_that.islemKodu);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EvraklarModel extends EvraklarModel {
   _EvraklarModel({this.id, this.belgeNo, this.aciklama, this.belgeTipi, this.resimUrl, this.resimUrlKucuk, this.boyutByte, this.islemKodu}): super._();
  factory _EvraklarModel.fromJson(Map<String, dynamic> json) => _$EvraklarModelFromJson(json);

@override  int? id;
@override  String? belgeNo;
@override  String? aciklama;
@override  String? belgeTipi;
@override  String? resimUrl;
@override  String? resimUrlKucuk;
@override  int? boyutByte;
@override  int? islemKodu;

/// Create a copy of EvraklarModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvraklarModelCopyWith<_EvraklarModel> get copyWith => __$EvraklarModelCopyWithImpl<_EvraklarModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EvraklarModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$EvraklarModelCopyWith<$Res> implements $EvraklarModelCopyWith<$Res> {
  factory _$EvraklarModelCopyWith(_EvraklarModel value, $Res Function(_EvraklarModel) _then) = __$EvraklarModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? belgeNo, String? aciklama, String? belgeTipi, String? resimUrl, String? resimUrlKucuk, int? boyutByte, int? islemKodu
});




}
/// @nodoc
class __$EvraklarModelCopyWithImpl<$Res>
    implements _$EvraklarModelCopyWith<$Res> {
  __$EvraklarModelCopyWithImpl(this._self, this._then);

  final _EvraklarModel _self;
  final $Res Function(_EvraklarModel) _then;

/// Create a copy of EvraklarModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? belgeNo = freezed,Object? aciklama = freezed,Object? belgeTipi = freezed,Object? resimUrl = freezed,Object? resimUrlKucuk = freezed,Object? boyutByte = freezed,Object? islemKodu = freezed,}) {
  return _then(_EvraklarModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,resimUrl: freezed == resimUrl ? _self.resimUrl : resimUrl // ignore: cast_nullable_to_non_nullable
as String?,resimUrlKucuk: freezed == resimUrlKucuk ? _self.resimUrlKucuk : resimUrlKucuk // ignore: cast_nullable_to_non_nullable
as String?,boyutByte: freezed == boyutByte ? _self.boyutByte : boyutByte // ignore: cast_nullable_to_non_nullable
as int?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
