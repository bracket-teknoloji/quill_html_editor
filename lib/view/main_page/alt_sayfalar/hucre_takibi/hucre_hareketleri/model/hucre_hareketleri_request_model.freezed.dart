// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hucre_hareketleri_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HucreHareketleriRequestModel {

 String? get ekranTipi; int? get filtreKodu; String? get stokKodu;
/// Create a copy of HucreHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HucreHareketleriRequestModelCopyWith<HucreHareketleriRequestModel> get copyWith => _$HucreHareketleriRequestModelCopyWithImpl<HucreHareketleriRequestModel>(this as HucreHareketleriRequestModel, _$identity);

  /// Serializes this HucreHareketleriRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HucreHareketleriRequestModel&&(identical(other.ekranTipi, ekranTipi) || other.ekranTipi == ekranTipi)&&(identical(other.filtreKodu, filtreKodu) || other.filtreKodu == filtreKodu)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ekranTipi,filtreKodu,stokKodu);



}

/// @nodoc
abstract mixin class $HucreHareketleriRequestModelCopyWith<$Res>  {
  factory $HucreHareketleriRequestModelCopyWith(HucreHareketleriRequestModel value, $Res Function(HucreHareketleriRequestModel) _then) = _$HucreHareketleriRequestModelCopyWithImpl;
@useResult
$Res call({
 String? ekranTipi, int? filtreKodu, String? stokKodu
});




}
/// @nodoc
class _$HucreHareketleriRequestModelCopyWithImpl<$Res>
    implements $HucreHareketleriRequestModelCopyWith<$Res> {
  _$HucreHareketleriRequestModelCopyWithImpl(this._self, this._then);

  final HucreHareketleriRequestModel _self;
  final $Res Function(HucreHareketleriRequestModel) _then;

/// Create a copy of HucreHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ekranTipi = freezed,Object? filtreKodu = freezed,Object? stokKodu = freezed,}) {
  return _then(_self.copyWith(
ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _HucreHareketleriRequestModel implements HucreHareketleriRequestModel {
   _HucreHareketleriRequestModel({this.ekranTipi, this.filtreKodu, this.stokKodu});
  factory _HucreHareketleriRequestModel.fromJson(Map<String, dynamic> json) => _$HucreHareketleriRequestModelFromJson(json);

@override final  String? ekranTipi;
@override final  int? filtreKodu;
@override final  String? stokKodu;

/// Create a copy of HucreHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HucreHareketleriRequestModelCopyWith<_HucreHareketleriRequestModel> get copyWith => __$HucreHareketleriRequestModelCopyWithImpl<_HucreHareketleriRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HucreHareketleriRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HucreHareketleriRequestModel&&(identical(other.ekranTipi, ekranTipi) || other.ekranTipi == ekranTipi)&&(identical(other.filtreKodu, filtreKodu) || other.filtreKodu == filtreKodu)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ekranTipi,filtreKodu,stokKodu);



}

/// @nodoc
abstract mixin class _$HucreHareketleriRequestModelCopyWith<$Res> implements $HucreHareketleriRequestModelCopyWith<$Res> {
  factory _$HucreHareketleriRequestModelCopyWith(_HucreHareketleriRequestModel value, $Res Function(_HucreHareketleriRequestModel) _then) = __$HucreHareketleriRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? ekranTipi, int? filtreKodu, String? stokKodu
});




}
/// @nodoc
class __$HucreHareketleriRequestModelCopyWithImpl<$Res>
    implements _$HucreHareketleriRequestModelCopyWith<$Res> {
  __$HucreHareketleriRequestModelCopyWithImpl(this._self, this._then);

  final _HucreHareketleriRequestModel _self;
  final $Res Function(_HucreHareketleriRequestModel) _then;

/// Create a copy of HucreHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ekranTipi = freezed,Object? filtreKodu = freezed,Object? stokKodu = freezed,}) {
  return _then(_HucreHareketleriRequestModel(
ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,filtreKodu: freezed == filtreKodu ? _self.filtreKodu : filtreKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
