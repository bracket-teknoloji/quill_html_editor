// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_belge_pdf_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EBelgePdfRequestModel {

 String? get belgeTuru; String? get ebelgeTuru; int? get islemKodu; String? get resmiBelgeNo;
/// Create a copy of EBelgePdfRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EBelgePdfRequestModelCopyWith<EBelgePdfRequestModel> get copyWith => _$EBelgePdfRequestModelCopyWithImpl<EBelgePdfRequestModel>(this as EBelgePdfRequestModel, _$identity);

  /// Serializes this EBelgePdfRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EBelgePdfRequestModel&&(identical(other.belgeTuru, belgeTuru) || other.belgeTuru == belgeTuru)&&(identical(other.ebelgeTuru, ebelgeTuru) || other.ebelgeTuru == ebelgeTuru)&&(identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu)&&(identical(other.resmiBelgeNo, resmiBelgeNo) || other.resmiBelgeNo == resmiBelgeNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,belgeTuru,ebelgeTuru,islemKodu,resmiBelgeNo);



}

/// @nodoc
abstract mixin class $EBelgePdfRequestModelCopyWith<$Res>  {
  factory $EBelgePdfRequestModelCopyWith(EBelgePdfRequestModel value, $Res Function(EBelgePdfRequestModel) _then) = _$EBelgePdfRequestModelCopyWithImpl;
@useResult
$Res call({
 String? belgeTuru, String? ebelgeTuru, int? islemKodu, String? resmiBelgeNo
});




}
/// @nodoc
class _$EBelgePdfRequestModelCopyWithImpl<$Res>
    implements $EBelgePdfRequestModelCopyWith<$Res> {
  _$EBelgePdfRequestModelCopyWithImpl(this._self, this._then);

  final EBelgePdfRequestModel _self;
  final $Res Function(EBelgePdfRequestModel) _then;

/// Create a copy of EBelgePdfRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeTuru = freezed,Object? ebelgeTuru = freezed,Object? islemKodu = freezed,Object? resmiBelgeNo = freezed,}) {
  return _then(_self.copyWith(
belgeTuru: freezed == belgeTuru ? _self.belgeTuru : belgeTuru // ignore: cast_nullable_to_non_nullable
as String?,ebelgeTuru: freezed == ebelgeTuru ? _self.ebelgeTuru : ebelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,resmiBelgeNo: freezed == resmiBelgeNo ? _self.resmiBelgeNo : resmiBelgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EBelgePdfRequestModel].
extension EBelgePdfRequestModelPatterns on EBelgePdfRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EBelgePdfRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EBelgePdfRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EBelgePdfRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _EBelgePdfRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EBelgePdfRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _EBelgePdfRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? belgeTuru,  String? ebelgeTuru,  int? islemKodu,  String? resmiBelgeNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EBelgePdfRequestModel() when $default != null:
return $default(_that.belgeTuru,_that.ebelgeTuru,_that.islemKodu,_that.resmiBelgeNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? belgeTuru,  String? ebelgeTuru,  int? islemKodu,  String? resmiBelgeNo)  $default,) {final _that = this;
switch (_that) {
case _EBelgePdfRequestModel():
return $default(_that.belgeTuru,_that.ebelgeTuru,_that.islemKodu,_that.resmiBelgeNo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? belgeTuru,  String? ebelgeTuru,  int? islemKodu,  String? resmiBelgeNo)?  $default,) {final _that = this;
switch (_that) {
case _EBelgePdfRequestModel() when $default != null:
return $default(_that.belgeTuru,_that.ebelgeTuru,_that.islemKodu,_that.resmiBelgeNo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EBelgePdfRequestModel implements EBelgePdfRequestModel {
  const _EBelgePdfRequestModel({this.belgeTuru, this.ebelgeTuru, this.islemKodu, this.resmiBelgeNo});
  factory _EBelgePdfRequestModel.fromJson(Map<String, dynamic> json) => _$EBelgePdfRequestModelFromJson(json);

@override final  String? belgeTuru;
@override final  String? ebelgeTuru;
@override final  int? islemKodu;
@override final  String? resmiBelgeNo;

/// Create a copy of EBelgePdfRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EBelgePdfRequestModelCopyWith<_EBelgePdfRequestModel> get copyWith => __$EBelgePdfRequestModelCopyWithImpl<_EBelgePdfRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EBelgePdfRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EBelgePdfRequestModel&&(identical(other.belgeTuru, belgeTuru) || other.belgeTuru == belgeTuru)&&(identical(other.ebelgeTuru, ebelgeTuru) || other.ebelgeTuru == ebelgeTuru)&&(identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu)&&(identical(other.resmiBelgeNo, resmiBelgeNo) || other.resmiBelgeNo == resmiBelgeNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,belgeTuru,ebelgeTuru,islemKodu,resmiBelgeNo);



}

/// @nodoc
abstract mixin class _$EBelgePdfRequestModelCopyWith<$Res> implements $EBelgePdfRequestModelCopyWith<$Res> {
  factory _$EBelgePdfRequestModelCopyWith(_EBelgePdfRequestModel value, $Res Function(_EBelgePdfRequestModel) _then) = __$EBelgePdfRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeTuru, String? ebelgeTuru, int? islemKodu, String? resmiBelgeNo
});




}
/// @nodoc
class __$EBelgePdfRequestModelCopyWithImpl<$Res>
    implements _$EBelgePdfRequestModelCopyWith<$Res> {
  __$EBelgePdfRequestModelCopyWithImpl(this._self, this._then);

  final _EBelgePdfRequestModel _self;
  final $Res Function(_EBelgePdfRequestModel) _then;

/// Create a copy of EBelgePdfRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeTuru = freezed,Object? ebelgeTuru = freezed,Object? islemKodu = freezed,Object? resmiBelgeNo = freezed,}) {
  return _then(_EBelgePdfRequestModel(
belgeTuru: freezed == belgeTuru ? _self.belgeTuru : belgeTuru // ignore: cast_nullable_to_non_nullable
as String?,ebelgeTuru: freezed == ebelgeTuru ? _self.ebelgeTuru : ebelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,resmiBelgeNo: freezed == resmiBelgeNo ? _self.resmiBelgeNo : resmiBelgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
