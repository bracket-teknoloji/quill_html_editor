// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_belge_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EBelgeRequestModel {

 String? get basimDurumu; set basimDurumu(String? value); String? get baslamaTarihi; set baslamaTarihi(String? value); String? get bitisTarihi; set bitisTarihi(String? value); String? get eBelgeTuru; set eBelgeTuru(String? value); String? get islendi; set islendi(String? value); bool? get kayitTarihineGore; set kayitTarihineGore(bool? value); String? get kontrolEdildi; set kontrolEdildi(String? value); String? get faturaYonu; set faturaYonu(String? value); String? get onayDurumu; set onayDurumu(String? value); int? get sayfa; set sayfa(int? value); String? get senaryo; set senaryo(String? value); String? get sirala; set sirala(String? value); bool? get sorgulanmasin; set sorgulanmasin(bool? value); String? get searchText; set searchText(String? value); String? get taslak; set taslak(String? value); String? get resmiBelgeNo; set resmiBelgeNo(String? value);
/// Create a copy of EBelgeRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EBelgeRequestModelCopyWith<EBelgeRequestModel> get copyWith => _$EBelgeRequestModelCopyWithImpl<EBelgeRequestModel>(this as EBelgeRequestModel, _$identity);

  /// Serializes this EBelgeRequestModel to a JSON map.
  Map<String, dynamic> toJson();






}

/// @nodoc
abstract mixin class $EBelgeRequestModelCopyWith<$Res>  {
  factory $EBelgeRequestModelCopyWith(EBelgeRequestModel value, $Res Function(EBelgeRequestModel) _then) = _$EBelgeRequestModelCopyWithImpl;
@useResult
$Res call({
 String? basimDurumu, String? baslamaTarihi, String? bitisTarihi, String? eBelgeTuru, String? islendi, bool? kayitTarihineGore, String? kontrolEdildi, String? faturaYonu, String? onayDurumu, int? sayfa, String? senaryo, String? sirala, bool? sorgulanmasin, String? searchText, String? taslak, String? resmiBelgeNo
});




}
/// @nodoc
class _$EBelgeRequestModelCopyWithImpl<$Res>
    implements $EBelgeRequestModelCopyWith<$Res> {
  _$EBelgeRequestModelCopyWithImpl(this._self, this._then);

  final EBelgeRequestModel _self;
  final $Res Function(EBelgeRequestModel) _then;

/// Create a copy of EBelgeRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? basimDurumu = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? eBelgeTuru = freezed,Object? islendi = freezed,Object? kayitTarihineGore = freezed,Object? kontrolEdildi = freezed,Object? faturaYonu = freezed,Object? onayDurumu = freezed,Object? sayfa = freezed,Object? senaryo = freezed,Object? sirala = freezed,Object? sorgulanmasin = freezed,Object? searchText = freezed,Object? taslak = freezed,Object? resmiBelgeNo = freezed,}) {
  return _then(_self.copyWith(
basimDurumu: freezed == basimDurumu ? _self.basimDurumu : basimDurumu // ignore: cast_nullable_to_non_nullable
as String?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,eBelgeTuru: freezed == eBelgeTuru ? _self.eBelgeTuru : eBelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,islendi: freezed == islendi ? _self.islendi : islendi // ignore: cast_nullable_to_non_nullable
as String?,kayitTarihineGore: freezed == kayitTarihineGore ? _self.kayitTarihineGore : kayitTarihineGore // ignore: cast_nullable_to_non_nullable
as bool?,kontrolEdildi: freezed == kontrolEdildi ? _self.kontrolEdildi : kontrolEdildi // ignore: cast_nullable_to_non_nullable
as String?,faturaYonu: freezed == faturaYonu ? _self.faturaYonu : faturaYonu // ignore: cast_nullable_to_non_nullable
as String?,onayDurumu: freezed == onayDurumu ? _self.onayDurumu : onayDurumu // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,senaryo: freezed == senaryo ? _self.senaryo : senaryo // ignore: cast_nullable_to_non_nullable
as String?,sirala: freezed == sirala ? _self.sirala : sirala // ignore: cast_nullable_to_non_nullable
as String?,sorgulanmasin: freezed == sorgulanmasin ? _self.sorgulanmasin : sorgulanmasin // ignore: cast_nullable_to_non_nullable
as bool?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,taslak: freezed == taslak ? _self.taslak : taslak // ignore: cast_nullable_to_non_nullable
as String?,resmiBelgeNo: freezed == resmiBelgeNo ? _self.resmiBelgeNo : resmiBelgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _EBelgeRequestModel extends EBelgeRequestModel {
   _EBelgeRequestModel({this.basimDurumu, this.baslamaTarihi, this.bitisTarihi, this.eBelgeTuru, this.islendi, this.kayitTarihineGore, this.kontrolEdildi, this.faturaYonu, this.onayDurumu, this.sayfa, this.senaryo, this.sirala, this.sorgulanmasin, this.searchText, this.taslak, this.resmiBelgeNo}): super._();
  factory _EBelgeRequestModel.fromJson(Map<String, dynamic> json) => _$EBelgeRequestModelFromJson(json);

@override  String? basimDurumu;
@override  String? baslamaTarihi;
@override  String? bitisTarihi;
@override  String? eBelgeTuru;
@override  String? islendi;
@override  bool? kayitTarihineGore;
@override  String? kontrolEdildi;
@override  String? faturaYonu;
@override  String? onayDurumu;
@override  int? sayfa;
@override  String? senaryo;
@override  String? sirala;
@override  bool? sorgulanmasin;
@override  String? searchText;
@override  String? taslak;
@override  String? resmiBelgeNo;

/// Create a copy of EBelgeRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EBelgeRequestModelCopyWith<_EBelgeRequestModel> get copyWith => __$EBelgeRequestModelCopyWithImpl<_EBelgeRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EBelgeRequestModelToJson(this, );
}





}

/// @nodoc
abstract mixin class _$EBelgeRequestModelCopyWith<$Res> implements $EBelgeRequestModelCopyWith<$Res> {
  factory _$EBelgeRequestModelCopyWith(_EBelgeRequestModel value, $Res Function(_EBelgeRequestModel) _then) = __$EBelgeRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? basimDurumu, String? baslamaTarihi, String? bitisTarihi, String? eBelgeTuru, String? islendi, bool? kayitTarihineGore, String? kontrolEdildi, String? faturaYonu, String? onayDurumu, int? sayfa, String? senaryo, String? sirala, bool? sorgulanmasin, String? searchText, String? taslak, String? resmiBelgeNo
});




}
/// @nodoc
class __$EBelgeRequestModelCopyWithImpl<$Res>
    implements _$EBelgeRequestModelCopyWith<$Res> {
  __$EBelgeRequestModelCopyWithImpl(this._self, this._then);

  final _EBelgeRequestModel _self;
  final $Res Function(_EBelgeRequestModel) _then;

/// Create a copy of EBelgeRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? basimDurumu = freezed,Object? baslamaTarihi = freezed,Object? bitisTarihi = freezed,Object? eBelgeTuru = freezed,Object? islendi = freezed,Object? kayitTarihineGore = freezed,Object? kontrolEdildi = freezed,Object? faturaYonu = freezed,Object? onayDurumu = freezed,Object? sayfa = freezed,Object? senaryo = freezed,Object? sirala = freezed,Object? sorgulanmasin = freezed,Object? searchText = freezed,Object? taslak = freezed,Object? resmiBelgeNo = freezed,}) {
  return _then(_EBelgeRequestModel(
basimDurumu: freezed == basimDurumu ? _self.basimDurumu : basimDurumu // ignore: cast_nullable_to_non_nullable
as String?,baslamaTarihi: freezed == baslamaTarihi ? _self.baslamaTarihi : baslamaTarihi // ignore: cast_nullable_to_non_nullable
as String?,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as String?,eBelgeTuru: freezed == eBelgeTuru ? _self.eBelgeTuru : eBelgeTuru // ignore: cast_nullable_to_non_nullable
as String?,islendi: freezed == islendi ? _self.islendi : islendi // ignore: cast_nullable_to_non_nullable
as String?,kayitTarihineGore: freezed == kayitTarihineGore ? _self.kayitTarihineGore : kayitTarihineGore // ignore: cast_nullable_to_non_nullable
as bool?,kontrolEdildi: freezed == kontrolEdildi ? _self.kontrolEdildi : kontrolEdildi // ignore: cast_nullable_to_non_nullable
as String?,faturaYonu: freezed == faturaYonu ? _self.faturaYonu : faturaYonu // ignore: cast_nullable_to_non_nullable
as String?,onayDurumu: freezed == onayDurumu ? _self.onayDurumu : onayDurumu // ignore: cast_nullable_to_non_nullable
as String?,sayfa: freezed == sayfa ? _self.sayfa : sayfa // ignore: cast_nullable_to_non_nullable
as int?,senaryo: freezed == senaryo ? _self.senaryo : senaryo // ignore: cast_nullable_to_non_nullable
as String?,sirala: freezed == sirala ? _self.sirala : sirala // ignore: cast_nullable_to_non_nullable
as String?,sorgulanmasin: freezed == sorgulanmasin ? _self.sorgulanmasin : sorgulanmasin // ignore: cast_nullable_to_non_nullable
as bool?,searchText: freezed == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String?,taslak: freezed == taslak ? _self.taslak : taslak // ignore: cast_nullable_to_non_nullable
as String?,resmiBelgeNo: freezed == resmiBelgeNo ? _self.resmiBelgeNo : resmiBelgeNo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
