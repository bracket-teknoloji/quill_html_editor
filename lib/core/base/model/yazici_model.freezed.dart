// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yazici_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YaziciModel {

@HiveField(0) String? get yaziciAdi;@HiveField(0) set yaziciAdi(String? value);@HiveField(1) String get macAdresi;@HiveField(1) set macAdresi(String value);@HiveField(2) YaziciTipi? get yaziciTipi;@HiveField(2) set yaziciTipi(YaziciTipi? value);@HiveField(3) String? get aciklama;@HiveField(3) set aciklama(String? value);@HiveField(4) String? get yazdirmaTipi;@HiveField(4) set yazdirmaTipi(String? value);
/// Create a copy of YaziciModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YaziciModelCopyWith<YaziciModel> get copyWith => _$YaziciModelCopyWithImpl<YaziciModel>(this as YaziciModel, _$identity);

  /// Serializes this YaziciModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $YaziciModelCopyWith<$Res>  {
  factory $YaziciModelCopyWith(YaziciModel value, $Res Function(YaziciModel) _then) = _$YaziciModelCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String? yaziciAdi,@HiveField(1) String macAdresi,@HiveField(2) YaziciTipi? yaziciTipi,@HiveField(3) String? aciklama,@HiveField(4) String? yazdirmaTipi
});




}
/// @nodoc
class _$YaziciModelCopyWithImpl<$Res>
    implements $YaziciModelCopyWith<$Res> {
  _$YaziciModelCopyWithImpl(this._self, this._then);

  final YaziciModel _self;
  final $Res Function(YaziciModel) _then;

/// Create a copy of YaziciModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? yaziciAdi = freezed,Object? macAdresi = null,Object? yaziciTipi = freezed,Object? aciklama = freezed,Object? yazdirmaTipi = freezed,}) {
  return _then(_self.copyWith(
yaziciAdi: freezed == yaziciAdi ? _self.yaziciAdi : yaziciAdi // ignore: cast_nullable_to_non_nullable
as String?,macAdresi: null == macAdresi ? _self.macAdresi : macAdresi // ignore: cast_nullable_to_non_nullable
as String,yaziciTipi: freezed == yaziciTipi ? _self.yaziciTipi : yaziciTipi // ignore: cast_nullable_to_non_nullable
as YaziciTipi?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,yazdirmaTipi: freezed == yazdirmaTipi ? _self.yazdirmaTipi : yazdirmaTipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _YaziciModel extends YaziciModel {
   _YaziciModel({@HiveField(0) this.yaziciAdi, @HiveField(1) this.macAdresi = "", @HiveField(2) this.yaziciTipi, @HiveField(3) this.aciklama, @HiveField(4) this.yazdirmaTipi}): super._();
  factory _YaziciModel.fromJson(Map<String, dynamic> json) => _$YaziciModelFromJson(json);

@override@HiveField(0)  String? yaziciAdi;
@override@JsonKey()@HiveField(1)  String macAdresi;
@override@HiveField(2)  YaziciTipi? yaziciTipi;
@override@HiveField(3)  String? aciklama;
@override@HiveField(4)  String? yazdirmaTipi;

/// Create a copy of YaziciModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YaziciModelCopyWith<_YaziciModel> get copyWith => __$YaziciModelCopyWithImpl<_YaziciModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YaziciModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$YaziciModelCopyWith<$Res> implements $YaziciModelCopyWith<$Res> {
  factory _$YaziciModelCopyWith(_YaziciModel value, $Res Function(_YaziciModel) _then) = __$YaziciModelCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String? yaziciAdi,@HiveField(1) String macAdresi,@HiveField(2) YaziciTipi? yaziciTipi,@HiveField(3) String? aciklama,@HiveField(4) String? yazdirmaTipi
});




}
/// @nodoc
class __$YaziciModelCopyWithImpl<$Res>
    implements _$YaziciModelCopyWith<$Res> {
  __$YaziciModelCopyWithImpl(this._self, this._then);

  final _YaziciModel _self;
  final $Res Function(_YaziciModel) _then;

/// Create a copy of YaziciModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? yaziciAdi = freezed,Object? macAdresi = null,Object? yaziciTipi = freezed,Object? aciklama = freezed,Object? yazdirmaTipi = freezed,}) {
  return _then(_YaziciModel(
yaziciAdi: freezed == yaziciAdi ? _self.yaziciAdi : yaziciAdi // ignore: cast_nullable_to_non_nullable
as String?,macAdresi: null == macAdresi ? _self.macAdresi : macAdresi // ignore: cast_nullable_to_non_nullable
as String,yaziciTipi: freezed == yaziciTipi ? _self.yaziciTipi : yaziciTipi // ignore: cast_nullable_to_non_nullable
as YaziciTipi?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,yazdirmaTipi: freezed == yazdirmaTipi ? _self.yazdirmaTipi : yazdirmaTipi // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
