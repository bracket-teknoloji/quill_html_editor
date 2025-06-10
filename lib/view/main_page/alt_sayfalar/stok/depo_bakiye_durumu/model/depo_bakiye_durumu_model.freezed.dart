// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'depo_bakiye_durumu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepoBakiyeDurumuModel {

 int? get subeKodu; int? get depoKodu; String? get stokKodu; double? get giris; double? get cikis; double? get bakiye; String? get subeAdi; String? get stokAdi; String? get depoAdi;
/// Create a copy of DepoBakiyeDurumuModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepoBakiyeDurumuModelCopyWith<DepoBakiyeDurumuModel> get copyWith => _$DepoBakiyeDurumuModelCopyWithImpl<DepoBakiyeDurumuModel>(this as DepoBakiyeDurumuModel, _$identity);

  /// Serializes this DepoBakiyeDurumuModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepoBakiyeDurumuModel&&super == other&&(identical(other.subeKodu, subeKodu) || other.subeKodu == subeKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.giris, giris) || other.giris == giris)&&(identical(other.cikis, cikis) || other.cikis == cikis)&&(identical(other.bakiye, bakiye) || other.bakiye == bakiye)&&(identical(other.subeAdi, subeAdi) || other.subeAdi == subeAdi)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi)&&(identical(other.depoAdi, depoAdi) || other.depoAdi == depoAdi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subeKodu,depoKodu,stokKodu,giris,cikis,bakiye,subeAdi,stokAdi,depoAdi);



}

/// @nodoc
abstract mixin class $DepoBakiyeDurumuModelCopyWith<$Res>  {
  factory $DepoBakiyeDurumuModelCopyWith(DepoBakiyeDurumuModel value, $Res Function(DepoBakiyeDurumuModel) _then) = _$DepoBakiyeDurumuModelCopyWithImpl;
@useResult
$Res call({
 int? subeKodu, int? depoKodu, String? stokKodu, double? giris, double? cikis, double? bakiye, String? subeAdi, String? stokAdi, String? depoAdi
});




}
/// @nodoc
class _$DepoBakiyeDurumuModelCopyWithImpl<$Res>
    implements $DepoBakiyeDurumuModelCopyWith<$Res> {
  _$DepoBakiyeDurumuModelCopyWithImpl(this._self, this._then);

  final DepoBakiyeDurumuModel _self;
  final $Res Function(DepoBakiyeDurumuModel) _then;

/// Create a copy of DepoBakiyeDurumuModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subeKodu = freezed,Object? depoKodu = freezed,Object? stokKodu = freezed,Object? giris = freezed,Object? cikis = freezed,Object? bakiye = freezed,Object? subeAdi = freezed,Object? stokAdi = freezed,Object? depoAdi = freezed,}) {
  return _then(_self.copyWith(
subeKodu: freezed == subeKodu ? _self.subeKodu : subeKodu // ignore: cast_nullable_to_non_nullable
as int?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,giris: freezed == giris ? _self.giris : giris // ignore: cast_nullable_to_non_nullable
as double?,cikis: freezed == cikis ? _self.cikis : cikis // ignore: cast_nullable_to_non_nullable
as double?,bakiye: freezed == bakiye ? _self.bakiye : bakiye // ignore: cast_nullable_to_non_nullable
as double?,subeAdi: freezed == subeAdi ? _self.subeAdi : subeAdi // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,depoAdi: freezed == depoAdi ? _self.depoAdi : depoAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DepoBakiyeDurumuModel extends DepoBakiyeDurumuModel {
  const _DepoBakiyeDurumuModel({this.subeKodu, this.depoKodu, this.stokKodu, this.giris, this.cikis, this.bakiye, this.subeAdi, this.stokAdi, this.depoAdi}): super._();
  factory _DepoBakiyeDurumuModel.fromJson(Map<String, dynamic> json) => _$DepoBakiyeDurumuModelFromJson(json);

@override final  int? subeKodu;
@override final  int? depoKodu;
@override final  String? stokKodu;
@override final  double? giris;
@override final  double? cikis;
@override final  double? bakiye;
@override final  String? subeAdi;
@override final  String? stokAdi;
@override final  String? depoAdi;

/// Create a copy of DepoBakiyeDurumuModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepoBakiyeDurumuModelCopyWith<_DepoBakiyeDurumuModel> get copyWith => __$DepoBakiyeDurumuModelCopyWithImpl<_DepoBakiyeDurumuModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepoBakiyeDurumuModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepoBakiyeDurumuModel&&super == other&&(identical(other.subeKodu, subeKodu) || other.subeKodu == subeKodu)&&(identical(other.depoKodu, depoKodu) || other.depoKodu == depoKodu)&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.giris, giris) || other.giris == giris)&&(identical(other.cikis, cikis) || other.cikis == cikis)&&(identical(other.bakiye, bakiye) || other.bakiye == bakiye)&&(identical(other.subeAdi, subeAdi) || other.subeAdi == subeAdi)&&(identical(other.stokAdi, stokAdi) || other.stokAdi == stokAdi)&&(identical(other.depoAdi, depoAdi) || other.depoAdi == depoAdi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subeKodu,depoKodu,stokKodu,giris,cikis,bakiye,subeAdi,stokAdi,depoAdi);



}

/// @nodoc
abstract mixin class _$DepoBakiyeDurumuModelCopyWith<$Res> implements $DepoBakiyeDurumuModelCopyWith<$Res> {
  factory _$DepoBakiyeDurumuModelCopyWith(_DepoBakiyeDurumuModel value, $Res Function(_DepoBakiyeDurumuModel) _then) = __$DepoBakiyeDurumuModelCopyWithImpl;
@override @useResult
$Res call({
 int? subeKodu, int? depoKodu, String? stokKodu, double? giris, double? cikis, double? bakiye, String? subeAdi, String? stokAdi, String? depoAdi
});




}
/// @nodoc
class __$DepoBakiyeDurumuModelCopyWithImpl<$Res>
    implements _$DepoBakiyeDurumuModelCopyWith<$Res> {
  __$DepoBakiyeDurumuModelCopyWithImpl(this._self, this._then);

  final _DepoBakiyeDurumuModel _self;
  final $Res Function(_DepoBakiyeDurumuModel) _then;

/// Create a copy of DepoBakiyeDurumuModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subeKodu = freezed,Object? depoKodu = freezed,Object? stokKodu = freezed,Object? giris = freezed,Object? cikis = freezed,Object? bakiye = freezed,Object? subeAdi = freezed,Object? stokAdi = freezed,Object? depoAdi = freezed,}) {
  return _then(_DepoBakiyeDurumuModel(
subeKodu: freezed == subeKodu ? _self.subeKodu : subeKodu // ignore: cast_nullable_to_non_nullable
as int?,depoKodu: freezed == depoKodu ? _self.depoKodu : depoKodu // ignore: cast_nullable_to_non_nullable
as int?,stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,giris: freezed == giris ? _self.giris : giris // ignore: cast_nullable_to_non_nullable
as double?,cikis: freezed == cikis ? _self.cikis : cikis // ignore: cast_nullable_to_non_nullable
as double?,bakiye: freezed == bakiye ? _self.bakiye : bakiye // ignore: cast_nullable_to_non_nullable
as double?,subeAdi: freezed == subeAdi ? _self.subeAdi : subeAdi // ignore: cast_nullable_to_non_nullable
as String?,stokAdi: freezed == stokAdi ? _self.stokAdi : stokAdi // ignore: cast_nullable_to_non_nullable
as String?,depoAdi: freezed == depoAdi ? _self.depoAdi : depoAdi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
