// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cari_hareketleri_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CariHareketleriRequestModel {

@JsonKey(name: "SIRALAMA") String? get siralama;@JsonKey(name: "SIRALAMA") set siralama(String? value); bool? get sadeceTahsilatlarOdemeler; set sadeceTahsilatlarOdemeler(bool? value); String? get cariKodu; set cariKodu(String? value); String? get ekranTipi; set ekranTipi(String? value); String? get arrPlasiyerKodu; set arrPlasiyerKodu(String? value); String? get arrHareketTuru; set arrHareketTuru(String? value); String? get baslamaTarihi; set baslamaTarihi(String? value); String? get bitisTarihi; set bitisTarihi(String? value);@JsonKey(name: "BA") String? get ba;@JsonKey(name: "BA") set ba(String? value); String? get menuKodu; set menuKodu(String? value); String? get kapatilmis; set kapatilmis(String? value);
/// Create a copy of CariHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CariHareketleriRequestModelCopyWith<CariHareketleriRequestModel> get copyWith => _$CariHareketleriRequestModelCopyWithImpl<CariHareketleriRequestModel>(this as CariHareketleriRequestModel, _$identity);

  /// Serializes this CariHareketleriRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $CariHareketleriRequestModelCopyWith<$Res>  {
  factory $CariHareketleriRequestModelCopyWith(CariHareketleriRequestModel value, $Res Function(CariHareketleriRequestModel) _then) = _$CariHareketleriRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "SIRALAMA") String? siralama, bool? sadeceTahsilatlarOdemeler, String? cariKodu, String? ekranTipi, String? arrPlasiyerKodu, String? arrHareketTuru, String? baslamaTarihi, String? bitisTarihi,@JsonKey(name: "BA") String? ba, String? menuKodu, String? kapatilmis
});




}
/// @nodoc
class _$CariHareketleriRequestModelCopyWithImpl<$Res>
    implements $CariHareketleriRequestModelCopyWith<$Res> {
  _$CariHareketleriRequestModelCopyWithImpl(this._self, this._then);

  final CariHareketleriRequestModel _self;
  final $Res Function(CariHareketleriRequestModel) _then;

/// Create a copy of CariHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? siralama = freezed,Object? sadeceTahsilatlarOdemeler = freezed,Object? cariKodu = freezed,Object? ekranTipi = freezed,Object? arrPlasiyerKodu = freezed,Object? arrHareketTuru = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? ba = freezed,Object? menuKodu = freezed,Object? kapatilmis = freezed,}) {
  return _then(_self.copyWith(
siralama: freezed == siralama ? _self.siralama : siralama // ignore: cast_nullable_to_non_nullable
as String?,sadeceTahsilatlarOdemeler: freezed == sadeceTahsilatlarOdemeler ? _self.sadeceTahsilatlarOdemeler : sadeceTahsilatlarOdemeler // ignore: cast_nullable_to_non_nullable
as bool?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,arrPlasiyerKodu: freezed == arrPlasiyerKodu ? _self.arrPlasiyerKodu : arrPlasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,arrHareketTuru: freezed == arrHareketTuru ? _self.arrHareketTuru : arrHareketTuru // ignore: cast_nullable_to_non_nullable
as String?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,ba: freezed == ba ? _self.ba : ba // ignore: cast_nullable_to_non_nullable
as String?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,kapatilmis: freezed == kapatilmis ? _self.kapatilmis : kapatilmis // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _CariHareketleriRequestModel implements CariHareketleriRequestModel {
   _CariHareketleriRequestModel({@JsonKey(name: "SIRALAMA") this.siralama, this.sadeceTahsilatlarOdemeler, this.cariKodu, this.ekranTipi, this.arrPlasiyerKodu, this.arrHareketTuru, this.baslamaTarihi, this.bitisTarihi, @JsonKey(name: "BA") this.ba, this.menuKodu, this.kapatilmis});
  factory _CariHareketleriRequestModel.fromJson(Map<String, dynamic> json) => _$CariHareketleriRequestModelFromJson(json);

@override@JsonKey(name: "SIRALAMA")  String? siralama;
@override  bool? sadeceTahsilatlarOdemeler;
@override  String? cariKodu;
@override  String? ekranTipi;
@override  String? arrPlasiyerKodu;
@override  String? arrHareketTuru;
@override  String? baslamaTarihi;
@override  String? bitisTarihi;
@override@JsonKey(name: "BA")  String? ba;
@override  String? menuKodu;
@override  String? kapatilmis;

/// Create a copy of CariHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CariHareketleriRequestModelCopyWith<_CariHareketleriRequestModel> get copyWith => __$CariHareketleriRequestModelCopyWithImpl<_CariHareketleriRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CariHareketleriRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$CariHareketleriRequestModelCopyWith<$Res> implements $CariHareketleriRequestModelCopyWith<$Res> {
  factory _$CariHareketleriRequestModelCopyWith(_CariHareketleriRequestModel value, $Res Function(_CariHareketleriRequestModel) _then) = __$CariHareketleriRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "SIRALAMA") String? siralama, bool? sadeceTahsilatlarOdemeler, String? cariKodu, String? ekranTipi, String? arrPlasiyerKodu, String? arrHareketTuru, String? baslamaTarihi, String? bitisTarihi,@JsonKey(name: "BA") String? ba, String? menuKodu, String? kapatilmis
});




}
/// @nodoc
class __$CariHareketleriRequestModelCopyWithImpl<$Res>
    implements _$CariHareketleriRequestModelCopyWith<$Res> {
  __$CariHareketleriRequestModelCopyWithImpl(this._self, this._then);

  final _CariHareketleriRequestModel _self;
  final $Res Function(_CariHareketleriRequestModel) _then;

/// Create a copy of CariHareketleriRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? siralama = freezed,Object? sadeceTahsilatlarOdemeler = freezed,Object? cariKodu = freezed,Object? ekranTipi = freezed,Object? arrPlasiyerKodu = freezed,Object? arrHareketTuru = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? ba = freezed,Object? menuKodu = freezed,Object? kapatilmis = freezed,}) {
  return _then(_CariHareketleriRequestModel(
siralama: freezed == siralama ? _self.siralama : siralama // ignore: cast_nullable_to_non_nullable
as String?,sadeceTahsilatlarOdemeler: freezed == sadeceTahsilatlarOdemeler ? _self.sadeceTahsilatlarOdemeler : sadeceTahsilatlarOdemeler // ignore: cast_nullable_to_non_nullable
as bool?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,ekranTipi: freezed == ekranTipi ? _self.ekranTipi : ekranTipi // ignore: cast_nullable_to_non_nullable
as String?,arrPlasiyerKodu: freezed == arrPlasiyerKodu ? _self.arrPlasiyerKodu : arrPlasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,arrHareketTuru: freezed == arrHareketTuru ? _self.arrHareketTuru : arrHareketTuru // ignore: cast_nullable_to_non_nullable
as String?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,ba: freezed == ba ? _self.ba : ba // ignore: cast_nullable_to_non_nullable
as String?,menuKodu: freezed == menuKodu ? _self.menuKodu : menuKodu // ignore: cast_nullable_to_non_nullable
as String?,kapatilmis: freezed == kapatilmis ? _self.kapatilmis : kapatilmis // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
