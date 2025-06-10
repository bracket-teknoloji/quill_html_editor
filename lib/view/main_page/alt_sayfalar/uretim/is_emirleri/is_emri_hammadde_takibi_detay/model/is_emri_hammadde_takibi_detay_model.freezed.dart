// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'is_emri_hammadde_takibi_detay_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IsEmriHammaddeTakibiDetayModel {

 String? get hamKodu; set hamKodu(String? value); String? get hamAdi; set hamAdi(String? value); int? get miktar; set miktar(int? value); List<Referanslar>? get referanslar; set referanslar(List<Referanslar>? value);
/// Create a copy of IsEmriHammaddeTakibiDetayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsEmriHammaddeTakibiDetayModelCopyWith<IsEmriHammaddeTakibiDetayModel> get copyWith => _$IsEmriHammaddeTakibiDetayModelCopyWithImpl<IsEmriHammaddeTakibiDetayModel>(this as IsEmriHammaddeTakibiDetayModel, _$identity);

  /// Serializes this IsEmriHammaddeTakibiDetayModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $IsEmriHammaddeTakibiDetayModelCopyWith<$Res>  {
  factory $IsEmriHammaddeTakibiDetayModelCopyWith(IsEmriHammaddeTakibiDetayModel value, $Res Function(IsEmriHammaddeTakibiDetayModel) _then) = _$IsEmriHammaddeTakibiDetayModelCopyWithImpl;
@useResult
$Res call({
 String? hamKodu, String? hamAdi, int? miktar, List<Referanslar>? referanslar
});




}
/// @nodoc
class _$IsEmriHammaddeTakibiDetayModelCopyWithImpl<$Res>
    implements $IsEmriHammaddeTakibiDetayModelCopyWith<$Res> {
  _$IsEmriHammaddeTakibiDetayModelCopyWithImpl(this._self, this._then);

  final IsEmriHammaddeTakibiDetayModel _self;
  final $Res Function(IsEmriHammaddeTakibiDetayModel) _then;

/// Create a copy of IsEmriHammaddeTakibiDetayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hamKodu = freezed,Object? hamAdi = freezed,Object? miktar = freezed,Object? referanslar = freezed,}) {
  return _then(_self.copyWith(
hamKodu: freezed == hamKodu ? _self.hamKodu : hamKodu // ignore: cast_nullable_to_non_nullable
as String?,hamAdi: freezed == hamAdi ? _self.hamAdi : hamAdi // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as int?,referanslar: freezed == referanslar ? _self.referanslar : referanslar // ignore: cast_nullable_to_non_nullable
as List<Referanslar>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IsEmriHammaddeTakibiDetayModel extends IsEmriHammaddeTakibiDetayModel {
   _IsEmriHammaddeTakibiDetayModel({this.hamKodu, this.hamAdi, this.miktar, this.referanslar}): super._();
  factory _IsEmriHammaddeTakibiDetayModel.fromJson(Map<String, dynamic> json) => _$IsEmriHammaddeTakibiDetayModelFromJson(json);

@override  String? hamKodu;
@override  String? hamAdi;
@override  int? miktar;
@override  List<Referanslar>? referanslar;

/// Create a copy of IsEmriHammaddeTakibiDetayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsEmriHammaddeTakibiDetayModelCopyWith<_IsEmriHammaddeTakibiDetayModel> get copyWith => __$IsEmriHammaddeTakibiDetayModelCopyWithImpl<_IsEmriHammaddeTakibiDetayModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IsEmriHammaddeTakibiDetayModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$IsEmriHammaddeTakibiDetayModelCopyWith<$Res> implements $IsEmriHammaddeTakibiDetayModelCopyWith<$Res> {
  factory _$IsEmriHammaddeTakibiDetayModelCopyWith(_IsEmriHammaddeTakibiDetayModel value, $Res Function(_IsEmriHammaddeTakibiDetayModel) _then) = __$IsEmriHammaddeTakibiDetayModelCopyWithImpl;
@override @useResult
$Res call({
 String? hamKodu, String? hamAdi, int? miktar, List<Referanslar>? referanslar
});




}
/// @nodoc
class __$IsEmriHammaddeTakibiDetayModelCopyWithImpl<$Res>
    implements _$IsEmriHammaddeTakibiDetayModelCopyWith<$Res> {
  __$IsEmriHammaddeTakibiDetayModelCopyWithImpl(this._self, this._then);

  final _IsEmriHammaddeTakibiDetayModel _self;
  final $Res Function(_IsEmriHammaddeTakibiDetayModel) _then;

/// Create a copy of IsEmriHammaddeTakibiDetayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hamKodu = freezed,Object? hamAdi = freezed,Object? miktar = freezed,Object? referanslar = freezed,}) {
  return _then(_IsEmriHammaddeTakibiDetayModel(
hamKodu: freezed == hamKodu ? _self.hamKodu : hamKodu // ignore: cast_nullable_to_non_nullable
as String?,hamAdi: freezed == hamAdi ? _self.hamAdi : hamAdi // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as int?,referanslar: freezed == referanslar ? _self.referanslar : referanslar // ignore: cast_nullable_to_non_nullable
as List<Referanslar>?,
  ));
}


}


/// @nodoc
mixin _$Referanslar {

 int? get id; set id(int? value); String? get hammaddeNo; set hammaddeNo(String? value); String? get stokKodu; set stokKodu(String? value); String? get stokAdi; set stokAdi(String? value); String? get referansStokKodu; set referansStokKodu(String? value); String? get referansStokAdi; set referansStokAdi(String? value);
/// Create a copy of Referanslar
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferanslarCopyWith<Referanslar> get copyWith => _$ReferanslarCopyWithImpl<Referanslar>(this as Referanslar, _$identity);

  /// Serializes this Referanslar to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $ReferanslarCopyWith<$Res>  {
  factory $ReferanslarCopyWith(Referanslar value, $Res Function(Referanslar) _then) = _$ReferanslarCopyWithImpl;
@useResult
$Res call({
 int? id, String? hammaddeNo, String? stokKodu, String? stokAdi, String? referansStokKodu, String? referansStokAdi
});




}
/// @nodoc
class _$ReferanslarCopyWithImpl<$Res>
    implements $ReferanslarCopyWith<$Res> {
  _$ReferanslarCopyWithImpl(this._self, this._then);

  final Referanslar _self;
  final $Res Function(Referanslar) _then;

/// Create a copy of Referanslar
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? hammaddeNo = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? referansStokKodu = freezed,Object? referansStokAdi = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,hammaddeNo: freezed == hammaddeNo ? _self.hammaddeNo : hammaddeNo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,referansStokKodu: freezed == referansStokKodu ? _self.referansStokKodu : referansStokKodu // ignore: cast_nullable_to_non_nullable
as String?,referansStokAdi: freezed == referansStokAdi ? _self.referansStokAdi : referansStokAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Referanslar implements Referanslar {
   _Referanslar({this.id, this.hammaddeNo, this.stokKodu, this.stokAdi, this.referansStokKodu, this.referansStokAdi});
  factory _Referanslar.fromJson(Map<String, dynamic> json) => _$ReferanslarFromJson(json);

@override  int? id;
@override  String? hammaddeNo;
@override  String? stokKodu;
@override  String? stokAdi;
@override  String? referansStokKodu;
@override  String? referansStokAdi;

/// Create a copy of Referanslar
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferanslarCopyWith<_Referanslar> get copyWith => __$ReferanslarCopyWithImpl<_Referanslar>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferanslarToJson(this, );
}





}

/// @nodoc
abstract mixin class _$ReferanslarCopyWith<$Res> implements $ReferanslarCopyWith<$Res> {
  factory _$ReferanslarCopyWith(_Referanslar value, $Res Function(_Referanslar) _then) = __$ReferanslarCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? hammaddeNo, String? stokKodu, String? stokAdi, String? referansStokKodu, String? referansStokAdi
});




}
/// @nodoc
class __$ReferanslarCopyWithImpl<$Res>
    implements _$ReferanslarCopyWith<$Res> {
  __$ReferanslarCopyWithImpl(this._self, this._then);

  final _Referanslar _self;
  final $Res Function(_Referanslar) _then;

/// Create a copy of Referanslar
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? hammaddeNo = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? referansStokKodu = freezed,Object? referansStokAdi = freezed,}) {
  return _then(_Referanslar(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,hammaddeNo: freezed == hammaddeNo ? _self.hammaddeNo : hammaddeNo // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,referansStokKodu: freezed == referansStokKodu ? _self.referansStokKodu : referansStokKodu // ignore: cast_nullable_to_non_nullable
as String?,referansStokAdi: freezed == referansStokAdi ? _self.referansStokAdi : referansStokAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
