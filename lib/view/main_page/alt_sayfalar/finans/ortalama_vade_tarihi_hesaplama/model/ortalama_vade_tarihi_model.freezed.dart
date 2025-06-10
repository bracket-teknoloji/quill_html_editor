// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ortalama_vade_tarihi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrtalamaVadeTarihiModel {

 DateTime? get vadeTarihi; set vadeTarihi(DateTime? value); double? get tutar; set tutar(double? value);
/// Create a copy of OrtalamaVadeTarihiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrtalamaVadeTarihiModelCopyWith<OrtalamaVadeTarihiModel> get copyWith => _$OrtalamaVadeTarihiModelCopyWithImpl<OrtalamaVadeTarihiModel>(this as OrtalamaVadeTarihiModel, _$identity);

  /// Serializes this OrtalamaVadeTarihiModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $OrtalamaVadeTarihiModelCopyWith<$Res>  {
  factory $OrtalamaVadeTarihiModelCopyWith(OrtalamaVadeTarihiModel value, $Res Function(OrtalamaVadeTarihiModel) _then) = _$OrtalamaVadeTarihiModelCopyWithImpl;
@useResult
$Res call({
 DateTime? vadeTarihi, double? tutar
});




}
/// @nodoc
class _$OrtalamaVadeTarihiModelCopyWithImpl<$Res>
    implements $OrtalamaVadeTarihiModelCopyWith<$Res> {
  _$OrtalamaVadeTarihiModelCopyWithImpl(this._self, this._then);

  final OrtalamaVadeTarihiModel _self;
  final $Res Function(OrtalamaVadeTarihiModel) _then;

/// Create a copy of OrtalamaVadeTarihiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vadeTarihi = freezed,Object? tutar = freezed,}) {
  return _then(_self.copyWith(
vadeTarihi: freezed == vadeTarihi ? _self.vadeTarihi : vadeTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OrtalamaVadeTarihiModel implements OrtalamaVadeTarihiModel {
   _OrtalamaVadeTarihiModel({this.vadeTarihi, this.tutar});
  factory _OrtalamaVadeTarihiModel.fromJson(Map<String, dynamic> json) => _$OrtalamaVadeTarihiModelFromJson(json);

@override  DateTime? vadeTarihi;
@override  double? tutar;

/// Create a copy of OrtalamaVadeTarihiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrtalamaVadeTarihiModelCopyWith<_OrtalamaVadeTarihiModel> get copyWith => __$OrtalamaVadeTarihiModelCopyWithImpl<_OrtalamaVadeTarihiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrtalamaVadeTarihiModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$OrtalamaVadeTarihiModelCopyWith<$Res> implements $OrtalamaVadeTarihiModelCopyWith<$Res> {
  factory _$OrtalamaVadeTarihiModelCopyWith(_OrtalamaVadeTarihiModel value, $Res Function(_OrtalamaVadeTarihiModel) _then) = __$OrtalamaVadeTarihiModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime? vadeTarihi, double? tutar
});




}
/// @nodoc
class __$OrtalamaVadeTarihiModelCopyWithImpl<$Res>
    implements _$OrtalamaVadeTarihiModelCopyWith<$Res> {
  __$OrtalamaVadeTarihiModelCopyWithImpl(this._self, this._then);

  final _OrtalamaVadeTarihiModel _self;
  final $Res Function(_OrtalamaVadeTarihiModel) _then;

/// Create a copy of OrtalamaVadeTarihiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vadeTarihi = freezed,Object? tutar = freezed,}) {
  return _then(_OrtalamaVadeTarihiModel(
vadeTarihi: freezed == vadeTarihi ? _self.vadeTarihi : vadeTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
