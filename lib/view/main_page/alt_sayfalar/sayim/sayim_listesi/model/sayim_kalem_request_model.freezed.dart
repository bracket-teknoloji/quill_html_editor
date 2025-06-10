// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sayim_kalem_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SayimKalemRequestModel {

 int? get id; int? get depoKodu; String? get belgeNo;
/// Create a copy of SayimKalemRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SayimKalemRequestModelCopyWith<SayimKalemRequestModel> get copyWith => _$SayimKalemRequestModelCopyWithImpl<SayimKalemRequestModel>(this as SayimKalemRequestModel, _$identity);

  /// Serializes this SayimKalemRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SayimKalemRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,depoKodu,belgeNo);



}

/// @nodoc
abstract mixin class $SayimKalemRequestModelCopyWith<$Res>  {
  factory $SayimKalemRequestModelCopyWith(SayimKalemRequestModel value, $Res Function(SayimKalemRequestModel) _then) = _$SayimKalemRequestModelCopyWithImpl;
@useResult
$Res call({
 int? id, int? depoKodu, String? belgeNo
});




}
/// @nodoc
class _$SayimKalemRequestModelCopyWithImpl<$Res>
    implements $SayimKalemRequestModelCopyWith<$Res> {
  _$SayimKalemRequestModelCopyWithImpl(this._self, this._then);

  final SayimKalemRequestModel _self;
  final $Res Function(SayimKalemRequestModel) _then;

/// Create a copy of SayimKalemRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? depoKodu = freezed,Object? belgeNo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SayimKalemRequestModel implements SayimKalemRequestModel {
  const _SayimKalemRequestModel({this.id, this.depoKodu, this.belgeNo});
  factory _SayimKalemRequestModel.fromJson(Map<String, dynamic> json) => _$SayimKalemRequestModelFromJson(json);

@override final  int? id;
@override final  int? depoKodu;
@override final  String? belgeNo;

/// Create a copy of SayimKalemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SayimKalemRequestModelCopyWith<_SayimKalemRequestModel> get copyWith => __$SayimKalemRequestModelCopyWithImpl<_SayimKalemRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SayimKalemRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SayimKalemRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,depoKodu,belgeNo);



}

/// @nodoc
abstract mixin class _$SayimKalemRequestModelCopyWith<$Res> implements $SayimKalemRequestModelCopyWith<$Res> {
  factory _$SayimKalemRequestModelCopyWith(_SayimKalemRequestModel value, $Res Function(_SayimKalemRequestModel) _then) = __$SayimKalemRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? depoKodu, String? belgeNo
});




}
/// @nodoc
class __$SayimKalemRequestModelCopyWithImpl<$Res>
    implements _$SayimKalemRequestModelCopyWith<$Res> {
  __$SayimKalemRequestModelCopyWithImpl(this._self, this._then);

  final _SayimKalemRequestModel _self;
  final $Res Function(_SayimKalemRequestModel) _then;

/// Create a copy of SayimKalemRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? depoKodu = freezed,Object? belgeNo = freezed,}) {
  return _then(_SayimKalemRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
