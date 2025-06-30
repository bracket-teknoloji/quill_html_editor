// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taksit_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaksitResponseModel {

// factory TaksitResponseModel.fromJson(Map<String, dynamic> json) => _$TaksitResponseModelFromJson(json);
 int? get bankaId; String? get bankaAdi; int? get tutar; List<Taksitler>? get taksitler;
/// Create a copy of TaksitResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaksitResponseModelCopyWith<TaksitResponseModel> get copyWith => _$TaksitResponseModelCopyWithImpl<TaksitResponseModel>(this as TaksitResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaksitResponseModel&&super == other&&(identical(other.bankaId, bankaId) || other.bankaId == bankaId)&&(identical(other.bankaAdi, bankaAdi) || other.bankaAdi == bankaAdi)&&(identical(other.tutar, tutar) || other.tutar == tutar)&&const DeepCollectionEquality().equals(other.taksitler, taksitler));
}


@override
int get hashCode => Object.hash(runtimeType,bankaId,bankaAdi,tutar,const DeepCollectionEquality().hash(taksitler));



}

/// @nodoc
abstract mixin class $TaksitResponseModelCopyWith<$Res>  {
  factory $TaksitResponseModelCopyWith(TaksitResponseModel value, $Res Function(TaksitResponseModel) _then) = _$TaksitResponseModelCopyWithImpl;
@useResult
$Res call({
 int? bankaId, String? bankaAdi, int? tutar, List<Taksitler>? taksitler
});




}
/// @nodoc
class _$TaksitResponseModelCopyWithImpl<$Res>
    implements $TaksitResponseModelCopyWith<$Res> {
  _$TaksitResponseModelCopyWithImpl(this._self, this._then);

  final TaksitResponseModel _self;
  final $Res Function(TaksitResponseModel) _then;

/// Create a copy of TaksitResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bankaId = freezed,Object? bankaAdi = freezed,Object? tutar = freezed,Object? taksitler = freezed,}) {
  return _then(TaksitResponseModel(
bankaId: freezed == bankaId ? _self.bankaId : bankaId // ignore: cast_nullable_to_non_nullable
as int?,bankaAdi: freezed == bankaAdi ? _self.bankaAdi : bankaAdi // ignore: cast_nullable_to_non_nullable
as String?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as int?,taksitler: freezed == taksitler ? _self.taksitler : taksitler // ignore: cast_nullable_to_non_nullable
as List<Taksitler>?,
  ));
}

}



/// @nodoc
mixin _$Taksitler {

 int? get id; int? get firmaId; int? get bankaId; String? get odemeMetni; int? get taksit; int? get ekstraTaksit; int? get altLimit; int? get vadeFarki; int? get sira; Banka? get banka; String? get silindi; DateTime? get kayittarihi; String? get kayityapankul; DateTime? get duzeltmetarihi; String? get duzeltmeyapankul;
/// Create a copy of Taksitler
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaksitlerCopyWith<Taksitler> get copyWith => _$TaksitlerCopyWithImpl<Taksitler>(this as Taksitler, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Taksitler&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.firmaId, firmaId) || other.firmaId == firmaId)&&(identical(other.bankaId, bankaId) || other.bankaId == bankaId)&&(identical(other.odemeMetni, odemeMetni) || other.odemeMetni == odemeMetni)&&(identical(other.taksit, taksit) || other.taksit == taksit)&&(identical(other.ekstraTaksit, ekstraTaksit) || other.ekstraTaksit == ekstraTaksit)&&(identical(other.altLimit, altLimit) || other.altLimit == altLimit)&&(identical(other.vadeFarki, vadeFarki) || other.vadeFarki == vadeFarki)&&(identical(other.sira, sira) || other.sira == sira)&&(identical(other.banka, banka) || other.banka == banka)&&(identical(other.silindi, silindi) || other.silindi == silindi)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&(identical(other.kayityapankul, kayityapankul) || other.kayityapankul == kayityapankul)&&(identical(other.duzeltmetarihi, duzeltmetarihi) || other.duzeltmetarihi == duzeltmetarihi)&&(identical(other.duzeltmeyapankul, duzeltmeyapankul) || other.duzeltmeyapankul == duzeltmeyapankul));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firmaId,bankaId,odemeMetni,taksit,ekstraTaksit,altLimit,vadeFarki,sira,banka,silindi,kayittarihi,kayityapankul,duzeltmetarihi,duzeltmeyapankul);



}

/// @nodoc
abstract mixin class $TaksitlerCopyWith<$Res>  {
  factory $TaksitlerCopyWith(Taksitler value, $Res Function(Taksitler) _then) = _$TaksitlerCopyWithImpl;
@useResult
$Res call({
 int? id, int? firmaId, int? bankaId, String? odemeMetni, int? taksit, int? ekstraTaksit, int? altLimit, int? vadeFarki, int? sira, Banka? banka, String? silindi, DateTime? kayittarihi, String? kayityapankul, DateTime? duzeltmetarihi, String? duzeltmeyapankul
});




}
/// @nodoc
class _$TaksitlerCopyWithImpl<$Res>
    implements $TaksitlerCopyWith<$Res> {
  _$TaksitlerCopyWithImpl(this._self, this._then);

  final Taksitler _self;
  final $Res Function(Taksitler) _then;

/// Create a copy of Taksitler
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firmaId = freezed,Object? bankaId = freezed,Object? odemeMetni = freezed,Object? taksit = freezed,Object? ekstraTaksit = freezed,Object? altLimit = freezed,Object? vadeFarki = freezed,Object? sira = freezed,Object? banka = freezed,Object? silindi = freezed,Object? kayittarihi = freezed,Object? kayityapankul = freezed,Object? duzeltmetarihi = freezed,Object? duzeltmeyapankul = freezed,}) {
  return _then(Taksitler(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firmaId: freezed == firmaId ? _self.firmaId : firmaId // ignore: cast_nullable_to_non_nullable
as int?,bankaId: freezed == bankaId ? _self.bankaId : bankaId // ignore: cast_nullable_to_non_nullable
as int?,odemeMetni: freezed == odemeMetni ? _self.odemeMetni : odemeMetni // ignore: cast_nullable_to_non_nullable
as String?,taksit: freezed == taksit ? _self.taksit : taksit // ignore: cast_nullable_to_non_nullable
as int?,ekstraTaksit: freezed == ekstraTaksit ? _self.ekstraTaksit : ekstraTaksit // ignore: cast_nullable_to_non_nullable
as int?,altLimit: freezed == altLimit ? _self.altLimit : altLimit // ignore: cast_nullable_to_non_nullable
as int?,vadeFarki: freezed == vadeFarki ? _self.vadeFarki : vadeFarki // ignore: cast_nullable_to_non_nullable
as int?,sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,banka: freezed == banka ? _self.banka : banka // ignore: cast_nullable_to_non_nullable
as Banka?,silindi: freezed == silindi ? _self.silindi : silindi // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,duzeltmetarihi: freezed == duzeltmetarihi ? _self.duzeltmetarihi : duzeltmetarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,duzeltmeyapankul: freezed == duzeltmeyapankul ? _self.duzeltmeyapankul : duzeltmeyapankul // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}



/// @nodoc
mixin _$Banka {

 int? get id; String? get adi; String? get odemeLink; String? get logoUrl; String? get silindi; DateTime? get kayittarihi; String? get kayityapankul; DateTime? get duzeltmetarihi; String? get duzeltmeyapankul;
/// Create a copy of Banka
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankaCopyWith<Banka> get copyWith => _$BankaCopyWithImpl<Banka>(this as Banka, _$identity);

  /// Serializes this Banka to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Banka&&(identical(other.id, id) || other.id == id)&&(identical(other.adi, adi) || other.adi == adi)&&(identical(other.odemeLink, odemeLink) || other.odemeLink == odemeLink)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.silindi, silindi) || other.silindi == silindi)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&(identical(other.kayityapankul, kayityapankul) || other.kayityapankul == kayityapankul)&&(identical(other.duzeltmetarihi, duzeltmetarihi) || other.duzeltmetarihi == duzeltmetarihi)&&(identical(other.duzeltmeyapankul, duzeltmeyapankul) || other.duzeltmeyapankul == duzeltmeyapankul));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,adi,odemeLink,logoUrl,silindi,kayittarihi,kayityapankul,duzeltmetarihi,duzeltmeyapankul);



}

/// @nodoc
abstract mixin class $BankaCopyWith<$Res>  {
  factory $BankaCopyWith(Banka value, $Res Function(Banka) _then) = _$BankaCopyWithImpl;
@useResult
$Res call({
 int? id, String? adi, String? odemeLink, String? logoUrl, String? silindi, DateTime? kayittarihi, String? kayityapankul, DateTime? duzeltmetarihi, String? duzeltmeyapankul
});




}
/// @nodoc
class _$BankaCopyWithImpl<$Res>
    implements $BankaCopyWith<$Res> {
  _$BankaCopyWithImpl(this._self, this._then);

  final Banka _self;
  final $Res Function(Banka) _then;

/// Create a copy of Banka
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? adi = freezed,Object? odemeLink = freezed,Object? logoUrl = freezed,Object? silindi = freezed,Object? kayittarihi = freezed,Object? kayityapankul = freezed,Object? duzeltmetarihi = freezed,Object? duzeltmeyapankul = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,odemeLink: freezed == odemeLink ? _self.odemeLink : odemeLink // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,silindi: freezed == silindi ? _self.silindi : silindi // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,duzeltmetarihi: freezed == duzeltmetarihi ? _self.duzeltmetarihi : duzeltmetarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,duzeltmeyapankul: freezed == duzeltmeyapankul ? _self.duzeltmeyapankul : duzeltmeyapankul // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.screamingSnake)
class _Banka implements Banka {
  const _Banka({this.id, this.adi, this.odemeLink, this.logoUrl, this.silindi, this.kayittarihi, this.kayityapankul, this.duzeltmetarihi, this.duzeltmeyapankul});
  factory _Banka.fromJson(Map<String, dynamic> json) => _$BankaFromJson(json);

@override final  int? id;
@override final  String? adi;
@override final  String? odemeLink;
@override final  String? logoUrl;
@override final  String? silindi;
@override final  DateTime? kayittarihi;
@override final  String? kayityapankul;
@override final  DateTime? duzeltmetarihi;
@override final  String? duzeltmeyapankul;

/// Create a copy of Banka
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankaCopyWith<_Banka> get copyWith => __$BankaCopyWithImpl<_Banka>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Banka&&(identical(other.id, id) || other.id == id)&&(identical(other.adi, adi) || other.adi == adi)&&(identical(other.odemeLink, odemeLink) || other.odemeLink == odemeLink)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.silindi, silindi) || other.silindi == silindi)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&(identical(other.kayityapankul, kayityapankul) || other.kayityapankul == kayityapankul)&&(identical(other.duzeltmetarihi, duzeltmetarihi) || other.duzeltmetarihi == duzeltmetarihi)&&(identical(other.duzeltmeyapankul, duzeltmeyapankul) || other.duzeltmeyapankul == duzeltmeyapankul));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,adi,odemeLink,logoUrl,silindi,kayittarihi,kayityapankul,duzeltmetarihi,duzeltmeyapankul);



}

/// @nodoc
abstract mixin class _$BankaCopyWith<$Res> implements $BankaCopyWith<$Res> {
  factory _$BankaCopyWith(_Banka value, $Res Function(_Banka) _then) = __$BankaCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? adi, String? odemeLink, String? logoUrl, String? silindi, DateTime? kayittarihi, String? kayityapankul, DateTime? duzeltmetarihi, String? duzeltmeyapankul
});




}
/// @nodoc
class __$BankaCopyWithImpl<$Res>
    implements _$BankaCopyWith<$Res> {
  __$BankaCopyWithImpl(this._self, this._then);

  final _Banka _self;
  final $Res Function(_Banka) _then;

/// Create a copy of Banka
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? adi = freezed,Object? odemeLink = freezed,Object? logoUrl = freezed,Object? silindi = freezed,Object? kayittarihi = freezed,Object? kayityapankul = freezed,Object? duzeltmetarihi = freezed,Object? duzeltmeyapankul = freezed,}) {
  return _then(_Banka(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,odemeLink: freezed == odemeLink ? _self.odemeLink : odemeLink // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,silindi: freezed == silindi ? _self.silindi : silindi // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,duzeltmetarihi: freezed == duzeltmetarihi ? _self.duzeltmetarihi : duzeltmetarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,duzeltmeyapankul: freezed == duzeltmeyapankul ? _self.duzeltmeyapankul : duzeltmeyapankul // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Sanalpos {

 int? get id; int? get bankaId; int? get firmaId; String? get merchantId; String? get merchantUser; String? get merchantPassword; String? get terminalNo; String? get storeKey; bool? get aktifMi; bool? get testMi; String? get silindi; DateTime? get kayittarihi; String? get kayityapankul; DateTime? get duzeltmetarihi; String? get duzeltmeyapankul;
/// Create a copy of Sanalpos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SanalposCopyWith<Sanalpos> get copyWith => _$SanalposCopyWithImpl<Sanalpos>(this as Sanalpos, _$identity);

  /// Serializes this Sanalpos to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sanalpos&&(identical(other.id, id) || other.id == id)&&(identical(other.bankaId, bankaId) || other.bankaId == bankaId)&&(identical(other.firmaId, firmaId) || other.firmaId == firmaId)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.merchantUser, merchantUser) || other.merchantUser == merchantUser)&&(identical(other.merchantPassword, merchantPassword) || other.merchantPassword == merchantPassword)&&(identical(other.terminalNo, terminalNo) || other.terminalNo == terminalNo)&&(identical(other.storeKey, storeKey) || other.storeKey == storeKey)&&(identical(other.aktifMi, aktifMi) || other.aktifMi == aktifMi)&&(identical(other.testMi, testMi) || other.testMi == testMi)&&(identical(other.silindi, silindi) || other.silindi == silindi)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&(identical(other.kayityapankul, kayityapankul) || other.kayityapankul == kayityapankul)&&(identical(other.duzeltmetarihi, duzeltmetarihi) || other.duzeltmetarihi == duzeltmetarihi)&&(identical(other.duzeltmeyapankul, duzeltmeyapankul) || other.duzeltmeyapankul == duzeltmeyapankul));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bankaId,firmaId,merchantId,merchantUser,merchantPassword,terminalNo,storeKey,aktifMi,testMi,silindi,kayittarihi,kayityapankul,duzeltmetarihi,duzeltmeyapankul);



}

/// @nodoc
abstract mixin class $SanalposCopyWith<$Res>  {
  factory $SanalposCopyWith(Sanalpos value, $Res Function(Sanalpos) _then) = _$SanalposCopyWithImpl;
@useResult
$Res call({
 int? id, int? bankaId, int? firmaId, String? merchantId, String? merchantUser, String? merchantPassword, String? terminalNo, String? storeKey, bool? aktifMi, bool? testMi, String? silindi, DateTime? kayittarihi, String? kayityapankul, DateTime? duzeltmetarihi, String? duzeltmeyapankul
});




}
/// @nodoc
class _$SanalposCopyWithImpl<$Res>
    implements $SanalposCopyWith<$Res> {
  _$SanalposCopyWithImpl(this._self, this._then);

  final Sanalpos _self;
  final $Res Function(Sanalpos) _then;

/// Create a copy of Sanalpos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? bankaId = freezed,Object? firmaId = freezed,Object? merchantId = freezed,Object? merchantUser = freezed,Object? merchantPassword = freezed,Object? terminalNo = freezed,Object? storeKey = freezed,Object? aktifMi = freezed,Object? testMi = freezed,Object? silindi = freezed,Object? kayittarihi = freezed,Object? kayityapankul = freezed,Object? duzeltmetarihi = freezed,Object? duzeltmeyapankul = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,bankaId: freezed == bankaId ? _self.bankaId : bankaId // ignore: cast_nullable_to_non_nullable
as int?,firmaId: freezed == firmaId ? _self.firmaId : firmaId // ignore: cast_nullable_to_non_nullable
as int?,merchantId: freezed == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String?,merchantUser: freezed == merchantUser ? _self.merchantUser : merchantUser // ignore: cast_nullable_to_non_nullable
as String?,merchantPassword: freezed == merchantPassword ? _self.merchantPassword : merchantPassword // ignore: cast_nullable_to_non_nullable
as String?,terminalNo: freezed == terminalNo ? _self.terminalNo : terminalNo // ignore: cast_nullable_to_non_nullable
as String?,storeKey: freezed == storeKey ? _self.storeKey : storeKey // ignore: cast_nullable_to_non_nullable
as String?,aktifMi: freezed == aktifMi ? _self.aktifMi : aktifMi // ignore: cast_nullable_to_non_nullable
as bool?,testMi: freezed == testMi ? _self.testMi : testMi // ignore: cast_nullable_to_non_nullable
as bool?,silindi: freezed == silindi ? _self.silindi : silindi // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,duzeltmetarihi: freezed == duzeltmetarihi ? _self.duzeltmetarihi : duzeltmetarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,duzeltmeyapankul: freezed == duzeltmeyapankul ? _self.duzeltmeyapankul : duzeltmeyapankul // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.screamingSnake)
class _Sanalpos implements Sanalpos {
  const _Sanalpos({this.id, this.bankaId, this.firmaId, this.merchantId, this.merchantUser, this.merchantPassword, this.terminalNo, this.storeKey, this.aktifMi, this.testMi, this.silindi, this.kayittarihi, this.kayityapankul, this.duzeltmetarihi, this.duzeltmeyapankul});
  factory _Sanalpos.fromJson(Map<String, dynamic> json) => _$SanalposFromJson(json);

@override final  int? id;
@override final  int? bankaId;
@override final  int? firmaId;
@override final  String? merchantId;
@override final  String? merchantUser;
@override final  String? merchantPassword;
@override final  String? terminalNo;
@override final  String? storeKey;
@override final  bool? aktifMi;
@override final  bool? testMi;
@override final  String? silindi;
@override final  DateTime? kayittarihi;
@override final  String? kayityapankul;
@override final  DateTime? duzeltmetarihi;
@override final  String? duzeltmeyapankul;

/// Create a copy of Sanalpos
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SanalposCopyWith<_Sanalpos> get copyWith => __$SanalposCopyWithImpl<_Sanalpos>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SanalposToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sanalpos&&(identical(other.id, id) || other.id == id)&&(identical(other.bankaId, bankaId) || other.bankaId == bankaId)&&(identical(other.firmaId, firmaId) || other.firmaId == firmaId)&&(identical(other.merchantId, merchantId) || other.merchantId == merchantId)&&(identical(other.merchantUser, merchantUser) || other.merchantUser == merchantUser)&&(identical(other.merchantPassword, merchantPassword) || other.merchantPassword == merchantPassword)&&(identical(other.terminalNo, terminalNo) || other.terminalNo == terminalNo)&&(identical(other.storeKey, storeKey) || other.storeKey == storeKey)&&(identical(other.aktifMi, aktifMi) || other.aktifMi == aktifMi)&&(identical(other.testMi, testMi) || other.testMi == testMi)&&(identical(other.silindi, silindi) || other.silindi == silindi)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&(identical(other.kayityapankul, kayityapankul) || other.kayityapankul == kayityapankul)&&(identical(other.duzeltmetarihi, duzeltmetarihi) || other.duzeltmetarihi == duzeltmetarihi)&&(identical(other.duzeltmeyapankul, duzeltmeyapankul) || other.duzeltmeyapankul == duzeltmeyapankul));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bankaId,firmaId,merchantId,merchantUser,merchantPassword,terminalNo,storeKey,aktifMi,testMi,silindi,kayittarihi,kayityapankul,duzeltmetarihi,duzeltmeyapankul);



}

/// @nodoc
abstract mixin class _$SanalposCopyWith<$Res> implements $SanalposCopyWith<$Res> {
  factory _$SanalposCopyWith(_Sanalpos value, $Res Function(_Sanalpos) _then) = __$SanalposCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? bankaId, int? firmaId, String? merchantId, String? merchantUser, String? merchantPassword, String? terminalNo, String? storeKey, bool? aktifMi, bool? testMi, String? silindi, DateTime? kayittarihi, String? kayityapankul, DateTime? duzeltmetarihi, String? duzeltmeyapankul
});




}
/// @nodoc
class __$SanalposCopyWithImpl<$Res>
    implements _$SanalposCopyWith<$Res> {
  __$SanalposCopyWithImpl(this._self, this._then);

  final _Sanalpos _self;
  final $Res Function(_Sanalpos) _then;

/// Create a copy of Sanalpos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? bankaId = freezed,Object? firmaId = freezed,Object? merchantId = freezed,Object? merchantUser = freezed,Object? merchantPassword = freezed,Object? terminalNo = freezed,Object? storeKey = freezed,Object? aktifMi = freezed,Object? testMi = freezed,Object? silindi = freezed,Object? kayittarihi = freezed,Object? kayityapankul = freezed,Object? duzeltmetarihi = freezed,Object? duzeltmeyapankul = freezed,}) {
  return _then(_Sanalpos(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,bankaId: freezed == bankaId ? _self.bankaId : bankaId // ignore: cast_nullable_to_non_nullable
as int?,firmaId: freezed == firmaId ? _self.firmaId : firmaId // ignore: cast_nullable_to_non_nullable
as int?,merchantId: freezed == merchantId ? _self.merchantId : merchantId // ignore: cast_nullable_to_non_nullable
as String?,merchantUser: freezed == merchantUser ? _self.merchantUser : merchantUser // ignore: cast_nullable_to_non_nullable
as String?,merchantPassword: freezed == merchantPassword ? _self.merchantPassword : merchantPassword // ignore: cast_nullable_to_non_nullable
as String?,terminalNo: freezed == terminalNo ? _self.terminalNo : terminalNo // ignore: cast_nullable_to_non_nullable
as String?,storeKey: freezed == storeKey ? _self.storeKey : storeKey // ignore: cast_nullable_to_non_nullable
as String?,aktifMi: freezed == aktifMi ? _self.aktifMi : aktifMi // ignore: cast_nullable_to_non_nullable
as bool?,testMi: freezed == testMi ? _self.testMi : testMi // ignore: cast_nullable_to_non_nullable
as bool?,silindi: freezed == silindi ? _self.silindi : silindi // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as String?,duzeltmetarihi: freezed == duzeltmetarihi ? _self.duzeltmetarihi : duzeltmetarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,duzeltmeyapankul: freezed == duzeltmeyapankul ? _self.duzeltmeyapankul : duzeltmeyapankul // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
