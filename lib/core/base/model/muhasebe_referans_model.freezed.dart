// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'muhasebe_referans_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MuhasebeReferansModel {

 String? get kodu; set kodu(String? value); String? get tanimi; set tanimi(String? value);
/// Create a copy of MuhasebeReferansModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuhasebeReferansModelCopyWith<MuhasebeReferansModel> get copyWith => _$MuhasebeReferansModelCopyWithImpl<MuhasebeReferansModel>(this as MuhasebeReferansModel, _$identity);

  /// Serializes this MuhasebeReferansModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $MuhasebeReferansModelCopyWith<$Res>  {
  factory $MuhasebeReferansModelCopyWith(MuhasebeReferansModel value, $Res Function(MuhasebeReferansModel) _then) = _$MuhasebeReferansModelCopyWithImpl;
@useResult
$Res call({
 String? kodu, String? tanimi
});




}
/// @nodoc
class _$MuhasebeReferansModelCopyWithImpl<$Res>
    implements $MuhasebeReferansModelCopyWith<$Res> {
  _$MuhasebeReferansModelCopyWithImpl(this._self, this._then);

  final MuhasebeReferansModel _self;
  final $Res Function(MuhasebeReferansModel) _then;

/// Create a copy of MuhasebeReferansModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kodu = freezed,Object? tanimi = freezed,}) {
  return _then(_self.copyWith(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,tanimi: freezed == tanimi ? _self.tanimi : tanimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MuhasebeReferansModel extends MuhasebeReferansModel {
   _MuhasebeReferansModel({this.kodu, this.tanimi}): super._();
  factory _MuhasebeReferansModel.fromJson(Map<String, dynamic> json) => _$MuhasebeReferansModelFromJson(json);

@override  String? kodu;
@override  String? tanimi;

/// Create a copy of MuhasebeReferansModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuhasebeReferansModelCopyWith<_MuhasebeReferansModel> get copyWith => __$MuhasebeReferansModelCopyWithImpl<_MuhasebeReferansModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MuhasebeReferansModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$MuhasebeReferansModelCopyWith<$Res> implements $MuhasebeReferansModelCopyWith<$Res> {
  factory _$MuhasebeReferansModelCopyWith(_MuhasebeReferansModel value, $Res Function(_MuhasebeReferansModel) _then) = __$MuhasebeReferansModelCopyWithImpl;
@override @useResult
$Res call({
 String? kodu, String? tanimi
});




}
/// @nodoc
class __$MuhasebeReferansModelCopyWithImpl<$Res>
    implements _$MuhasebeReferansModelCopyWith<$Res> {
  __$MuhasebeReferansModelCopyWithImpl(this._self, this._then);

  final _MuhasebeReferansModel _self;
  final $Res Function(_MuhasebeReferansModel) _then;

/// Create a copy of MuhasebeReferansModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kodu = freezed,Object? tanimi = freezed,}) {
  return _then(_MuhasebeReferansModel(
kodu: freezed == kodu ? _self.kodu : kodu // ignore: cast_nullable_to_non_nullable
as String?,tanimi: freezed == tanimi ? _self.tanimi : tanimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
