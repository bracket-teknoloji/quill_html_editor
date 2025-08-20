// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olcum_dat_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OlcumDatResponseModel {

 String? get girisDepo; String? get cikisDepo; String? get stokKodu; String? get seriNo; double? get miktar;
/// Create a copy of OlcumDatResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumDatResponseModelCopyWith<OlcumDatResponseModel> get copyWith => _$OlcumDatResponseModelCopyWithImpl<OlcumDatResponseModel>(this as OlcumDatResponseModel, _$identity);

  /// Serializes this OlcumDatResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OlcumDatResponseModel&&super == other&&(identical(other.girisDepo, girisDepo) || other.girisDepo == girisDepo)&&(identical(other.cikisDepo, cikisDepo) || other.cikisDepo == cikisDepo)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.seriNo, seriNo) || other.seriNo == seriNo)&&(identical(other.miktar, miktar) || other.miktar == miktar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,girisDepo,cikisDepo,stokKodu,seriNo,miktar);



}

/// @nodoc
abstract mixin class $OlcumDatResponseModelCopyWith<$Res>  {
  factory $OlcumDatResponseModelCopyWith(OlcumDatResponseModel value, $Res Function(OlcumDatResponseModel) _then) = _$OlcumDatResponseModelCopyWithImpl;
@useResult
$Res call({
 String? girisDepo, String? cikisDepo, String? stokKodu, String? seriNo, double? miktar
});




}
/// @nodoc
class _$OlcumDatResponseModelCopyWithImpl<$Res>
    implements $OlcumDatResponseModelCopyWith<$Res> {
  _$OlcumDatResponseModelCopyWithImpl(this._self, this._then);

  final OlcumDatResponseModel _self;
  final $Res Function(OlcumDatResponseModel) _then;

/// Create a copy of OlcumDatResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? girisDepo = freezed,Object? cikisDepo = freezed,Object? stokKodu = freezed,Object? seriNo = freezed,Object? miktar = freezed,}) {
  return _then(_self.copyWith(
girisDepo: freezed == girisDepo ? _self.girisDepo : girisDepo // ignore: cast_nullable_to_non_nullable
as String?,cikisDepo: freezed == cikisDepo ? _self.cikisDepo : cikisDepo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [OlcumDatResponseModel].
extension OlcumDatResponseModelPatterns on OlcumDatResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OlcumDatResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OlcumDatResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OlcumDatResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _OlcumDatResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OlcumDatResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _OlcumDatResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? girisDepo,  String? cikisDepo,  String? stokKodu,  String? seriNo,  double? miktar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OlcumDatResponseModel() when $default != null:
return $default(_that.girisDepo,_that.cikisDepo,_that.stokKodu,_that.seriNo,_that.miktar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? girisDepo,  String? cikisDepo,  String? stokKodu,  String? seriNo,  double? miktar)  $default,) {final _that = this;
switch (_that) {
case _OlcumDatResponseModel():
return $default(_that.girisDepo,_that.cikisDepo,_that.stokKodu,_that.seriNo,_that.miktar);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? girisDepo,  String? cikisDepo,  String? stokKodu,  String? seriNo,  double? miktar)?  $default,) {final _that = this;
switch (_that) {
case _OlcumDatResponseModel() when $default != null:
return $default(_that.girisDepo,_that.cikisDepo,_that.stokKodu,_that.seriNo,_that.miktar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OlcumDatResponseModel extends OlcumDatResponseModel {
  const _OlcumDatResponseModel({this.girisDepo, this.cikisDepo, this.stokKodu, this.seriNo, this.miktar}): super._();
  factory _OlcumDatResponseModel.fromJson(Map<String, dynamic> json) => _$OlcumDatResponseModelFromJson(json);

@override final  String? girisDepo;
@override final  String? cikisDepo;
@override final  String? stokKodu;
@override final  String? seriNo;
@override final  double? miktar;

/// Create a copy of OlcumDatResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumDatResponseModelCopyWith<_OlcumDatResponseModel> get copyWith => __$OlcumDatResponseModelCopyWithImpl<_OlcumDatResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumDatResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OlcumDatResponseModel&&super == other&&(identical(other.girisDepo, girisDepo) || other.girisDepo == girisDepo)&&(identical(other.cikisDepo, cikisDepo) || other.cikisDepo == cikisDepo)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.seriNo, seriNo) || other.seriNo == seriNo)&&(identical(other.miktar, miktar) || other.miktar == miktar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,girisDepo,cikisDepo,stokKodu,seriNo,miktar);



}

/// @nodoc
abstract mixin class _$OlcumDatResponseModelCopyWith<$Res> implements $OlcumDatResponseModelCopyWith<$Res> {
  factory _$OlcumDatResponseModelCopyWith(_OlcumDatResponseModel value, $Res Function(_OlcumDatResponseModel) _then) = __$OlcumDatResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? girisDepo, String? cikisDepo, String? stokKodu, String? seriNo, double? miktar
});




}
/// @nodoc
class __$OlcumDatResponseModelCopyWithImpl<$Res>
    implements _$OlcumDatResponseModelCopyWith<$Res> {
  __$OlcumDatResponseModelCopyWithImpl(this._self, this._then);

  final _OlcumDatResponseModel _self;
  final $Res Function(_OlcumDatResponseModel) _then;

/// Create a copy of OlcumDatResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? girisDepo = freezed,Object? cikisDepo = freezed,Object? stokKodu = freezed,Object? seriNo = freezed,Object? miktar = freezed,}) {
  return _then(_OlcumDatResponseModel(
girisDepo: freezed == girisDepo ? _self.girisDepo : girisDepo // ignore: cast_nullable_to_non_nullable
as String?,cikisDepo: freezed == cikisDepo ? _self.cikisDepo : cikisDepo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
