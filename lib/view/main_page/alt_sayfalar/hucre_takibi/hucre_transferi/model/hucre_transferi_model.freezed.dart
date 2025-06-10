// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hucre_transferi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HucreTransferiModel {

 int? get depoKodu; set depoKodu(int? value);@JsonKey(includeFromJson: false, includeToJson: false) String? get depoTanimi;@JsonKey(includeFromJson: false, includeToJson: false) set depoTanimi(String? value);@JsonKey(includeFromJson: false, includeToJson: false) BelgeRehberiModel? get belgeModel;@JsonKey(includeFromJson: false, includeToJson: false) set belgeModel(BelgeRehberiModel? value); String? get hedefHucre; set hedefHucre(String? value); String? get hucreKodu; set hucreKodu(String? value); String? get islemTuru; set islemTuru(String? value); String? get pickerBelgeTuru; set pickerBelgeTuru(String? value); double? get miktar; set miktar(double? value); String? get stokKodu; set stokKodu(String? value); String? get stokAdi; set stokAdi(String? value); String? get paketKodu; set paketKodu(String? value); String? get belgeTuru; set belgeTuru(String? value); String? get belgeNo; set belgeNo(String? value); String? get cariKodu; set cariKodu(String? value);
/// Create a copy of HucreTransferiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HucreTransferiModelCopyWith<HucreTransferiModel> get copyWith => _$HucreTransferiModelCopyWithImpl<HucreTransferiModel>(this as HucreTransferiModel, _$identity);

  /// Serializes this HucreTransferiModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $HucreTransferiModelCopyWith<$Res>  {
  factory $HucreTransferiModelCopyWith(HucreTransferiModel value, $Res Function(HucreTransferiModel) _then) = _$HucreTransferiModelCopyWithImpl;
@useResult
$Res call({
 int? depoKodu,@JsonKey(includeFromJson: false, includeToJson: false) String? depoTanimi,@JsonKey(includeFromJson: false, includeToJson: false) BelgeRehberiModel? belgeModel, String? hedefHucre, String? hucreKodu, String? islemTuru, String? pickerBelgeTuru, double? miktar, String? stokKodu, String? stokAdi, String? paketKodu, String? belgeTuru, String? belgeNo, String? cariKodu
});


$BelgeRehberiModelCopyWith<$Res>? get belgeModel;

}
/// @nodoc
class _$HucreTransferiModelCopyWithImpl<$Res>
    implements $HucreTransferiModelCopyWith<$Res> {
  _$HucreTransferiModelCopyWithImpl(this._self, this._then);

  final HucreTransferiModel _self;
  final $Res Function(HucreTransferiModel) _then;

/// Create a copy of HucreTransferiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? depoKodu = freezed,Object? depoTanimi = freezed,Object? belgeModel = freezed,Object? hedefHucre = freezed,Object? hucreKodu = freezed,Object? islemTuru = freezed,Object? pickerBelgeTuru = freezed,Object? miktar = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? paketKodu = freezed,Object? belgeTuru = freezed,Object? belgeNo = freezed,Object? cariKodu = freezed,}) {
  return _then(_self.copyWith(
depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,depoTanimi: freezed == depoTanimi ? _self.depoTanimi : depoTanimi // ignore: cast_nullable_to_non_nullable
as String?,belgeModel: freezed == belgeModel ? _self.belgeModel : belgeModel // ignore: cast_nullable_to_non_nullable
as BelgeRehberiModel?,hedefHucre: freezed == hedefHucre ? _self.hedefHucre : hedefHucre // ignore: cast_nullable_to_non_nullable
as String?,hucreKodu: freezed == hucreKodu ? _self.hucreKodu : hucreKodu // ignore: cast_nullable_to_non_nullable
as String?,islemTuru: freezed == islemTuru ? _self.islemTuru : islemTuru // ignore: cast_nullable_to_non_nullable
as String?,pickerBelgeTuru: freezed == pickerBelgeTuru ? _self.pickerBelgeTuru : pickerBelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,paketKodu: freezed == paketKodu ? _self.paketKodu : paketKodu // ignore: cast_nullable_to_non_nullable
as String?,belgeTuru: freezed == belgeTuru ? _self.belgeTuru : belgeTuru // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HucreTransferiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BelgeRehberiModelCopyWith<$Res>? get belgeModel {
    if (_self.belgeModel == null) {
    return null;
  }

  return $BelgeRehberiModelCopyWith<$Res>(_self.belgeModel!, (value) {
    return _then(_self.copyWith(belgeModel: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _HucreTransferiModel implements HucreTransferiModel {
   _HucreTransferiModel({this.depoKodu, @JsonKey(includeFromJson: false, includeToJson: false) this.depoTanimi, @JsonKey(includeFromJson: false, includeToJson: false) this.belgeModel, this.hedefHucre, this.hucreKodu, this.islemTuru, this.pickerBelgeTuru, this.miktar, this.stokKodu, this.stokAdi, this.paketKodu, this.belgeTuru, this.belgeNo, this.cariKodu});
  factory _HucreTransferiModel.fromJson(Map<String, dynamic> json) => _$HucreTransferiModelFromJson(json);

@override  int? depoKodu;
@override@JsonKey(includeFromJson: false, includeToJson: false)  String? depoTanimi;
@override@JsonKey(includeFromJson: false, includeToJson: false)  BelgeRehberiModel? belgeModel;
@override  String? hedefHucre;
@override  String? hucreKodu;
@override  String? islemTuru;
@override  String? pickerBelgeTuru;
@override  double? miktar;
@override  String? stokKodu;
@override  String? stokAdi;
@override  String? paketKodu;
@override  String? belgeTuru;
@override  String? belgeNo;
@override  String? cariKodu;

/// Create a copy of HucreTransferiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HucreTransferiModelCopyWith<_HucreTransferiModel> get copyWith => __$HucreTransferiModelCopyWithImpl<_HucreTransferiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HucreTransferiModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$HucreTransferiModelCopyWith<$Res> implements $HucreTransferiModelCopyWith<$Res> {
  factory _$HucreTransferiModelCopyWith(_HucreTransferiModel value, $Res Function(_HucreTransferiModel) _then) = __$HucreTransferiModelCopyWithImpl;
@override @useResult
$Res call({
 int? depoKodu,@JsonKey(includeFromJson: false, includeToJson: false) String? depoTanimi,@JsonKey(includeFromJson: false, includeToJson: false) BelgeRehberiModel? belgeModel, String? hedefHucre, String? hucreKodu, String? islemTuru, String? pickerBelgeTuru, double? miktar, String? stokKodu, String? stokAdi, String? paketKodu, String? belgeTuru, String? belgeNo, String? cariKodu
});


@override $BelgeRehberiModelCopyWith<$Res>? get belgeModel;

}
/// @nodoc
class __$HucreTransferiModelCopyWithImpl<$Res>
    implements _$HucreTransferiModelCopyWith<$Res> {
  __$HucreTransferiModelCopyWithImpl(this._self, this._then);

  final _HucreTransferiModel _self;
  final $Res Function(_HucreTransferiModel) _then;

/// Create a copy of HucreTransferiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? depoKodu = freezed,Object? depoTanimi = freezed,Object? belgeModel = freezed,Object? hedefHucre = freezed,Object? hucreKodu = freezed,Object? islemTuru = freezed,Object? pickerBelgeTuru = freezed,Object? miktar = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? paketKodu = freezed,Object? belgeTuru = freezed,Object? belgeNo = freezed,Object? cariKodu = freezed,}) {
  return _then(_HucreTransferiModel(
depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,depoTanimi: freezed == depoTanimi ? _self.depoTanimi : depoTanimi // ignore: cast_nullable_to_non_nullable
as String?,belgeModel: freezed == belgeModel ? _self.belgeModel : belgeModel // ignore: cast_nullable_to_non_nullable
as BelgeRehberiModel?,hedefHucre: freezed == hedefHucre ? _self.hedefHucre : hedefHucre // ignore: cast_nullable_to_non_nullable
as String?,hucreKodu: freezed == hucreKodu ? _self.hucreKodu : hucreKodu // ignore: cast_nullable_to_non_nullable
as String?,islemTuru: freezed == islemTuru ? _self.islemTuru : islemTuru // ignore: cast_nullable_to_non_nullable
as String?,pickerBelgeTuru: freezed == pickerBelgeTuru ? _self.pickerBelgeTuru : pickerBelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as double?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,paketKodu: freezed == paketKodu ? _self.paketKodu : paketKodu // ignore: cast_nullable_to_non_nullable
as String?,belgeTuru: freezed == belgeTuru ? _self.belgeTuru : belgeTuru // ignore: cast_nullable_to_non_nullable
as String?,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,cariKodu: freezed == cariKodu ? _self.cariKodu : cariKodu // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HucreTransferiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BelgeRehberiModelCopyWith<$Res>? get belgeModel {
    if (_self.belgeModel == null) {
    return null;
  }

  return $BelgeRehberiModelCopyWith<$Res>(_self.belgeModel!, (value) {
    return _then(_self.copyWith(belgeModel: value));
  });
}
}

// dart format on
