// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hucre_takibi_stoklar_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HucreTakibiStoklarRequestModel {

 int? get depoKodu; String? get islemTuru; String? get cariKodu; String? get pickerBelgeTuru; String? get stokKodu; String? get belgeNo;
/// Create a copy of HucreTakibiStoklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HucreTakibiStoklarRequestModelCopyWith<HucreTakibiStoklarRequestModel> get copyWith => _$HucreTakibiStoklarRequestModelCopyWithImpl<HucreTakibiStoklarRequestModel>(this as HucreTakibiStoklarRequestModel, _$identity);

  /// Serializes this HucreTakibiStoklarRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HucreTakibiStoklarRequestModel&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.islemTuru, islemTuru) || other.islemTuru == islemTuru)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.pickerBelgeTuru, pickerBelgeTuru) || other.pickerBelgeTuru == pickerBelgeTuru)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,depoKodu,islemTuru,cariKodu,pickerBelgeTuru,stokKodu,belgeNo);



}

/// @nodoc
abstract mixin class $HucreTakibiStoklarRequestModelCopyWith<$Res>  {
  factory $HucreTakibiStoklarRequestModelCopyWith(HucreTakibiStoklarRequestModel value, $Res Function(HucreTakibiStoklarRequestModel) _then) = _$HucreTakibiStoklarRequestModelCopyWithImpl;
@useResult
$Res call({
 int? depoKodu, String? islemTuru, String? cariKodu, String? pickerBelgeTuru, String? stokKodu, String? belgeNo
});




}
/// @nodoc
class _$HucreTakibiStoklarRequestModelCopyWithImpl<$Res>
    implements $HucreTakibiStoklarRequestModelCopyWith<$Res> {
  _$HucreTakibiStoklarRequestModelCopyWithImpl(this._self, this._then);

  final HucreTakibiStoklarRequestModel _self;
  final $Res Function(HucreTakibiStoklarRequestModel) _then;

/// Create a copy of HucreTakibiStoklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? depoKodu = freezed,Object? islemTuru = freezed,Object? cariKodu = freezed,Object? pickerBelgeTuru = freezed,Object? stokKodu = freezed,Object? belgeNo = freezed,}) {
  return _then(_self.copyWith(
depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,islemTuru: freezed == islemTuru ? _self.islemTuru : islemTuru // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,pickerBelgeTuru: freezed == pickerBelgeTuru ? _self.pickerBelgeTuru : pickerBelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HucreTakibiStoklarRequestModel].
extension HucreTakibiStoklarRequestModelPatterns on HucreTakibiStoklarRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HucreTakibiStoklarRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HucreTakibiStoklarRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HucreTakibiStoklarRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _HucreTakibiStoklarRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HucreTakibiStoklarRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _HucreTakibiStoklarRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? depoKodu,  String? islemTuru,  String? cariKodu,  String? pickerBelgeTuru,  String? stokKodu,  String? belgeNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HucreTakibiStoklarRequestModel() when $default != null:
return $default(_that.depoKodu,_that.islemTuru,_that.cariKodu,_that.pickerBelgeTuru,_that.stokKodu,_that.belgeNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? depoKodu,  String? islemTuru,  String? cariKodu,  String? pickerBelgeTuru,  String? stokKodu,  String? belgeNo)  $default,) {final _that = this;
switch (_that) {
case _HucreTakibiStoklarRequestModel():
return $default(_that.depoKodu,_that.islemTuru,_that.cariKodu,_that.pickerBelgeTuru,_that.stokKodu,_that.belgeNo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? depoKodu,  String? islemTuru,  String? cariKodu,  String? pickerBelgeTuru,  String? stokKodu,  String? belgeNo)?  $default,) {final _that = this;
switch (_that) {
case _HucreTakibiStoklarRequestModel() when $default != null:
return $default(_that.depoKodu,_that.islemTuru,_that.cariKodu,_that.pickerBelgeTuru,_that.stokKodu,_that.belgeNo);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _HucreTakibiStoklarRequestModel implements HucreTakibiStoklarRequestModel {
  const _HucreTakibiStoklarRequestModel({this.depoKodu, this.islemTuru, this.cariKodu, this.pickerBelgeTuru, this.stokKodu, this.belgeNo});
  factory _HucreTakibiStoklarRequestModel.fromJson(Map<String, dynamic> json) => _$HucreTakibiStoklarRequestModelFromJson(json);

@override final  int? depoKodu;
@override final  String? islemTuru;
@override final  String? cariKodu;
@override final  String? pickerBelgeTuru;
@override final  String? stokKodu;
@override final  String? belgeNo;

/// Create a copy of HucreTakibiStoklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HucreTakibiStoklarRequestModelCopyWith<_HucreTakibiStoklarRequestModel> get copyWith => __$HucreTakibiStoklarRequestModelCopyWithImpl<_HucreTakibiStoklarRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HucreTakibiStoklarRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HucreTakibiStoklarRequestModel&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.islemTuru, islemTuru) || other.islemTuru == islemTuru)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.pickerBelgeTuru, pickerBelgeTuru) || other.pickerBelgeTuru == pickerBelgeTuru)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,depoKodu,islemTuru,cariKodu,pickerBelgeTuru,stokKodu,belgeNo);



}

/// @nodoc
abstract mixin class _$HucreTakibiStoklarRequestModelCopyWith<$Res> implements $HucreTakibiStoklarRequestModelCopyWith<$Res> {
  factory _$HucreTakibiStoklarRequestModelCopyWith(_HucreTakibiStoklarRequestModel value, $Res Function(_HucreTakibiStoklarRequestModel) _then) = __$HucreTakibiStoklarRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? depoKodu, String? islemTuru, String? cariKodu, String? pickerBelgeTuru, String? stokKodu, String? belgeNo
});




}
/// @nodoc
class __$HucreTakibiStoklarRequestModelCopyWithImpl<$Res>
    implements _$HucreTakibiStoklarRequestModelCopyWith<$Res> {
  __$HucreTakibiStoklarRequestModelCopyWithImpl(this._self, this._then);

  final _HucreTakibiStoklarRequestModel _self;
  final $Res Function(_HucreTakibiStoklarRequestModel) _then;

/// Create a copy of HucreTakibiStoklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? depoKodu = freezed,Object? islemTuru = freezed,Object? cariKodu = freezed,Object? pickerBelgeTuru = freezed,Object? stokKodu = freezed,Object? belgeNo = freezed,}) {
  return _then(_HucreTakibiStoklarRequestModel(
depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,islemTuru: freezed == islemTuru ? _self.islemTuru : islemTuru // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,pickerBelgeTuru: freezed == pickerBelgeTuru ? _self.pickerBelgeTuru : pickerBelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
