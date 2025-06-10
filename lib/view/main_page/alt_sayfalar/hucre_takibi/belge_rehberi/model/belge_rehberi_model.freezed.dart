// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'belge_rehberi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BelgeRehberiModel {

 String? get belgeNo; String? get belgeTipi; String? get cariKodu; String? get cariAdi; DateTime? get tarih; int? get depoKodu; String? get depoTanimi; double? get kalemSayisi;
/// Create a copy of BelgeRehberiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BelgeRehberiModelCopyWith<BelgeRehberiModel> get copyWith => _$BelgeRehberiModelCopyWithImpl<BelgeRehberiModel>(this as BelgeRehberiModel, _$identity);

  /// Serializes this BelgeRehberiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BelgeRehberiModel&&super == other&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo)&&(identical(other.belgeTipi, belgeTipi) || other.belgeTipi == belgeTipi)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.cariAdi, cariAdi) || other.cariAdi == cariAdi)&&(identical(other.tarih, tarih) || other.tarih == tarih)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.depoTanimi, depoTanimi) || other.depoTanimi == depoTanimi)&&(identical(other.kalemSayisi, kalemSayisi) || other.kalemSayisi == kalemSayisi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,belgeNo,belgeTipi,cariKodu,cariAdi,tarih,depoKodu,depoTanimi,kalemSayisi);



}

/// @nodoc
abstract mixin class $BelgeRehberiModelCopyWith<$Res>  {
  factory $BelgeRehberiModelCopyWith(BelgeRehberiModel value, $Res Function(BelgeRehberiModel) _then) = _$BelgeRehberiModelCopyWithImpl;
@useResult
$Res call({
 String? belgeNo, String? belgeTipi, String? cariKodu, String? cariAdi, DateTime? tarih, int? depoKodu, String? depoTanimi, double? kalemSayisi
});




}
/// @nodoc
class _$BelgeRehberiModelCopyWithImpl<$Res>
    implements $BelgeRehberiModelCopyWith<$Res> {
  _$BelgeRehberiModelCopyWithImpl(this._self, this._then);

  final BelgeRehberiModel _self;
  final $Res Function(BelgeRehberiModel) _then;

/// Create a copy of BelgeRehberiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? cariKodu = freezed,Object? cariAdi = freezed,Object? tarih = freezed,Object? depoKodu = freezed,Object? depoTanimi = freezed,Object? kalemSayisi = freezed,}) {
  return _then(_self.copyWith(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,cariAdi: freezed == cariAdi ? _self.cariAdi : cariAdi // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,depoTanimi: freezed == depoTanimi ? _self.depoTanimi : depoTanimi // ignore: cast_nullable_to_non_nullable
as String?,kalemSayisi: freezed == kalemSayisi ? _self.kalemSayisi : kalemSayisi // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BelgeRehberiModel extends BelgeRehberiModel {
   _BelgeRehberiModel({this.belgeNo, this.belgeTipi, this.cariKodu, this.cariAdi, this.tarih, this.depoKodu, this.depoTanimi, this.kalemSayisi}): super._();
  factory _BelgeRehberiModel.fromJson(Map<String, dynamic> json) => _$BelgeRehberiModelFromJson(json);

@override final  String? belgeNo;
@override final  String? belgeTipi;
@override final  String? cariKodu;
@override final  String? cariAdi;
@override final  DateTime? tarih;
@override final  int? depoKodu;
@override final  String? depoTanimi;
@override final  double? kalemSayisi;

/// Create a copy of BelgeRehberiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BelgeRehberiModelCopyWith<_BelgeRehberiModel> get copyWith => __$BelgeRehberiModelCopyWithImpl<_BelgeRehberiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BelgeRehberiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BelgeRehberiModel&&super == other&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo)&&(identical(other.belgeTipi, belgeTipi) || other.belgeTipi == belgeTipi)&&(identical(other.cariKodu, cariKodu) || other.cariKodu == cariKodu)&&(identical(other.cariAdi, cariAdi) || other.cariAdi == cariAdi)&&(identical(other.tarih, tarih) || other.tarih == tarih)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.depoTanimi, depoTanimi) || other.depoTanimi == depoTanimi)&&(identical(other.kalemSayisi, kalemSayisi) || other.kalemSayisi == kalemSayisi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,belgeNo,belgeTipi,cariKodu,cariAdi,tarih,depoKodu,depoTanimi,kalemSayisi);



}

/// @nodoc
abstract mixin class _$BelgeRehberiModelCopyWith<$Res> implements $BelgeRehberiModelCopyWith<$Res> {
  factory _$BelgeRehberiModelCopyWith(_BelgeRehberiModel value, $Res Function(_BelgeRehberiModel) _then) = __$BelgeRehberiModelCopyWithImpl;
@override @useResult
$Res call({
 String? belgeNo, String? belgeTipi, String? cariKodu, String? cariAdi, DateTime? tarih, int? depoKodu, String? depoTanimi, double? kalemSayisi
});




}
/// @nodoc
class __$BelgeRehberiModelCopyWithImpl<$Res>
    implements _$BelgeRehberiModelCopyWith<$Res> {
  __$BelgeRehberiModelCopyWithImpl(this._self, this._then);

  final _BelgeRehberiModel _self;
  final $Res Function(_BelgeRehberiModel) _then;

/// Create a copy of BelgeRehberiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? belgeNo = freezed,Object? belgeTipi = freezed,Object? cariKodu = freezed,Object? cariAdi = freezed,Object? tarih = freezed,Object? depoKodu = freezed,Object? depoTanimi = freezed,Object? kalemSayisi = freezed,}) {
  return _then(_BelgeRehberiModel(
belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,belgeTipi: freezed == belgeTipi ? _self.belgeTipi : belgeTipi // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,cariAdi: freezed == cariAdi ? _self.cariAdi : cariAdi // ignore: cast_nullable_to_non_nullable
as String?,tarih: freezed == tarih ? _self.tarih : tarih // ignore: cast_nullable_to_non_nullable
as DateTime?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,depoTanimi: freezed == depoTanimi ? _self.depoTanimi : depoTanimi // ignore: cast_nullable_to_non_nullable
as String?,kalemSayisi: freezed == kalemSayisi ? _self.kalemSayisi : kalemSayisi // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
