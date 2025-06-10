// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barkod_tanimla_kayitlari_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BarkodTanimlaKayitlariModel {

 String? get stokKodu; String? get barkod; int? get birim; String? get kilit; String? get aciklama; String? get birimAdi; String? get barkodTipi; String? get barkodTipiAdi; double? get birimPay; double? get birimPayda; String? get stokBirim1Adi;
/// Create a copy of BarkodTanimlaKayitlariModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BarkodTanimlaKayitlariModelCopyWith<BarkodTanimlaKayitlariModel> get copyWith => _$BarkodTanimlaKayitlariModelCopyWithImpl<BarkodTanimlaKayitlariModel>(this as BarkodTanimlaKayitlariModel, _$identity);

  /// Serializes this BarkodTanimlaKayitlariModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BarkodTanimlaKayitlariModel&&super == other&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.barkod, barkod) || other.barkod == barkod)&&(identical(other.birim, birim) || other.birim == birim)&&(identical(other.kilit, kilit) || other.kilit == kilit)&&(identical(other.aciklama, aciklama) || other.aciklama == aciklama)&&(identical(other.birimAdi, birimAdi) || other.birimAdi == birimAdi)&&(identical(other.barkodTipi, barkodTipi) || other.barkodTipi == barkodTipi)&&(identical(other.barkodTipiAdi, barkodTipiAdi) || other.barkodTipiAdi == barkodTipiAdi)&&(identical(other.birimPay, birimPay) || other.birimPay == birimPay)&&(identical(other.birimPayda, birimPayda) || other.birimPayda == birimPayda)&&(identical(other.stokBirim1Adi, stokBirim1Adi) || other.stokBirim1Adi == stokBirim1Adi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,barkod,birim,kilit,aciklama,birimAdi,barkodTipi,barkodTipiAdi,birimPay,birimPayda,stokBirim1Adi);



}

/// @nodoc
abstract mixin class $BarkodTanimlaKayitlariModelCopyWith<$Res>  {
  factory $BarkodTanimlaKayitlariModelCopyWith(BarkodTanimlaKayitlariModel value, $Res Function(BarkodTanimlaKayitlariModel) _then) = _$BarkodTanimlaKayitlariModelCopyWithImpl;
@useResult
$Res call({
 String? stokKodu, String? barkod, int? birim, String? kilit, String? aciklama, String? birimAdi, String? barkodTipi, String? barkodTipiAdi, double? birimPay, double? birimPayda, String? stokBirim1Adi
});




}
/// @nodoc
class _$BarkodTanimlaKayitlariModelCopyWithImpl<$Res>
    implements $BarkodTanimlaKayitlariModelCopyWith<$Res> {
  _$BarkodTanimlaKayitlariModelCopyWithImpl(this._self, this._then);

  final BarkodTanimlaKayitlariModel _self;
  final $Res Function(BarkodTanimlaKayitlariModel) _then;

/// Create a copy of BarkodTanimlaKayitlariModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stokKodu = freezed,Object? barkod = freezed,Object? birim = freezed,Object? kilit = freezed,Object? aciklama = freezed,Object? birimAdi = freezed,Object? barkodTipi = freezed,Object? barkodTipiAdi = freezed,Object? birimPay = freezed,Object? birimPayda = freezed,Object? stokBirim1Adi = freezed,}) {
  return _then(_self.copyWith(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,barkod: freezed == barkod ? _self.barkod : barkod // ignore: cast_nullable_to_non_nullable
as String?,birim: freezed == birim ? _self.birim : birim // ignore: cast_nullable_to_non_nullable
as int?,kilit: freezed == kilit ? _self.kilit : kilit // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,birimAdi: freezed == birimAdi ? _self.birimAdi : birimAdi // ignore: cast_nullable_to_non_nullable
as String?,barkodTipi: freezed == barkodTipi ? _self.barkodTipi : barkodTipi // ignore: cast_nullable_to_non_nullable
as String?,barkodTipiAdi: freezed == barkodTipiAdi ? _self.barkodTipiAdi : barkodTipiAdi // ignore: cast_nullable_to_non_nullable
as String?,birimPay: freezed == birimPay ? _self.birimPay : birimPay // ignore: cast_nullable_to_non_nullable
as double?,birimPayda: freezed == birimPayda ? _self.birimPayda : birimPayda // ignore: cast_nullable_to_non_nullable
as double?,stokBirim1Adi: freezed == stokBirim1Adi ? _self.stokBirim1Adi : stokBirim1Adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BarkodTanimlaKayitlariModel extends BarkodTanimlaKayitlariModel {
   _BarkodTanimlaKayitlariModel({this.stokKodu, this.barkod, this.birim, this.kilit, this.aciklama, this.birimAdi, this.barkodTipi, this.barkodTipiAdi, this.birimPay, this.birimPayda, this.stokBirim1Adi}): super._();
  factory _BarkodTanimlaKayitlariModel.fromJson(Map<String, dynamic> json) => _$BarkodTanimlaKayitlariModelFromJson(json);

@override final  String? stokKodu;
@override final  String? barkod;
@override final  int? birim;
@override final  String? kilit;
@override final  String? aciklama;
@override final  String? birimAdi;
@override final  String? barkodTipi;
@override final  String? barkodTipiAdi;
@override final  double? birimPay;
@override final  double? birimPayda;
@override final  String? stokBirim1Adi;

/// Create a copy of BarkodTanimlaKayitlariModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BarkodTanimlaKayitlariModelCopyWith<_BarkodTanimlaKayitlariModel> get copyWith => __$BarkodTanimlaKayitlariModelCopyWithImpl<_BarkodTanimlaKayitlariModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BarkodTanimlaKayitlariModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BarkodTanimlaKayitlariModel&&super == other&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.barkod, barkod) || other.barkod == barkod)&&(identical(other.birim, birim) || other.birim == birim)&&(identical(other.kilit, kilit) || other.kilit == kilit)&&(identical(other.aciklama, aciklama) || other.aciklama == aciklama)&&(identical(other.birimAdi, birimAdi) || other.birimAdi == birimAdi)&&(identical(other.barkodTipi, barkodTipi) || other.barkodTipi == barkodTipi)&&(identical(other.barkodTipiAdi, barkodTipiAdi) || other.barkodTipiAdi == barkodTipiAdi)&&(identical(other.birimPay, birimPay) || other.birimPay == birimPay)&&(identical(other.birimPayda, birimPayda) || other.birimPayda == birimPayda)&&(identical(other.stokBirim1Adi, stokBirim1Adi) || other.stokBirim1Adi == stokBirim1Adi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,barkod,birim,kilit,aciklama,birimAdi,barkodTipi,barkodTipiAdi,birimPay,birimPayda,stokBirim1Adi);



}

/// @nodoc
abstract mixin class _$BarkodTanimlaKayitlariModelCopyWith<$Res> implements $BarkodTanimlaKayitlariModelCopyWith<$Res> {
  factory _$BarkodTanimlaKayitlariModelCopyWith(_BarkodTanimlaKayitlariModel value, $Res Function(_BarkodTanimlaKayitlariModel) _then) = __$BarkodTanimlaKayitlariModelCopyWithImpl;
@override @useResult
$Res call({
 String? stokKodu, String? barkod, int? birim, String? kilit, String? aciklama, String? birimAdi, String? barkodTipi, String? barkodTipiAdi, double? birimPay, double? birimPayda, String? stokBirim1Adi
});




}
/// @nodoc
class __$BarkodTanimlaKayitlariModelCopyWithImpl<$Res>
    implements _$BarkodTanimlaKayitlariModelCopyWith<$Res> {
  __$BarkodTanimlaKayitlariModelCopyWithImpl(this._self, this._then);

  final _BarkodTanimlaKayitlariModel _self;
  final $Res Function(_BarkodTanimlaKayitlariModel) _then;

/// Create a copy of BarkodTanimlaKayitlariModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stokKodu = freezed,Object? barkod = freezed,Object? birim = freezed,Object? kilit = freezed,Object? aciklama = freezed,Object? birimAdi = freezed,Object? barkodTipi = freezed,Object? barkodTipiAdi = freezed,Object? birimPay = freezed,Object? birimPayda = freezed,Object? stokBirim1Adi = freezed,}) {
  return _then(_BarkodTanimlaKayitlariModel(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,barkod: freezed == barkod ? _self.barkod : barkod // ignore: cast_nullable_to_non_nullable
as String?,birim: freezed == birim ? _self.birim : birim // ignore: cast_nullable_to_non_nullable
as int?,kilit: freezed == kilit ? _self.kilit : kilit // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,birimAdi: freezed == birimAdi ? _self.birimAdi : birimAdi // ignore: cast_nullable_to_non_nullable
as String?,barkodTipi: freezed == barkodTipi ? _self.barkodTipi : barkodTipi // ignore: cast_nullable_to_non_nullable
as String?,barkodTipiAdi: freezed == barkodTipiAdi ? _self.barkodTipiAdi : barkodTipiAdi // ignore: cast_nullable_to_non_nullable
as String?,birimPay: freezed == birimPay ? _self.birimPay : birimPay // ignore: cast_nullable_to_non_nullable
as double?,birimPayda: freezed == birimPayda ? _self.birimPayda : birimPayda // ignore: cast_nullable_to_non_nullable
as double?,stokBirim1Adi: freezed == stokBirim1Adi ? _self.stokBirim1Adi : stokBirim1Adi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
