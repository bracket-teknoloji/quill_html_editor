// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hucre_listesi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HucreListesiModel {

 String? get hucreKodu; int? get depoKodu; String? get depoTanimi;@JsonKey(name: "SeriList") List<dynamic>? get seriList; bool? get eksiyeDusebilir; int? get netMiktar; String? get stokKodu; String? get stokAdi;
/// Create a copy of HucreListesiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HucreListesiModelCopyWith<HucreListesiModel> get copyWith => _$HucreListesiModelCopyWithImpl<HucreListesiModel>(this as HucreListesiModel, _$identity);

  /// Serializes this HucreListesiModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HucreListesiModel&&super == other&&(identical(other.hucreKodu, hucreKodu) || other.hucreKodu == hucreKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.depoTanimi, depoTanimi) || other.depoTanimi == depoTanimi)&&const DeepCollectionEquality().equals(other.seriList, seriList)&&(identical(other.eksiyeDusebilir, eksiyeDusebilir) || other.eksiyeDusebilir == eksiyeDusebilir)&&(identical(other.netMiktar, netMiktar) || other.netMiktar == netMiktar)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hucreKodu,depoKodu,depoTanimi,const DeepCollectionEquality().hash(seriList),eksiyeDusebilir,netMiktar,stokKodu,stokAdi);



}

/// @nodoc
abstract mixin class $HucreListesiModelCopyWith<$Res>  {
  factory $HucreListesiModelCopyWith(HucreListesiModel value, $Res Function(HucreListesiModel) _then) = _$HucreListesiModelCopyWithImpl;
@useResult
$Res call({
 String? hucreKodu, int? depoKodu, String? depoTanimi,@JsonKey(name: "SeriList") List<dynamic>? seriList, bool? eksiyeDusebilir, int? netMiktar, String? stokKodu, String? stokAdi
});




}
/// @nodoc
class _$HucreListesiModelCopyWithImpl<$Res>
    implements $HucreListesiModelCopyWith<$Res> {
  _$HucreListesiModelCopyWithImpl(this._self, this._then);

  final HucreListesiModel _self;
  final $Res Function(HucreListesiModel) _then;

/// Create a copy of HucreListesiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hucreKodu = freezed,Object? depoKodu = freezed,Object? depoTanimi = freezed,Object? seriList = freezed,Object? eksiyeDusebilir = freezed,Object? netMiktar = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,}) {
  return _then(_self.copyWith(
hucreKodu: freezed == hucreKodu ? _self.hucreKodu : hucreKodu // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,depoTanimi: freezed == depoTanimi ? _self.depoTanimi : depoTanimi // ignore: cast_nullable_to_non_nullable
as String?,seriList: freezed == seriList ? _self.seriList : seriList // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,eksiyeDusebilir: freezed == eksiyeDusebilir ? _self.eksiyeDusebilir : eksiyeDusebilir // ignore: cast_nullable_to_non_nullable
as bool?,netMiktar: freezed == netMiktar ? _self.netMiktar : netMiktar // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HucreListesiModel extends HucreListesiModel {
   _HucreListesiModel({this.hucreKodu, this.depoKodu, this.depoTanimi, @JsonKey(name: "SeriList") final  List<dynamic>? seriList, this.eksiyeDusebilir, this.netMiktar, this.stokKodu, this.stokAdi}): _seriList = seriList,super._();
  factory _HucreListesiModel.fromJson(Map<String, dynamic> json) => _$HucreListesiModelFromJson(json);

@override final  String? hucreKodu;
@override final  int? depoKodu;
@override final  String? depoTanimi;
 final  List<dynamic>? _seriList;
@override@JsonKey(name: "SeriList") List<dynamic>? get seriList {
  final value = _seriList;
  if (value == null) return null;
  if (_seriList is EqualUnmodifiableListView) return _seriList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? eksiyeDusebilir;
@override final  int? netMiktar;
@override final  String? stokKodu;
@override final  String? stokAdi;

/// Create a copy of HucreListesiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HucreListesiModelCopyWith<_HucreListesiModel> get copyWith => __$HucreListesiModelCopyWithImpl<_HucreListesiModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HucreListesiModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HucreListesiModel&&super == other&&(identical(other.hucreKodu, hucreKodu) || other.hucreKodu == hucreKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.depoTanimi, depoTanimi) || other.depoTanimi == depoTanimi)&&const DeepCollectionEquality().equals(other._seriList, _seriList)&&(identical(other.eksiyeDusebilir, eksiyeDusebilir) || other.eksiyeDusebilir == eksiyeDusebilir)&&(identical(other.netMiktar, netMiktar) || other.netMiktar == netMiktar)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hucreKodu,depoKodu,depoTanimi,const DeepCollectionEquality().hash(_seriList),eksiyeDusebilir,netMiktar,stokKodu,stokAdi);



}

/// @nodoc
abstract mixin class _$HucreListesiModelCopyWith<$Res> implements $HucreListesiModelCopyWith<$Res> {
  factory _$HucreListesiModelCopyWith(_HucreListesiModel value, $Res Function(_HucreListesiModel) _then) = __$HucreListesiModelCopyWithImpl;
@override @useResult
$Res call({
 String? hucreKodu, int? depoKodu, String? depoTanimi,@JsonKey(name: "SeriList") List<dynamic>? seriList, bool? eksiyeDusebilir, int? netMiktar, String? stokKodu, String? stokAdi
});




}
/// @nodoc
class __$HucreListesiModelCopyWithImpl<$Res>
    implements _$HucreListesiModelCopyWith<$Res> {
  __$HucreListesiModelCopyWithImpl(this._self, this._then);

  final _HucreListesiModel _self;
  final $Res Function(_HucreListesiModel) _then;

/// Create a copy of HucreListesiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hucreKodu = freezed,Object? depoKodu = freezed,Object? depoTanimi = freezed,Object? seriList = freezed,Object? eksiyeDusebilir = freezed,Object? netMiktar = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,}) {
  return _then(_HucreListesiModel(
hucreKodu: freezed == hucreKodu ? _self.hucreKodu : hucreKodu // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,depoTanimi: freezed == depoTanimi ? _self.depoTanimi : depoTanimi // ignore: cast_nullable_to_non_nullable
as String?,seriList: freezed == seriList ? _self._seriList : seriList // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,eksiyeDusebilir: freezed == eksiyeDusebilir ? _self.eksiyeDusebilir : eksiyeDusebilir // ignore: cast_nullable_to_non_nullable
as bool?,netMiktar: freezed == netMiktar ? _self.netMiktar : netMiktar // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
