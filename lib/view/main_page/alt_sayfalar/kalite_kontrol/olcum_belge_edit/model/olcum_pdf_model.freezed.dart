// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olcum_pdf_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OlcumPdfModel {

 String? get stokKodu; String? get yapkod; String? get revno; DateTime? get revtar; String? get tur;
/// Create a copy of OlcumPdfModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OlcumPdfModelCopyWith<OlcumPdfModel> get copyWith => _$OlcumPdfModelCopyWithImpl<OlcumPdfModel>(this as OlcumPdfModel, _$identity);

  /// Serializes this OlcumPdfModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OlcumPdfModel&&super == other&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.yapkod, yapkod) || other.yapkod == yapkod)&&(identical(other.revno, revno) || other.revno == revno)&&(identical(other.revtar, revtar) || other.revtar == revtar)&&(identical(other.tur, tur) || other.tur == tur));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,yapkod,revno,revtar,tur);



}

/// @nodoc
abstract mixin class $OlcumPdfModelCopyWith<$Res>  {
  factory $OlcumPdfModelCopyWith(OlcumPdfModel value, $Res Function(OlcumPdfModel) _then) = _$OlcumPdfModelCopyWithImpl;
@useResult
$Res call({
 String? stokKodu, String? yapkod, String? revno, DateTime? revtar, String? tur
});




}
/// @nodoc
class _$OlcumPdfModelCopyWithImpl<$Res>
    implements $OlcumPdfModelCopyWith<$Res> {
  _$OlcumPdfModelCopyWithImpl(this._self, this._then);

  final OlcumPdfModel _self;
  final $Res Function(OlcumPdfModel) _then;

/// Create a copy of OlcumPdfModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stokKodu = freezed,Object? yapkod = freezed,Object? revno = freezed,Object? revtar = freezed,Object? tur = freezed,}) {
  return _then(_self.copyWith(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,revno: freezed == revno ? _self.revno : revno // ignore: cast_nullable_to_non_nullable
as String?,revtar: freezed == revtar ? _self.revtar : revtar // ignore: cast_nullable_to_non_nullable
as DateTime?,tur: freezed == tur ? _self.tur : tur // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OlcumPdfModel extends OlcumPdfModel {
   _OlcumPdfModel({this.stokKodu, this.yapkod, this.revno, this.revtar, this.tur}): super._();
  factory _OlcumPdfModel.fromJson(Map<String, dynamic> json) => _$OlcumPdfModelFromJson(json);

@override final  String? stokKodu;
@override final  String? yapkod;
@override final  String? revno;
@override final  DateTime? revtar;
@override final  String? tur;

/// Create a copy of OlcumPdfModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OlcumPdfModelCopyWith<_OlcumPdfModel> get copyWith => __$OlcumPdfModelCopyWithImpl<_OlcumPdfModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OlcumPdfModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OlcumPdfModel&&super == other&&(identical(other.stokKodu, stokKodu) || other.stokKodu == stokKodu)&&(identical(other.yapkod, yapkod) || other.yapkod == yapkod)&&(identical(other.revno, revno) || other.revno == revno)&&(identical(other.revtar, revtar) || other.revtar == revtar)&&(identical(other.tur, tur) || other.tur == tur));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stokKodu,yapkod,revno,revtar,tur);



}

/// @nodoc
abstract mixin class _$OlcumPdfModelCopyWith<$Res> implements $OlcumPdfModelCopyWith<$Res> {
  factory _$OlcumPdfModelCopyWith(_OlcumPdfModel value, $Res Function(_OlcumPdfModel) _then) = __$OlcumPdfModelCopyWithImpl;
@override @useResult
$Res call({
 String? stokKodu, String? yapkod, String? revno, DateTime? revtar, String? tur
});




}
/// @nodoc
class __$OlcumPdfModelCopyWithImpl<$Res>
    implements _$OlcumPdfModelCopyWith<$Res> {
  __$OlcumPdfModelCopyWithImpl(this._self, this._then);

  final _OlcumPdfModel _self;
  final $Res Function(_OlcumPdfModel) _then;

/// Create a copy of OlcumPdfModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stokKodu = freezed,Object? yapkod = freezed,Object? revno = freezed,Object? revtar = freezed,Object? tur = freezed,}) {
  return _then(_OlcumPdfModel(
stokKodu: freezed == stokKodu ? _self.stokKodu : stokKodu // ignore: cast_nullable_to_non_nullable
as String?,yapkod: freezed == yapkod ? _self.yapkod : yapkod // ignore: cast_nullable_to_non_nullable
as String?,revno: freezed == revno ? _self.revno : revno // ignore: cast_nullable_to_non_nullable
as String?,revtar: freezed == revtar ? _self.revtar : revtar // ignore: cast_nullable_to_non_nullable
as DateTime?,tur: freezed == tur ? _self.tur : tur // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
