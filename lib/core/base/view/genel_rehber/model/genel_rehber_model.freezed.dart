// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genel_rehber_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenelRehberModel {

 String? get kodu; set kodu(String? value); String? get aciklama; set aciklama(String? value); String? get adi; set adi(String? value);
/// Create a copy of GenelRehberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenelRehberModelCopyWith<GenelRehberModel> get copyWith => _$GenelRehberModelCopyWithImpl<GenelRehberModel>(this as GenelRehberModel, _$identity);

  /// Serializes this GenelRehberModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $GenelRehberModelCopyWith<$Res>  {
  factory $GenelRehberModelCopyWith(GenelRehberModel value, $Res Function(GenelRehberModel) _then) = _$GenelRehberModelCopyWithImpl;
@useResult
$Res call({
 String? kodu, String? aciklama, String? adi
});




}
/// @nodoc
class _$GenelRehberModelCopyWithImpl<$Res>
    implements $GenelRehberModelCopyWith<$Res> {
  _$GenelRehberModelCopyWithImpl(this._self, this._then);

  final GenelRehberModel _self;
  final $Res Function(GenelRehberModel) _then;

/// Create a copy of GenelRehberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kodu = freezed,Object? aciklama = freezed,Object? adi = freezed,}) {
  return _then(_self.copyWith(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GenelRehberModel extends GenelRehberModel {
   _GenelRehberModel({this.kodu, this.aciklama, this.adi}): super._();
  factory _GenelRehberModel.fromJson(Map<String, dynamic> json) => _$GenelRehberModelFromJson(json);

@override  String? kodu;
@override  String? aciklama;
@override  String? adi;

/// Create a copy of GenelRehberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenelRehberModelCopyWith<_GenelRehberModel> get copyWith => __$GenelRehberModelCopyWithImpl<_GenelRehberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenelRehberModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$GenelRehberModelCopyWith<$Res> implements $GenelRehberModelCopyWith<$Res> {
  factory _$GenelRehberModelCopyWith(_GenelRehberModel value, $Res Function(_GenelRehberModel) _then) = __$GenelRehberModelCopyWithImpl;
@override @useResult
$Res call({
 String? kodu, String? aciklama, String? adi
});




}
/// @nodoc
class __$GenelRehberModelCopyWithImpl<$Res>
    implements _$GenelRehberModelCopyWith<$Res> {
  __$GenelRehberModelCopyWithImpl(this._self, this._then);

  final _GenelRehberModel _self;
  final $Res Function(_GenelRehberModel) _then;

/// Create a copy of GenelRehberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kodu = freezed,Object? aciklama = freezed,Object? adi = freezed,}) {
  return _then(_GenelRehberModel(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
