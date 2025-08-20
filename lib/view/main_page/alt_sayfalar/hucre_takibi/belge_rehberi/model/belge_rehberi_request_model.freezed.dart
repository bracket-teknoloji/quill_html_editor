// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'belge_rehberi_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BelgeRehberiRequestModel {

 int? get depoKodu; String? get islemTuru; String? get pickerBelgeTuru; String? get searchText;
/// Create a copy of BelgeRehberiRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BelgeRehberiRequestModelCopyWith<BelgeRehberiRequestModel> get copyWith => _$BelgeRehberiRequestModelCopyWithImpl<BelgeRehberiRequestModel>(this as BelgeRehberiRequestModel, _$identity);

  /// Serializes this BelgeRehberiRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BelgeRehberiRequestModel&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.islemTuru, islemTuru) || other.islemTuru == islemTuru)&&(identical(other.pickerBelgeTuru, pickerBelgeTuru) || other.pickerBelgeTuru == pickerBelgeTuru)&&(identical(other.searchText, searchText) || other.searchText == searchText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,depoKodu,islemTuru,pickerBelgeTuru,searchText);



}

/// @nodoc
abstract mixin class $BelgeRehberiRequestModelCopyWith<$Res>  {
  factory $BelgeRehberiRequestModelCopyWith(BelgeRehberiRequestModel value, $Res Function(BelgeRehberiRequestModel) _then) = _$BelgeRehberiRequestModelCopyWithImpl;
@useResult
$Res call({
 int? depoKodu, String? islemTuru, String? pickerBelgeTuru, String? searchText
});




}
/// @nodoc
class _$BelgeRehberiRequestModelCopyWithImpl<$Res>
    implements $BelgeRehberiRequestModelCopyWith<$Res> {
  _$BelgeRehberiRequestModelCopyWithImpl(this._self, this._then);

  final BelgeRehberiRequestModel _self;
  final $Res Function(BelgeRehberiRequestModel) _then;

/// Create a copy of BelgeRehberiRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? depoKodu = freezed,Object? islemTuru = freezed,Object? pickerBelgeTuru = freezed,Object? searchText = freezed,}) {
  return _then(_self.copyWith(
depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,islemTuru: freezed == islemTuru ? _self.islemTuru : islemTuru // ignore: cast_nullable_to_non_nullable
as String?,pickerBelgeTuru: freezed == pickerBelgeTuru ? _self.pickerBelgeTuru : pickerBelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BelgeRehberiRequestModel].
extension BelgeRehberiRequestModelPatterns on BelgeRehberiRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BelgeRehberiRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BelgeRehberiRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BelgeRehberiRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _BelgeRehberiRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BelgeRehberiRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _BelgeRehberiRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? depoKodu,  String? islemTuru,  String? pickerBelgeTuru,  String? searchText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BelgeRehberiRequestModel() when $default != null:
return $default(_that.depoKodu,_that.islemTuru,_that.pickerBelgeTuru,_that.searchText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? depoKodu,  String? islemTuru,  String? pickerBelgeTuru,  String? searchText)  $default,) {final _that = this;
switch (_that) {
case _BelgeRehberiRequestModel():
return $default(_that.depoKodu,_that.islemTuru,_that.pickerBelgeTuru,_that.searchText);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? depoKodu,  String? islemTuru,  String? pickerBelgeTuru,  String? searchText)?  $default,) {final _that = this;
switch (_that) {
case _BelgeRehberiRequestModel() when $default != null:
return $default(_that.depoKodu,_that.islemTuru,_that.pickerBelgeTuru,_that.searchText);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _BelgeRehberiRequestModel implements BelgeRehberiRequestModel {
  const _BelgeRehberiRequestModel({this.depoKodu, this.islemTuru, this.pickerBelgeTuru, this.searchText});
  factory _BelgeRehberiRequestModel.fromJson(Map<String, dynamic> json) => _$BelgeRehberiRequestModelFromJson(json);

@override final  int? depoKodu;
@override final  String? islemTuru;
@override final  String? pickerBelgeTuru;
@override final  String? searchText;

/// Create a copy of BelgeRehberiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BelgeRehberiRequestModelCopyWith<_BelgeRehberiRequestModel> get copyWith => __$BelgeRehberiRequestModelCopyWithImpl<_BelgeRehberiRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BelgeRehberiRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BelgeRehberiRequestModel&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.islemTuru, islemTuru) || other.islemTuru == islemTuru)&&(identical(other.pickerBelgeTuru, pickerBelgeTuru) || other.pickerBelgeTuru == pickerBelgeTuru)&&(identical(other.searchText, searchText) || other.searchText == searchText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,depoKodu,islemTuru,pickerBelgeTuru,searchText);



}

/// @nodoc
abstract mixin class _$BelgeRehberiRequestModelCopyWith<$Res> implements $BelgeRehberiRequestModelCopyWith<$Res> {
  factory _$BelgeRehberiRequestModelCopyWith(_BelgeRehberiRequestModel value, $Res Function(_BelgeRehberiRequestModel) _then) = __$BelgeRehberiRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? depoKodu, String? islemTuru, String? pickerBelgeTuru, String? searchText
});




}
/// @nodoc
class __$BelgeRehberiRequestModelCopyWithImpl<$Res>
    implements _$BelgeRehberiRequestModelCopyWith<$Res> {
  __$BelgeRehberiRequestModelCopyWithImpl(this._self, this._then);

  final _BelgeRehberiRequestModel _self;
  final $Res Function(_BelgeRehberiRequestModel) _then;

/// Create a copy of BelgeRehberiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? depoKodu = freezed,Object? islemTuru = freezed,Object? pickerBelgeTuru = freezed,Object? searchText = freezed,}) {
  return _then(_BelgeRehberiRequestModel(
depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,islemTuru: freezed == islemTuru ? _self.islemTuru : islemTuru // ignore: cast_nullable_to_non_nullable
as String?,pickerBelgeTuru: freezed == pickerBelgeTuru ? _self.pickerBelgeTuru : pickerBelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
