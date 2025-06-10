// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_uret_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriUretModel {

 String? get seriNo; set seriNo(String? value); String? get stokKodu; set stokKodu(String? value); int? get sonNo; set sonNo(int? value);
/// Create a copy of SeriUretModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriUretModelCopyWith<SeriUretModel> get copyWith => _$SeriUretModelCopyWithImpl<SeriUretModel>(this as SeriUretModel, _$identity);

  /// Serializes this SeriUretModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $SeriUretModelCopyWith<$Res>  {
  factory $SeriUretModelCopyWith(SeriUretModel value, $Res Function(SeriUretModel) _then) = _$SeriUretModelCopyWithImpl;
@useResult
$Res call({
 String? seriNo, String? stokKodu, int? sonNo
});




}
/// @nodoc
class _$SeriUretModelCopyWithImpl<$Res>
    implements $SeriUretModelCopyWith<$Res> {
  _$SeriUretModelCopyWithImpl(this._self, this._then);

  final SeriUretModel _self;
  final $Res Function(SeriUretModel) _then;

/// Create a copy of SeriUretModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seriNo = freezed,Object? stokKodu = freezed,Object? sonNo = freezed,}) {
  return _then(_self.copyWith(
seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,sonNo: freezed == sonNo ? _self.sonNo : sonNo // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SeriUretModel extends SeriUretModel {
   _SeriUretModel({this.seriNo, this.stokKodu, this.sonNo}): super._();
  factory _SeriUretModel.fromJson(Map<String, dynamic> json) => _$SeriUretModelFromJson(json);

@override  String? seriNo;
@override  String? stokKodu;
@override  int? sonNo;

/// Create a copy of SeriUretModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriUretModelCopyWith<_SeriUretModel> get copyWith => __$SeriUretModelCopyWithImpl<_SeriUretModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriUretModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$SeriUretModelCopyWith<$Res> implements $SeriUretModelCopyWith<$Res> {
  factory _$SeriUretModelCopyWith(_SeriUretModel value, $Res Function(_SeriUretModel) _then) = __$SeriUretModelCopyWithImpl;
@override @useResult
$Res call({
 String? seriNo, String? stokKodu, int? sonNo
});




}
/// @nodoc
class __$SeriUretModelCopyWithImpl<$Res>
    implements _$SeriUretModelCopyWith<$Res> {
  __$SeriUretModelCopyWithImpl(this._self, this._then);

  final _SeriUretModel _self;
  final $Res Function(_SeriUretModel) _then;

/// Create a copy of SeriUretModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seriNo = freezed,Object? stokKodu = freezed,Object? sonNo = freezed,}) {
  return _then(_SeriUretModel(
seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,sonNo: freezed == sonNo ? _self.sonNo : sonNo // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
