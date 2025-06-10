// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barkod_tanimla_kayitlari_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BarkodTanimlaKayitlariRequestModel {

 String? get stokKodu; String? get kayitTipi;
/// Create a copy of BarkodTanimlaKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BarkodTanimlaKayitlariRequestModelCopyWith<BarkodTanimlaKayitlariRequestModel> get copyWith => _$BarkodTanimlaKayitlariRequestModelCopyWithImpl<BarkodTanimlaKayitlariRequestModel>(this as BarkodTanimlaKayitlariRequestModel, _$identity);

  /// Serializes this BarkodTanimlaKayitlariRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BarkodTanimlaKayitlariRequestModel&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.kayitTipi, kayitTipi) || other.kayitTipi == kayitTipi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,kayitTipi);



}

/// @nodoc
abstract mixin class $BarkodTanimlaKayitlariRequestModelCopyWith<$Res>  {
  factory $BarkodTanimlaKayitlariRequestModelCopyWith(BarkodTanimlaKayitlariRequestModel value, $Res Function(BarkodTanimlaKayitlariRequestModel) _then) = _$BarkodTanimlaKayitlariRequestModelCopyWithImpl;
@useResult
$Res call({
 String? stokKodu, String? kayitTipi
});




}
/// @nodoc
class _$BarkodTanimlaKayitlariRequestModelCopyWithImpl<$Res>
    implements $BarkodTanimlaKayitlariRequestModelCopyWith<$Res> {
  _$BarkodTanimlaKayitlariRequestModelCopyWithImpl(this._self, this._then);

  final BarkodTanimlaKayitlariRequestModel _self;
  final $Res Function(BarkodTanimlaKayitlariRequestModel) _then;

/// Create a copy of BarkodTanimlaKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stokKodu = freezed,Object? kayitTipi = freezed,}) {
  return _then(_self.copyWith(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,kayitTipi: freezed == kayitTipi ? _self.kayitTipi : kayitTipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _BarkodTanimlaKayitlariRequestModel implements BarkodTanimlaKayitlariRequestModel {
   _BarkodTanimlaKayitlariRequestModel({this.stokKodu, this.kayitTipi});
  factory _BarkodTanimlaKayitlariRequestModel.fromJson(Map<String, dynamic> json) => _$BarkodTanimlaKayitlariRequestModelFromJson(json);

@override final  String? stokKodu;
@override final  String? kayitTipi;

/// Create a copy of BarkodTanimlaKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BarkodTanimlaKayitlariRequestModelCopyWith<_BarkodTanimlaKayitlariRequestModel> get copyWith => __$BarkodTanimlaKayitlariRequestModelCopyWithImpl<_BarkodTanimlaKayitlariRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BarkodTanimlaKayitlariRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BarkodTanimlaKayitlariRequestModel&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.kayitTipi, kayitTipi) || other.kayitTipi == kayitTipi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,kayitTipi);



}

/// @nodoc
abstract mixin class _$BarkodTanimlaKayitlariRequestModelCopyWith<$Res> implements $BarkodTanimlaKayitlariRequestModelCopyWith<$Res> {
  factory _$BarkodTanimlaKayitlariRequestModelCopyWith(_BarkodTanimlaKayitlariRequestModel value, $Res Function(_BarkodTanimlaKayitlariRequestModel) _then) = __$BarkodTanimlaKayitlariRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? stokKodu, String? kayitTipi
});




}
/// @nodoc
class __$BarkodTanimlaKayitlariRequestModelCopyWithImpl<$Res>
    implements _$BarkodTanimlaKayitlariRequestModelCopyWith<$Res> {
  __$BarkodTanimlaKayitlariRequestModelCopyWithImpl(this._self, this._then);

  final _BarkodTanimlaKayitlariRequestModel _self;
  final $Res Function(_BarkodTanimlaKayitlariRequestModel) _then;

/// Create a copy of BarkodTanimlaKayitlariRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stokKodu = freezed,Object? kayitTipi = freezed,}) {
  return _then(_BarkodTanimlaKayitlariRequestModel(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,kayitTipi: freezed == kayitTipi ? _self.kayitTipi : kayitTipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
