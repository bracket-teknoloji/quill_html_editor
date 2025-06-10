// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paketleme_edit_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaketlemeEditRequestModel {

 int? get islemKodu; int? get paketId; int? get kalemId;
/// Create a copy of PaketlemeEditRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaketlemeEditRequestModelCopyWith<PaketlemeEditRequestModel> get copyWith => _$PaketlemeEditRequestModelCopyWithImpl<PaketlemeEditRequestModel>(this as PaketlemeEditRequestModel, _$identity);

  /// Serializes this PaketlemeEditRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaketlemeEditRequestModel&&(identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu)&&(identical(other.paketId, paketId) || other.paketId == paketId)&&(identical(other.kalemId, kalemId) || other.kalemId == kalemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,islemKodu,paketId,kalemId);



}

/// @nodoc
abstract mixin class $PaketlemeEditRequestModelCopyWith<$Res>  {
  factory $PaketlemeEditRequestModelCopyWith(PaketlemeEditRequestModel value, $Res Function(PaketlemeEditRequestModel) _then) = _$PaketlemeEditRequestModelCopyWithImpl;
@useResult
$Res call({
 int? islemKodu, int? paketId, int? kalemId
});




}
/// @nodoc
class _$PaketlemeEditRequestModelCopyWithImpl<$Res>
    implements $PaketlemeEditRequestModelCopyWith<$Res> {
  _$PaketlemeEditRequestModelCopyWithImpl(this._self, this._then);

  final PaketlemeEditRequestModel _self;
  final $Res Function(PaketlemeEditRequestModel) _then;

/// Create a copy of PaketlemeEditRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? islemKodu = freezed,Object? paketId = freezed,Object? kalemId = freezed,}) {
  return _then(_self.copyWith(
islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,paketId: freezed == paketId ? _self.paketId : paketId // ignore: cast_nullable_to_non_nullable
as int?,kalemId: freezed == kalemId ? _self.kalemId : kalemId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PaketlemeEditRequestModel implements PaketlemeEditRequestModel {
  const _PaketlemeEditRequestModel({this.islemKodu, this.paketId, this.kalemId});
  factory _PaketlemeEditRequestModel.fromJson(Map<String, dynamic> json) => _$PaketlemeEditRequestModelFromJson(json);

@override final  int? islemKodu;
@override final  int? paketId;
@override final  int? kalemId;

/// Create a copy of PaketlemeEditRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaketlemeEditRequestModelCopyWith<_PaketlemeEditRequestModel> get copyWith => __$PaketlemeEditRequestModelCopyWithImpl<_PaketlemeEditRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaketlemeEditRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaketlemeEditRequestModel&&(identical(other.islemKodu, islemKodu) || other.islemKodu == islemKodu)&&(identical(other.paketId, paketId) || other.paketId == paketId)&&(identical(other.kalemId, kalemId) || other.kalemId == kalemId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,islemKodu,paketId,kalemId);



}

/// @nodoc
abstract mixin class _$PaketlemeEditRequestModelCopyWith<$Res> implements $PaketlemeEditRequestModelCopyWith<$Res> {
  factory _$PaketlemeEditRequestModelCopyWith(_PaketlemeEditRequestModel value, $Res Function(_PaketlemeEditRequestModel) _then) = __$PaketlemeEditRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? islemKodu, int? paketId, int? kalemId
});




}
/// @nodoc
class __$PaketlemeEditRequestModelCopyWithImpl<$Res>
    implements _$PaketlemeEditRequestModelCopyWith<$Res> {
  __$PaketlemeEditRequestModelCopyWithImpl(this._self, this._then);

  final _PaketlemeEditRequestModel _self;
  final $Res Function(_PaketlemeEditRequestModel) _then;

/// Create a copy of PaketlemeEditRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? islemKodu = freezed,Object? paketId = freezed,Object? kalemId = freezed,}) {
  return _then(_PaketlemeEditRequestModel(
islemKodu: freezed == islemKodu ? _self.islemKodu : islemKodu // ignore: cast_nullable_to_non_nullable
as int?,paketId: freezed == paketId ? _self.paketId : paketId // ignore: cast_nullable_to_non_nullable
as int?,kalemId: freezed == kalemId ? _self.kalemId : kalemId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
