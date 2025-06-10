// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teklif_iste_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeklifIsteModel {

 String? get tip; String? get mesaj;
/// Create a copy of TeklifIsteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeklifIsteModelCopyWith<TeklifIsteModel> get copyWith => _$TeklifIsteModelCopyWithImpl<TeklifIsteModel>(this as TeklifIsteModel, _$identity);

  /// Serializes this TeklifIsteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeklifIsteModel&&super == other&&(identical(other.tip, tip) || other.tip == tip)&&(identical(other.mesaj, mesaj) || other.mesaj == mesaj));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tip,mesaj);



}

/// @nodoc
abstract mixin class $TeklifIsteModelCopyWith<$Res>  {
  factory $TeklifIsteModelCopyWith(TeklifIsteModel value, $Res Function(TeklifIsteModel) _then) = _$TeklifIsteModelCopyWithImpl;
@useResult
$Res call({
 String? tip, String? mesaj
});




}
/// @nodoc
class _$TeklifIsteModelCopyWithImpl<$Res>
    implements $TeklifIsteModelCopyWith<$Res> {
  _$TeklifIsteModelCopyWithImpl(this._self, this._then);

  final TeklifIsteModel _self;
  final $Res Function(TeklifIsteModel) _then;

/// Create a copy of TeklifIsteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tip = freezed,Object? mesaj = freezed,}) {
  return _then(_self.copyWith(
tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as String?,mesaj: freezed == mesaj ? _self.mesaj : mesaj // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TeklifIsteModel extends TeklifIsteModel {
  const _TeklifIsteModel({this.tip, this.mesaj}): super._();
  factory _TeklifIsteModel.fromJson(Map<String, dynamic> json) => _$TeklifIsteModelFromJson(json);

@override final  String? tip;
@override final  String? mesaj;

/// Create a copy of TeklifIsteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeklifIsteModelCopyWith<_TeklifIsteModel> get copyWith => __$TeklifIsteModelCopyWithImpl<_TeklifIsteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeklifIsteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeklifIsteModel&&super == other&&(identical(other.tip, tip) || other.tip == tip)&&(identical(other.mesaj, mesaj) || other.mesaj == mesaj));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tip,mesaj);



}

/// @nodoc
abstract mixin class _$TeklifIsteModelCopyWith<$Res> implements $TeklifIsteModelCopyWith<$Res> {
  factory _$TeklifIsteModelCopyWith(_TeklifIsteModel value, $Res Function(_TeklifIsteModel) _then) = __$TeklifIsteModelCopyWithImpl;
@override @useResult
$Res call({
 String? tip, String? mesaj
});




}
/// @nodoc
class __$TeklifIsteModelCopyWithImpl<$Res>
    implements _$TeklifIsteModelCopyWith<$Res> {
  __$TeklifIsteModelCopyWithImpl(this._self, this._then);

  final _TeklifIsteModel _self;
  final $Res Function(_TeklifIsteModel) _then;

/// Create a copy of TeklifIsteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tip = freezed,Object? mesaj = freezed,}) {
  return _then(_TeklifIsteModel(
tip: freezed == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as String?,mesaj: freezed == mesaj ? _self.mesaj : mesaj // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
