// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'belge_kontrol_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BelgeKontrolRequestModel {

@JsonKey(name: "BaslamaTarihi") String? get baslamaTarihi;@JsonKey(name: "BaslamaTarihi") set baslamaTarihi(String? value);@JsonKey(name: "BitisTarihi") String? get bitisTarihi;@JsonKey(name: "BitisTarihi") set bitisTarihi(String? value);@JsonKey(name: "Durum") String? get durum;@JsonKey(name: "Durum") set durum(String? value);
/// Create a copy of BelgeKontrolRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BelgeKontrolRequestModelCopyWith<BelgeKontrolRequestModel> get copyWith => _$BelgeKontrolRequestModelCopyWithImpl<BelgeKontrolRequestModel>(this as BelgeKontrolRequestModel, _$identity);

  /// Serializes this BelgeKontrolRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $BelgeKontrolRequestModelCopyWith<$Res>  {
  factory $BelgeKontrolRequestModelCopyWith(BelgeKontrolRequestModel value, $Res Function(BelgeKontrolRequestModel) _then) = _$BelgeKontrolRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "BaslamaTarihi") String? baslamaTarihi,@JsonKey(name: "BitisTarihi") String? bitisTarihi,@JsonKey(name: "Durum") String? durum
});




}
/// @nodoc
class _$BelgeKontrolRequestModelCopyWithImpl<$Res>
    implements $BelgeKontrolRequestModelCopyWith<$Res> {
  _$BelgeKontrolRequestModelCopyWithImpl(this._self, this._then);

  final BelgeKontrolRequestModel _self;
  final $Res Function(BelgeKontrolRequestModel) _then;

/// Create a copy of BelgeKontrolRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? durum = freezed,}) {
  return _then(_self.copyWith(
baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BelgeKontrolRequestModel extends BelgeKontrolRequestModel {
   _BelgeKontrolRequestModel({@JsonKey(name: "BaslamaTarihi") this.baslamaTarihi, @JsonKey(name: "BitisTarihi") this.bitisTarihi, @JsonKey(name: "Durum") this.durum}): super._();
  factory _BelgeKontrolRequestModel.fromJson(Map<String, dynamic> json) => _$BelgeKontrolRequestModelFromJson(json);

@override@JsonKey(name: "BaslamaTarihi")  String? baslamaTarihi;
@override@JsonKey(name: "BitisTarihi")  String? bitisTarihi;
@override@JsonKey(name: "Durum")  String? durum;

/// Create a copy of BelgeKontrolRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BelgeKontrolRequestModelCopyWith<_BelgeKontrolRequestModel> get copyWith => __$BelgeKontrolRequestModelCopyWithImpl<_BelgeKontrolRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BelgeKontrolRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$BelgeKontrolRequestModelCopyWith<$Res> implements $BelgeKontrolRequestModelCopyWith<$Res> {
  factory _$BelgeKontrolRequestModelCopyWith(_BelgeKontrolRequestModel value, $Res Function(_BelgeKontrolRequestModel) _then) = __$BelgeKontrolRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "BaslamaTarihi") String? baslamaTarihi,@JsonKey(name: "BitisTarihi") String? bitisTarihi,@JsonKey(name: "Durum") String? durum
});




}
/// @nodoc
class __$BelgeKontrolRequestModelCopyWithImpl<$Res>
    implements _$BelgeKontrolRequestModelCopyWith<$Res> {
  __$BelgeKontrolRequestModelCopyWithImpl(this._self, this._then);

  final _BelgeKontrolRequestModel _self;
  final $Res Function(_BelgeKontrolRequestModel) _then;

/// Create a copy of BelgeKontrolRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? durum = freezed,}) {
  return _then(_BelgeKontrolRequestModel(
baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
