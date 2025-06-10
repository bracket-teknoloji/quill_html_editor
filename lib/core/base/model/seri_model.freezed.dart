// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seri_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriModel {

 String? get seriNo; String? get aciklama; String? get stokKodu; String? get stokAdi; int? get depoKodu; int? get miktar; String? get depoTanimi;
/// Create a copy of SeriModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriModelCopyWith<SeriModel> get copyWith => _$SeriModelCopyWithImpl<SeriModel>(this as SeriModel, _$identity);

  /// Serializes this SeriModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriModel&&super == other&&(identical(other.seriNo, seriNo) || other.seriNo == seriNo)&&(identical(other.aciklama, aciklama) || other.aciklama == aciklama)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.miktar, miktar) || other.miktar == miktar)&&(identical(other.depoTanimi, depoTanimi) || other.depoTanimi == depoTanimi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seriNo,aciklama,stokKodu,stokAdi,depoKodu,miktar,depoTanimi);



}

/// @nodoc
abstract mixin class $SeriModelCopyWith<$Res>  {
  factory $SeriModelCopyWith(SeriModel value, $Res Function(SeriModel) _then) = _$SeriModelCopyWithImpl;
@useResult
$Res call({
 String? seriNo, String? aciklama, String? stokKodu, String? stokAdi, int? depoKodu, int? miktar, String? depoTanimi
});




}
/// @nodoc
class _$SeriModelCopyWithImpl<$Res>
    implements $SeriModelCopyWith<$Res> {
  _$SeriModelCopyWithImpl(this._self, this._then);

  final SeriModel _self;
  final $Res Function(SeriModel) _then;

/// Create a copy of SeriModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seriNo = freezed,Object? aciklama = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? depoKodu = freezed,Object? miktar = freezed,Object? depoTanimi = freezed,}) {
  return _then(_self.copyWith(
seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as int?,depoTanimi: freezed == depoTanimi ? _self.depoTanimi : depoTanimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SeriModel extends SeriModel {
   _SeriModel({this.seriNo, this.aciklama, this.stokKodu, this.stokAdi, this.depoKodu, this.miktar, this.depoTanimi}): super._();
  factory _SeriModel.fromJson(Map<String, dynamic> json) => _$SeriModelFromJson(json);

@override final  String? seriNo;
@override final  String? aciklama;
@override final  String? stokKodu;
@override final  String? stokAdi;
@override final  int? depoKodu;
@override final  int? miktar;
@override final  String? depoTanimi;

/// Create a copy of SeriModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriModelCopyWith<_SeriModel> get copyWith => __$SeriModelCopyWithImpl<_SeriModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriModel&&super == other&&(identical(other.seriNo, seriNo) || other.seriNo == seriNo)&&(identical(other.aciklama, aciklama) || other.aciklama == aciklama)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.miktar, miktar) || other.miktar == miktar)&&(identical(other.depoTanimi, depoTanimi) || other.depoTanimi == depoTanimi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seriNo,aciklama,stokKodu,stokAdi,depoKodu,miktar,depoTanimi);



}

/// @nodoc
abstract mixin class _$SeriModelCopyWith<$Res> implements $SeriModelCopyWith<$Res> {
  factory _$SeriModelCopyWith(_SeriModel value, $Res Function(_SeriModel) _then) = __$SeriModelCopyWithImpl;
@override @useResult
$Res call({
 String? seriNo, String? aciklama, String? stokKodu, String? stokAdi, int? depoKodu, int? miktar, String? depoTanimi
});




}
/// @nodoc
class __$SeriModelCopyWithImpl<$Res>
    implements _$SeriModelCopyWith<$Res> {
  __$SeriModelCopyWithImpl(this._self, this._then);

  final _SeriModel _self;
  final $Res Function(_SeriModel) _then;

/// Create a copy of SeriModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seriNo = freezed,Object? aciklama = freezed,Object? stokKodu = freezed,Object? stokAdi = freezed,Object? depoKodu = freezed,Object? miktar = freezed,Object? depoTanimi = freezed,}) {
  return _then(_SeriModel(
seriNo: freezed == seriNo ? _self.seriNo : seriNo // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,miktar: freezed == miktar ? _self.miktar : miktar // ignore: cast_nullable_to_non_nullable
as int?,depoTanimi: freezed == depoTanimi ? _self.depoTanimi : depoTanimi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
