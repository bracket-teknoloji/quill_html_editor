// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uretim_sonu_raporu_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UretimSonuRaporuRequestModel {

 String? get belgeNo; set belgeNo(String? value); int? get filtreKodu; set filtreKodu(int? value); String? get stokKodu; set stokKodu(String? value);
/// Create a copy of UretimSonuRaporuRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UretimSonuRaporuRequestModelCopyWith<UretimSonuRaporuRequestModel> get copyWith => _$UretimSonuRaporuRequestModelCopyWithImpl<UretimSonuRaporuRequestModel>(this as UretimSonuRaporuRequestModel, _$identity);

  /// Serializes this UretimSonuRaporuRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $UretimSonuRaporuRequestModelCopyWith<$Res>  {
  factory $UretimSonuRaporuRequestModelCopyWith(UretimSonuRaporuRequestModel value, $Res Function(UretimSonuRaporuRequestModel) _then) = _$UretimSonuRaporuRequestModelCopyWithImpl;
@useResult
$Res call({
 String? belgeNo, int? filtreKodu, String? stokKodu
});




}
/// @nodoc
class _$UretimSonuRaporuRequestModelCopyWithImpl<$Res>
    implements $UretimSonuRaporuRequestModelCopyWith<$Res> {
  _$UretimSonuRaporuRequestModelCopyWithImpl(this._self, this._then);

  final UretimSonuRaporuRequestModel _self;
  final $Res Function(UretimSonuRaporuRequestModel) _then;

/// Create a copy of UretimSonuRaporuRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeNo = freezed,Object? filtreKodu = freezed,Object? stokKodu = freezed,}) {
  return _then(_self.copyWith(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _UretimSonuRaporuRequestModel implements UretimSonuRaporuRequestModel {
   _UretimSonuRaporuRequestModel({this.belgeNo, this.filtreKodu, this.stokKodu});
  factory _UretimSonuRaporuRequestModel.fromJson(Map<String, dynamic> json) => _$UretimSonuRaporuRequestModelFromJson(json);

@override  String? belgeNo;
@override  int? filtreKodu;
@override  String? stokKodu;

/// Create a copy of UretimSonuRaporuRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UretimSonuRaporuRequestModelCopyWith<_UretimSonuRaporuRequestModel> get copyWith => __$UretimSonuRaporuRequestModelCopyWithImpl<_UretimSonuRaporuRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UretimSonuRaporuRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$UretimSonuRaporuRequestModelCopyWith<$Res> implements $UretimSonuRaporuRequestModelCopyWith<$Res> {
  factory _$UretimSonuRaporuRequestModelCopyWith(_UretimSonuRaporuRequestModel value, $Res Function(_UretimSonuRaporuRequestModel) _then) = __$UretimSonuRaporuRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeNo, int? filtreKodu, String? stokKodu
});




}
/// @nodoc
class __$UretimSonuRaporuRequestModelCopyWithImpl<$Res>
    implements _$UretimSonuRaporuRequestModelCopyWith<$Res> {
  __$UretimSonuRaporuRequestModelCopyWithImpl(this._self, this._then);

  final _UretimSonuRaporuRequestModel _self;
  final $Res Function(_UretimSonuRaporuRequestModel) _then;

/// Create a copy of UretimSonuRaporuRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeNo = freezed,Object? filtreKodu = freezed,Object? stokKodu = freezed,}) {
  return _then(_UretimSonuRaporuRequestModel(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
