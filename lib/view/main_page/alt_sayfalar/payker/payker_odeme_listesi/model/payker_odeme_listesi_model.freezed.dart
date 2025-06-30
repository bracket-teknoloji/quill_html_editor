// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payker_odeme_listesi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasePaykerOdemeListesiModel {

 int? get draw; int? get recordsTotal; int? get recordsFiltered; List<PaykerOdemeListesiModel>? get data;
/// Create a copy of BasePaykerOdemeListesiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasePaykerOdemeListesiModelCopyWith<BasePaykerOdemeListesiModel> get copyWith => _$BasePaykerOdemeListesiModelCopyWithImpl<BasePaykerOdemeListesiModel>(this as BasePaykerOdemeListesiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasePaykerOdemeListesiModel&&super == other&&(identical(other.draw, draw) || other.draw == draw)&&(identical(other.recordsTotal, recordsTotal) || other.recordsTotal == recordsTotal)&&(identical(other.recordsFiltered, recordsFiltered) || other.recordsFiltered == recordsFiltered)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,draw,recordsTotal,recordsFiltered,const DeepCollectionEquality().hash(data));



}

/// @nodoc
abstract mixin class $BasePaykerOdemeListesiModelCopyWith<$Res>  {
  factory $BasePaykerOdemeListesiModelCopyWith(BasePaykerOdemeListesiModel value, $Res Function(BasePaykerOdemeListesiModel) _then) = _$BasePaykerOdemeListesiModelCopyWithImpl;
@useResult
$Res call({
 int? draw, int? recordsTotal, int? recordsFiltered, List<PaykerOdemeListesiModel>? data
});




}
/// @nodoc
class _$BasePaykerOdemeListesiModelCopyWithImpl<$Res>
    implements $BasePaykerOdemeListesiModelCopyWith<$Res> {
  _$BasePaykerOdemeListesiModelCopyWithImpl(this._self, this._then);

  final BasePaykerOdemeListesiModel _self;
  final $Res Function(BasePaykerOdemeListesiModel) _then;

/// Create a copy of BasePaykerOdemeListesiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draw = freezed,Object? recordsTotal = freezed,Object? recordsFiltered = freezed,Object? data = freezed,}) {
  return _then(BasePaykerOdemeListesiModel(
draw: freezed == draw ? _self.draw : draw // ignore: cast_nullable_to_non_nullable
as int?,recordsTotal: freezed == recordsTotal ? _self.recordsTotal : recordsTotal // ignore: cast_nullable_to_non_nullable
as int?,recordsFiltered: freezed == recordsFiltered ? _self.recordsFiltered : recordsFiltered // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PaykerOdemeListesiModel>?,
  ));
}

}



/// @nodoc
mixin _$PaykerOdemeListesiModel {

 int? get id; set id(int? value); int? get firmaId; set firmaId(int? value); String? get kartIsim; set kartIsim(String? value); String? get kartNo; set kartNo(String? value); String? get enrollmentId; set enrollmentId(String? value); String? get transactionId; set transactionId(String? value); double? get tutar; set tutar(double? value); String? get aciklama; set aciklama(String? value); String? get odemeTuru; set odemeTuru(String? value); int? get taksitSayisi; set taksitSayisi(int? value); String? get ipAdres; set ipAdres(String? value); int? get bankaId; set bankaId(int? value); dynamic get bayiId; set bayiId(dynamic value); String? get durum; set durum(String? value); String? get durumKodu; set durumKodu(String? value); String? get durumAciklama; set durumAciklama(String? value); dynamic get odemelinkId; set odemelinkId(dynamic value); String? get responsedata; set responsedata(String? value); Banka? get banka; set banka(Banka? value); dynamic get bayi; set bayi(dynamic value); dynamic get firma; set firma(dynamic value); dynamic get odemeLink; set odemeLink(dynamic value); dynamic get silindi; set silindi(dynamic value); DateTime? get kayittarihi; set kayittarihi(DateTime? value); dynamic get kayityapankul; set kayityapankul(dynamic value); DateTime? get duzeltmetarihi; set duzeltmetarihi(DateTime? value); dynamic get duzeltmeyapankul; set duzeltmeyapankul(dynamic value); String? get siparisNo; set siparisNo(String? value); String? get firmaKodu; set firmaKodu(String? value); String? get belgeNo; set belgeNo(String? value); String? get uygulama; set uygulama(String? value); String? get platform; set platform(String? value); String? get erpSirket; set erpSirket(String? value); int? get erpIsletmeKodu; set erpIsletmeKodu(int? value); DateTime? get alinmaTarihi; set alinmaTarihi(DateTime? value);
/// Create a copy of PaykerOdemeListesiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaykerOdemeListesiModelCopyWith<PaykerOdemeListesiModel> get copyWith => _$PaykerOdemeListesiModelCopyWithImpl<PaykerOdemeListesiModel>(this as PaykerOdemeListesiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaykerOdemeListesiModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.firmaId, firmaId) || other.firmaId == firmaId)&&(identical(other.kartIsim, kartIsim) || other.kartIsim == kartIsim)&&(identical(other.kartNo, kartNo) || other.kartNo == kartNo)&&(identical(other.enrollmentId, enrollmentId) || other.enrollmentId == enrollmentId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.tutar, tutar) || other.tutar == tutar)&&(identical(other.aciklama, aciklama) || other.aciklama == aciklama)&&(identical(other.odemeTuru, odemeTuru) || other.odemeTuru == odemeTuru)&&(identical(other.taksitSayisi, taksitSayisi) || other.taksitSayisi == taksitSayisi)&&(identical(other.ipAdres, ipAdres) || other.ipAdres == ipAdres)&&(identical(other.bankaId, bankaId) || other.bankaId == bankaId)&&const DeepCollectionEquality().equals(other.bayiId, bayiId)&&(identical(other.durum, durum) || other.durum == durum)&&(identical(other.durumKodu, durumKodu) || other.durumKodu == durumKodu)&&(identical(other.durumAciklama, durumAciklama) || other.durumAciklama == durumAciklama)&&const DeepCollectionEquality().equals(other.odemelinkId, odemelinkId)&&(identical(other.responsedata, responsedata) || other.responsedata == responsedata)&&(identical(other.banka, banka) || other.banka == banka)&&const DeepCollectionEquality().equals(other.bayi, bayi)&&const DeepCollectionEquality().equals(other.firma, firma)&&const DeepCollectionEquality().equals(other.odemeLink, odemeLink)&&const DeepCollectionEquality().equals(other.silindi, silindi)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&const DeepCollectionEquality().equals(other.kayityapankul, kayityapankul)&&(identical(other.duzeltmetarihi, duzeltmetarihi) || other.duzeltmetarihi == duzeltmetarihi)&&const DeepCollectionEquality().equals(other.duzeltmeyapankul, duzeltmeyapankul)&&(identical(other.siparisNo, siparisNo) || other.siparisNo == siparisNo)&&(identical(other.firmaKodu, firmaKodu) || other.firmaKodu == firmaKodu)&&(identical(other.belgeNo, belgeNo) || other.belgeNo == belgeNo)&&(identical(other.uygulama, uygulama) || other.uygulama == uygulama)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.erpSirket, erpSirket) || other.erpSirket == erpSirket)&&(identical(other.erpIsletmeKodu, erpIsletmeKodu) || other.erpIsletmeKodu == erpIsletmeKodu)&&(identical(other.alinmaTarihi, alinmaTarihi) || other.alinmaTarihi == alinmaTarihi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,firmaId,kartIsim,kartNo,enrollmentId,transactionId,tutar,aciklama,odemeTuru,taksitSayisi,ipAdres,bankaId,const DeepCollectionEquality().hash(bayiId),durum,durumKodu,durumAciklama,const DeepCollectionEquality().hash(odemelinkId),responsedata,banka,const DeepCollectionEquality().hash(bayi),const DeepCollectionEquality().hash(firma),const DeepCollectionEquality().hash(odemeLink),const DeepCollectionEquality().hash(silindi),kayittarihi,const DeepCollectionEquality().hash(kayityapankul),duzeltmetarihi,const DeepCollectionEquality().hash(duzeltmeyapankul),siparisNo,firmaKodu,belgeNo,uygulama,platform,erpSirket,erpIsletmeKodu,alinmaTarihi]);



}

/// @nodoc
abstract mixin class $PaykerOdemeListesiModelCopyWith<$Res>  {
  factory $PaykerOdemeListesiModelCopyWith(PaykerOdemeListesiModel value, $Res Function(PaykerOdemeListesiModel) _then) = _$PaykerOdemeListesiModelCopyWithImpl;
@useResult
$Res call({
 int? id, int? firmaId, String? kartIsim, String? kartNo, String? enrollmentId, String? transactionId, double? tutar, String? aciklama, String? odemeTuru, String? ipAdres, int? bankaId, dynamic bayiId, String? durum, String? durumKodu, String? durumAciklama, dynamic odemelinkId, String? responsedata, Banka? banka, dynamic bayi, dynamic firma, dynamic odemeLink, dynamic silindi, String? siparisNo, String? firmaKodu, DateTime? kayittarihi, dynamic kayityapankul, DateTime? duzeltmetarihi, dynamic duzeltmeyapankul, String? belgeNo, String? uygulama, String? platform, String? erpSirket, int? erpIsletmeKodu, DateTime? alinmaTarihi, int? taksitSayisi
});




}
/// @nodoc
class _$PaykerOdemeListesiModelCopyWithImpl<$Res>
    implements $PaykerOdemeListesiModelCopyWith<$Res> {
  _$PaykerOdemeListesiModelCopyWithImpl(this._self, this._then);

  final PaykerOdemeListesiModel _self;
  final $Res Function(PaykerOdemeListesiModel) _then;

/// Create a copy of PaykerOdemeListesiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firmaId = freezed,Object? kartIsim = freezed,Object? kartNo = freezed,Object? enrollmentId = freezed,Object? transactionId = freezed,Object? tutar = freezed,Object? aciklama = freezed,Object? odemeTuru = freezed,Object? ipAdres = freezed,Object? bankaId = freezed,Object? bayiId = freezed,Object? durum = freezed,Object? durumKodu = freezed,Object? durumAciklama = freezed,Object? odemelinkId = freezed,Object? responsedata = freezed,Object? banka = freezed,Object? bayi = freezed,Object? firma = freezed,Object? odemeLink = freezed,Object? silindi = freezed,Object? siparisNo = freezed,Object? firmaKodu = freezed,Object? kayittarihi = freezed,Object? kayityapankul = freezed,Object? duzeltmetarihi = freezed,Object? duzeltmeyapankul = freezed,Object? belgeNo = freezed,Object? uygulama = freezed,Object? platform = freezed,Object? erpSirket = freezed,Object? erpIsletmeKodu = freezed,Object? alinmaTarihi = freezed,Object? taksitSayisi = freezed,}) {
  return _then(PaykerOdemeListesiModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firmaId: freezed == firmaId ? _self.firmaId : firmaId // ignore: cast_nullable_to_non_nullable
as int?,kartIsim: freezed == kartIsim ? _self.kartIsim : kartIsim // ignore: cast_nullable_to_non_nullable
as String?,kartNo: freezed == kartNo ? _self.kartNo : kartNo // ignore: cast_nullable_to_non_nullable
as String?,enrollmentId: freezed == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,tutar: freezed == tutar ? _self.tutar : tutar // ignore: cast_nullable_to_non_nullable
as double?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,odemeTuru: freezed == odemeTuru ? _self.odemeTuru : odemeTuru // ignore: cast_nullable_to_non_nullable
as String?,ipAdres: freezed == ipAdres ? _self.ipAdres : ipAdres // ignore: cast_nullable_to_non_nullable
as String?,bankaId: freezed == bankaId ? _self.bankaId : bankaId // ignore: cast_nullable_to_non_nullable
as int?,bayiId: freezed == bayiId ? _self.bayiId : bayiId // ignore: cast_nullable_to_non_nullable
as dynamic,durum: freezed == durum ? _self.durum : durum // ignore: cast_nullable_to_non_nullable
as String?,durumKodu: freezed == durumKodu ? _self.durumKodu : durumKodu // ignore: cast_nullable_to_non_nullable
as String?,durumAciklama: freezed == durumAciklama ? _self.durumAciklama : durumAciklama // ignore: cast_nullable_to_non_nullable
as String?,odemelinkId: freezed == odemelinkId ? _self.odemelinkId : odemelinkId // ignore: cast_nullable_to_non_nullable
as dynamic,responsedata: freezed == responsedata ? _self.responsedata : responsedata // ignore: cast_nullable_to_non_nullable
as String?,banka: freezed == banka ? _self.banka : banka // ignore: cast_nullable_to_non_nullable
as Banka?,bayi: freezed == bayi ? _self.bayi : bayi // ignore: cast_nullable_to_non_nullable
as dynamic,firma: freezed == firma ? _self.firma : firma // ignore: cast_nullable_to_non_nullable
as dynamic,odemeLink: freezed == odemeLink ? _self.odemeLink : odemeLink // ignore: cast_nullable_to_non_nullable
as dynamic,silindi: freezed == silindi ? _self.silindi : silindi // ignore: cast_nullable_to_non_nullable
as dynamic,siparisNo: freezed == siparisNo ? _self.siparisNo : siparisNo // ignore: cast_nullable_to_non_nullable
as String?,firmaKodu: freezed == firmaKodu ? _self.firmaKodu : firmaKodu // ignore: cast_nullable_to_non_nullable
as String?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,kayityapankul: freezed == kayityapankul ? _self.kayityapankul : kayityapankul // ignore: cast_nullable_to_non_nullable
as dynamic,duzeltmetarihi: freezed == duzeltmetarihi ? _self.duzeltmetarihi : duzeltmetarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,duzeltmeyapankul: freezed == duzeltmeyapankul ? _self.duzeltmeyapankul : duzeltmeyapankul // ignore: cast_nullable_to_non_nullable
as dynamic,belgeNo: freezed == belgeNo ? _self.belgeNo : belgeNo // ignore: cast_nullable_to_non_nullable
as String?,uygulama: freezed == uygulama ? _self.uygulama : uygulama // ignore: cast_nullable_to_non_nullable
as String?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,erpSirket: freezed == erpSirket ? _self.erpSirket : erpSirket // ignore: cast_nullable_to_non_nullable
as String?,erpIsletmeKodu: freezed == erpIsletmeKodu ? _self.erpIsletmeKodu : erpIsletmeKodu // ignore: cast_nullable_to_non_nullable
as int?,alinmaTarihi: freezed == alinmaTarihi ? _self.alinmaTarihi : alinmaTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,taksitSayisi: freezed == taksitSayisi ? _self.taksitSayisi : taksitSayisi // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


// dart format on
