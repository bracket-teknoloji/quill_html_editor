// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stok_fiyati_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StokFiyatiModel {

 double? get fiyat; String? get yer; int? get fiyatSirasi; String? get stokKodu; String? get cariKodu; DateTime? get tarih;
/// Create a copy of StokFiyatiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StokFiyatiModelCopyWith<StokFiyatiModel> get copyWith => _$StokFiyatiModelCopyWithImpl<StokFiyatiModel>(this as StokFiyatiModel, _$identity);

  /// Serializes this StokFiyatiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StokFiyatiModel&&super == other&&(identical(other.fiyat, fiyat) || other.fiyat == fiyat)&&(identical(other.yer, yer) || other.yer == yer)&&(identical(other.fiyatSirasi, fiyatSirasi) || other.fiyatSirasi == fiyatSirasi)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.tarih, tarih) || other.tarih == tarih));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fiyat,yer,fiyatSirasi,stokKodu,cariKodu,tarih);



}

/// @nodoc
abstract mixin class $StokFiyatiModelCopyWith<$Res>  {
  factory $StokFiyatiModelCopyWith(StokFiyatiModel value, $Res Function(StokFiyatiModel) _then) = _$StokFiyatiModelCopyWithImpl;
@useResult
$Res call({
 double? fiyat, String? yer, int? fiyatSirasi, String? stokKodu, String? cariKodu, DateTime? tarih
});




}
/// @nodoc
class _$StokFiyatiModelCopyWithImpl<$Res>
    implements $StokFiyatiModelCopyWith<$Res> {
  _$StokFiyatiModelCopyWithImpl(this._self, this._then);

  final StokFiyatiModel _self;
  final $Res Function(StokFiyatiModel) _then;

/// Create a copy of StokFiyatiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fiyat = freezed,Object? yer = freezed,Object? fiyatSirasi = freezed,Object? stokKodu = freezed,Object? cariKodu = freezed,Object? tarih = freezed,}) {
  return _then(_self.copyWith(
fiyat: freezed == fiyat ? _self.fiyat : fiyat // ignore: cast_nullable_to_non_nullable
as double?,yer: freezed == yer ? _self.yer : yer // ignore: cast_nullable_to_non_nullable
as String?,fiyatSirasi: freezed == fiyatSirasi ? _self.fiyatSirasi : fiyatSirasi // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StokFiyatiModel extends StokFiyatiModel {
   _StokFiyatiModel({this.fiyat, this.yer, this.fiyatSirasi, this.stokKodu, this.cariKodu, this.tarih}): super._();
  factory _StokFiyatiModel.fromJson(Map<String, dynamic> json) => _$StokFiyatiModelFromJson(json);

@override final  double? fiyat;
@override final  String? yer;
@override final  int? fiyatSirasi;
@override final  String? stokKodu;
@override final  String? cariKodu;
@override final  DateTime? tarih;

/// Create a copy of StokFiyatiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StokFiyatiModelCopyWith<_StokFiyatiModel> get copyWith => __$StokFiyatiModelCopyWithImpl<_StokFiyatiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StokFiyatiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StokFiyatiModel&&super == other&&(identical(other.fiyat, fiyat) || other.fiyat == fiyat)&&(identical(other.yer, yer) || other.yer == yer)&&(identical(other.fiyatSirasi, fiyatSirasi) || other.fiyatSirasi == fiyatSirasi)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.tarih, tarih) || other.tarih == tarih));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fiyat,yer,fiyatSirasi,stokKodu,cariKodu,tarih);



}

/// @nodoc
abstract mixin class _$StokFiyatiModelCopyWith<$Res> implements $StokFiyatiModelCopyWith<$Res> {
  factory _$StokFiyatiModelCopyWith(_StokFiyatiModel value, $Res Function(_StokFiyatiModel) _then) = __$StokFiyatiModelCopyWithImpl;
@override @useResult
$Res call({
 double? fiyat, String? yer, int? fiyatSirasi, String? stokKodu, String? cariKodu, DateTime? tarih
});




}
/// @nodoc
class __$StokFiyatiModelCopyWithImpl<$Res>
    implements _$StokFiyatiModelCopyWith<$Res> {
  __$StokFiyatiModelCopyWithImpl(this._self, this._then);

  final _StokFiyatiModel _self;
  final $Res Function(_StokFiyatiModel) _then;

/// Create a copy of StokFiyatiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fiyat = freezed,Object? yer = freezed,Object? fiyatSirasi = freezed,Object? stokKodu = freezed,Object? cariKodu = freezed,Object? tarih = freezed,}) {
  return _then(_StokFiyatiModel(
fiyat: freezed == fiyat ? _self.fiyat : fiyat // ignore: cast_nullable_to_non_nullable
as double?,yer: freezed == yer ? _self.yer : yer // ignore: cast_nullable_to_non_nullable
as String?,fiyatSirasi: freezed == fiyatSirasi ? _self.fiyatSirasi : fiyatSirasi // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
