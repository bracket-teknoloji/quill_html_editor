// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 int get firmaId; int? get bayiId; double? get tutar; String? get email; String? get unvan; DateTime? get bitTar; String? get taksitlerJson; int? get kullanimSayisi; String? get guid; bool? get alindi;
/// Create a copy of PaykerLinkEditModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaykerLinkEditModelCopyWith<PaykerLinkEditModel> get copyWith => _$PaykerLinkEditModelCopyWithImpl<PaykerLinkEditModel>(this as PaykerLinkEditModel, _$identity);

  /// Serializes this PaykerLinkEditModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaykerLinkEditModel&&super == other&&(identical(other.firmaId, firmaId) || other.firmaId == firmaId)&&(identical(other.bayiId, bayiId) || other.bayiId == bayiId)&&(identical(other.tutar, tutar) || other.tutar == tutar)&&(identical(other.email, email) || other.email == email)&&(identical(other.unvan, unvan) || other.unvan == unvan)&&(identical(other.bitTar, bitTar) || other.bitTar == bitTar)&&(identical(other.taksitlerJson, taksitlerJson) || other.taksitlerJson == taksitlerJson)&&(identical(other.kullanimSayisi, kullanimSayisi) || other.kullanimSayisi == kullanimSayisi)&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.alindi, alindi) || other.alindi == alindi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firmaId,bayiId,tutar,email,unvan,bitTar,taksitlerJson,kullanimSayisi,guid,alindi);



}

/// @nodoc
abstract mixin class $PaykerLinkEditModelCopyWith<$Res>  {
  factory $PaykerLinkEditModelCopyWith(PaykerLinkEditModel value, $Res Function(PaykerLinkEditModel) _then) = _$PaykerLinkEditModelCopyWithImpl;
@useResult
$Res call({
 int firmaId, int? bayiId, double? tutar, String? email, String? unvan, DateTime? bitTar, String? taksitlerJson, int? kullanimSayisi, String? guid, bool? alindi
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
@pragma('vm:prefer-inline') @override $Res call({Object? firmaId = null,Object? bayiId = freezed,Object? tutar = freezed,Object? email = freezed,Object? unvan = freezed,Object? bitTar = freezed,Object? taksitlerJson = freezed,Object? kullanimSayisi = freezed,Object? guid = freezed,Object? alindi = freezed,}) {
  return _then(_self.copyWith(
firmaId: null == firmaId ? _self.firmaId : firmaId // ignore: cast_nullable_to_non_nullable
as int,bayiId: freezed == bayiId ? _self.bayiId : bayiId // ignore: cast_nullable_to_non_nullable
as int?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as double?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,unvan: freezed == unvan ? _self.unvan : unvan // ignore: cast_nullable_to_non_nullable
as String?,bitTar: freezed == bitTar ? _self.bitTar : bitTar // ignore: cast_nullable_to_non_nullable
as DateTime?,taksitlerJson: freezed == taksitlerJson ? _self.taksitlerJson : taksitlerJson // ignore: cast_nullable_to_non_nullable
as String?,kullanimSayisi: freezed == kullanimSayisi ? _self.kullanimSayisi : kullanimSayisi // ignore: cast_nullable_to_non_nullable
as int?,guid: freezed == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String?,alindi: freezed == alindi ? _self.alindi : alindi // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PaykerLinkEditModel extends PaykerLinkEditModel {
  const _PaykerLinkEditModel({this.firmaId = 0, this.bayiId, this.tutar, this.email, this.unvan, this.bitTar, this.taksitlerJson, this.kullanimSayisi, this.guid, this.alindi}): super._();
  factory _PaykerLinkEditModel.fromJson(Map<String, dynamic> json) => _$PaykerLinkEditModelFromJson(json);

@override@JsonKey() final  int firmaId;
@override final  int? bayiId;
@override final  double? tutar;
@override final  String? email;
@override final  String? unvan;
@override final  DateTime? bitTar;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaykerLinkEditModel&&super == other&&(identical(other.firmaId, firmaId) || other.firmaId == firmaId)&&(identical(other.bayiId, bayiId) || other.bayiId == bayiId)&&(identical(other.tutar, tutar) || other.tutar == tutar)&&(identical(other.email, email) || other.email == email)&&(identical(other.unvan, unvan) || other.unvan == unvan)&&(identical(other.bitTar, bitTar) || other.bitTar == bitTar)&&(identical(other.taksitlerJson, taksitlerJson) || other.taksitlerJson == taksitlerJson)&&(identical(other.kullanimSayisi, kullanimSayisi) || other.kullanimSayisi == kullanimSayisi)&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.alindi, alindi) || other.alindi == alindi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firmaId,bayiId,tutar,email,unvan,bitTar,taksitlerJson,kullanimSayisi,guid,alindi);



}

/// @nodoc
abstract mixin class _$PaykerLinkEditModelCopyWith<$Res> implements $PaykerLinkEditModelCopyWith<$Res> {
  factory _$PaykerLinkEditModelCopyWith(_PaykerLinkEditModel value, $Res Function(_PaykerLinkEditModel) _then) = __$PaykerLinkEditModelCopyWithImpl;
@override @useResult
$Res call({
 int firmaId, int? bayiId, double? tutar, String? email, String? unvan, DateTime? bitTar, String? taksitlerJson, int? kullanimSayisi, String? guid, bool? alindi
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
@override @pragma('vm:prefer-inline') $Res call({Object? firmaId = null,Object? bayiId = freezed,Object? tutar = freezed,Object? email = freezed,Object? unvan = freezed,Object? bitTar = freezed,Object? taksitlerJson = freezed,Object? kullanimSayisi = freezed,Object? guid = freezed,Object? alindi = freezed,}) {
  return _then(_PaykerLinkEditModel(
firmaId: null == firmaId ? _self.firmaId : firmaId // ignore: cast_nullable_to_non_nullable
as int,bayiId: freezed == bayiId ? _self.bayiId : bayiId // ignore: cast_nullable_to_non_nullable
as int?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as double?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,unvan: freezed == unvan ? _self.unvan : unvan // ignore: cast_nullable_to_non_nullable
as String?,bitTar: freezed == bitTar ? _self.bitTar : bitTar // ignore: cast_nullable_to_non_nullable
as DateTime?,taksitlerJson: freezed == taksitlerJson ? _self.taksitlerJson : taksitlerJson // ignore: cast_nullable_to_non_nullable
as String?,kullanimSayisi: freezed == kullanimSayisi ? _self.kullanimSayisi : kullanimSayisi // ignore: cast_nullable_to_non_nullable
as int?,guid: freezed == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String?,alindi: freezed == alindi ? _self.alindi : alindi // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
