// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stok_fiyat_ozeti_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StokFiyatOzetiRequestModel {

 String? get yapKod; set yapKod(String? value); String? get cariKodu; set cariKodu(String? value); String? get stokKodu; set stokKodu(String? value);
/// Create a copy of StokFiyatOzetiRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StokFiyatOzetiRequestModelCopyWith<StokFiyatOzetiRequestModel> get copyWith => _$StokFiyatOzetiRequestModelCopyWithImpl<StokFiyatOzetiRequestModel>(this as StokFiyatOzetiRequestModel, _$identity);

  /// Serializes this StokFiyatOzetiRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $StokFiyatOzetiRequestModelCopyWith<$Res>  {
  factory $StokFiyatOzetiRequestModelCopyWith(StokFiyatOzetiRequestModel value, $Res Function(StokFiyatOzetiRequestModel) _then) = _$StokFiyatOzetiRequestModelCopyWithImpl;
@useResult
$Res call({
 String? yapKod, String? cariKodu, String? stokKodu
});




}
/// @nodoc
class _$StokFiyatOzetiRequestModelCopyWithImpl<$Res>
    implements $StokFiyatOzetiRequestModelCopyWith<$Res> {
  _$StokFiyatOzetiRequestModelCopyWithImpl(this._self, this._then);

  final StokFiyatOzetiRequestModel _self;
  final $Res Function(StokFiyatOzetiRequestModel) _then;

/// Create a copy of StokFiyatOzetiRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? yapKod = freezed,Object? cariKodu = freezed,Object? stokKodu = freezed,}) {
  return _then(_self.copyWith(
yapKod: freezed == yapKod ? _self.yapKod : yapKod // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _StokFiyatOzetiRequestModel implements StokFiyatOzetiRequestModel {
   _StokFiyatOzetiRequestModel({this.yapKod, this.cariKodu, this.stokKodu});
  factory _StokFiyatOzetiRequestModel.fromJson(Map<String, dynamic> json) => _$StokFiyatOzetiRequestModelFromJson(json);

@override  String? yapKod;
@override  String? cariKodu;
@override  String? stokKodu;

/// Create a copy of StokFiyatOzetiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StokFiyatOzetiRequestModelCopyWith<_StokFiyatOzetiRequestModel> get copyWith => __$StokFiyatOzetiRequestModelCopyWithImpl<_StokFiyatOzetiRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StokFiyatOzetiRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$StokFiyatOzetiRequestModelCopyWith<$Res> implements $StokFiyatOzetiRequestModelCopyWith<$Res> {
  factory _$StokFiyatOzetiRequestModelCopyWith(_StokFiyatOzetiRequestModel value, $Res Function(_StokFiyatOzetiRequestModel) _then) = __$StokFiyatOzetiRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? yapKod, String? cariKodu, String? stokKodu
});




}
/// @nodoc
class __$StokFiyatOzetiRequestModelCopyWithImpl<$Res>
    implements _$StokFiyatOzetiRequestModelCopyWith<$Res> {
  __$StokFiyatOzetiRequestModelCopyWithImpl(this._self, this._then);

  final _StokFiyatOzetiRequestModel _self;
  final $Res Function(_StokFiyatOzetiRequestModel) _then;

/// Create a copy of StokFiyatOzetiRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? yapKod = freezed,Object? cariKodu = freezed,Object? stokKodu = freezed,}) {
  return _then(_StokFiyatOzetiRequestModel(
yapKod: freezed == yapKod ? _self.yapKod : yapKod // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
