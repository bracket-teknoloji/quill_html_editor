// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evraklar_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EvraklarRequestModel {

 String? get belgeTipi; set belgeTipi(String? value); String? get urlGetir; set urlGetir(String? value); String? get belgeNo; set belgeNo(String? value);
/// Create a copy of EvraklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvraklarRequestModelCopyWith<EvraklarRequestModel> get copyWith => _$EvraklarRequestModelCopyWithImpl<EvraklarRequestModel>(this as EvraklarRequestModel, _$identity);

  /// Serializes this EvraklarRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $EvraklarRequestModelCopyWith<$Res>  {
  factory $EvraklarRequestModelCopyWith(EvraklarRequestModel value, $Res Function(EvraklarRequestModel) _then) = _$EvraklarRequestModelCopyWithImpl;
@useResult
$Res call({
 String? belgeTipi, String? urlGetir, String? belgeNo
});




}
/// @nodoc
class _$EvraklarRequestModelCopyWithImpl<$Res>
    implements $EvraklarRequestModelCopyWith<$Res> {
  _$EvraklarRequestModelCopyWithImpl(this._self, this._then);

  final EvraklarRequestModel _self;
  final $Res Function(EvraklarRequestModel) _then;

/// Create a copy of EvraklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeTipi = freezed,Object? urlGetir = freezed,Object? belgeNo = freezed,}) {
  return _then(_self.copyWith(
belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,urlGetir: freezed == urlGetir ? _self.urlGetir : urlGetir // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _EvraklarRequestModel extends EvraklarRequestModel {
   _EvraklarRequestModel({this.belgeTipi, this.urlGetir, this.belgeNo}): super._();
  factory _EvraklarRequestModel.fromJson(Map<String, dynamic> json) => _$EvraklarRequestModelFromJson(json);

@override  String? belgeTipi;
@override  String? urlGetir;
@override  String? belgeNo;

/// Create a copy of EvraklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvraklarRequestModelCopyWith<_EvraklarRequestModel> get copyWith => __$EvraklarRequestModelCopyWithImpl<_EvraklarRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EvraklarRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$EvraklarRequestModelCopyWith<$Res> implements $EvraklarRequestModelCopyWith<$Res> {
  factory _$EvraklarRequestModelCopyWith(_EvraklarRequestModel value, $Res Function(_EvraklarRequestModel) _then) = __$EvraklarRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeTipi, String? urlGetir, String? belgeNo
});




}
/// @nodoc
class __$EvraklarRequestModelCopyWithImpl<$Res>
    implements _$EvraklarRequestModelCopyWith<$Res> {
  __$EvraklarRequestModelCopyWithImpl(this._self, this._then);

  final _EvraklarRequestModel _self;
  final $Res Function(_EvraklarRequestModel) _then;

/// Create a copy of EvraklarRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeTipi = freezed,Object? urlGetir = freezed,Object? belgeNo = freezed,}) {
  return _then(_EvraklarRequestModel(
belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,urlGetir: freezed == urlGetir ? _self.urlGetir : urlGetir // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
