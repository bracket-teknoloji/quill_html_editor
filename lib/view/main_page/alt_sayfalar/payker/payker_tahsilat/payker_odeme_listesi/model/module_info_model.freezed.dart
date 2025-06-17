// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModuleInfoModel {

 Hesap? get hesap; List<Moduller>? get moduller; DateTime? get kayitTarihi;
/// Create a copy of ModuleInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModuleInfoModelCopyWith<ModuleInfoModel> get copyWith => _$ModuleInfoModelCopyWithImpl<ModuleInfoModel>(this as ModuleInfoModel, _$identity);







}

/// @nodoc
abstract mixin class $ModuleInfoModelCopyWith<$Res>  {
  factory $ModuleInfoModelCopyWith(ModuleInfoModel value, $Res Function(ModuleInfoModel) _then) = _$ModuleInfoModelCopyWithImpl;
@useResult
$Res call({
 Hesap? hesap, List<Moduller>? moduller, DateTime? kayitTarihi
});




}
/// @nodoc
class _$ModuleInfoModelCopyWithImpl<$Res>
    implements $ModuleInfoModelCopyWith<$Res> {
  _$ModuleInfoModelCopyWithImpl(this._self, this._then);

  final ModuleInfoModel _self;
  final $Res Function(ModuleInfoModel) _then;

/// Create a copy of ModuleInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hesap = freezed,Object? moduller = freezed,Object? kayitTarihi = freezed,}) {
  return _then(ModuleInfoModel(
hesap: freezed == hesap ? _self.hesap : hesap // ignore: cast_nullable_to_non_nullable
as Hesap?,moduller: freezed == moduller ? _self.moduller : moduller // ignore: cast_nullable_to_non_nullable
as List<Moduller>?,kayitTarihi: freezed == kayitTarihi ? _self.kayitTarihi : kayitTarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}



/// @nodoc
mixin _$Hesap {

@HiveField(0) int? get id;@HiveField(1) String? get email;@HiveField(2) String? get parola;@HiveField(3) String? get adi;@HiveField(4) String? get soyadi;@HiveField(5) String? get adiSoyadi;@HiveField(6) String? get firma;@HiveField(7) String? get telefon;@HiveField(8) String? get adres;@HiveField(9) int? get vergiDairesi;@HiveField(10) String? get vergiDairesiAdi;@HiveField(11) String? get vergiNumarasi;@HiveField(12) int? get ilKodu;@HiveField(13) String? get ilAdi;@HiveField(14) int? get ilceKodu;@HiveField(15) String? get ilceAdi;@HiveField(16) bool? get admin;@HiveField(17) bool? get aktif;@HiveField(18) bool? get bayiMi;@HiveField(19) int? get kullaniciSayisi;@HiveField(20) String? get dogrulamaKod;@HiveField(21) bool? get yetkiSerbestrapor;@HiveField(22) bool? get yetkiDizayn;@HiveField(23) bool? get yetkiSohbet;@HiveField(24) bool? get yetkiAjanda;@HiveField(25) bool? get yetkiYedekleme;@HiveField(26) DateTime? get kayittarihi;@HiveField(27) bool? get ftpKullanimi;@HiveField(28) String? get ftpAdres;@HiveField(29) String? get ftpKullaniciAdi;@HiveField(30) String? get ftpParola;@HiveField(31) bool? get ftpDosyaYedek;@HiveField(32) List<Cihazlar>? get cihazlar;@HiveField(33) DeveloperBilgi? get developerBilgi;@HiveField(34) String? get erpTipi;@HiveField(35) String? get erpVersiyon;@HiveField(36) dynamic get aciklama;
/// Create a copy of Hesap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HesapCopyWith<Hesap> get copyWith => _$HesapCopyWithImpl<Hesap>(this as Hesap, _$identity);

  /// Serializes this Hesap to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hesap&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.parola, parola) || other.parola == parola)&&(identical(other.adi, adi) || other.adi == adi)&&(identical(other.soyadi, soyadi) || other.soyadi == soyadi)&&(identical(other.adiSoyadi, adiSoyadi) || other.adiSoyadi == adiSoyadi)&&(identical(other.firma, firma) || other.firma == firma)&&(identical(other.telefon, telefon) || other.telefon == telefon)&&(identical(other.adres, adres) || other.adres == adres)&&(identical(other.vergiDairesi, vergiDairesi) || other.vergiDairesi == vergiDairesi)&&(identical(other.vergiDairesiAdi, vergiDairesiAdi) || other.vergiDairesiAdi == vergiDairesiAdi)&&(identical(other.vergiNumarasi, vergiNumarasi) || other.vergiNumarasi == vergiNumarasi)&&(identical(other.ilKodu, ilKodu) || other.ilKodu == ilKodu)&&(identical(other.ilAdi, ilAdi) || other.ilAdi == ilAdi)&&(identical(other.ilceKodu, ilceKodu) || other.ilceKodu == ilceKodu)&&(identical(other.ilceAdi, ilceAdi) || other.ilceAdi == ilceAdi)&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.aktif, aktif) || other.aktif == aktif)&&(identical(other.bayiMi, bayiMi) || other.bayiMi == bayiMi)&&(identical(other.kullaniciSayisi, kullaniciSayisi) || other.kullaniciSayisi == kullaniciSayisi)&&(identical(other.dogrulamaKod, dogrulamaKod) || other.dogrulamaKod == dogrulamaKod)&&(identical(other.yetkiSerbestrapor, yetkiSerbestrapor) || other.yetkiSerbestrapor == yetkiSerbestrapor)&&(identical(other.yetkiDizayn, yetkiDizayn) || other.yetkiDizayn == yetkiDizayn)&&(identical(other.yetkiSohbet, yetkiSohbet) || other.yetkiSohbet == yetkiSohbet)&&(identical(other.yetkiAjanda, yetkiAjanda) || other.yetkiAjanda == yetkiAjanda)&&(identical(other.yetkiYedekleme, yetkiYedekleme) || other.yetkiYedekleme == yetkiYedekleme)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&(identical(other.ftpKullanimi, ftpKullanimi) || other.ftpKullanimi == ftpKullanimi)&&(identical(other.ftpAdres, ftpAdres) || other.ftpAdres == ftpAdres)&&(identical(other.ftpKullaniciAdi, ftpKullaniciAdi) || other.ftpKullaniciAdi == ftpKullaniciAdi)&&(identical(other.ftpParola, ftpParola) || other.ftpParola == ftpParola)&&(identical(other.ftpDosyaYedek, ftpDosyaYedek) || other.ftpDosyaYedek == ftpDosyaYedek)&&const DeepCollectionEquality().equals(other.cihazlar, cihazlar)&&(identical(other.developerBilgi, developerBilgi) || other.developerBilgi == developerBilgi)&&(identical(other.erpTipi, erpTipi) || other.erpTipi == erpTipi)&&(identical(other.erpVersiyon, erpVersiyon) || other.erpVersiyon == erpVersiyon)&&const DeepCollectionEquality().equals(other.aciklama, aciklama));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,email,parola,adi,soyadi,adiSoyadi,firma,telefon,adres,vergiDairesi,vergiDairesiAdi,vergiNumarasi,ilKodu,ilAdi,ilceKodu,ilceAdi,admin,aktif,bayiMi,kullaniciSayisi,dogrulamaKod,yetkiSerbestrapor,yetkiDizayn,yetkiSohbet,yetkiAjanda,yetkiYedekleme,kayittarihi,ftpKullanimi,ftpAdres,ftpKullaniciAdi,ftpParola,ftpDosyaYedek,const DeepCollectionEquality().hash(cihazlar),developerBilgi,erpTipi,erpVersiyon,const DeepCollectionEquality().hash(aciklama)]);



}

/// @nodoc
abstract mixin class $HesapCopyWith<$Res>  {
  factory $HesapCopyWith(Hesap value, $Res Function(Hesap) _then) = _$HesapCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int? id,@HiveField(1) String? email,@HiveField(2) String? parola,@HiveField(3) String? adi,@HiveField(4) String? soyadi,@HiveField(5) String? adiSoyadi,@HiveField(6) String? firma,@HiveField(7) String? telefon,@HiveField(8) String? adres,@HiveField(9) int? vergiDairesi,@HiveField(10) String? vergiDairesiAdi,@HiveField(11) String? vergiNumarasi,@HiveField(12) int? ilKodu,@HiveField(13) String? ilAdi,@HiveField(14) int? ilceKodu,@HiveField(15) String? ilceAdi,@HiveField(16) bool? admin,@HiveField(17) bool? aktif,@HiveField(18) bool? bayiMi,@HiveField(19) int? kullaniciSayisi,@HiveField(20) String? dogrulamaKod,@HiveField(21) bool? yetkiSerbestrapor,@HiveField(22) bool? yetkiDizayn,@HiveField(23) bool? yetkiSohbet,@HiveField(24) bool? yetkiAjanda,@HiveField(25) bool? yetkiYedekleme,@HiveField(26) DateTime? kayittarihi,@HiveField(27) bool? ftpKullanimi,@HiveField(28) String? ftpAdres,@HiveField(29) String? ftpKullaniciAdi,@HiveField(30) String? ftpParola,@HiveField(31) bool? ftpDosyaYedek,@HiveField(32) List<Cihazlar>? cihazlar,@HiveField(33) DeveloperBilgi? developerBilgi,@HiveField(34) String? erpTipi,@HiveField(35) String? erpVersiyon,@HiveField(36) dynamic aciklama
});


$DeveloperBilgiCopyWith<$Res>? get developerBilgi;

}
/// @nodoc
class _$HesapCopyWithImpl<$Res>
    implements $HesapCopyWith<$Res> {
  _$HesapCopyWithImpl(this._self, this._then);

  final Hesap _self;
  final $Res Function(Hesap) _then;

/// Create a copy of Hesap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? parola = freezed,Object? adi = freezed,Object? soyadi = freezed,Object? adiSoyadi = freezed,Object? firma = freezed,Object? telefon = freezed,Object? adres = freezed,Object? vergiDairesi = freezed,Object? vergiDairesiAdi = freezed,Object? vergiNumarasi = freezed,Object? ilKodu = freezed,Object? ilAdi = freezed,Object? ilceKodu = freezed,Object? ilceAdi = freezed,Object? admin = freezed,Object? aktif = freezed,Object? bayiMi = freezed,Object? kullaniciSayisi = freezed,Object? dogrulamaKod = freezed,Object? yetkiSerbestrapor = freezed,Object? yetkiDizayn = freezed,Object? yetkiSohbet = freezed,Object? yetkiAjanda = freezed,Object? yetkiYedekleme = freezed,Object? kayittarihi = freezed,Object? ftpKullanimi = freezed,Object? ftpAdres = freezed,Object? ftpKullaniciAdi = freezed,Object? ftpParola = freezed,Object? ftpDosyaYedek = freezed,Object? cihazlar = freezed,Object? developerBilgi = freezed,Object? erpTipi = freezed,Object? erpVersiyon = freezed,Object? aciklama = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,parola: freezed == parola ? _self.parola : parola // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,soyadi: freezed == soyadi ? _self.soyadi : soyadi // ignore: cast_nullable_to_non_nullable
as String?,adiSoyadi: freezed == adiSoyadi ? _self.adiSoyadi : adiSoyadi // ignore: cast_nullable_to_non_nullable
as String?,firma: freezed == firma ? _self.firma : firma // ignore: cast_nullable_to_non_nullable
as String?,telefon: freezed == telefon ? _self.telefon : telefon // ignore: cast_nullable_to_non_nullable
as String?,adres: freezed == adres ? _self.adres : adres // ignore: cast_nullable_to_non_nullable
as String?,vergiDairesi: freezed == vergiDairesi ? _self.vergiDairesi : vergiDairesi // ignore: cast_nullable_to_non_nullable
as int?,vergiDairesiAdi: freezed == vergiDairesiAdi ? _self.vergiDairesiAdi : vergiDairesiAdi // ignore: cast_nullable_to_non_nullable
as String?,vergiNumarasi: freezed == vergiNumarasi ? _self.vergiNumarasi : vergiNumarasi // ignore: cast_nullable_to_non_nullable
as String?,ilKodu: freezed == ilKodu ? _self.ilKodu : ilKodu // ignore: cast_nullable_to_non_nullable
as int?,ilAdi: freezed == ilAdi ? _self.ilAdi : ilAdi // ignore: cast_nullable_to_non_nullable
as String?,ilceKodu: freezed == ilceKodu ? _self.ilceKodu : ilceKodu // ignore: cast_nullable_to_non_nullable
as int?,ilceAdi: freezed == ilceAdi ? _self.ilceAdi : ilceAdi // ignore: cast_nullable_to_non_nullable
as String?,admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as bool?,aktif: freezed == aktif ? _self.aktif : aktif // ignore: cast_nullable_to_non_nullable
as bool?,bayiMi: freezed == bayiMi ? _self.bayiMi : bayiMi // ignore: cast_nullable_to_non_nullable
as bool?,kullaniciSayisi: freezed == kullaniciSayisi ? _self.kullaniciSayisi : kullaniciSayisi // ignore: cast_nullable_to_non_nullable
as int?,dogrulamaKod: freezed == dogrulamaKod ? _self.dogrulamaKod : dogrulamaKod // ignore: cast_nullable_to_non_nullable
as String?,yetkiSerbestrapor: freezed == yetkiSerbestrapor ? _self.yetkiSerbestrapor : yetkiSerbestrapor // ignore: cast_nullable_to_non_nullable
as bool?,yetkiDizayn: freezed == yetkiDizayn ? _self.yetkiDizayn : yetkiDizayn // ignore: cast_nullable_to_non_nullable
as bool?,yetkiSohbet: freezed == yetkiSohbet ? _self.yetkiSohbet : yetkiSohbet // ignore: cast_nullable_to_non_nullable
as bool?,yetkiAjanda: freezed == yetkiAjanda ? _self.yetkiAjanda : yetkiAjanda // ignore: cast_nullable_to_non_nullable
as bool?,yetkiYedekleme: freezed == yetkiYedekleme ? _self.yetkiYedekleme : yetkiYedekleme // ignore: cast_nullable_to_non_nullable
as bool?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,ftpKullanimi: freezed == ftpKullanimi ? _self.ftpKullanimi : ftpKullanimi // ignore: cast_nullable_to_non_nullable
as bool?,ftpAdres: freezed == ftpAdres ? _self.ftpAdres : ftpAdres // ignore: cast_nullable_to_non_nullable
as String?,ftpKullaniciAdi: freezed == ftpKullaniciAdi ? _self.ftpKullaniciAdi : ftpKullaniciAdi // ignore: cast_nullable_to_non_nullable
as String?,ftpParola: freezed == ftpParola ? _self.ftpParola : ftpParola // ignore: cast_nullable_to_non_nullable
as String?,ftpDosyaYedek: freezed == ftpDosyaYedek ? _self.ftpDosyaYedek : ftpDosyaYedek // ignore: cast_nullable_to_non_nullable
as bool?,cihazlar: freezed == cihazlar ? _self.cihazlar : cihazlar // ignore: cast_nullable_to_non_nullable
as List<Cihazlar>?,developerBilgi: freezed == developerBilgi ? _self.developerBilgi : developerBilgi // ignore: cast_nullable_to_non_nullable
as DeveloperBilgi?,erpTipi: freezed == erpTipi ? _self.erpTipi : erpTipi // ignore: cast_nullable_to_non_nullable
as String?,erpVersiyon: freezed == erpVersiyon ? _self.erpVersiyon : erpVersiyon // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of Hesap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperBilgiCopyWith<$Res>? get developerBilgi {
    if (_self.developerBilgi == null) {
    return null;
  }

  return $DeveloperBilgiCopyWith<$Res>(_self.developerBilgi!, (value) {
    return _then(_self.copyWith(developerBilgi: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Hesap implements Hesap {
  const _Hesap({@HiveField(0) this.id, @HiveField(1) this.email, @HiveField(2) this.parola, @HiveField(3) this.adi, @HiveField(4) this.soyadi, @HiveField(5) this.adiSoyadi, @HiveField(6) this.firma, @HiveField(7) this.telefon, @HiveField(8) this.adres, @HiveField(9) this.vergiDairesi, @HiveField(10) this.vergiDairesiAdi, @HiveField(11) this.vergiNumarasi, @HiveField(12) this.ilKodu, @HiveField(13) this.ilAdi, @HiveField(14) this.ilceKodu, @HiveField(15) this.ilceAdi, @HiveField(16) this.admin, @HiveField(17) this.aktif, @HiveField(18) this.bayiMi, @HiveField(19) this.kullaniciSayisi, @HiveField(20) this.dogrulamaKod, @HiveField(21) this.yetkiSerbestrapor, @HiveField(22) this.yetkiDizayn, @HiveField(23) this.yetkiSohbet, @HiveField(24) this.yetkiAjanda, @HiveField(25) this.yetkiYedekleme, @HiveField(26) this.kayittarihi, @HiveField(27) this.ftpKullanimi, @HiveField(28) this.ftpAdres, @HiveField(29) this.ftpKullaniciAdi, @HiveField(30) this.ftpParola, @HiveField(31) this.ftpDosyaYedek, @HiveField(32) final  List<Cihazlar>? cihazlar, @HiveField(33) this.developerBilgi, @HiveField(34) this.erpTipi, @HiveField(35) this.erpVersiyon, @HiveField(36) this.aciklama}): _cihazlar = cihazlar;
  factory _Hesap.fromJson(Map<String, dynamic> json) => _$HesapFromJson(json);

@override@HiveField(0) final  int? id;
@override@HiveField(1) final  String? email;
@override@HiveField(2) final  String? parola;
@override@HiveField(3) final  String? adi;
@override@HiveField(4) final  String? soyadi;
@override@HiveField(5) final  String? adiSoyadi;
@override@HiveField(6) final  String? firma;
@override@HiveField(7) final  String? telefon;
@override@HiveField(8) final  String? adres;
@override@HiveField(9) final  int? vergiDairesi;
@override@HiveField(10) final  String? vergiDairesiAdi;
@override@HiveField(11) final  String? vergiNumarasi;
@override@HiveField(12) final  int? ilKodu;
@override@HiveField(13) final  String? ilAdi;
@override@HiveField(14) final  int? ilceKodu;
@override@HiveField(15) final  String? ilceAdi;
@override@HiveField(16) final  bool? admin;
@override@HiveField(17) final  bool? aktif;
@override@HiveField(18) final  bool? bayiMi;
@override@HiveField(19) final  int? kullaniciSayisi;
@override@HiveField(20) final  String? dogrulamaKod;
@override@HiveField(21) final  bool? yetkiSerbestrapor;
@override@HiveField(22) final  bool? yetkiDizayn;
@override@HiveField(23) final  bool? yetkiSohbet;
@override@HiveField(24) final  bool? yetkiAjanda;
@override@HiveField(25) final  bool? yetkiYedekleme;
@override@HiveField(26) final  DateTime? kayittarihi;
@override@HiveField(27) final  bool? ftpKullanimi;
@override@HiveField(28) final  String? ftpAdres;
@override@HiveField(29) final  String? ftpKullaniciAdi;
@override@HiveField(30) final  String? ftpParola;
@override@HiveField(31) final  bool? ftpDosyaYedek;
 final  List<Cihazlar>? _cihazlar;
@override@HiveField(32) List<Cihazlar>? get cihazlar {
  final value = _cihazlar;
  if (value == null) return null;
  if (_cihazlar is EqualUnmodifiableListView) return _cihazlar;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@HiveField(33) final  DeveloperBilgi? developerBilgi;
@override@HiveField(34) final  String? erpTipi;
@override@HiveField(35) final  String? erpVersiyon;
@override@HiveField(36) final  dynamic aciklama;

/// Create a copy of Hesap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HesapCopyWith<_Hesap> get copyWith => __$HesapCopyWithImpl<_Hesap>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HesapToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hesap&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.parola, parola) || other.parola == parola)&&(identical(other.adi, adi) || other.adi == adi)&&(identical(other.soyadi, soyadi) || other.soyadi == soyadi)&&(identical(other.adiSoyadi, adiSoyadi) || other.adiSoyadi == adiSoyadi)&&(identical(other.firma, firma) || other.firma == firma)&&(identical(other.telefon, telefon) || other.telefon == telefon)&&(identical(other.adres, adres) || other.adres == adres)&&(identical(other.vergiDairesi, vergiDairesi) || other.vergiDairesi == vergiDairesi)&&(identical(other.vergiDairesiAdi, vergiDairesiAdi) || other.vergiDairesiAdi == vergiDairesiAdi)&&(identical(other.vergiNumarasi, vergiNumarasi) || other.vergiNumarasi == vergiNumarasi)&&(identical(other.ilKodu, ilKodu) || other.ilKodu == ilKodu)&&(identical(other.ilAdi, ilAdi) || other.ilAdi == ilAdi)&&(identical(other.ilceKodu, ilceKodu) || other.ilceKodu == ilceKodu)&&(identical(other.ilceAdi, ilceAdi) || other.ilceAdi == ilceAdi)&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.aktif, aktif) || other.aktif == aktif)&&(identical(other.bayiMi, bayiMi) || other.bayiMi == bayiMi)&&(identical(other.kullaniciSayisi, kullaniciSayisi) || other.kullaniciSayisi == kullaniciSayisi)&&(identical(other.dogrulamaKod, dogrulamaKod) || other.dogrulamaKod == dogrulamaKod)&&(identical(other.yetkiSerbestrapor, yetkiSerbestrapor) || other.yetkiSerbestrapor == yetkiSerbestrapor)&&(identical(other.yetkiDizayn, yetkiDizayn) || other.yetkiDizayn == yetkiDizayn)&&(identical(other.yetkiSohbet, yetkiSohbet) || other.yetkiSohbet == yetkiSohbet)&&(identical(other.yetkiAjanda, yetkiAjanda) || other.yetkiAjanda == yetkiAjanda)&&(identical(other.yetkiYedekleme, yetkiYedekleme) || other.yetkiYedekleme == yetkiYedekleme)&&(identical(other.kayittarihi, kayittarihi) || other.kayittarihi == kayittarihi)&&(identical(other.ftpKullanimi, ftpKullanimi) || other.ftpKullanimi == ftpKullanimi)&&(identical(other.ftpAdres, ftpAdres) || other.ftpAdres == ftpAdres)&&(identical(other.ftpKullaniciAdi, ftpKullaniciAdi) || other.ftpKullaniciAdi == ftpKullaniciAdi)&&(identical(other.ftpParola, ftpParola) || other.ftpParola == ftpParola)&&(identical(other.ftpDosyaYedek, ftpDosyaYedek) || other.ftpDosyaYedek == ftpDosyaYedek)&&const DeepCollectionEquality().equals(other._cihazlar, _cihazlar)&&(identical(other.developerBilgi, developerBilgi) || other.developerBilgi == developerBilgi)&&(identical(other.erpTipi, erpTipi) || other.erpTipi == erpTipi)&&(identical(other.erpVersiyon, erpVersiyon) || other.erpVersiyon == erpVersiyon)&&const DeepCollectionEquality().equals(other.aciklama, aciklama));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,email,parola,adi,soyadi,adiSoyadi,firma,telefon,adres,vergiDairesi,vergiDairesiAdi,vergiNumarasi,ilKodu,ilAdi,ilceKodu,ilceAdi,admin,aktif,bayiMi,kullaniciSayisi,dogrulamaKod,yetkiSerbestrapor,yetkiDizayn,yetkiSohbet,yetkiAjanda,yetkiYedekleme,kayittarihi,ftpKullanimi,ftpAdres,ftpKullaniciAdi,ftpParola,ftpDosyaYedek,const DeepCollectionEquality().hash(_cihazlar),developerBilgi,erpTipi,erpVersiyon,const DeepCollectionEquality().hash(aciklama)]);



}

/// @nodoc
abstract mixin class _$HesapCopyWith<$Res> implements $HesapCopyWith<$Res> {
  factory _$HesapCopyWith(_Hesap value, $Res Function(_Hesap) _then) = __$HesapCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int? id,@HiveField(1) String? email,@HiveField(2) String? parola,@HiveField(3) String? adi,@HiveField(4) String? soyadi,@HiveField(5) String? adiSoyadi,@HiveField(6) String? firma,@HiveField(7) String? telefon,@HiveField(8) String? adres,@HiveField(9) int? vergiDairesi,@HiveField(10) String? vergiDairesiAdi,@HiveField(11) String? vergiNumarasi,@HiveField(12) int? ilKodu,@HiveField(13) String? ilAdi,@HiveField(14) int? ilceKodu,@HiveField(15) String? ilceAdi,@HiveField(16) bool? admin,@HiveField(17) bool? aktif,@HiveField(18) bool? bayiMi,@HiveField(19) int? kullaniciSayisi,@HiveField(20) String? dogrulamaKod,@HiveField(21) bool? yetkiSerbestrapor,@HiveField(22) bool? yetkiDizayn,@HiveField(23) bool? yetkiSohbet,@HiveField(24) bool? yetkiAjanda,@HiveField(25) bool? yetkiYedekleme,@HiveField(26) DateTime? kayittarihi,@HiveField(27) bool? ftpKullanimi,@HiveField(28) String? ftpAdres,@HiveField(29) String? ftpKullaniciAdi,@HiveField(30) String? ftpParola,@HiveField(31) bool? ftpDosyaYedek,@HiveField(32) List<Cihazlar>? cihazlar,@HiveField(33) DeveloperBilgi? developerBilgi,@HiveField(34) String? erpTipi,@HiveField(35) String? erpVersiyon,@HiveField(36) dynamic aciklama
});


@override $DeveloperBilgiCopyWith<$Res>? get developerBilgi;

}
/// @nodoc
class __$HesapCopyWithImpl<$Res>
    implements _$HesapCopyWith<$Res> {
  __$HesapCopyWithImpl(this._self, this._then);

  final _Hesap _self;
  final $Res Function(_Hesap) _then;

/// Create a copy of Hesap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? parola = freezed,Object? adi = freezed,Object? soyadi = freezed,Object? adiSoyadi = freezed,Object? firma = freezed,Object? telefon = freezed,Object? adres = freezed,Object? vergiDairesi = freezed,Object? vergiDairesiAdi = freezed,Object? vergiNumarasi = freezed,Object? ilKodu = freezed,Object? ilAdi = freezed,Object? ilceKodu = freezed,Object? ilceAdi = freezed,Object? admin = freezed,Object? aktif = freezed,Object? bayiMi = freezed,Object? kullaniciSayisi = freezed,Object? dogrulamaKod = freezed,Object? yetkiSerbestrapor = freezed,Object? yetkiDizayn = freezed,Object? yetkiSohbet = freezed,Object? yetkiAjanda = freezed,Object? yetkiYedekleme = freezed,Object? kayittarihi = freezed,Object? ftpKullanimi = freezed,Object? ftpAdres = freezed,Object? ftpKullaniciAdi = freezed,Object? ftpParola = freezed,Object? ftpDosyaYedek = freezed,Object? cihazlar = freezed,Object? developerBilgi = freezed,Object? erpTipi = freezed,Object? erpVersiyon = freezed,Object? aciklama = freezed,}) {
  return _then(_Hesap(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,parola: freezed == parola ? _self.parola : parola // ignore: cast_nullable_to_non_nullable
as String?,adi: freezed == adi ? _self.adi : adi // ignore: cast_nullable_to_non_nullable
as String?,soyadi: freezed == soyadi ? _self.soyadi : soyadi // ignore: cast_nullable_to_non_nullable
as String?,adiSoyadi: freezed == adiSoyadi ? _self.adiSoyadi : adiSoyadi // ignore: cast_nullable_to_non_nullable
as String?,firma: freezed == firma ? _self.firma : firma // ignore: cast_nullable_to_non_nullable
as String?,telefon: freezed == telefon ? _self.telefon : telefon // ignore: cast_nullable_to_non_nullable
as String?,adres: freezed == adres ? _self.adres : adres // ignore: cast_nullable_to_non_nullable
as String?,vergiDairesi: freezed == vergiDairesi ? _self.vergiDairesi : vergiDairesi // ignore: cast_nullable_to_non_nullable
as int?,vergiDairesiAdi: freezed == vergiDairesiAdi ? _self.vergiDairesiAdi : vergiDairesiAdi // ignore: cast_nullable_to_non_nullable
as String?,vergiNumarasi: freezed == vergiNumarasi ? _self.vergiNumarasi : vergiNumarasi // ignore: cast_nullable_to_non_nullable
as String?,ilKodu: freezed == ilKodu ? _self.ilKodu : ilKodu // ignore: cast_nullable_to_non_nullable
as int?,ilAdi: freezed == ilAdi ? _self.ilAdi : ilAdi // ignore: cast_nullable_to_non_nullable
as String?,ilceKodu: freezed == ilceKodu ? _self.ilceKodu : ilceKodu // ignore: cast_nullable_to_non_nullable
as int?,ilceAdi: freezed == ilceAdi ? _self.ilceAdi : ilceAdi // ignore: cast_nullable_to_non_nullable
as String?,admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as bool?,aktif: freezed == aktif ? _self.aktif : aktif // ignore: cast_nullable_to_non_nullable
as bool?,bayiMi: freezed == bayiMi ? _self.bayiMi : bayiMi // ignore: cast_nullable_to_non_nullable
as bool?,kullaniciSayisi: freezed == kullaniciSayisi ? _self.kullaniciSayisi : kullaniciSayisi // ignore: cast_nullable_to_non_nullable
as int?,dogrulamaKod: freezed == dogrulamaKod ? _self.dogrulamaKod : dogrulamaKod // ignore: cast_nullable_to_non_nullable
as String?,yetkiSerbestrapor: freezed == yetkiSerbestrapor ? _self.yetkiSerbestrapor : yetkiSerbestrapor // ignore: cast_nullable_to_non_nullable
as bool?,yetkiDizayn: freezed == yetkiDizayn ? _self.yetkiDizayn : yetkiDizayn // ignore: cast_nullable_to_non_nullable
as bool?,yetkiSohbet: freezed == yetkiSohbet ? _self.yetkiSohbet : yetkiSohbet // ignore: cast_nullable_to_non_nullable
as bool?,yetkiAjanda: freezed == yetkiAjanda ? _self.yetkiAjanda : yetkiAjanda // ignore: cast_nullable_to_non_nullable
as bool?,yetkiYedekleme: freezed == yetkiYedekleme ? _self.yetkiYedekleme : yetkiYedekleme // ignore: cast_nullable_to_non_nullable
as bool?,kayittarihi: freezed == kayittarihi ? _self.kayittarihi : kayittarihi // ignore: cast_nullable_to_non_nullable
as DateTime?,ftpKullanimi: freezed == ftpKullanimi ? _self.ftpKullanimi : ftpKullanimi // ignore: cast_nullable_to_non_nullable
as bool?,ftpAdres: freezed == ftpAdres ? _self.ftpAdres : ftpAdres // ignore: cast_nullable_to_non_nullable
as String?,ftpKullaniciAdi: freezed == ftpKullaniciAdi ? _self.ftpKullaniciAdi : ftpKullaniciAdi // ignore: cast_nullable_to_non_nullable
as String?,ftpParola: freezed == ftpParola ? _self.ftpParola : ftpParola // ignore: cast_nullable_to_non_nullable
as String?,ftpDosyaYedek: freezed == ftpDosyaYedek ? _self.ftpDosyaYedek : ftpDosyaYedek // ignore: cast_nullable_to_non_nullable
as bool?,cihazlar: freezed == cihazlar ? _self._cihazlar : cihazlar // ignore: cast_nullable_to_non_nullable
as List<Cihazlar>?,developerBilgi: freezed == developerBilgi ? _self.developerBilgi : developerBilgi // ignore: cast_nullable_to_non_nullable
as DeveloperBilgi?,erpTipi: freezed == erpTipi ? _self.erpTipi : erpTipi // ignore: cast_nullable_to_non_nullable
as String?,erpVersiyon: freezed == erpVersiyon ? _self.erpVersiyon : erpVersiyon // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of Hesap
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperBilgiCopyWith<$Res>? get developerBilgi {
    if (_self.developerBilgi == null) {
    return null;
  }

  return $DeveloperBilgiCopyWith<$Res>(_self.developerBilgi!, (value) {
    return _then(_self.copyWith(developerBilgi: value));
  });
}
}


/// @nodoc
mixin _$Cihazlar {

@HiveField(0) int? get id;@HiveField(1) String? get platform;@HiveField(2) String? get versiyon;@HiveField(3) dynamic get storeVersiyon;@HiveField(4) String? get isletimSistemi;@HiveField(5) String? get isletimSistemiVer;@HiveField(6) String? get isletimSistemiPlat;@HiveField(7) String? get lisanskey;@HiveField(8) String? get lisanspc;@HiveField(9) DateTime? get songiristar;@HiveField(10) String? get disIpAdresi;@HiveField(11) String? get erpTipi;@HiveField(12) String? get erpVersiyon;@HiveField(13) bool? get sunucuMu;@HiveField(14) Sqlserverinfo? get sqlserverinfo;@HiveField(15) int? get applicationUptime;
/// Create a copy of Cihazlar
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CihazlarCopyWith<Cihazlar> get copyWith => _$CihazlarCopyWithImpl<Cihazlar>(this as Cihazlar, _$identity);

  /// Serializes this Cihazlar to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cihazlar&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.versiyon, versiyon) || other.versiyon == versiyon)&&const DeepCollectionEquality().equals(other.storeVersiyon, storeVersiyon)&&(identical(other.isletimSistemi, isletimSistemi) || other.isletimSistemi == isletimSistemi)&&(identical(other.isletimSistemiVer, isletimSistemiVer) || other.isletimSistemiVer == isletimSistemiVer)&&(identical(other.isletimSistemiPlat, isletimSistemiPlat) || other.isletimSistemiPlat == isletimSistemiPlat)&&(identical(other.lisanskey, lisanskey) || other.lisanskey == lisanskey)&&(identical(other.lisanspc, lisanspc) || other.lisanspc == lisanspc)&&(identical(other.songiristar, songiristar) || other.songiristar == songiristar)&&(identical(other.disIpAdresi, disIpAdresi) || other.disIpAdresi == disIpAdresi)&&(identical(other.erpTipi, erpTipi) || other.erpTipi == erpTipi)&&(identical(other.erpVersiyon, erpVersiyon) || other.erpVersiyon == erpVersiyon)&&(identical(other.sunucuMu, sunucuMu) || other.sunucuMu == sunucuMu)&&(identical(other.sqlserverinfo, sqlserverinfo) || other.sqlserverinfo == sqlserverinfo)&&(identical(other.applicationUptime, applicationUptime) || other.applicationUptime == applicationUptime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,platform,versiyon,const DeepCollectionEquality().hash(storeVersiyon),isletimSistemi,isletimSistemiVer,isletimSistemiPlat,lisanskey,lisanspc,songiristar,disIpAdresi,erpTipi,erpVersiyon,sunucuMu,sqlserverinfo,applicationUptime);



}

/// @nodoc
abstract mixin class $CihazlarCopyWith<$Res>  {
  factory $CihazlarCopyWith(Cihazlar value, $Res Function(Cihazlar) _then) = _$CihazlarCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int? id,@HiveField(1) String? platform,@HiveField(2) String? versiyon,@HiveField(3) dynamic storeVersiyon,@HiveField(4) String? isletimSistemi,@HiveField(5) String? isletimSistemiVer,@HiveField(6) String? isletimSistemiPlat,@HiveField(7) String? lisanskey,@HiveField(8) String? lisanspc,@HiveField(9) DateTime? songiristar,@HiveField(10) String? disIpAdresi,@HiveField(11) String? erpTipi,@HiveField(12) String? erpVersiyon,@HiveField(13) bool? sunucuMu,@HiveField(14) Sqlserverinfo? sqlserverinfo,@HiveField(15) int? applicationUptime
});


$SqlserverinfoCopyWith<$Res>? get sqlserverinfo;

}
/// @nodoc
class _$CihazlarCopyWithImpl<$Res>
    implements $CihazlarCopyWith<$Res> {
  _$CihazlarCopyWithImpl(this._self, this._then);

  final Cihazlar _self;
  final $Res Function(Cihazlar) _then;

/// Create a copy of Cihazlar
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? platform = freezed,Object? versiyon = freezed,Object? storeVersiyon = freezed,Object? isletimSistemi = freezed,Object? isletimSistemiVer = freezed,Object? isletimSistemiPlat = freezed,Object? lisanskey = freezed,Object? lisanspc = freezed,Object? songiristar = freezed,Object? disIpAdresi = freezed,Object? erpTipi = freezed,Object? erpVersiyon = freezed,Object? sunucuMu = freezed,Object? sqlserverinfo = freezed,Object? applicationUptime = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,versiyon: freezed == versiyon ? _self.versiyon : versiyon // ignore: cast_nullable_to_non_nullable
as String?,storeVersiyon: freezed == storeVersiyon ? _self.storeVersiyon : storeVersiyon // ignore: cast_nullable_to_non_nullable
as dynamic,isletimSistemi: freezed == isletimSistemi ? _self.isletimSistemi : isletimSistemi // ignore: cast_nullable_to_non_nullable
as String?,isletimSistemiVer: freezed == isletimSistemiVer ? _self.isletimSistemiVer : isletimSistemiVer // ignore: cast_nullable_to_non_nullable
as String?,isletimSistemiPlat: freezed == isletimSistemiPlat ? _self.isletimSistemiPlat : isletimSistemiPlat // ignore: cast_nullable_to_non_nullable
as String?,lisanskey: freezed == lisanskey ? _self.lisanskey : lisanskey // ignore: cast_nullable_to_non_nullable
as String?,lisanspc: freezed == lisanspc ? _self.lisanspc : lisanspc // ignore: cast_nullable_to_non_nullable
as String?,songiristar: freezed == songiristar ? _self.songiristar : songiristar // ignore: cast_nullable_to_non_nullable
as DateTime?,disIpAdresi: freezed == disIpAdresi ? _self.disIpAdresi : disIpAdresi // ignore: cast_nullable_to_non_nullable
as String?,erpTipi: freezed == erpTipi ? _self.erpTipi : erpTipi // ignore: cast_nullable_to_non_nullable
as String?,erpVersiyon: freezed == erpVersiyon ? _self.erpVersiyon : erpVersiyon // ignore: cast_nullable_to_non_nullable
as String?,sunucuMu: freezed == sunucuMu ? _self.sunucuMu : sunucuMu // ignore: cast_nullable_to_non_nullable
as bool?,sqlserverinfo: freezed == sqlserverinfo ? _self.sqlserverinfo : sqlserverinfo // ignore: cast_nullable_to_non_nullable
as Sqlserverinfo?,applicationUptime: freezed == applicationUptime ? _self.applicationUptime : applicationUptime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Cihazlar
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SqlserverinfoCopyWith<$Res>? get sqlserverinfo {
    if (_self.sqlserverinfo == null) {
    return null;
  }

  return $SqlserverinfoCopyWith<$Res>(_self.sqlserverinfo!, (value) {
    return _then(_self.copyWith(sqlserverinfo: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Cihazlar implements Cihazlar {
  const _Cihazlar({@HiveField(0) this.id, @HiveField(1) this.platform, @HiveField(2) this.versiyon, @HiveField(3) this.storeVersiyon, @HiveField(4) this.isletimSistemi, @HiveField(5) this.isletimSistemiVer, @HiveField(6) this.isletimSistemiPlat, @HiveField(7) this.lisanskey, @HiveField(8) this.lisanspc, @HiveField(9) this.songiristar, @HiveField(10) this.disIpAdresi, @HiveField(11) this.erpTipi, @HiveField(12) this.erpVersiyon, @HiveField(13) this.sunucuMu, @HiveField(14) this.sqlserverinfo, @HiveField(15) this.applicationUptime});
  factory _Cihazlar.fromJson(Map<String, dynamic> json) => _$CihazlarFromJson(json);

@override@HiveField(0) final  int? id;
@override@HiveField(1) final  String? platform;
@override@HiveField(2) final  String? versiyon;
@override@HiveField(3) final  dynamic storeVersiyon;
@override@HiveField(4) final  String? isletimSistemi;
@override@HiveField(5) final  String? isletimSistemiVer;
@override@HiveField(6) final  String? isletimSistemiPlat;
@override@HiveField(7) final  String? lisanskey;
@override@HiveField(8) final  String? lisanspc;
@override@HiveField(9) final  DateTime? songiristar;
@override@HiveField(10) final  String? disIpAdresi;
@override@HiveField(11) final  String? erpTipi;
@override@HiveField(12) final  String? erpVersiyon;
@override@HiveField(13) final  bool? sunucuMu;
@override@HiveField(14) final  Sqlserverinfo? sqlserverinfo;
@override@HiveField(15) final  int? applicationUptime;

/// Create a copy of Cihazlar
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CihazlarCopyWith<_Cihazlar> get copyWith => __$CihazlarCopyWithImpl<_Cihazlar>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CihazlarToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cihazlar&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.versiyon, versiyon) || other.versiyon == versiyon)&&const DeepCollectionEquality().equals(other.storeVersiyon, storeVersiyon)&&(identical(other.isletimSistemi, isletimSistemi) || other.isletimSistemi == isletimSistemi)&&(identical(other.isletimSistemiVer, isletimSistemiVer) || other.isletimSistemiVer == isletimSistemiVer)&&(identical(other.isletimSistemiPlat, isletimSistemiPlat) || other.isletimSistemiPlat == isletimSistemiPlat)&&(identical(other.lisanskey, lisanskey) || other.lisanskey == lisanskey)&&(identical(other.lisanspc, lisanspc) || other.lisanspc == lisanspc)&&(identical(other.songiristar, songiristar) || other.songiristar == songiristar)&&(identical(other.disIpAdresi, disIpAdresi) || other.disIpAdresi == disIpAdresi)&&(identical(other.erpTipi, erpTipi) || other.erpTipi == erpTipi)&&(identical(other.erpVersiyon, erpVersiyon) || other.erpVersiyon == erpVersiyon)&&(identical(other.sunucuMu, sunucuMu) || other.sunucuMu == sunucuMu)&&(identical(other.sqlserverinfo, sqlserverinfo) || other.sqlserverinfo == sqlserverinfo)&&(identical(other.applicationUptime, applicationUptime) || other.applicationUptime == applicationUptime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,platform,versiyon,const DeepCollectionEquality().hash(storeVersiyon),isletimSistemi,isletimSistemiVer,isletimSistemiPlat,lisanskey,lisanspc,songiristar,disIpAdresi,erpTipi,erpVersiyon,sunucuMu,sqlserverinfo,applicationUptime);



}

/// @nodoc
abstract mixin class _$CihazlarCopyWith<$Res> implements $CihazlarCopyWith<$Res> {
  factory _$CihazlarCopyWith(_Cihazlar value, $Res Function(_Cihazlar) _then) = __$CihazlarCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int? id,@HiveField(1) String? platform,@HiveField(2) String? versiyon,@HiveField(3) dynamic storeVersiyon,@HiveField(4) String? isletimSistemi,@HiveField(5) String? isletimSistemiVer,@HiveField(6) String? isletimSistemiPlat,@HiveField(7) String? lisanskey,@HiveField(8) String? lisanspc,@HiveField(9) DateTime? songiristar,@HiveField(10) String? disIpAdresi,@HiveField(11) String? erpTipi,@HiveField(12) String? erpVersiyon,@HiveField(13) bool? sunucuMu,@HiveField(14) Sqlserverinfo? sqlserverinfo,@HiveField(15) int? applicationUptime
});


@override $SqlserverinfoCopyWith<$Res>? get sqlserverinfo;

}
/// @nodoc
class __$CihazlarCopyWithImpl<$Res>
    implements _$CihazlarCopyWith<$Res> {
  __$CihazlarCopyWithImpl(this._self, this._then);

  final _Cihazlar _self;
  final $Res Function(_Cihazlar) _then;

/// Create a copy of Cihazlar
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? platform = freezed,Object? versiyon = freezed,Object? storeVersiyon = freezed,Object? isletimSistemi = freezed,Object? isletimSistemiVer = freezed,Object? isletimSistemiPlat = freezed,Object? lisanskey = freezed,Object? lisanspc = freezed,Object? songiristar = freezed,Object? disIpAdresi = freezed,Object? erpTipi = freezed,Object? erpVersiyon = freezed,Object? sunucuMu = freezed,Object? sqlserverinfo = freezed,Object? applicationUptime = freezed,}) {
  return _then(_Cihazlar(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,versiyon: freezed == versiyon ? _self.versiyon : versiyon // ignore: cast_nullable_to_non_nullable
as String?,storeVersiyon: freezed == storeVersiyon ? _self.storeVersiyon : storeVersiyon // ignore: cast_nullable_to_non_nullable
as dynamic,isletimSistemi: freezed == isletimSistemi ? _self.isletimSistemi : isletimSistemi // ignore: cast_nullable_to_non_nullable
as String?,isletimSistemiVer: freezed == isletimSistemiVer ? _self.isletimSistemiVer : isletimSistemiVer // ignore: cast_nullable_to_non_nullable
as String?,isletimSistemiPlat: freezed == isletimSistemiPlat ? _self.isletimSistemiPlat : isletimSistemiPlat // ignore: cast_nullable_to_non_nullable
as String?,lisanskey: freezed == lisanskey ? _self.lisanskey : lisanskey // ignore: cast_nullable_to_non_nullable
as String?,lisanspc: freezed == lisanspc ? _self.lisanspc : lisanspc // ignore: cast_nullable_to_non_nullable
as String?,songiristar: freezed == songiristar ? _self.songiristar : songiristar // ignore: cast_nullable_to_non_nullable
as DateTime?,disIpAdresi: freezed == disIpAdresi ? _self.disIpAdresi : disIpAdresi // ignore: cast_nullable_to_non_nullable
as String?,erpTipi: freezed == erpTipi ? _self.erpTipi : erpTipi // ignore: cast_nullable_to_non_nullable
as String?,erpVersiyon: freezed == erpVersiyon ? _self.erpVersiyon : erpVersiyon // ignore: cast_nullable_to_non_nullable
as String?,sunucuMu: freezed == sunucuMu ? _self.sunucuMu : sunucuMu // ignore: cast_nullable_to_non_nullable
as bool?,sqlserverinfo: freezed == sqlserverinfo ? _self.sqlserverinfo : sqlserverinfo // ignore: cast_nullable_to_non_nullable
as Sqlserverinfo?,applicationUptime: freezed == applicationUptime ? _self.applicationUptime : applicationUptime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Cihazlar
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SqlserverinfoCopyWith<$Res>? get sqlserverinfo {
    if (_self.sqlserverinfo == null) {
    return null;
  }

  return $SqlserverinfoCopyWith<$Res>(_self.sqlserverinfo!, (value) {
    return _then(_self.copyWith(sqlserverinfo: value));
  });
}
}


/// @nodoc
mixin _$Sqlserverinfo {

@HiveField(0) String? get name;@HiveField(1) String? get instanceName;@HiveField(2) String? get surum;@HiveField(3) int? get versiyon;@HiveField(4) String? get productVersion;@HiveField(5) String? get edition;@HiveField(6) String? get msdbGuid;@HiveField(7) String? get tempdbGuid;
/// Create a copy of Sqlserverinfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SqlserverinfoCopyWith<Sqlserverinfo> get copyWith => _$SqlserverinfoCopyWithImpl<Sqlserverinfo>(this as Sqlserverinfo, _$identity);

  /// Serializes this Sqlserverinfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sqlserverinfo&&(identical(other.name, name) || other.name == name)&&(identical(other.instanceName, instanceName) || other.instanceName == instanceName)&&(identical(other.surum, surum) || other.surum == surum)&&(identical(other.versiyon, versiyon) || other.versiyon == versiyon)&&(identical(other.productVersion, productVersion) || other.productVersion == productVersion)&&(identical(other.edition, edition) || other.edition == edition)&&(identical(other.msdbGuid, msdbGuid) || other.msdbGuid == msdbGuid)&&(identical(other.tempdbGuid, tempdbGuid) || other.tempdbGuid == tempdbGuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,instanceName,surum,versiyon,productVersion,edition,msdbGuid,tempdbGuid);



}

/// @nodoc
abstract mixin class $SqlserverinfoCopyWith<$Res>  {
  factory $SqlserverinfoCopyWith(Sqlserverinfo value, $Res Function(Sqlserverinfo) _then) = _$SqlserverinfoCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String? name,@HiveField(1) String? instanceName,@HiveField(2) String? surum,@HiveField(3) int? versiyon,@HiveField(4) String? productVersion,@HiveField(5) String? edition,@HiveField(6) String? msdbGuid,@HiveField(7) String? tempdbGuid
});




}
/// @nodoc
class _$SqlserverinfoCopyWithImpl<$Res>
    implements $SqlserverinfoCopyWith<$Res> {
  _$SqlserverinfoCopyWithImpl(this._self, this._then);

  final Sqlserverinfo _self;
  final $Res Function(Sqlserverinfo) _then;

/// Create a copy of Sqlserverinfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? instanceName = freezed,Object? surum = freezed,Object? versiyon = freezed,Object? productVersion = freezed,Object? edition = freezed,Object? msdbGuid = freezed,Object? tempdbGuid = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,instanceName: freezed == instanceName ? _self.instanceName : instanceName // ignore: cast_nullable_to_non_nullable
as String?,surum: freezed == surum ? _self.surum : surum // ignore: cast_nullable_to_non_nullable
as String?,versiyon: freezed == versiyon ? _self.versiyon : versiyon // ignore: cast_nullable_to_non_nullable
as int?,productVersion: freezed == productVersion ? _self.productVersion : productVersion // ignore: cast_nullable_to_non_nullable
as String?,edition: freezed == edition ? _self.edition : edition // ignore: cast_nullable_to_non_nullable
as String?,msdbGuid: freezed == msdbGuid ? _self.msdbGuid : msdbGuid // ignore: cast_nullable_to_non_nullable
as String?,tempdbGuid: freezed == tempdbGuid ? _self.tempdbGuid : tempdbGuid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Sqlserverinfo implements Sqlserverinfo {
  const _Sqlserverinfo({@HiveField(0) this.name, @HiveField(1) this.instanceName, @HiveField(2) this.surum, @HiveField(3) this.versiyon, @HiveField(4) this.productVersion, @HiveField(5) this.edition, @HiveField(6) this.msdbGuid, @HiveField(7) this.tempdbGuid});
  factory _Sqlserverinfo.fromJson(Map<String, dynamic> json) => _$SqlserverinfoFromJson(json);

@override@HiveField(0) final  String? name;
@override@HiveField(1) final  String? instanceName;
@override@HiveField(2) final  String? surum;
@override@HiveField(3) final  int? versiyon;
@override@HiveField(4) final  String? productVersion;
@override@HiveField(5) final  String? edition;
@override@HiveField(6) final  String? msdbGuid;
@override@HiveField(7) final  String? tempdbGuid;

/// Create a copy of Sqlserverinfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SqlserverinfoCopyWith<_Sqlserverinfo> get copyWith => __$SqlserverinfoCopyWithImpl<_Sqlserverinfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SqlserverinfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sqlserverinfo&&(identical(other.name, name) || other.name == name)&&(identical(other.instanceName, instanceName) || other.instanceName == instanceName)&&(identical(other.surum, surum) || other.surum == surum)&&(identical(other.versiyon, versiyon) || other.versiyon == versiyon)&&(identical(other.productVersion, productVersion) || other.productVersion == productVersion)&&(identical(other.edition, edition) || other.edition == edition)&&(identical(other.msdbGuid, msdbGuid) || other.msdbGuid == msdbGuid)&&(identical(other.tempdbGuid, tempdbGuid) || other.tempdbGuid == tempdbGuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,instanceName,surum,versiyon,productVersion,edition,msdbGuid,tempdbGuid);



}

/// @nodoc
abstract mixin class _$SqlserverinfoCopyWith<$Res> implements $SqlserverinfoCopyWith<$Res> {
  factory _$SqlserverinfoCopyWith(_Sqlserverinfo value, $Res Function(_Sqlserverinfo) _then) = __$SqlserverinfoCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String? name,@HiveField(1) String? instanceName,@HiveField(2) String? surum,@HiveField(3) int? versiyon,@HiveField(4) String? productVersion,@HiveField(5) String? edition,@HiveField(6) String? msdbGuid,@HiveField(7) String? tempdbGuid
});




}
/// @nodoc
class __$SqlserverinfoCopyWithImpl<$Res>
    implements _$SqlserverinfoCopyWith<$Res> {
  __$SqlserverinfoCopyWithImpl(this._self, this._then);

  final _Sqlserverinfo _self;
  final $Res Function(_Sqlserverinfo) _then;

/// Create a copy of Sqlserverinfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? instanceName = freezed,Object? surum = freezed,Object? versiyon = freezed,Object? productVersion = freezed,Object? edition = freezed,Object? msdbGuid = freezed,Object? tempdbGuid = freezed,}) {
  return _then(_Sqlserverinfo(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,instanceName: freezed == instanceName ? _self.instanceName : instanceName // ignore: cast_nullable_to_non_nullable
as String?,surum: freezed == surum ? _self.surum : surum // ignore: cast_nullable_to_non_nullable
as String?,versiyon: freezed == versiyon ? _self.versiyon : versiyon // ignore: cast_nullable_to_non_nullable
as int?,productVersion: freezed == productVersion ? _self.productVersion : productVersion // ignore: cast_nullable_to_non_nullable
as String?,edition: freezed == edition ? _self.edition : edition // ignore: cast_nullable_to_non_nullable
as String?,msdbGuid: freezed == msdbGuid ? _self.msdbGuid : msdbGuid // ignore: cast_nullable_to_non_nullable
as String?,tempdbGuid: freezed == tempdbGuid ? _self.tempdbGuid : tempdbGuid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DeveloperBilgi {

@HiveField(0) bool? get admin;@HiveField(1) String? get guncellemeFtp;@HiveField(2) String? get guncellemeFtpKullaniciAdi;@HiveField(3) String? get guncellemeFtpParola;@HiveField(4) String? get yedeklemeFtp;@HiveField(5) String? get yedeklemeFtpKullaniciAdi;@HiveField(6) String? get yedeklemeFtpParola;
/// Create a copy of DeveloperBilgi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperBilgiCopyWith<DeveloperBilgi> get copyWith => _$DeveloperBilgiCopyWithImpl<DeveloperBilgi>(this as DeveloperBilgi, _$identity);

  /// Serializes this DeveloperBilgi to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperBilgi&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.guncellemeFtp, guncellemeFtp) || other.guncellemeFtp == guncellemeFtp)&&(identical(other.guncellemeFtpKullaniciAdi, guncellemeFtpKullaniciAdi) || other.guncellemeFtpKullaniciAdi == guncellemeFtpKullaniciAdi)&&(identical(other.guncellemeFtpParola, guncellemeFtpParola) || other.guncellemeFtpParola == guncellemeFtpParola)&&(identical(other.yedeklemeFtp, yedeklemeFtp) || other.yedeklemeFtp == yedeklemeFtp)&&(identical(other.yedeklemeFtpKullaniciAdi, yedeklemeFtpKullaniciAdi) || other.yedeklemeFtpKullaniciAdi == yedeklemeFtpKullaniciAdi)&&(identical(other.yedeklemeFtpParola, yedeklemeFtpParola) || other.yedeklemeFtpParola == yedeklemeFtpParola));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admin,guncellemeFtp,guncellemeFtpKullaniciAdi,guncellemeFtpParola,yedeklemeFtp,yedeklemeFtpKullaniciAdi,yedeklemeFtpParola);



}

/// @nodoc
abstract mixin class $DeveloperBilgiCopyWith<$Res>  {
  factory $DeveloperBilgiCopyWith(DeveloperBilgi value, $Res Function(DeveloperBilgi) _then) = _$DeveloperBilgiCopyWithImpl;
@useResult
$Res call({
@HiveField(0) bool? admin,@HiveField(1) String? guncellemeFtp,@HiveField(2) String? guncellemeFtpKullaniciAdi,@HiveField(3) String? guncellemeFtpParola,@HiveField(4) String? yedeklemeFtp,@HiveField(5) String? yedeklemeFtpKullaniciAdi,@HiveField(6) String? yedeklemeFtpParola
});




}
/// @nodoc
class _$DeveloperBilgiCopyWithImpl<$Res>
    implements $DeveloperBilgiCopyWith<$Res> {
  _$DeveloperBilgiCopyWithImpl(this._self, this._then);

  final DeveloperBilgi _self;
  final $Res Function(DeveloperBilgi) _then;

/// Create a copy of DeveloperBilgi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? admin = freezed,Object? guncellemeFtp = freezed,Object? guncellemeFtpKullaniciAdi = freezed,Object? guncellemeFtpParola = freezed,Object? yedeklemeFtp = freezed,Object? yedeklemeFtpKullaniciAdi = freezed,Object? yedeklemeFtpParola = freezed,}) {
  return _then(_self.copyWith(
admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as bool?,guncellemeFtp: freezed == guncellemeFtp ? _self.guncellemeFtp : guncellemeFtp // ignore: cast_nullable_to_non_nullable
as String?,guncellemeFtpKullaniciAdi: freezed == guncellemeFtpKullaniciAdi ? _self.guncellemeFtpKullaniciAdi : guncellemeFtpKullaniciAdi // ignore: cast_nullable_to_non_nullable
as String?,guncellemeFtpParola: freezed == guncellemeFtpParola ? _self.guncellemeFtpParola : guncellemeFtpParola // ignore: cast_nullable_to_non_nullable
as String?,yedeklemeFtp: freezed == yedeklemeFtp ? _self.yedeklemeFtp : yedeklemeFtp // ignore: cast_nullable_to_non_nullable
as String?,yedeklemeFtpKullaniciAdi: freezed == yedeklemeFtpKullaniciAdi ? _self.yedeklemeFtpKullaniciAdi : yedeklemeFtpKullaniciAdi // ignore: cast_nullable_to_non_nullable
as String?,yedeklemeFtpParola: freezed == yedeklemeFtpParola ? _self.yedeklemeFtpParola : yedeklemeFtpParola // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DeveloperBilgi implements DeveloperBilgi {
  const _DeveloperBilgi({@HiveField(0) this.admin, @HiveField(1) this.guncellemeFtp, @HiveField(2) this.guncellemeFtpKullaniciAdi, @HiveField(3) this.guncellemeFtpParola, @HiveField(4) this.yedeklemeFtp, @HiveField(5) this.yedeklemeFtpKullaniciAdi, @HiveField(6) this.yedeklemeFtpParola});
  factory _DeveloperBilgi.fromJson(Map<String, dynamic> json) => _$DeveloperBilgiFromJson(json);

@override@HiveField(0) final  bool? admin;
@override@HiveField(1) final  String? guncellemeFtp;
@override@HiveField(2) final  String? guncellemeFtpKullaniciAdi;
@override@HiveField(3) final  String? guncellemeFtpParola;
@override@HiveField(4) final  String? yedeklemeFtp;
@override@HiveField(5) final  String? yedeklemeFtpKullaniciAdi;
@override@HiveField(6) final  String? yedeklemeFtpParola;

/// Create a copy of DeveloperBilgi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeveloperBilgiCopyWith<_DeveloperBilgi> get copyWith => __$DeveloperBilgiCopyWithImpl<_DeveloperBilgi>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeveloperBilgiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeveloperBilgi&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.guncellemeFtp, guncellemeFtp) || other.guncellemeFtp == guncellemeFtp)&&(identical(other.guncellemeFtpKullaniciAdi, guncellemeFtpKullaniciAdi) || other.guncellemeFtpKullaniciAdi == guncellemeFtpKullaniciAdi)&&(identical(other.guncellemeFtpParola, guncellemeFtpParola) || other.guncellemeFtpParola == guncellemeFtpParola)&&(identical(other.yedeklemeFtp, yedeklemeFtp) || other.yedeklemeFtp == yedeklemeFtp)&&(identical(other.yedeklemeFtpKullaniciAdi, yedeklemeFtpKullaniciAdi) || other.yedeklemeFtpKullaniciAdi == yedeklemeFtpKullaniciAdi)&&(identical(other.yedeklemeFtpParola, yedeklemeFtpParola) || other.yedeklemeFtpParola == yedeklemeFtpParola));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admin,guncellemeFtp,guncellemeFtpKullaniciAdi,guncellemeFtpParola,yedeklemeFtp,yedeklemeFtpKullaniciAdi,yedeklemeFtpParola);



}

/// @nodoc
abstract mixin class _$DeveloperBilgiCopyWith<$Res> implements $DeveloperBilgiCopyWith<$Res> {
  factory _$DeveloperBilgiCopyWith(_DeveloperBilgi value, $Res Function(_DeveloperBilgi) _then) = __$DeveloperBilgiCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) bool? admin,@HiveField(1) String? guncellemeFtp,@HiveField(2) String? guncellemeFtpKullaniciAdi,@HiveField(3) String? guncellemeFtpParola,@HiveField(4) String? yedeklemeFtp,@HiveField(5) String? yedeklemeFtpKullaniciAdi,@HiveField(6) String? yedeklemeFtpParola
});




}
/// @nodoc
class __$DeveloperBilgiCopyWithImpl<$Res>
    implements _$DeveloperBilgiCopyWith<$Res> {
  __$DeveloperBilgiCopyWithImpl(this._self, this._then);

  final _DeveloperBilgi _self;
  final $Res Function(_DeveloperBilgi) _then;

/// Create a copy of DeveloperBilgi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? admin = freezed,Object? guncellemeFtp = freezed,Object? guncellemeFtpKullaniciAdi = freezed,Object? guncellemeFtpParola = freezed,Object? yedeklemeFtp = freezed,Object? yedeklemeFtpKullaniciAdi = freezed,Object? yedeklemeFtpParola = freezed,}) {
  return _then(_DeveloperBilgi(
admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as bool?,guncellemeFtp: freezed == guncellemeFtp ? _self.guncellemeFtp : guncellemeFtp // ignore: cast_nullable_to_non_nullable
as String?,guncellemeFtpKullaniciAdi: freezed == guncellemeFtpKullaniciAdi ? _self.guncellemeFtpKullaniciAdi : guncellemeFtpKullaniciAdi // ignore: cast_nullable_to_non_nullable
as String?,guncellemeFtpParola: freezed == guncellemeFtpParola ? _self.guncellemeFtpParola : guncellemeFtpParola // ignore: cast_nullable_to_non_nullable
as String?,yedeklemeFtp: freezed == yedeklemeFtp ? _self.yedeklemeFtp : yedeklemeFtp // ignore: cast_nullable_to_non_nullable
as String?,yedeklemeFtpKullaniciAdi: freezed == yedeklemeFtpKullaniciAdi ? _self.yedeklemeFtpKullaniciAdi : yedeklemeFtpKullaniciAdi // ignore: cast_nullable_to_non_nullable
as String?,yedeklemeFtpParola: freezed == yedeklemeFtpParola ? _self.yedeklemeFtpParola : yedeklemeFtpParola // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Moduller {

@HiveField(0) int? get kategoriId;@HiveField(1) String? get kategoriAdi;@HiveField(2) String? get modulBaslik;@HiveField(3) String? get dosyaAdi;@HiveField(4) String? get aciklama;@HiveField(5) String? get versiyon;@HiveField(6) bool? get isdemo;@HiveField(7) dynamic get sozlesmeBastar;@HiveField(8) DateTime? get sozlesmeBittar;@HiveField(9) bool? get kiralik;@HiveField(10) String? get webServisAdresi;@HiveField(11) int? get kullaniciSayisi;@HiveField(12) List<EkLisanslar>? get ekLisanslar;@HiveField(13) bool? get sozlesmeAktif;@HiveField(14) String? get sozlesmeUyari;
/// Create a copy of Moduller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModullerCopyWith<Moduller> get copyWith => _$ModullerCopyWithImpl<Moduller>(this as Moduller, _$identity);

  /// Serializes this Moduller to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Moduller&&(identical(other.kategoriId, kategoriId) || other.kategoriId == kategoriId)&&(identical(other.kategoriAdi, kategoriAdi) || other.kategoriAdi == kategoriAdi)&&(identical(other.modulBaslik, modulBaslik) || other.modulBaslik == modulBaslik)&&(identical(other.dosyaAdi, dosyaAdi) || other.dosyaAdi == dosyaAdi)&&(identical(other.aciklama, aciklama) || other.aciklama == aciklama)&&(identical(other.versiyon, versiyon) || other.versiyon == versiyon)&&(identical(other.isdemo, isdemo) || other.isdemo == isdemo)&&const DeepCollectionEquality().equals(other.sozlesmeBastar, sozlesmeBastar)&&(identical(other.sozlesmeBittar, sozlesmeBittar) || other.sozlesmeBittar == sozlesmeBittar)&&(identical(other.kiralik, kiralik) || other.kiralik == kiralik)&&(identical(other.webServisAdresi, webServisAdresi) || other.webServisAdresi == webServisAdresi)&&(identical(other.kullaniciSayisi, kullaniciSayisi) || other.kullaniciSayisi == kullaniciSayisi)&&const DeepCollectionEquality().equals(other.ekLisanslar, ekLisanslar)&&(identical(other.sozlesmeAktif, sozlesmeAktif) || other.sozlesmeAktif == sozlesmeAktif)&&(identical(other.sozlesmeUyari, sozlesmeUyari) || other.sozlesmeUyari == sozlesmeUyari));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategoriId,kategoriAdi,modulBaslik,dosyaAdi,aciklama,versiyon,isdemo,const DeepCollectionEquality().hash(sozlesmeBastar),sozlesmeBittar,kiralik,webServisAdresi,kullaniciSayisi,const DeepCollectionEquality().hash(ekLisanslar),sozlesmeAktif,sozlesmeUyari);



}

/// @nodoc
abstract mixin class $ModullerCopyWith<$Res>  {
  factory $ModullerCopyWith(Moduller value, $Res Function(Moduller) _then) = _$ModullerCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int? kategoriId,@HiveField(1) String? kategoriAdi,@HiveField(2) String? modulBaslik,@HiveField(3) String? dosyaAdi,@HiveField(4) String? aciklama,@HiveField(5) String? versiyon,@HiveField(6) bool? isdemo,@HiveField(7) dynamic sozlesmeBastar,@HiveField(8) DateTime? sozlesmeBittar,@HiveField(9) bool? kiralik,@HiveField(10) String? webServisAdresi,@HiveField(11) int? kullaniciSayisi,@HiveField(12) List<EkLisanslar>? ekLisanslar,@HiveField(13) bool? sozlesmeAktif,@HiveField(14) String? sozlesmeUyari
});




}
/// @nodoc
class _$ModullerCopyWithImpl<$Res>
    implements $ModullerCopyWith<$Res> {
  _$ModullerCopyWithImpl(this._self, this._then);

  final Moduller _self;
  final $Res Function(Moduller) _then;

/// Create a copy of Moduller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kategoriId = freezed,Object? kategoriAdi = freezed,Object? modulBaslik = freezed,Object? dosyaAdi = freezed,Object? aciklama = freezed,Object? versiyon = freezed,Object? isdemo = freezed,Object? sozlesmeBastar = freezed,Object? sozlesmeBittar = freezed,Object? kiralik = freezed,Object? webServisAdresi = freezed,Object? kullaniciSayisi = freezed,Object? ekLisanslar = freezed,Object? sozlesmeAktif = freezed,Object? sozlesmeUyari = freezed,}) {
  return _then(_self.copyWith(
kategoriId: freezed == kategoriId ? _self.kategoriId : kategoriId // ignore: cast_nullable_to_non_nullable
as int?,kategoriAdi: freezed == kategoriAdi ? _self.kategoriAdi : kategoriAdi // ignore: cast_nullable_to_non_nullable
as String?,modulBaslik: freezed == modulBaslik ? _self.modulBaslik : modulBaslik // ignore: cast_nullable_to_non_nullable
as String?,dosyaAdi: freezed == dosyaAdi ? _self.dosyaAdi : dosyaAdi // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,versiyon: freezed == versiyon ? _self.versiyon : versiyon // ignore: cast_nullable_to_non_nullable
as String?,isdemo: freezed == isdemo ? _self.isdemo : isdemo // ignore: cast_nullable_to_non_nullable
as bool?,sozlesmeBastar: freezed == sozlesmeBastar ? _self.sozlesmeBastar : sozlesmeBastar // ignore: cast_nullable_to_non_nullable
as dynamic,sozlesmeBittar: freezed == sozlesmeBittar ? _self.sozlesmeBittar : sozlesmeBittar // ignore: cast_nullable_to_non_nullable
as DateTime?,kiralik: freezed == kiralik ? _self.kiralik : kiralik // ignore: cast_nullable_to_non_nullable
as bool?,webServisAdresi: freezed == webServisAdresi ? _self.webServisAdresi : webServisAdresi // ignore: cast_nullable_to_non_nullable
as String?,kullaniciSayisi: freezed == kullaniciSayisi ? _self.kullaniciSayisi : kullaniciSayisi // ignore: cast_nullable_to_non_nullable
as int?,ekLisanslar: freezed == ekLisanslar ? _self.ekLisanslar : ekLisanslar // ignore: cast_nullable_to_non_nullable
as List<EkLisanslar>?,sozlesmeAktif: freezed == sozlesmeAktif ? _self.sozlesmeAktif : sozlesmeAktif // ignore: cast_nullable_to_non_nullable
as bool?,sozlesmeUyari: freezed == sozlesmeUyari ? _self.sozlesmeUyari : sozlesmeUyari // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Moduller implements Moduller {
  const _Moduller({@HiveField(0) this.kategoriId, @HiveField(1) this.kategoriAdi, @HiveField(2) this.modulBaslik, @HiveField(3) this.dosyaAdi, @HiveField(4) this.aciklama, @HiveField(5) this.versiyon, @HiveField(6) this.isdemo, @HiveField(7) this.sozlesmeBastar, @HiveField(8) this.sozlesmeBittar, @HiveField(9) this.kiralik, @HiveField(10) this.webServisAdresi, @HiveField(11) this.kullaniciSayisi, @HiveField(12) final  List<EkLisanslar>? ekLisanslar, @HiveField(13) this.sozlesmeAktif, @HiveField(14) this.sozlesmeUyari}): _ekLisanslar = ekLisanslar;
  factory _Moduller.fromJson(Map<String, dynamic> json) => _$ModullerFromJson(json);

@override@HiveField(0) final  int? kategoriId;
@override@HiveField(1) final  String? kategoriAdi;
@override@HiveField(2) final  String? modulBaslik;
@override@HiveField(3) final  String? dosyaAdi;
@override@HiveField(4) final  String? aciklama;
@override@HiveField(5) final  String? versiyon;
@override@HiveField(6) final  bool? isdemo;
@override@HiveField(7) final  dynamic sozlesmeBastar;
@override@HiveField(8) final  DateTime? sozlesmeBittar;
@override@HiveField(9) final  bool? kiralik;
@override@HiveField(10) final  String? webServisAdresi;
@override@HiveField(11) final  int? kullaniciSayisi;
 final  List<EkLisanslar>? _ekLisanslar;
@override@HiveField(12) List<EkLisanslar>? get ekLisanslar {
  final value = _ekLisanslar;
  if (value == null) return null;
  if (_ekLisanslar is EqualUnmodifiableListView) return _ekLisanslar;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@HiveField(13) final  bool? sozlesmeAktif;
@override@HiveField(14) final  String? sozlesmeUyari;

/// Create a copy of Moduller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModullerCopyWith<_Moduller> get copyWith => __$ModullerCopyWithImpl<_Moduller>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModullerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Moduller&&(identical(other.kategoriId, kategoriId) || other.kategoriId == kategoriId)&&(identical(other.kategoriAdi, kategoriAdi) || other.kategoriAdi == kategoriAdi)&&(identical(other.modulBaslik, modulBaslik) || other.modulBaslik == modulBaslik)&&(identical(other.dosyaAdi, dosyaAdi) || other.dosyaAdi == dosyaAdi)&&(identical(other.aciklama, aciklama) || other.aciklama == aciklama)&&(identical(other.versiyon, versiyon) || other.versiyon == versiyon)&&(identical(other.isdemo, isdemo) || other.isdemo == isdemo)&&const DeepCollectionEquality().equals(other.sozlesmeBastar, sozlesmeBastar)&&(identical(other.sozlesmeBittar, sozlesmeBittar) || other.sozlesmeBittar == sozlesmeBittar)&&(identical(other.kiralik, kiralik) || other.kiralik == kiralik)&&(identical(other.webServisAdresi, webServisAdresi) || other.webServisAdresi == webServisAdresi)&&(identical(other.kullaniciSayisi, kullaniciSayisi) || other.kullaniciSayisi == kullaniciSayisi)&&const DeepCollectionEquality().equals(other._ekLisanslar, _ekLisanslar)&&(identical(other.sozlesmeAktif, sozlesmeAktif) || other.sozlesmeAktif == sozlesmeAktif)&&(identical(other.sozlesmeUyari, sozlesmeUyari) || other.sozlesmeUyari == sozlesmeUyari));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kategoriId,kategoriAdi,modulBaslik,dosyaAdi,aciklama,versiyon,isdemo,const DeepCollectionEquality().hash(sozlesmeBastar),sozlesmeBittar,kiralik,webServisAdresi,kullaniciSayisi,const DeepCollectionEquality().hash(_ekLisanslar),sozlesmeAktif,sozlesmeUyari);



}

/// @nodoc
abstract mixin class _$ModullerCopyWith<$Res> implements $ModullerCopyWith<$Res> {
  factory _$ModullerCopyWith(_Moduller value, $Res Function(_Moduller) _then) = __$ModullerCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int? kategoriId,@HiveField(1) String? kategoriAdi,@HiveField(2) String? modulBaslik,@HiveField(3) String? dosyaAdi,@HiveField(4) String? aciklama,@HiveField(5) String? versiyon,@HiveField(6) bool? isdemo,@HiveField(7) dynamic sozlesmeBastar,@HiveField(8) DateTime? sozlesmeBittar,@HiveField(9) bool? kiralik,@HiveField(10) String? webServisAdresi,@HiveField(11) int? kullaniciSayisi,@HiveField(12) List<EkLisanslar>? ekLisanslar,@HiveField(13) bool? sozlesmeAktif,@HiveField(14) String? sozlesmeUyari
});




}
/// @nodoc
class __$ModullerCopyWithImpl<$Res>
    implements _$ModullerCopyWith<$Res> {
  __$ModullerCopyWithImpl(this._self, this._then);

  final _Moduller _self;
  final $Res Function(_Moduller) _then;

/// Create a copy of Moduller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kategoriId = freezed,Object? kategoriAdi = freezed,Object? modulBaslik = freezed,Object? dosyaAdi = freezed,Object? aciklama = freezed,Object? versiyon = freezed,Object? isdemo = freezed,Object? sozlesmeBastar = freezed,Object? sozlesmeBittar = freezed,Object? kiralik = freezed,Object? webServisAdresi = freezed,Object? kullaniciSayisi = freezed,Object? ekLisanslar = freezed,Object? sozlesmeAktif = freezed,Object? sozlesmeUyari = freezed,}) {
  return _then(_Moduller(
kategoriId: freezed == kategoriId ? _self.kategoriId : kategoriId // ignore: cast_nullable_to_non_nullable
as int?,kategoriAdi: freezed == kategoriAdi ? _self.kategoriAdi : kategoriAdi // ignore: cast_nullable_to_non_nullable
as String?,modulBaslik: freezed == modulBaslik ? _self.modulBaslik : modulBaslik // ignore: cast_nullable_to_non_nullable
as String?,dosyaAdi: freezed == dosyaAdi ? _self.dosyaAdi : dosyaAdi // ignore: cast_nullable_to_non_nullable
as String?,aciklama: freezed == aciklama ? _self.aciklama : aciklama // ignore: cast_nullable_to_non_nullable
as String?,versiyon: freezed == versiyon ? _self.versiyon : versiyon // ignore: cast_nullable_to_non_nullable
as String?,isdemo: freezed == isdemo ? _self.isdemo : isdemo // ignore: cast_nullable_to_non_nullable
as bool?,sozlesmeBastar: freezed == sozlesmeBastar ? _self.sozlesmeBastar : sozlesmeBastar // ignore: cast_nullable_to_non_nullable
as dynamic,sozlesmeBittar: freezed == sozlesmeBittar ? _self.sozlesmeBittar : sozlesmeBittar // ignore: cast_nullable_to_non_nullable
as DateTime?,kiralik: freezed == kiralik ? _self.kiralik : kiralik // ignore: cast_nullable_to_non_nullable
as bool?,webServisAdresi: freezed == webServisAdresi ? _self.webServisAdresi : webServisAdresi // ignore: cast_nullable_to_non_nullable
as String?,kullaniciSayisi: freezed == kullaniciSayisi ? _self.kullaniciSayisi : kullaniciSayisi // ignore: cast_nullable_to_non_nullable
as int?,ekLisanslar: freezed == ekLisanslar ? _self._ekLisanslar : ekLisanslar // ignore: cast_nullable_to_non_nullable
as List<EkLisanslar>?,sozlesmeAktif: freezed == sozlesmeAktif ? _self.sozlesmeAktif : sozlesmeAktif // ignore: cast_nullable_to_non_nullable
as bool?,sozlesmeUyari: freezed == sozlesmeUyari ? _self.sozlesmeUyari : sozlesmeUyari // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EkLisanslar {

@HiveField(0) int? get sira;@HiveField(1) String? get tanimi;@HiveField(2) dynamic get adet;@HiveField(3) dynamic get bitisTarihi;
/// Create a copy of EkLisanslar
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EkLisanslarCopyWith<EkLisanslar> get copyWith => _$EkLisanslarCopyWithImpl<EkLisanslar>(this as EkLisanslar, _$identity);

  /// Serializes this EkLisanslar to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EkLisanslar&&(identical(other.sira, sira) || other.sira == sira)&&(identical(other.tanimi, tanimi) || other.tanimi == tanimi)&&const DeepCollectionEquality().equals(other.adet, adet)&&const DeepCollectionEquality().equals(other.bitisTarihi, bitisTarihi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sira,tanimi,const DeepCollectionEquality().hash(adet),const DeepCollectionEquality().hash(bitisTarihi));



}

/// @nodoc
abstract mixin class $EkLisanslarCopyWith<$Res>  {
  factory $EkLisanslarCopyWith(EkLisanslar value, $Res Function(EkLisanslar) _then) = _$EkLisanslarCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int? sira,@HiveField(1) String? tanimi,@HiveField(2) dynamic adet,@HiveField(3) dynamic bitisTarihi
});




}
/// @nodoc
class _$EkLisanslarCopyWithImpl<$Res>
    implements $EkLisanslarCopyWith<$Res> {
  _$EkLisanslarCopyWithImpl(this._self, this._then);

  final EkLisanslar _self;
  final $Res Function(EkLisanslar) _then;

/// Create a copy of EkLisanslar
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sira = freezed,Object? tanimi = freezed,Object? adet = freezed,Object? bitisTarihi = freezed,}) {
  return _then(_self.copyWith(
sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,tanimi: freezed == tanimi ? _self.tanimi : tanimi // ignore: cast_nullable_to_non_nullable
as String?,adet: freezed == adet ? _self.adet : adet // ignore: cast_nullable_to_non_nullable
as dynamic,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EkLisanslar implements EkLisanslar {
  const _EkLisanslar({@HiveField(0) this.sira, @HiveField(1) this.tanimi, @HiveField(2) this.adet, @HiveField(3) this.bitisTarihi});
  factory _EkLisanslar.fromJson(Map<String, dynamic> json) => _$EkLisanslarFromJson(json);

@override@HiveField(0) final  int? sira;
@override@HiveField(1) final  String? tanimi;
@override@HiveField(2) final  dynamic adet;
@override@HiveField(3) final  dynamic bitisTarihi;

/// Create a copy of EkLisanslar
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EkLisanslarCopyWith<_EkLisanslar> get copyWith => __$EkLisanslarCopyWithImpl<_EkLisanslar>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EkLisanslarToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EkLisanslar&&(identical(other.sira, sira) || other.sira == sira)&&(identical(other.tanimi, tanimi) || other.tanimi == tanimi)&&const DeepCollectionEquality().equals(other.adet, adet)&&const DeepCollectionEquality().equals(other.bitisTarihi, bitisTarihi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sira,tanimi,const DeepCollectionEquality().hash(adet),const DeepCollectionEquality().hash(bitisTarihi));



}

/// @nodoc
abstract mixin class _$EkLisanslarCopyWith<$Res> implements $EkLisanslarCopyWith<$Res> {
  factory _$EkLisanslarCopyWith(_EkLisanslar value, $Res Function(_EkLisanslar) _then) = __$EkLisanslarCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int? sira,@HiveField(1) String? tanimi,@HiveField(2) dynamic adet,@HiveField(3) dynamic bitisTarihi
});




}
/// @nodoc
class __$EkLisanslarCopyWithImpl<$Res>
    implements _$EkLisanslarCopyWith<$Res> {
  __$EkLisanslarCopyWithImpl(this._self, this._then);

  final _EkLisanslar _self;
  final $Res Function(_EkLisanslar) _then;

/// Create a copy of EkLisanslar
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sira = freezed,Object? tanimi = freezed,Object? adet = freezed,Object? bitisTarihi = freezed,}) {
  return _then(_EkLisanslar(
sira: freezed == sira ? _self.sira : sira // ignore: cast_nullable_to_non_nullable
as int?,tanimi: freezed == tanimi ? _self.tanimi : tanimi // ignore: cast_nullable_to_non_nullable
as String?,adet: freezed == adet ? _self.adet : adet // ignore: cast_nullable_to_non_nullable
as dynamic,bitisTarihi: freezed == bitisTarihi ? _self.bitisTarihi : bitisTarihi // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
