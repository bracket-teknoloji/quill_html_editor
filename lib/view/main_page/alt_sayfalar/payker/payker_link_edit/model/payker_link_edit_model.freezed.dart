// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payker_link_edit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaykerLinkEditModel {

 int get firmaId; int? get bayiId; double? get tutar; String? get email; String? get unvan; DateTime? get bittar; String? get taksitlerJson; int? get kullanimSayisi; String? get guid; bool? get alindi;
/// Create a copy of PaykerLinkEditModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaykerLinkEditModelCopyWith<PaykerLinkEditModel> get copyWith => _$PaykerLinkEditModelCopyWithImpl<PaykerLinkEditModel>(this as PaykerLinkEditModel, _$identity);

  /// Serializes this PaykerLinkEditModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaykerLinkEditModel&&super == other&&(identical(other.firmaId, firmaId) || other.firmaId == firmaId)&&(identical(other.bayiId, bayiId) || other.bayiId == bayiId)&&(identical(other.tutar, tutar) || other.tutar == tutar)&&(identical(other.email, email) || other.email == email)&&(identical(other.unvan, unvan) || other.unvan == unvan)&&(identical(other.bittar, bittar) || other.bittar == bittar)&&(identical(other.taksitlerJson, taksitlerJson) || other.taksitlerJson == taksitlerJson)&&(identical(other.kullanimSayisi, kullanimSayisi) || other.kullanimSayisi == kullanimSayisi)&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.alindi, alindi) || other.alindi == alindi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firmaId,bayiId,tutar,email,unvan,bittar,taksitlerJson,kullanimSayisi,guid,alindi);



}

/// @nodoc
abstract mixin class $PaykerLinkEditModelCopyWith<$Res>  {
  factory $PaykerLinkEditModelCopyWith(PaykerLinkEditModel value, $Res Function(PaykerLinkEditModel) _then) = _$PaykerLinkEditModelCopyWithImpl;
@useResult
$Res call({
 int firmaId, int? bayiId, double? tutar, String? email, String? unvan, DateTime? bittar, String? taksitlerJson, int? kullanimSayisi, String? guid, bool? alindi
});




}
/// @nodoc
class _$PaykerLinkEditModelCopyWithImpl<$Res>
    implements $PaykerLinkEditModelCopyWith<$Res> {
  _$PaykerLinkEditModelCopyWithImpl(this._self, this._then);

  final PaykerLinkEditModel _self;
  final $Res Function(PaykerLinkEditModel) _then;

/// Create a copy of PaykerLinkEditModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firmaId = null,Object? bayiId = freezed,Object? tutar = freezed,Object? email = freezed,Object? unvan = freezed,Object? bittar = freezed,Object? taksitlerJson = freezed,Object? kullanimSayisi = freezed,Object? guid = freezed,Object? alindi = freezed,}) {
  return _then(_self.copyWith(
firmaId: null == firmaId ? _self.firmaId : firmaId // ignore: cast_nullable_to_non_nullable
as int,bayiId: freezed == bayiId ? _self.bayiId : bayiId // ignore: cast_nullable_to_non_nullable
as int?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as double?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,unvan: freezed == unvan ? _self.unvan : unvan // ignore: cast_nullable_to_non_nullable
as String?,bittar: freezed == bittar ? _self.bittar : bittar // ignore: cast_nullable_to_non_nullable
as DateTime?,taksitlerJson: freezed == taksitlerJson ? _self.taksitlerJson : taksitlerJson // ignore: cast_nullable_to_non_nullable
as String?,kullanimSayisi: freezed == kullanimSayisi ? _self.kullanimSayisi : kullanimSayisi // ignore: cast_nullable_to_non_nullable
as int?,guid: freezed == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String?,alindi: freezed == alindi ? _self.alindi : alindi // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaykerLinkEditModel].
extension PaykerLinkEditModelPatterns on PaykerLinkEditModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaykerLinkEditModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaykerLinkEditModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaykerLinkEditModel value)  $default,){
final _that = this;
switch (_that) {
case _PaykerLinkEditModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaykerLinkEditModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaykerLinkEditModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int firmaId,  int? bayiId,  double? tutar,  String? email,  String? unvan,  DateTime? bittar,  String? taksitlerJson,  int? kullanimSayisi,  String? guid,  bool? alindi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaykerLinkEditModel() when $default != null:
return $default(_that.firmaId,_that.bayiId,_that.tutar,_that.email,_that.unvan,_that.bittar,_that.taksitlerJson,_that.kullanimSayisi,_that.guid,_that.alindi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int firmaId,  int? bayiId,  double? tutar,  String? email,  String? unvan,  DateTime? bittar,  String? taksitlerJson,  int? kullanimSayisi,  String? guid,  bool? alindi)  $default,) {final _that = this;
switch (_that) {
case _PaykerLinkEditModel():
return $default(_that.firmaId,_that.bayiId,_that.tutar,_that.email,_that.unvan,_that.bittar,_that.taksitlerJson,_that.kullanimSayisi,_that.guid,_that.alindi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int firmaId,  int? bayiId,  double? tutar,  String? email,  String? unvan,  DateTime? bittar,  String? taksitlerJson,  int? kullanimSayisi,  String? guid,  bool? alindi)?  $default,) {final _that = this;
switch (_that) {
case _PaykerLinkEditModel() when $default != null:
return $default(_that.firmaId,_that.bayiId,_that.tutar,_that.email,_that.unvan,_that.bittar,_that.taksitlerJson,_that.kullanimSayisi,_that.guid,_that.alindi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaykerLinkEditModel extends PaykerLinkEditModel {
  const _PaykerLinkEditModel({this.firmaId = 0, this.bayiId, this.tutar, this.email, this.unvan, this.bittar, this.taksitlerJson, this.kullanimSayisi, this.guid, this.alindi}): super._();
  factory _PaykerLinkEditModel.fromJson(Map<String, dynamic> json) => _$PaykerLinkEditModelFromJson(json);

@override@JsonKey() final  int firmaId;
@override final  int? bayiId;
@override final  double? tutar;
@override final  String? email;
@override final  String? unvan;
@override final  DateTime? bittar;
@override final  String? taksitlerJson;
@override final  int? kullanimSayisi;
@override final  String? guid;
@override final  bool? alindi;

/// Create a copy of PaykerLinkEditModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaykerLinkEditModelCopyWith<_PaykerLinkEditModel> get copyWith => __$PaykerLinkEditModelCopyWithImpl<_PaykerLinkEditModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaykerLinkEditModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaykerLinkEditModel&&super == other&&(identical(other.firmaId, firmaId) || other.firmaId == firmaId)&&(identical(other.bayiId, bayiId) || other.bayiId == bayiId)&&(identical(other.tutar, tutar) || other.tutar == tutar)&&(identical(other.email, email) || other.email == email)&&(identical(other.unvan, unvan) || other.unvan == unvan)&&(identical(other.bittar, bittar) || other.bittar == bittar)&&(identical(other.taksitlerJson, taksitlerJson) || other.taksitlerJson == taksitlerJson)&&(identical(other.kullanimSayisi, kullanimSayisi) || other.kullanimSayisi == kullanimSayisi)&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.alindi, alindi) || other.alindi == alindi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firmaId,bayiId,tutar,email,unvan,bittar,taksitlerJson,kullanimSayisi,guid,alindi);



}

/// @nodoc
abstract mixin class _$PaykerLinkEditModelCopyWith<$Res> implements $PaykerLinkEditModelCopyWith<$Res> {
  factory _$PaykerLinkEditModelCopyWith(_PaykerLinkEditModel value, $Res Function(_PaykerLinkEditModel) _then) = __$PaykerLinkEditModelCopyWithImpl;
@override @useResult
$Res call({
 int firmaId, int? bayiId, double? tutar, String? email, String? unvan, DateTime? bittar, String? taksitlerJson, int? kullanimSayisi, String? guid, bool? alindi
});




}
/// @nodoc
class __$PaykerLinkEditModelCopyWithImpl<$Res>
    implements _$PaykerLinkEditModelCopyWith<$Res> {
  __$PaykerLinkEditModelCopyWithImpl(this._self, this._then);

  final _PaykerLinkEditModel _self;
  final $Res Function(_PaykerLinkEditModel) _then;

/// Create a copy of PaykerLinkEditModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firmaId = null,Object? bayiId = freezed,Object? tutar = freezed,Object? email = freezed,Object? unvan = freezed,Object? bittar = freezed,Object? taksitlerJson = freezed,Object? kullanimSayisi = freezed,Object? guid = freezed,Object? alindi = freezed,}) {
  return _then(_PaykerLinkEditModel(
firmaId: null == firmaId ? _self.firmaId : firmaId // ignore: cast_nullable_to_non_nullable
as int,bayiId: freezed == bayiId ? _self.bayiId : bayiId // ignore: cast_nullable_to_non_nullable
as int?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as double?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,unvan: freezed == unvan ? _self.unvan : unvan // ignore: cast_nullable_to_non_nullable
as String?,bittar: freezed == bittar ? _self.bittar : bittar // ignore: cast_nullable_to_non_nullable
as DateTime?,taksitlerJson: freezed == taksitlerJson ? _self.taksitlerJson : taksitlerJson // ignore: cast_nullable_to_non_nullable
as String?,kullanimSayisi: freezed == kullanimSayisi ? _self.kullanimSayisi : kullanimSayisi // ignore: cast_nullable_to_non_nullable
as int?,guid: freezed == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String?,alindi: freezed == alindi ? _self.alindi : alindi // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
