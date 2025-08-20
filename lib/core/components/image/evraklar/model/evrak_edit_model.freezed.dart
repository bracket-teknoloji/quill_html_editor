// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evrak_edit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EvrakEditModel {

 String? get aciklama; set aciklama(String? value); String? get base64Data; set base64Data(String? value); String? get belgeNo; set belgeNo(String? value); String? get belgeTipi; set belgeTipi(String? value); int? get boyutByte; set boyutByte(int? value); int? get islemKodu; set islemKodu(int? value);
/// Create a copy of EvrakEditModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvrakEditModelCopyWith<EvrakEditModel> get copyWith => _$EvrakEditModelCopyWithImpl<EvrakEditModel>(this as EvrakEditModel, _$identity);

  /// Serializes this EvrakEditModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $EvrakEditModelCopyWith<$Res>  {
  factory $EvrakEditModelCopyWith(EvrakEditModel value, $Res Function(EvrakEditModel) _then) = _$EvrakEditModelCopyWithImpl;
@useResult
$Res call({
 String? aciklama, String? base64Data, String? belgeNo, String? belgeTipi, int? boyutByte, int? islemKodu
});




}
/// @nodoc
class _$EvrakEditModelCopyWithImpl<$Res>
    implements $EvrakEditModelCopyWith<$Res> {
  _$EvrakEditModelCopyWithImpl(this._self, this._then);

  final EvrakEditModel _self;
  final $Res Function(EvrakEditModel) _then;

/// Create a copy of EvrakEditModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aciklama = freezed,Object? base64Data = freezed,Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? boyutByte = freezed,Object? islemKodu = freezed,}) {
  return _then(_self.copyWith(
aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,base64Data: freezed == base64Data ? _self.base64Data : base64Data // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,boyutByte: freezed == boyutByte ? _self.boyutByte : boyutByte // ignore: cast_nullable_to_non_nullable
as int?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [EvrakEditModel].
extension EvrakEditModelPatterns on EvrakEditModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EvrakEditModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EvrakEditModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EvrakEditModel value)  $default,){
final _that = this;
switch (_that) {
case _EvrakEditModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EvrakEditModel value)?  $default,){
final _that = this;
switch (_that) {
case _EvrakEditModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? aciklama,  String? base64Data,  String? belgeNo,  String? belgeTipi,  int? boyutByte,  int? islemKodu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EvrakEditModel() when $default != null:
return $default(_that.aciklama,_that.base64Data,_that.belgeNo,_that.belgeTipi,_that.boyutByte,_that.islemKodu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? aciklama,  String? base64Data,  String? belgeNo,  String? belgeTipi,  int? boyutByte,  int? islemKodu)  $default,) {final _that = this;
switch (_that) {
case _EvrakEditModel():
return $default(_that.aciklama,_that.base64Data,_that.belgeNo,_that.belgeTipi,_that.boyutByte,_that.islemKodu);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? aciklama,  String? base64Data,  String? belgeNo,  String? belgeTipi,  int? boyutByte,  int? islemKodu)?  $default,) {final _that = this;
switch (_that) {
case _EvrakEditModel() when $default != null:
return $default(_that.aciklama,_that.base64Data,_that.belgeNo,_that.belgeTipi,_that.boyutByte,_that.islemKodu);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EvrakEditModel extends EvrakEditModel {
   _EvrakEditModel({this.aciklama, this.base64Data, this.belgeNo, this.belgeTipi, this.boyutByte, this.islemKodu}): super._();
  factory _EvrakEditModel.fromJson(Map<String, dynamic> json) => _$EvrakEditModelFromJson(json);

@override  String? aciklama;
@override  String? base64Data;
@override  String? belgeNo;
@override  String? belgeTipi;
@override  int? boyutByte;
@override  int? islemKodu;

/// Create a copy of EvrakEditModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvrakEditModelCopyWith<_EvrakEditModel> get copyWith => __$EvrakEditModelCopyWithImpl<_EvrakEditModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EvrakEditModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$EvrakEditModelCopyWith<$Res> implements $EvrakEditModelCopyWith<$Res> {
  factory _$EvrakEditModelCopyWith(_EvrakEditModel value, $Res Function(_EvrakEditModel) _then) = __$EvrakEditModelCopyWithImpl;
@override @useResult
$Res call({
 String? aciklama, String? base64Data, String? belgeNo, String? belgeTipi, int? boyutByte, int? islemKodu
});




}
/// @nodoc
class __$EvrakEditModelCopyWithImpl<$Res>
    implements _$EvrakEditModelCopyWith<$Res> {
  __$EvrakEditModelCopyWithImpl(this._self, this._then);

  final _EvrakEditModel _self;
  final $Res Function(_EvrakEditModel) _then;

/// Create a copy of EvrakEditModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aciklama = freezed,Object? base64Data = freezed,Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? boyutByte = freezed,Object? islemKodu = freezed,}) {
  return _then(_EvrakEditModel(
aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,base64Data: freezed == base64Data ? _self.base64Data : base64Data // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,boyutByte: freezed == boyutByte ? _self.boyutByte : boyutByte // ignore: cast_nullable_to_non_nullable
as int?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
