// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dekont_islemler_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DekontIslemlerRequestModel {

 String? get dekontIslemTuru; set dekontIslemTuru(String? value); String? get dekontSeri; set dekontSeri(String? value); String? get guid; set guid(String? value); List<DekontKalemler>? get kalemler; set kalemler(List<DekontKalemler>? value); String? get plasiyerKodu; set plasiyerKodu(String? value); String? get projeKodu; set projeKodu(String? value); String? get tag; set tag(String? value); DateTime? get tarih; set tarih(DateTime? value);@JsonKey(name: "_YeniKayit") bool? get yeniKayit;@JsonKey(name: "_YeniKayit") set yeniKayit(bool? value); int? get dekontNo; set dekontNo(int? value);@JsonKey(includeFromJson: false, includeToJson: false) String? get seriAdi;@JsonKey(includeFromJson: false, includeToJson: false) set seriAdi(String? value);@JsonKey(includeFromJson: false, includeToJson: false) String? get plasiyerAdi;@JsonKey(includeFromJson: false, includeToJson: false) set plasiyerAdi(String? value);@JsonKey(includeFromJson: false, includeToJson: false) String? get projeAdi;@JsonKey(includeFromJson: false, includeToJson: false) set projeAdi(String? value);
/// Create a copy of DekontIslemlerRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DekontIslemlerRequestModelCopyWith<DekontIslemlerRequestModel> get copyWith => _$DekontIslemlerRequestModelCopyWithImpl<DekontIslemlerRequestModel>(this as DekontIslemlerRequestModel, _$identity);

  /// Serializes this DekontIslemlerRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $DekontIslemlerRequestModelCopyWith<$Res>  {
  factory $DekontIslemlerRequestModelCopyWith(DekontIslemlerRequestModel value, $Res Function(DekontIslemlerRequestModel) _then) = _$DekontIslemlerRequestModelCopyWithImpl;
@useResult
$Res call({
 String? dekontIslemTuru, String? dekontSeri, String? guid, List<DekontKalemler>? kalemler, String? plasiyerKodu, String? projeKodu, String? tag, DateTime? tarih,@JsonKey(name: "_YeniKayit") bool? yeniKayit, int? dekontNo,@JsonKey(includeFromJson: false, includeToJson: false) String? seriAdi,@JsonKey(includeFromJson: false, includeToJson: false) String? plasiyerAdi,@JsonKey(includeFromJson: false, includeToJson: false) String? projeAdi
});




}
/// @nodoc
class _$DekontIslemlerRequestModelCopyWithImpl<$Res>
    implements $DekontIslemlerRequestModelCopyWith<$Res> {
  _$DekontIslemlerRequestModelCopyWithImpl(this._self, this._then);

  final DekontIslemlerRequestModel _self;
  final $Res Function(DekontIslemlerRequestModel) _then;

/// Create a copy of DekontIslemlerRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dekontIslemTuru = freezed,Object? dekontSeri = freezed,Object? guid = freezed,Object? kalemler = freezed,Object? plasiyerKodu = freezed,Object? projeKodu = freezed,Object? tag = freezed,Object? tarih = freezed,Object? yeniKayit = freezed,Object? dekontNo = freezed,Object? seriAdi = freezed,Object? plasiyerAdi = freezed,Object? projeAdi = freezed,}) {
  return _then(_self.copyWith(
dekontIslemTuru: freezed == dekontIslemTuru ? _self.dekontIslemTuru : dekontIslemTuru // ignore: cast_nullable_to_non_nullable
as String?,dekontSeri: freezed == dekontSeri ? _self.dekontSeri : dekontSeri // ignore: cast_nullable_to_non_nullable
as String?,guid: freezed == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String?,kalemler: freezed == kalemler ? _self.kalemler : kalemler // ignore: cast_nullable_to_non_nullable
as List<DekontKalemler>?,plasiyerKodu: freezed == plasiyerKodu ? _self.plasiyerKodu : plasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,projeKodu: freezed == projeKodu ? _self.projeKodu : projeKodu // ignore: cast_nullable_to_non_nullable
as String?,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,yeniKayit: freezed == yeniKayit ? _self.yeniKayit : yeniKayit // ignore: cast_nullable_to_non_nullable
as bool?,dekontNo: freezed == dekontNo ? _self.dekontNo : dekontNo // ignore: cast_nullable_to_non_nullable
as int?,seriAdi: freezed == seriAdi ? _self.seriAdi : seriAdi // ignore: cast_nullable_to_non_nullable
as String?,plasiyerAdi: freezed == plasiyerAdi ? _self.plasiyerAdi : plasiyerAdi // ignore: cast_nullable_to_non_nullable
as String?,projeAdi: freezed == projeAdi ? _self.projeAdi : projeAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DekontIslemlerRequestModel extends DekontIslemlerRequestModel {
   _DekontIslemlerRequestModel({this.dekontIslemTuru, this.dekontSeri, this.guid, this.kalemler, this.plasiyerKodu, this.projeKodu, this.tag = "DekontModel", this.tarih, @JsonKey(name: "_YeniKayit") this.yeniKayit, this.dekontNo, @JsonKey(includeFromJson: false, includeToJson: false) this.seriAdi, @JsonKey(includeFromJson: false, includeToJson: false) this.plasiyerAdi, @JsonKey(includeFromJson: false, includeToJson: false) this.projeAdi}): super._();
  factory _DekontIslemlerRequestModel.fromJson(Map<String, dynamic> json) => _$DekontIslemlerRequestModelFromJson(json);

@override  String? dekontIslemTuru;
@override  String? dekontSeri;
@override  String? guid;
@override  List<DekontKalemler>? kalemler;
@override  String? plasiyerKodu;
@override  String? projeKodu;
@override@JsonKey()  String? tag;
@override  DateTime? tarih;
@override@JsonKey(name: "_YeniKayit")  bool? yeniKayit;
@override  int? dekontNo;
@override@JsonKey(includeFromJson: false, includeToJson: false)  String? seriAdi;
@override@JsonKey(includeFromJson: false, includeToJson: false)  String? plasiyerAdi;
@override@JsonKey(includeFromJson: false, includeToJson: false)  String? projeAdi;

/// Create a copy of DekontIslemlerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DekontIslemlerRequestModelCopyWith<_DekontIslemlerRequestModel> get copyWith => __$DekontIslemlerRequestModelCopyWithImpl<_DekontIslemlerRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DekontIslemlerRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$DekontIslemlerRequestModelCopyWith<$Res> implements $DekontIslemlerRequestModelCopyWith<$Res> {
  factory _$DekontIslemlerRequestModelCopyWith(_DekontIslemlerRequestModel value, $Res Function(_DekontIslemlerRequestModel) _then) = __$DekontIslemlerRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? dekontIslemTuru, String? dekontSeri, String? guid, List<DekontKalemler>? kalemler, String? plasiyerKodu, String? projeKodu, String? tag, DateTime? tarih,@JsonKey(name: "_YeniKayit") bool? yeniKayit, int? dekontNo,@JsonKey(includeFromJson: false, includeToJson: false) String? seriAdi,@JsonKey(includeFromJson: false, includeToJson: false) String? plasiyerAdi,@JsonKey(includeFromJson: false, includeToJson: false) String? projeAdi
});




}
/// @nodoc
class __$DekontIslemlerRequestModelCopyWithImpl<$Res>
    implements _$DekontIslemlerRequestModelCopyWith<$Res> {
  __$DekontIslemlerRequestModelCopyWithImpl(this._self, this._then);

  final _DekontIslemlerRequestModel _self;
  final $Res Function(_DekontIslemlerRequestModel) _then;

/// Create a copy of DekontIslemlerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dekontIslemTuru = freezed,Object? dekontSeri = freezed,Object? guid = freezed,Object? kalemler = freezed,Object? plasiyerKodu = freezed,Object? projeKodu = freezed,Object? tag = freezed,Object? tarih = freezed,Object? yeniKayit = freezed,Object? dekontNo = freezed,Object? seriAdi = freezed,Object? plasiyerAdi = freezed,Object? projeAdi = freezed,}) {
  return _then(_DekontIslemlerRequestModel(
dekontIslemTuru: freezed == dekontIslemTuru ? _self.dekontIslemTuru : dekontIslemTuru // ignore: cast_nullable_to_non_nullable
as String?,dekontSeri: freezed == dekontSeri ? _self.dekontSeri : dekontSeri // ignore: cast_nullable_to_non_nullable
as String?,guid: freezed == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String?,kalemler: freezed == kalemler ? _self.kalemler : kalemler // ignore: cast_nullable_to_non_nullable
as List<DekontKalemler>?,plasiyerKodu: freezed == plasiyerKodu ? _self.plasiyerKodu : plasiyerKodu // ignore: cast_nullable_to_non_nullable
as String?,projeKodu: freezed == projeKodu ? _self.projeKodu : projeKodu // ignore: cast_nullable_to_non_nullable
as String?,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,yeniKayit: freezed == yeniKayit ? _self.yeniKayit : yeniKayit // ignore: cast_nullable_to_non_nullable
as bool?,dekontNo: freezed == dekontNo ? _self.dekontNo : dekontNo // ignore: cast_nullable_to_non_nullable
as int?,seriAdi: freezed == seriAdi ? _self.seriAdi : seriAdi // ignore: cast_nullable_to_non_nullable
as String?,plasiyerAdi: freezed == plasiyerAdi ? _self.plasiyerAdi : plasiyerAdi // ignore: cast_nullable_to_non_nullable
as String?,projeAdi: freezed == projeAdi ? _self.projeAdi : projeAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
