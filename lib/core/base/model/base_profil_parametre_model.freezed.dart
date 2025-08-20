// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_profil_parametre_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseProfilParametreModel {

 bool get siparisYeniKaydaHazirla; bool get faturaYeniKaydaHazirla; bool get talepTeklifYeniKaydaHazirla; bool get transferYeniKaydaHazirla; bool get siparisEkAlan; bool get siparisMiktar; bool get siparisVade; bool get kurlariSilTekrarGuncelle; bool get stokResimleriGoster; bool get stokYazdirDizaynVeYaziciHatirla; bool get stokSecildigindeYazdir; bool get finansOzelRaporGrafikGoster;@Deprecated("Bunun yerine temaModu kullanılacak.") bool get acikTemaMi;/// 1 ise sistem varsayılanı
/// 2 ise açık
/// 3 ise karanlık tema
 ThemeMode get temaModu; bool get rotaDisiGorunsunMu; NetFectDizaynList? get netFectDizaynList; YaziciList? get yaziciList; EditTipiEnum get olcumGirisiBelgeTipi; bool get kapaliBelgelerListelenmesinMi; bool get sayimStokSecildigindeHemenKaydet; bool get sayimOtomatikEtiketYazdir; Map<String, dynamic> get stokGorunecekEkstraAlanlar; int get stokListesiGridSayisi; String get urunGrubunaGoreSatisRaporTipi; bool get urunGrubunaGoreGruplansin; String get cariListesiSirala; String get stokListesiSirala; bool get irsFaturalasanIrsaliyelerGelsin; bool get eIrsaliyeSeciliGelsin; DepoList? get depoTalepDepoList; String get faturaKarlilikMaliyetTipi; List<String> get stokhareketleriGizlenecekAlanlar; bool get stokhareketleriDovizliGoster; bool get sayimNqrOkutuldugundaQRAc;
/// Create a copy of BaseProfilParametreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseProfilParametreModelCopyWith<BaseProfilParametreModel> get copyWith => _$BaseProfilParametreModelCopyWithImpl<BaseProfilParametreModel>(this as BaseProfilParametreModel, _$identity);

  /// Serializes this BaseProfilParametreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseProfilParametreModel&&super == other&&(identical(other.siparisYeniKaydaHazirla, siparisYeniKaydaHazirla) || other.siparisYeniKaydaHazirla == siparisYeniKaydaHazirla)&&(identical(other.faturaYeniKaydaHazirla, faturaYeniKaydaHazirla) || other.faturaYeniKaydaHazirla == faturaYeniKaydaHazirla)&&(identical(other.talepTeklifYeniKaydaHazirla, talepTeklifYeniKaydaHazirla) || other.talepTeklifYeniKaydaHazirla == talepTeklifYeniKaydaHazirla)&&(identical(other.transferYeniKaydaHazirla, transferYeniKaydaHazirla) || other.transferYeniKaydaHazirla == transferYeniKaydaHazirla)&&(identical(other.siparisEkAlan, siparisEkAlan) || other.siparisEkAlan == siparisEkAlan)&&(identical(other.siparisMiktar, siparisMiktar) || other.siparisMiktar == siparisMiktar)&&(identical(other.siparisVade, siparisVade) || other.siparisVade == siparisVade)&&(identical(other.kurlariSilTekrarGuncelle, kurlariSilTekrarGuncelle) || other.kurlariSilTekrarGuncelle == kurlariSilTekrarGuncelle)&&(identical(other.stokResimleriGoster, stokResimleriGoster) || other.stokResimleriGoster == stokResimleriGoster)&&(identical(other.stokYazdirDizaynVeYaziciHatirla, stokYazdirDizaynVeYaziciHatirla) || other.stokYazdirDizaynVeYaziciHatirla == stokYazdirDizaynVeYaziciHatirla)&&(identical(other.stokSecildigindeYazdir, stokSecildigindeYazdir) || other.stokSecildigindeYazdir == stokSecildigindeYazdir)&&(identical(other.finansOzelRaporGrafikGoster, finansOzelRaporGrafikGoster) || other.finansOzelRaporGrafikGoster == finansOzelRaporGrafikGoster)&&(identical(other.acikTemaMi, acikTemaMi) || other.acikTemaMi == acikTemaMi)&&(identical(other.temaModu, temaModu) || other.temaModu == temaModu)&&(identical(other.rotaDisiGorunsunMu, rotaDisiGorunsunMu) || other.rotaDisiGorunsunMu == rotaDisiGorunsunMu)&&(identical(other.netFectDizaynList, netFectDizaynList) || other.netFectDizaynList == netFectDizaynList)&&(identical(other.yaziciList, yaziciList) || other.yaziciList == yaziciList)&&(identical(other.olcumGirisiBelgeTipi, olcumGirisiBelgeTipi) || other.olcumGirisiBelgeTipi == olcumGirisiBelgeTipi)&&(identical(other.kapaliBelgelerListelenmesinMi, kapaliBelgelerListelenmesinMi) || other.kapaliBelgelerListelenmesinMi == kapaliBelgelerListelenmesinMi)&&(identical(other.sayimStokSecildigindeHemenKaydet, sayimStokSecildigindeHemenKaydet) || other.sayimStokSecildigindeHemenKaydet == sayimStokSecildigindeHemenKaydet)&&(identical(other.sayimOtomatikEtiketYazdir, sayimOtomatikEtiketYazdir) || other.sayimOtomatikEtiketYazdir == sayimOtomatikEtiketYazdir)&&const DeepCollectionEquality().equals(other.stokGorunecekEkstraAlanlar, stokGorunecekEkstraAlanlar)&&(identical(other.stokListesiGridSayisi, stokListesiGridSayisi) || other.stokListesiGridSayisi == stokListesiGridSayisi)&&(identical(other.urunGrubunaGoreSatisRaporTipi, urunGrubunaGoreSatisRaporTipi) || other.urunGrubunaGoreSatisRaporTipi == urunGrubunaGoreSatisRaporTipi)&&(identical(other.urunGrubunaGoreGruplansin, urunGrubunaGoreGruplansin) || other.urunGrubunaGoreGruplansin == urunGrubunaGoreGruplansin)&&(identical(other.cariListesiSirala, cariListesiSirala) || other.cariListesiSirala == cariListesiSirala)&&(identical(other.stokListesiSirala, stokListesiSirala) || other.stokListesiSirala == stokListesiSirala)&&(identical(other.irsFaturalasanIrsaliyelerGelsin, irsFaturalasanIrsaliyelerGelsin) || other.irsFaturalasanIrsaliyelerGelsin == irsFaturalasanIrsaliyelerGelsin)&&(identical(other.eIrsaliyeSeciliGelsin, eIrsaliyeSeciliGelsin) || other.eIrsaliyeSeciliGelsin == eIrsaliyeSeciliGelsin)&&(identical(other.depoTalepDepoList, depoTalepDepoList) || other.depoTalepDepoList == depoTalepDepoList)&&(identical(other.faturaKarlilikMaliyetTipi, faturaKarlilikMaliyetTipi) || other.faturaKarlilikMaliyetTipi == faturaKarlilikMaliyetTipi)&&const DeepCollectionEquality().equals(other.stokhareketleriGizlenecekAlanlar, stokhareketleriGizlenecekAlanlar)&&(identical(other.stokhareketleriDovizliGoster, stokhareketleriDovizliGoster) || other.stokhareketleriDovizliGoster == stokhareketleriDovizliGoster)&&(identical(other.sayimNqrOkutuldugundaQRAc, sayimNqrOkutuldugundaQRAc) || other.sayimNqrOkutuldugundaQRAc == sayimNqrOkutuldugundaQRAc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,siparisYeniKaydaHazirla,faturaYeniKaydaHazirla,talepTeklifYeniKaydaHazirla,transferYeniKaydaHazirla,siparisEkAlan,siparisMiktar,siparisVade,kurlariSilTekrarGuncelle,stokResimleriGoster,stokYazdirDizaynVeYaziciHatirla,stokSecildigindeYazdir,finansOzelRaporGrafikGoster,acikTemaMi,temaModu,rotaDisiGorunsunMu,netFectDizaynList,yaziciList,olcumGirisiBelgeTipi,kapaliBelgelerListelenmesinMi,sayimStokSecildigindeHemenKaydet,sayimOtomatikEtiketYazdir,const DeepCollectionEquality().hash(stokGorunecekEkstraAlanlar),stokListesiGridSayisi,urunGrubunaGoreSatisRaporTipi,urunGrubunaGoreGruplansin,cariListesiSirala,stokListesiSirala,irsFaturalasanIrsaliyelerGelsin,eIrsaliyeSeciliGelsin,depoTalepDepoList,faturaKarlilikMaliyetTipi,const DeepCollectionEquality().hash(stokhareketleriGizlenecekAlanlar),stokhareketleriDovizliGoster,sayimNqrOkutuldugundaQRAc]);



}

/// @nodoc
abstract mixin class $BaseProfilParametreModelCopyWith<$Res>  {
  factory $BaseProfilParametreModelCopyWith(BaseProfilParametreModel value, $Res Function(BaseProfilParametreModel) _then) = _$BaseProfilParametreModelCopyWithImpl;
@useResult
$Res call({
 bool siparisYeniKaydaHazirla, bool faturaYeniKaydaHazirla, bool talepTeklifYeniKaydaHazirla, bool transferYeniKaydaHazirla, bool siparisEkAlan, bool siparisMiktar, bool siparisVade, bool kurlariSilTekrarGuncelle, bool stokResimleriGoster, bool stokYazdirDizaynVeYaziciHatirla, bool stokSecildigindeYazdir, bool finansOzelRaporGrafikGoster,@Deprecated("Bunun yerine temaModu kullanılacak.") bool acikTemaMi, ThemeMode temaModu, bool rotaDisiGorunsunMu, NetFectDizaynList? netFectDizaynList, YaziciList? yaziciList, EditTipiEnum olcumGirisiBelgeTipi, bool kapaliBelgelerListelenmesinMi, bool sayimStokSecildigindeHemenKaydet, bool sayimOtomatikEtiketYazdir, Map<String, dynamic> stokGorunecekEkstraAlanlar, int stokListesiGridSayisi, String urunGrubunaGoreSatisRaporTipi, bool urunGrubunaGoreGruplansin, String cariListesiSirala, String stokListesiSirala, bool irsFaturalasanIrsaliyelerGelsin, bool eIrsaliyeSeciliGelsin, DepoList? depoTalepDepoList, String faturaKarlilikMaliyetTipi, List<String> stokhareketleriGizlenecekAlanlar, bool stokhareketleriDovizliGoster, bool sayimNqrOkutuldugundaQRAc
});




}
/// @nodoc
class _$BaseProfilParametreModelCopyWithImpl<$Res>
    implements $BaseProfilParametreModelCopyWith<$Res> {
  _$BaseProfilParametreModelCopyWithImpl(this._self, this._then);

  final BaseProfilParametreModel _self;
  final $Res Function(BaseProfilParametreModel) _then;

/// Create a copy of BaseProfilParametreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? siparisYeniKaydaHazirla = null,Object? faturaYeniKaydaHazirla = null,Object? talepTeklifYeniKaydaHazirla = null,Object? transferYeniKaydaHazirla = null,Object? siparisEkAlan = null,Object? siparisMiktar = null,Object? siparisVade = null,Object? kurlariSilTekrarGuncelle = null,Object? stokResimleriGoster = null,Object? stokYazdirDizaynVeYaziciHatirla = null,Object? stokSecildigindeYazdir = null,Object? finansOzelRaporGrafikGoster = null,Object? acikTemaMi = null,Object? temaModu = null,Object? rotaDisiGorunsunMu = null,Object? netFectDizaynList = freezed,Object? yaziciList = freezed,Object? olcumGirisiBelgeTipi = null,Object? kapaliBelgelerListelenmesinMi = null,Object? sayimStokSecildigindeHemenKaydet = null,Object? sayimOtomatikEtiketYazdir = null,Object? stokGorunecekEkstraAlanlar = null,Object? stokListesiGridSayisi = null,Object? urunGrubunaGoreSatisRaporTipi = null,Object? urunGrubunaGoreGruplansin = null,Object? cariListesiSirala = null,Object? stokListesiSirala = null,Object? irsFaturalasanIrsaliyelerGelsin = null,Object? eIrsaliyeSeciliGelsin = null,Object? depoTalepDepoList = freezed,Object? faturaKarlilikMaliyetTipi = null,Object? stokhareketleriGizlenecekAlanlar = null,Object? stokhareketleriDovizliGoster = null,Object? sayimNqrOkutuldugundaQRAc = null,}) {
  return _then(_self.copyWith(
siparisYeniKaydaHazirla: null == siparisYeniKaydaHazirla ? _self.siparisYeniKaydaHazirla : siparisYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
as bool,faturaYeniKaydaHazirla: null == faturaYeniKaydaHazirla ? _self.faturaYeniKaydaHazirla : faturaYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
as bool,talepTeklifYeniKaydaHazirla: null == talepTeklifYeniKaydaHazirla ? _self.talepTeklifYeniKaydaHazirla : talepTeklifYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
as bool,transferYeniKaydaHazirla: null == transferYeniKaydaHazirla ? _self.transferYeniKaydaHazirla : transferYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
as bool,siparisEkAlan: null == siparisEkAlan ? _self.siparisEkAlan : siparisEkAlan // ignore: cast_nullable_to_non_nullable
as bool,siparisMiktar: null == siparisMiktar ? _self.siparisMiktar : siparisMiktar // ignore: cast_nullable_to_non_nullable
as bool,siparisVade: null == siparisVade ? _self.siparisVade : siparisVade // ignore: cast_nullable_to_non_nullable
as bool,kurlariSilTekrarGuncelle: null == kurlariSilTekrarGuncelle ? _self.kurlariSilTekrarGuncelle : kurlariSilTekrarGuncelle // ignore: cast_nullable_to_non_nullable
as bool,stokResimleriGoster: null == stokResimleriGoster ? _self.stokResimleriGoster : stokResimleriGoster // ignore: cast_nullable_to_non_nullable
as bool,stokYazdirDizaynVeYaziciHatirla: null == stokYazdirDizaynVeYaziciHatirla ? _self.stokYazdirDizaynVeYaziciHatirla : stokYazdirDizaynVeYaziciHatirla // ignore: cast_nullable_to_non_nullable
as bool,stokSecildigindeYazdir: null == stokSecildigindeYazdir ? _self.stokSecildigindeYazdir : stokSecildigindeYazdir // ignore: cast_nullable_to_non_nullable
as bool,finansOzelRaporGrafikGoster: null == finansOzelRaporGrafikGoster ? _self.finansOzelRaporGrafikGoster : finansOzelRaporGrafikGoster // ignore: cast_nullable_to_non_nullable
as bool,acikTemaMi: null == acikTemaMi ? _self.acikTemaMi : acikTemaMi // ignore: cast_nullable_to_non_nullable
as bool,temaModu: null == temaModu ? _self.temaModu : temaModu // ignore: cast_nullable_to_non_nullable
as ThemeMode,rotaDisiGorunsunMu: null == rotaDisiGorunsunMu ? _self.rotaDisiGorunsunMu : rotaDisiGorunsunMu // ignore: cast_nullable_to_non_nullable
as bool,netFectDizaynList: freezed == netFectDizaynList ? _self.netFectDizaynList : netFectDizaynList // ignore: cast_nullable_to_non_nullable
as NetFectDizaynList?,yaziciList: freezed == yaziciList ? _self.yaziciList : yaziciList // ignore: cast_nullable_to_non_nullable
as YaziciList?,olcumGirisiBelgeTipi: null == olcumGirisiBelgeTipi ? _self.olcumGirisiBelgeTipi : olcumGirisiBelgeTipi // ignore: cast_nullable_to_non_nullable
as EditTipiEnum,kapaliBelgelerListelenmesinMi: null == kapaliBelgelerListelenmesinMi ? _self.kapaliBelgelerListelenmesinMi : kapaliBelgelerListelenmesinMi // ignore: cast_nullable_to_non_nullable
as bool,sayimStokSecildigindeHemenKaydet: null == sayimStokSecildigindeHemenKaydet ? _self.sayimStokSecildigindeHemenKaydet : sayimStokSecildigindeHemenKaydet // ignore: cast_nullable_to_non_nullable
as bool,sayimOtomatikEtiketYazdir: null == sayimOtomatikEtiketYazdir ? _self.sayimOtomatikEtiketYazdir : sayimOtomatikEtiketYazdir // ignore: cast_nullable_to_non_nullable
as bool,stokGorunecekEkstraAlanlar: null == stokGorunecekEkstraAlanlar ? _self.stokGorunecekEkstraAlanlar : stokGorunecekEkstraAlanlar // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,stokListesiGridSayisi: null == stokListesiGridSayisi ? _self.stokListesiGridSayisi : stokListesiGridSayisi // ignore: cast_nullable_to_non_nullable
as int,urunGrubunaGoreSatisRaporTipi: null == urunGrubunaGoreSatisRaporTipi ? _self.urunGrubunaGoreSatisRaporTipi : urunGrubunaGoreSatisRaporTipi // ignore: cast_nullable_to_non_nullable
as String,urunGrubunaGoreGruplansin: null == urunGrubunaGoreGruplansin ? _self.urunGrubunaGoreGruplansin : urunGrubunaGoreGruplansin // ignore: cast_nullable_to_non_nullable
as bool,cariListesiSirala: null == cariListesiSirala ? _self.cariListesiSirala : cariListesiSirala // ignore: cast_nullable_to_non_nullable
as String,stokListesiSirala: null == stokListesiSirala ? _self.stokListesiSirala : stokListesiSirala // ignore: cast_nullable_to_non_nullable
as String,irsFaturalasanIrsaliyelerGelsin: null == irsFaturalasanIrsaliyelerGelsin ? _self.irsFaturalasanIrsaliyelerGelsin : irsFaturalasanIrsaliyelerGelsin // ignore: cast_nullable_to_non_nullable
as bool,eIrsaliyeSeciliGelsin: null == eIrsaliyeSeciliGelsin ? _self.eIrsaliyeSeciliGelsin : eIrsaliyeSeciliGelsin // ignore: cast_nullable_to_non_nullable
as bool,depoTalepDepoList: freezed == depoTalepDepoList ? _self.depoTalepDepoList : depoTalepDepoList // ignore: cast_nullable_to_non_nullable
as DepoList?,faturaKarlilikMaliyetTipi: null == faturaKarlilikMaliyetTipi ? _self.faturaKarlilikMaliyetTipi : faturaKarlilikMaliyetTipi // ignore: cast_nullable_to_non_nullable
as String,stokhareketleriGizlenecekAlanlar: null == stokhareketleriGizlenecekAlanlar ? _self.stokhareketleriGizlenecekAlanlar : stokhareketleriGizlenecekAlanlar // ignore: cast_nullable_to_non_nullable
as List<String>,stokhareketleriDovizliGoster: null == stokhareketleriDovizliGoster ? _self.stokhareketleriDovizliGoster : stokhareketleriDovizliGoster // ignore: cast_nullable_to_non_nullable
as bool,sayimNqrOkutuldugundaQRAc: null == sayimNqrOkutuldugundaQRAc ? _self.sayimNqrOkutuldugundaQRAc : sayimNqrOkutuldugundaQRAc // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseProfilParametreModel].
extension BaseProfilParametreModelPatterns on BaseProfilParametreModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BaseProfilParametreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BaseProfilParametreModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BaseProfilParametreModel value)  $default,){
final _that = this;
switch (_that) {
case _BaseProfilParametreModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BaseProfilParametreModel value)?  $default,){
final _that = this;
switch (_that) {
case _BaseProfilParametreModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool siparisYeniKaydaHazirla,  bool faturaYeniKaydaHazirla,  bool talepTeklifYeniKaydaHazirla,  bool transferYeniKaydaHazirla,  bool siparisEkAlan,  bool siparisMiktar,  bool siparisVade,  bool kurlariSilTekrarGuncelle,  bool stokResimleriGoster,  bool stokYazdirDizaynVeYaziciHatirla,  bool stokSecildigindeYazdir,  bool finansOzelRaporGrafikGoster, @Deprecated("Bunun yerine temaModu kullanılacak.")  bool acikTemaMi,  ThemeMode temaModu,  bool rotaDisiGorunsunMu,  NetFectDizaynList? netFectDizaynList,  YaziciList? yaziciList,  EditTipiEnum olcumGirisiBelgeTipi,  bool kapaliBelgelerListelenmesinMi,  bool sayimStokSecildigindeHemenKaydet,  bool sayimOtomatikEtiketYazdir,  Map<String, dynamic> stokGorunecekEkstraAlanlar,  int stokListesiGridSayisi,  String urunGrubunaGoreSatisRaporTipi,  bool urunGrubunaGoreGruplansin,  String cariListesiSirala,  String stokListesiSirala,  bool irsFaturalasanIrsaliyelerGelsin,  bool eIrsaliyeSeciliGelsin,  DepoList? depoTalepDepoList,  String faturaKarlilikMaliyetTipi,  List<String> stokhareketleriGizlenecekAlanlar,  bool stokhareketleriDovizliGoster,  bool sayimNqrOkutuldugundaQRAc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BaseProfilParametreModel() when $default != null:
return $default(_that.siparisYeniKaydaHazirla,_that.faturaYeniKaydaHazirla,_that.talepTeklifYeniKaydaHazirla,_that.transferYeniKaydaHazirla,_that.siparisEkAlan,_that.siparisMiktar,_that.siparisVade,_that.kurlariSilTekrarGuncelle,_that.stokResimleriGoster,_that.stokYazdirDizaynVeYaziciHatirla,_that.stokSecildigindeYazdir,_that.finansOzelRaporGrafikGoster,_that.acikTemaMi,_that.temaModu,_that.rotaDisiGorunsunMu,_that.netFectDizaynList,_that.yaziciList,_that.olcumGirisiBelgeTipi,_that.kapaliBelgelerListelenmesinMi,_that.sayimStokSecildigindeHemenKaydet,_that.sayimOtomatikEtiketYazdir,_that.stokGorunecekEkstraAlanlar,_that.stokListesiGridSayisi,_that.urunGrubunaGoreSatisRaporTipi,_that.urunGrubunaGoreGruplansin,_that.cariListesiSirala,_that.stokListesiSirala,_that.irsFaturalasanIrsaliyelerGelsin,_that.eIrsaliyeSeciliGelsin,_that.depoTalepDepoList,_that.faturaKarlilikMaliyetTipi,_that.stokhareketleriGizlenecekAlanlar,_that.stokhareketleriDovizliGoster,_that.sayimNqrOkutuldugundaQRAc);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool siparisYeniKaydaHazirla,  bool faturaYeniKaydaHazirla,  bool talepTeklifYeniKaydaHazirla,  bool transferYeniKaydaHazirla,  bool siparisEkAlan,  bool siparisMiktar,  bool siparisVade,  bool kurlariSilTekrarGuncelle,  bool stokResimleriGoster,  bool stokYazdirDizaynVeYaziciHatirla,  bool stokSecildigindeYazdir,  bool finansOzelRaporGrafikGoster, @Deprecated("Bunun yerine temaModu kullanılacak.")  bool acikTemaMi,  ThemeMode temaModu,  bool rotaDisiGorunsunMu,  NetFectDizaynList? netFectDizaynList,  YaziciList? yaziciList,  EditTipiEnum olcumGirisiBelgeTipi,  bool kapaliBelgelerListelenmesinMi,  bool sayimStokSecildigindeHemenKaydet,  bool sayimOtomatikEtiketYazdir,  Map<String, dynamic> stokGorunecekEkstraAlanlar,  int stokListesiGridSayisi,  String urunGrubunaGoreSatisRaporTipi,  bool urunGrubunaGoreGruplansin,  String cariListesiSirala,  String stokListesiSirala,  bool irsFaturalasanIrsaliyelerGelsin,  bool eIrsaliyeSeciliGelsin,  DepoList? depoTalepDepoList,  String faturaKarlilikMaliyetTipi,  List<String> stokhareketleriGizlenecekAlanlar,  bool stokhareketleriDovizliGoster,  bool sayimNqrOkutuldugundaQRAc)  $default,) {final _that = this;
switch (_that) {
case _BaseProfilParametreModel():
return $default(_that.siparisYeniKaydaHazirla,_that.faturaYeniKaydaHazirla,_that.talepTeklifYeniKaydaHazirla,_that.transferYeniKaydaHazirla,_that.siparisEkAlan,_that.siparisMiktar,_that.siparisVade,_that.kurlariSilTekrarGuncelle,_that.stokResimleriGoster,_that.stokYazdirDizaynVeYaziciHatirla,_that.stokSecildigindeYazdir,_that.finansOzelRaporGrafikGoster,_that.acikTemaMi,_that.temaModu,_that.rotaDisiGorunsunMu,_that.netFectDizaynList,_that.yaziciList,_that.olcumGirisiBelgeTipi,_that.kapaliBelgelerListelenmesinMi,_that.sayimStokSecildigindeHemenKaydet,_that.sayimOtomatikEtiketYazdir,_that.stokGorunecekEkstraAlanlar,_that.stokListesiGridSayisi,_that.urunGrubunaGoreSatisRaporTipi,_that.urunGrubunaGoreGruplansin,_that.cariListesiSirala,_that.stokListesiSirala,_that.irsFaturalasanIrsaliyelerGelsin,_that.eIrsaliyeSeciliGelsin,_that.depoTalepDepoList,_that.faturaKarlilikMaliyetTipi,_that.stokhareketleriGizlenecekAlanlar,_that.stokhareketleriDovizliGoster,_that.sayimNqrOkutuldugundaQRAc);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool siparisYeniKaydaHazirla,  bool faturaYeniKaydaHazirla,  bool talepTeklifYeniKaydaHazirla,  bool transferYeniKaydaHazirla,  bool siparisEkAlan,  bool siparisMiktar,  bool siparisVade,  bool kurlariSilTekrarGuncelle,  bool stokResimleriGoster,  bool stokYazdirDizaynVeYaziciHatirla,  bool stokSecildigindeYazdir,  bool finansOzelRaporGrafikGoster, @Deprecated("Bunun yerine temaModu kullanılacak.")  bool acikTemaMi,  ThemeMode temaModu,  bool rotaDisiGorunsunMu,  NetFectDizaynList? netFectDizaynList,  YaziciList? yaziciList,  EditTipiEnum olcumGirisiBelgeTipi,  bool kapaliBelgelerListelenmesinMi,  bool sayimStokSecildigindeHemenKaydet,  bool sayimOtomatikEtiketYazdir,  Map<String, dynamic> stokGorunecekEkstraAlanlar,  int stokListesiGridSayisi,  String urunGrubunaGoreSatisRaporTipi,  bool urunGrubunaGoreGruplansin,  String cariListesiSirala,  String stokListesiSirala,  bool irsFaturalasanIrsaliyelerGelsin,  bool eIrsaliyeSeciliGelsin,  DepoList? depoTalepDepoList,  String faturaKarlilikMaliyetTipi,  List<String> stokhareketleriGizlenecekAlanlar,  bool stokhareketleriDovizliGoster,  bool sayimNqrOkutuldugundaQRAc)?  $default,) {final _that = this;
switch (_that) {
case _BaseProfilParametreModel() when $default != null:
return $default(_that.siparisYeniKaydaHazirla,_that.faturaYeniKaydaHazirla,_that.talepTeklifYeniKaydaHazirla,_that.transferYeniKaydaHazirla,_that.siparisEkAlan,_that.siparisMiktar,_that.siparisVade,_that.kurlariSilTekrarGuncelle,_that.stokResimleriGoster,_that.stokYazdirDizaynVeYaziciHatirla,_that.stokSecildigindeYazdir,_that.finansOzelRaporGrafikGoster,_that.acikTemaMi,_that.temaModu,_that.rotaDisiGorunsunMu,_that.netFectDizaynList,_that.yaziciList,_that.olcumGirisiBelgeTipi,_that.kapaliBelgelerListelenmesinMi,_that.sayimStokSecildigindeHemenKaydet,_that.sayimOtomatikEtiketYazdir,_that.stokGorunecekEkstraAlanlar,_that.stokListesiGridSayisi,_that.urunGrubunaGoreSatisRaporTipi,_that.urunGrubunaGoreGruplansin,_that.cariListesiSirala,_that.stokListesiSirala,_that.irsFaturalasanIrsaliyelerGelsin,_that.eIrsaliyeSeciliGelsin,_that.depoTalepDepoList,_that.faturaKarlilikMaliyetTipi,_that.stokhareketleriGizlenecekAlanlar,_that.stokhareketleriDovizliGoster,_that.sayimNqrOkutuldugundaQRAc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BaseProfilParametreModel extends BaseProfilParametreModel {
  const _BaseProfilParametreModel({this.siparisYeniKaydaHazirla = false, this.faturaYeniKaydaHazirla = false, this.talepTeklifYeniKaydaHazirla = false, this.transferYeniKaydaHazirla = false, this.siparisEkAlan = false, this.siparisMiktar = false, this.siparisVade = false, this.kurlariSilTekrarGuncelle = false, this.stokResimleriGoster = false, this.stokYazdirDizaynVeYaziciHatirla = false, this.stokSecildigindeYazdir = false, this.finansOzelRaporGrafikGoster = false, @Deprecated("Bunun yerine temaModu kullanılacak.") this.acikTemaMi = false, this.temaModu = ThemeMode.dark, this.rotaDisiGorunsunMu = false, this.netFectDizaynList, this.yaziciList, this.olcumGirisiBelgeTipi = EditTipiEnum.isEmri, this.kapaliBelgelerListelenmesinMi = false, this.sayimStokSecildigindeHemenKaydet = false, this.sayimOtomatikEtiketYazdir = false, final  Map<String, dynamic> stokGorunecekEkstraAlanlar = const {}, this.stokListesiGridSayisi = 0, this.urunGrubunaGoreSatisRaporTipi = "T", this.urunGrubunaGoreGruplansin = false, this.cariListesiSirala = "AZ", this.stokListesiSirala = "AZ", this.irsFaturalasanIrsaliyelerGelsin = false, this.eIrsaliyeSeciliGelsin = false, this.depoTalepDepoList = null, this.faturaKarlilikMaliyetTipi = "SGF", final  List<String> stokhareketleriGizlenecekAlanlar = const [], this.stokhareketleriDovizliGoster = false, this.sayimNqrOkutuldugundaQRAc = false}): _stokGorunecekEkstraAlanlar = stokGorunecekEkstraAlanlar,_stokhareketleriGizlenecekAlanlar = stokhareketleriGizlenecekAlanlar,super._();
  factory _BaseProfilParametreModel.fromJson(Map<String, dynamic> json) => _$BaseProfilParametreModelFromJson(json);

@override@JsonKey() final  bool siparisYeniKaydaHazirla;
@override@JsonKey() final  bool faturaYeniKaydaHazirla;
@override@JsonKey() final  bool talepTeklifYeniKaydaHazirla;
@override@JsonKey() final  bool transferYeniKaydaHazirla;
@override@JsonKey() final  bool siparisEkAlan;
@override@JsonKey() final  bool siparisMiktar;
@override@JsonKey() final  bool siparisVade;
@override@JsonKey() final  bool kurlariSilTekrarGuncelle;
@override@JsonKey() final  bool stokResimleriGoster;
@override@JsonKey() final  bool stokYazdirDizaynVeYaziciHatirla;
@override@JsonKey() final  bool stokSecildigindeYazdir;
@override@JsonKey() final  bool finansOzelRaporGrafikGoster;
@override@JsonKey()@Deprecated("Bunun yerine temaModu kullanılacak.") final  bool acikTemaMi;
/// 1 ise sistem varsayılanı
/// 2 ise açık
/// 3 ise karanlık tema
@override@JsonKey() final  ThemeMode temaModu;
@override@JsonKey() final  bool rotaDisiGorunsunMu;
@override final  NetFectDizaynList? netFectDizaynList;
@override final  YaziciList? yaziciList;
@override@JsonKey() final  EditTipiEnum olcumGirisiBelgeTipi;
@override@JsonKey() final  bool kapaliBelgelerListelenmesinMi;
@override@JsonKey() final  bool sayimStokSecildigindeHemenKaydet;
@override@JsonKey() final  bool sayimOtomatikEtiketYazdir;
 final  Map<String, dynamic> _stokGorunecekEkstraAlanlar;
@override@JsonKey() Map<String, dynamic> get stokGorunecekEkstraAlanlar {
  if (_stokGorunecekEkstraAlanlar is EqualUnmodifiableMapView) return _stokGorunecekEkstraAlanlar;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_stokGorunecekEkstraAlanlar);
}

@override@JsonKey() final  int stokListesiGridSayisi;
@override@JsonKey() final  String urunGrubunaGoreSatisRaporTipi;
@override@JsonKey() final  bool urunGrubunaGoreGruplansin;
@override@JsonKey() final  String cariListesiSirala;
@override@JsonKey() final  String stokListesiSirala;
@override@JsonKey() final  bool irsFaturalasanIrsaliyelerGelsin;
@override@JsonKey() final  bool eIrsaliyeSeciliGelsin;
@override@JsonKey() final  DepoList? depoTalepDepoList;
@override@JsonKey() final  String faturaKarlilikMaliyetTipi;
 final  List<String> _stokhareketleriGizlenecekAlanlar;
@override@JsonKey() List<String> get stokhareketleriGizlenecekAlanlar {
  if (_stokhareketleriGizlenecekAlanlar is EqualUnmodifiableListView) return _stokhareketleriGizlenecekAlanlar;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stokhareketleriGizlenecekAlanlar);
}

@override@JsonKey() final  bool stokhareketleriDovizliGoster;
@override@JsonKey() final  bool sayimNqrOkutuldugundaQRAc;

/// Create a copy of BaseProfilParametreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseProfilParametreModelCopyWith<_BaseProfilParametreModel> get copyWith => __$BaseProfilParametreModelCopyWithImpl<_BaseProfilParametreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BaseProfilParametreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseProfilParametreModel&&super == other&&(identical(other.siparisYeniKaydaHazirla, siparisYeniKaydaHazirla) || other.siparisYeniKaydaHazirla == siparisYeniKaydaHazirla)&&(identical(other.faturaYeniKaydaHazirla, faturaYeniKaydaHazirla) || other.faturaYeniKaydaHazirla == faturaYeniKaydaHazirla)&&(identical(other.talepTeklifYeniKaydaHazirla, talepTeklifYeniKaydaHazirla) || other.talepTeklifYeniKaydaHazirla == talepTeklifYeniKaydaHazirla)&&(identical(other.transferYeniKaydaHazirla, transferYeniKaydaHazirla) || other.transferYeniKaydaHazirla == transferYeniKaydaHazirla)&&(identical(other.siparisEkAlan, siparisEkAlan) || other.siparisEkAlan == siparisEkAlan)&&(identical(other.siparisMiktar, siparisMiktar) || other.siparisMiktar == siparisMiktar)&&(identical(other.siparisVade, siparisVade) || other.siparisVade == siparisVade)&&(identical(other.kurlariSilTekrarGuncelle, kurlariSilTekrarGuncelle) || other.kurlariSilTekrarGuncelle == kurlariSilTekrarGuncelle)&&(identical(other.stokResimleriGoster, stokResimleriGoster) || other.stokResimleriGoster == stokResimleriGoster)&&(identical(other.stokYazdirDizaynVeYaziciHatirla, stokYazdirDizaynVeYaziciHatirla) || other.stokYazdirDizaynVeYaziciHatirla == stokYazdirDizaynVeYaziciHatirla)&&(identical(other.stokSecildigindeYazdir, stokSecildigindeYazdir) || other.stokSecildigindeYazdir == stokSecildigindeYazdir)&&(identical(other.finansOzelRaporGrafikGoster, finansOzelRaporGrafikGoster) || other.finansOzelRaporGrafikGoster == finansOzelRaporGrafikGoster)&&(identical(other.acikTemaMi, acikTemaMi) || other.acikTemaMi == acikTemaMi)&&(identical(other.temaModu, temaModu) || other.temaModu == temaModu)&&(identical(other.rotaDisiGorunsunMu, rotaDisiGorunsunMu) || other.rotaDisiGorunsunMu == rotaDisiGorunsunMu)&&(identical(other.netFectDizaynList, netFectDizaynList) || other.netFectDizaynList == netFectDizaynList)&&(identical(other.yaziciList, yaziciList) || other.yaziciList == yaziciList)&&(identical(other.olcumGirisiBelgeTipi, olcumGirisiBelgeTipi) || other.olcumGirisiBelgeTipi == olcumGirisiBelgeTipi)&&(identical(other.kapaliBelgelerListelenmesinMi, kapaliBelgelerListelenmesinMi) || other.kapaliBelgelerListelenmesinMi == kapaliBelgelerListelenmesinMi)&&(identical(other.sayimStokSecildigindeHemenKaydet, sayimStokSecildigindeHemenKaydet) || other.sayimStokSecildigindeHemenKaydet == sayimStokSecildigindeHemenKaydet)&&(identical(other.sayimOtomatikEtiketYazdir, sayimOtomatikEtiketYazdir) || other.sayimOtomatikEtiketYazdir == sayimOtomatikEtiketYazdir)&&const DeepCollectionEquality().equals(other._stokGorunecekEkstraAlanlar, _stokGorunecekEkstraAlanlar)&&(identical(other.stokListesiGridSayisi, stokListesiGridSayisi) || other.stokListesiGridSayisi == stokListesiGridSayisi)&&(identical(other.urunGrubunaGoreSatisRaporTipi, urunGrubunaGoreSatisRaporTipi) || other.urunGrubunaGoreSatisRaporTipi == urunGrubunaGoreSatisRaporTipi)&&(identical(other.urunGrubunaGoreGruplansin, urunGrubunaGoreGruplansin) || other.urunGrubunaGoreGruplansin == urunGrubunaGoreGruplansin)&&(identical(other.cariListesiSirala, cariListesiSirala) || other.cariListesiSirala == cariListesiSirala)&&(identical(other.stokListesiSirala, stokListesiSirala) || other.stokListesiSirala == stokListesiSirala)&&(identical(other.irsFaturalasanIrsaliyelerGelsin, irsFaturalasanIrsaliyelerGelsin) || other.irsFaturalasanIrsaliyelerGelsin == irsFaturalasanIrsaliyelerGelsin)&&(identical(other.eIrsaliyeSeciliGelsin, eIrsaliyeSeciliGelsin) || other.eIrsaliyeSeciliGelsin == eIrsaliyeSeciliGelsin)&&(identical(other.depoTalepDepoList, depoTalepDepoList) || other.depoTalepDepoList == depoTalepDepoList)&&(identical(other.faturaKarlilikMaliyetTipi, faturaKarlilikMaliyetTipi) || other.faturaKarlilikMaliyetTipi == faturaKarlilikMaliyetTipi)&&const DeepCollectionEquality().equals(other._stokhareketleriGizlenecekAlanlar, _stokhareketleriGizlenecekAlanlar)&&(identical(other.stokhareketleriDovizliGoster, stokhareketleriDovizliGoster) || other.stokhareketleriDovizliGoster == stokhareketleriDovizliGoster)&&(identical(other.sayimNqrOkutuldugundaQRAc, sayimNqrOkutuldugundaQRAc) || other.sayimNqrOkutuldugundaQRAc == sayimNqrOkutuldugundaQRAc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,siparisYeniKaydaHazirla,faturaYeniKaydaHazirla,talepTeklifYeniKaydaHazirla,transferYeniKaydaHazirla,siparisEkAlan,siparisMiktar,siparisVade,kurlariSilTekrarGuncelle,stokResimleriGoster,stokYazdirDizaynVeYaziciHatirla,stokSecildigindeYazdir,finansOzelRaporGrafikGoster,acikTemaMi,temaModu,rotaDisiGorunsunMu,netFectDizaynList,yaziciList,olcumGirisiBelgeTipi,kapaliBelgelerListelenmesinMi,sayimStokSecildigindeHemenKaydet,sayimOtomatikEtiketYazdir,const DeepCollectionEquality().hash(_stokGorunecekEkstraAlanlar),stokListesiGridSayisi,urunGrubunaGoreSatisRaporTipi,urunGrubunaGoreGruplansin,cariListesiSirala,stokListesiSirala,irsFaturalasanIrsaliyelerGelsin,eIrsaliyeSeciliGelsin,depoTalepDepoList,faturaKarlilikMaliyetTipi,const DeepCollectionEquality().hash(_stokhareketleriGizlenecekAlanlar),stokhareketleriDovizliGoster,sayimNqrOkutuldugundaQRAc]);



}

/// @nodoc
abstract mixin class _$BaseProfilParametreModelCopyWith<$Res> implements $BaseProfilParametreModelCopyWith<$Res> {
  factory _$BaseProfilParametreModelCopyWith(_BaseProfilParametreModel value, $Res Function(_BaseProfilParametreModel) _then) = __$BaseProfilParametreModelCopyWithImpl;
@override @useResult
$Res call({
 bool siparisYeniKaydaHazirla, bool faturaYeniKaydaHazirla, bool talepTeklifYeniKaydaHazirla, bool transferYeniKaydaHazirla, bool siparisEkAlan, bool siparisMiktar, bool siparisVade, bool kurlariSilTekrarGuncelle, bool stokResimleriGoster, bool stokYazdirDizaynVeYaziciHatirla, bool stokSecildigindeYazdir, bool finansOzelRaporGrafikGoster,@Deprecated("Bunun yerine temaModu kullanılacak.") bool acikTemaMi, ThemeMode temaModu, bool rotaDisiGorunsunMu, NetFectDizaynList? netFectDizaynList, YaziciList? yaziciList, EditTipiEnum olcumGirisiBelgeTipi, bool kapaliBelgelerListelenmesinMi, bool sayimStokSecildigindeHemenKaydet, bool sayimOtomatikEtiketYazdir, Map<String, dynamic> stokGorunecekEkstraAlanlar, int stokListesiGridSayisi, String urunGrubunaGoreSatisRaporTipi, bool urunGrubunaGoreGruplansin, String cariListesiSirala, String stokListesiSirala, bool irsFaturalasanIrsaliyelerGelsin, bool eIrsaliyeSeciliGelsin, DepoList? depoTalepDepoList, String faturaKarlilikMaliyetTipi, List<String> stokhareketleriGizlenecekAlanlar, bool stokhareketleriDovizliGoster, bool sayimNqrOkutuldugundaQRAc
});




}
/// @nodoc
class __$BaseProfilParametreModelCopyWithImpl<$Res>
    implements _$BaseProfilParametreModelCopyWith<$Res> {
  __$BaseProfilParametreModelCopyWithImpl(this._self, this._then);

  final _BaseProfilParametreModel _self;
  final $Res Function(_BaseProfilParametreModel) _then;

/// Create a copy of BaseProfilParametreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? siparisYeniKaydaHazirla = null,Object? faturaYeniKaydaHazirla = null,Object? talepTeklifYeniKaydaHazirla = null,Object? transferYeniKaydaHazirla = null,Object? siparisEkAlan = null,Object? siparisMiktar = null,Object? siparisVade = null,Object? kurlariSilTekrarGuncelle = null,Object? stokResimleriGoster = null,Object? stokYazdirDizaynVeYaziciHatirla = null,Object? stokSecildigindeYazdir = null,Object? finansOzelRaporGrafikGoster = null,Object? acikTemaMi = null,Object? temaModu = null,Object? rotaDisiGorunsunMu = null,Object? netFectDizaynList = freezed,Object? yaziciList = freezed,Object? olcumGirisiBelgeTipi = null,Object? kapaliBelgelerListelenmesinMi = null,Object? sayimStokSecildigindeHemenKaydet = null,Object? sayimOtomatikEtiketYazdir = null,Object? stokGorunecekEkstraAlanlar = null,Object? stokListesiGridSayisi = null,Object? urunGrubunaGoreSatisRaporTipi = null,Object? urunGrubunaGoreGruplansin = null,Object? cariListesiSirala = null,Object? stokListesiSirala = null,Object? irsFaturalasanIrsaliyelerGelsin = null,Object? eIrsaliyeSeciliGelsin = null,Object? depoTalepDepoList = freezed,Object? faturaKarlilikMaliyetTipi = null,Object? stokhareketleriGizlenecekAlanlar = null,Object? stokhareketleriDovizliGoster = null,Object? sayimNqrOkutuldugundaQRAc = null,}) {
  return _then(_BaseProfilParametreModel(
siparisYeniKaydaHazirla: null == siparisYeniKaydaHazirla ? _self.siparisYeniKaydaHazirla : siparisYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
as bool,faturaYeniKaydaHazirla: null == faturaYeniKaydaHazirla ? _self.faturaYeniKaydaHazirla : faturaYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
as bool,talepTeklifYeniKaydaHazirla: null == talepTeklifYeniKaydaHazirla ? _self.talepTeklifYeniKaydaHazirla : talepTeklifYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
as bool,transferYeniKaydaHazirla: null == transferYeniKaydaHazirla ? _self.transferYeniKaydaHazirla : transferYeniKaydaHazirla // ignore: cast_nullable_to_non_nullable
as bool,siparisEkAlan: null == siparisEkAlan ? _self.siparisEkAlan : siparisEkAlan // ignore: cast_nullable_to_non_nullable
as bool,siparisMiktar: null == siparisMiktar ? _self.siparisMiktar : siparisMiktar // ignore: cast_nullable_to_non_nullable
as bool,siparisVade: null == siparisVade ? _self.siparisVade : siparisVade // ignore: cast_nullable_to_non_nullable
as bool,kurlariSilTekrarGuncelle: null == kurlariSilTekrarGuncelle ? _self.kurlariSilTekrarGuncelle : kurlariSilTekrarGuncelle // ignore: cast_nullable_to_non_nullable
as bool,stokResimleriGoster: null == stokResimleriGoster ? _self.stokResimleriGoster : stokResimleriGoster // ignore: cast_nullable_to_non_nullable
as bool,stokYazdirDizaynVeYaziciHatirla: null == stokYazdirDizaynVeYaziciHatirla ? _self.stokYazdirDizaynVeYaziciHatirla : stokYazdirDizaynVeYaziciHatirla // ignore: cast_nullable_to_non_nullable
as bool,stokSecildigindeYazdir: null == stokSecildigindeYazdir ? _self.stokSecildigindeYazdir : stokSecildigindeYazdir // ignore: cast_nullable_to_non_nullable
as bool,finansOzelRaporGrafikGoster: null == finansOzelRaporGrafikGoster ? _self.finansOzelRaporGrafikGoster : finansOzelRaporGrafikGoster // ignore: cast_nullable_to_non_nullable
as bool,acikTemaMi: null == acikTemaMi ? _self.acikTemaMi : acikTemaMi // ignore: cast_nullable_to_non_nullable
as bool,temaModu: null == temaModu ? _self.temaModu : temaModu // ignore: cast_nullable_to_non_nullable
as ThemeMode,rotaDisiGorunsunMu: null == rotaDisiGorunsunMu ? _self.rotaDisiGorunsunMu : rotaDisiGorunsunMu // ignore: cast_nullable_to_non_nullable
as bool,netFectDizaynList: freezed == netFectDizaynList ? _self.netFectDizaynList : netFectDizaynList // ignore: cast_nullable_to_non_nullable
as NetFectDizaynList?,yaziciList: freezed == yaziciList ? _self.yaziciList : yaziciList // ignore: cast_nullable_to_non_nullable
as YaziciList?,olcumGirisiBelgeTipi: null == olcumGirisiBelgeTipi ? _self.olcumGirisiBelgeTipi : olcumGirisiBelgeTipi // ignore: cast_nullable_to_non_nullable
as EditTipiEnum,kapaliBelgelerListelenmesinMi: null == kapaliBelgelerListelenmesinMi ? _self.kapaliBelgelerListelenmesinMi : kapaliBelgelerListelenmesinMi // ignore: cast_nullable_to_non_nullable
as bool,sayimStokSecildigindeHemenKaydet: null == sayimStokSecildigindeHemenKaydet ? _self.sayimStokSecildigindeHemenKaydet : sayimStokSecildigindeHemenKaydet // ignore: cast_nullable_to_non_nullable
as bool,sayimOtomatikEtiketYazdir: null == sayimOtomatikEtiketYazdir ? _self.sayimOtomatikEtiketYazdir : sayimOtomatikEtiketYazdir // ignore: cast_nullable_to_non_nullable
as bool,stokGorunecekEkstraAlanlar: null == stokGorunecekEkstraAlanlar ? _self._stokGorunecekEkstraAlanlar : stokGorunecekEkstraAlanlar // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,stokListesiGridSayisi: null == stokListesiGridSayisi ? _self.stokListesiGridSayisi : stokListesiGridSayisi // ignore: cast_nullable_to_non_nullable
as int,urunGrubunaGoreSatisRaporTipi: null == urunGrubunaGoreSatisRaporTipi ? _self.urunGrubunaGoreSatisRaporTipi : urunGrubunaGoreSatisRaporTipi // ignore: cast_nullable_to_non_nullable
as String,urunGrubunaGoreGruplansin: null == urunGrubunaGoreGruplansin ? _self.urunGrubunaGoreGruplansin : urunGrubunaGoreGruplansin // ignore: cast_nullable_to_non_nullable
as bool,cariListesiSirala: null == cariListesiSirala ? _self.cariListesiSirala : cariListesiSirala // ignore: cast_nullable_to_non_nullable
as String,stokListesiSirala: null == stokListesiSirala ? _self.stokListesiSirala : stokListesiSirala // ignore: cast_nullable_to_non_nullable
as String,irsFaturalasanIrsaliyelerGelsin: null == irsFaturalasanIrsaliyelerGelsin ? _self.irsFaturalasanIrsaliyelerGelsin : irsFaturalasanIrsaliyelerGelsin // ignore: cast_nullable_to_non_nullable
as bool,eIrsaliyeSeciliGelsin: null == eIrsaliyeSeciliGelsin ? _self.eIrsaliyeSeciliGelsin : eIrsaliyeSeciliGelsin // ignore: cast_nullable_to_non_nullable
as bool,depoTalepDepoList: freezed == depoTalepDepoList ? _self.depoTalepDepoList : depoTalepDepoList // ignore: cast_nullable_to_non_nullable
as DepoList?,faturaKarlilikMaliyetTipi: null == faturaKarlilikMaliyetTipi ? _self.faturaKarlilikMaliyetTipi : faturaKarlilikMaliyetTipi // ignore: cast_nullable_to_non_nullable
as String,stokhareketleriGizlenecekAlanlar: null == stokhareketleriGizlenecekAlanlar ? _self._stokhareketleriGizlenecekAlanlar : stokhareketleriGizlenecekAlanlar // ignore: cast_nullable_to_non_nullable
as List<String>,stokhareketleriDovizliGoster: null == stokhareketleriDovizliGoster ? _self.stokhareketleriDovizliGoster : stokhareketleriDovizliGoster // ignore: cast_nullable_to_non_nullable
as bool,sayimNqrOkutuldugundaQRAc: null == sayimNqrOkutuldugundaQRAc ? _self.sayimNqrOkutuldugundaQRAc : sayimNqrOkutuldugundaQRAc // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
