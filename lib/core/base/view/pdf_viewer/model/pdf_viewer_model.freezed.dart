// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_viewer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PdfModel _$PdfModelFromJson(Map<String, dynamic> json) {
  return _PdfModel.fromJson(json);
}

/// @nodoc
mixin _$PdfModel {
  String? get raporOzelKod => throw _privateConstructorUsedError;
  set raporOzelKod(String? value) => throw _privateConstructorUsedError;
  bool? get standart => throw _privateConstructorUsedError;
  set standart(bool? value) => throw _privateConstructorUsedError;
  DicParams? get dicParams => throw _privateConstructorUsedError;
  set dicParams(DicParams? value) => throw _privateConstructorUsedError;
  int? get dizaynId => throw _privateConstructorUsedError;
  set dizaynId(int? value) => throw _privateConstructorUsedError;
  int? get etiketSayisi => throw _privateConstructorUsedError;
  set etiketSayisi(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PdfModelCopyWith<PdfModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfModelCopyWith<$Res> {
  factory $PdfModelCopyWith(PdfModel value, $Res Function(PdfModel) then) =
      _$PdfModelCopyWithImpl<$Res, PdfModel>;
  @useResult
  $Res call(
      {String? raporOzelKod,
      bool? standart,
      DicParams? dicParams,
      int? dizaynId,
      int? etiketSayisi});

  $DicParamsCopyWith<$Res>? get dicParams;
}

/// @nodoc
class _$PdfModelCopyWithImpl<$Res, $Val extends PdfModel>
    implements $PdfModelCopyWith<$Res> {
  _$PdfModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raporOzelKod = freezed,
    Object? standart = freezed,
    Object? dicParams = freezed,
    Object? dizaynId = freezed,
    Object? etiketSayisi = freezed,
  }) {
    return _then(_value.copyWith(
      raporOzelKod: freezed == raporOzelKod
          ? _value.raporOzelKod
          : raporOzelKod // ignore: cast_nullable_to_non_nullable
              as String?,
      standart: freezed == standart
          ? _value.standart
          : standart // ignore: cast_nullable_to_non_nullable
              as bool?,
      dicParams: freezed == dicParams
          ? _value.dicParams
          : dicParams // ignore: cast_nullable_to_non_nullable
              as DicParams?,
      dizaynId: freezed == dizaynId
          ? _value.dizaynId
          : dizaynId // ignore: cast_nullable_to_non_nullable
              as int?,
      etiketSayisi: freezed == etiketSayisi
          ? _value.etiketSayisi
          : etiketSayisi // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DicParamsCopyWith<$Res>? get dicParams {
    if (_value.dicParams == null) {
      return null;
    }

    return $DicParamsCopyWith<$Res>(_value.dicParams!, (value) {
      return _then(_value.copyWith(dicParams: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PdfModelImplCopyWith<$Res>
    implements $PdfModelCopyWith<$Res> {
  factory _$$PdfModelImplCopyWith(
          _$PdfModelImpl value, $Res Function(_$PdfModelImpl) then) =
      __$$PdfModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? raporOzelKod,
      bool? standart,
      DicParams? dicParams,
      int? dizaynId,
      int? etiketSayisi});

  @override
  $DicParamsCopyWith<$Res>? get dicParams;
}

/// @nodoc
class __$$PdfModelImplCopyWithImpl<$Res>
    extends _$PdfModelCopyWithImpl<$Res, _$PdfModelImpl>
    implements _$$PdfModelImplCopyWith<$Res> {
  __$$PdfModelImplCopyWithImpl(
      _$PdfModelImpl _value, $Res Function(_$PdfModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raporOzelKod = freezed,
    Object? standart = freezed,
    Object? dicParams = freezed,
    Object? dizaynId = freezed,
    Object? etiketSayisi = freezed,
  }) {
    return _then(_$PdfModelImpl(
      raporOzelKod: freezed == raporOzelKod
          ? _value.raporOzelKod
          : raporOzelKod // ignore: cast_nullable_to_non_nullable
              as String?,
      standart: freezed == standart
          ? _value.standart
          : standart // ignore: cast_nullable_to_non_nullable
              as bool?,
      dicParams: freezed == dicParams
          ? _value.dicParams
          : dicParams // ignore: cast_nullable_to_non_nullable
              as DicParams?,
      dizaynId: freezed == dizaynId
          ? _value.dizaynId
          : dizaynId // ignore: cast_nullable_to_non_nullable
              as int?,
      etiketSayisi: freezed == etiketSayisi
          ? _value.etiketSayisi
          : etiketSayisi // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(createFactory: true, explicitToJson: true, createToJson: true)
class _$PdfModelImpl extends _PdfModel {
  _$PdfModelImpl(
      {this.raporOzelKod,
      this.standart,
      this.dicParams,
      this.dizaynId,
      this.etiketSayisi})
      : super._();

  factory _$PdfModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PdfModelImplFromJson(json);

  @override
  String? raporOzelKod;
  @override
  bool? standart;
  @override
  DicParams? dicParams;
  @override
  int? dizaynId;
  @override
  int? etiketSayisi;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfModelImplCopyWith<_$PdfModelImpl> get copyWith =>
      __$$PdfModelImplCopyWithImpl<_$PdfModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfModelImplToJson(
      this,
    );
  }
}

abstract class _PdfModel extends PdfModel {
  factory _PdfModel(
      {String? raporOzelKod,
      bool? standart,
      DicParams? dicParams,
      int? dizaynId,
      int? etiketSayisi}) = _$PdfModelImpl;
  _PdfModel._() : super._();

  factory _PdfModel.fromJson(Map<String, dynamic> json) =
      _$PdfModelImpl.fromJson;

  @override
  String? get raporOzelKod;
  set raporOzelKod(String? value);
  @override
  bool? get standart;
  set standart(bool? value);
  @override
  DicParams? get dicParams;
  set dicParams(DicParams? value);
  @override
  int? get dizaynId;
  set dizaynId(int? value);
  @override
  int? get etiketSayisi;
  set etiketSayisi(int? value);
  @override
  @JsonKey(ignore: true)
  _$$PdfModelImplCopyWith<_$PdfModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DicParams _$DicParamsFromJson(Map<String, dynamic> json) {
  return _DicParams.fromJson(json);
}

/// @nodoc
mixin _$DicParams {
  String? get cariKodu => throw _privateConstructorUsedError;
  set cariKodu(String? value) => throw _privateConstructorUsedError;
  String? get stokKodu => throw _privateConstructorUsedError;
  set stokKodu(String? value) => throw _privateConstructorUsedError;
  String? get sifirHaric => throw _privateConstructorUsedError;
  set sifirHaric(String? value) => throw _privateConstructorUsedError;
  String? get maliyetTipi => throw _privateConstructorUsedError;
  set maliyetTipi(String? value) => throw _privateConstructorUsedError;
  String? get tlHarDokulsun => throw _privateConstructorUsedError;
  set tlHarDokulsun(String? value) => throw _privateConstructorUsedError;
  String? get depoKodlari => throw _privateConstructorUsedError;
  set depoKodlari(String? value) => throw _privateConstructorUsedError;
  String? get haricStokKodlari => throw _privateConstructorUsedError;
  set haricStokKodlari(String? value) => throw _privateConstructorUsedError;
  String? get haricStokGrupKodlari => throw _privateConstructorUsedError;
  set haricStokGrupKodlari(String? value) => throw _privateConstructorUsedError;
  String? get dovizTipi => throw _privateConstructorUsedError;
  set dovizTipi(String? value) => throw _privateConstructorUsedError;
  String? get bastar => throw _privateConstructorUsedError;
  set bastar(String? value) => throw _privateConstructorUsedError;
  String? get bittar => throw _privateConstructorUsedError;
  set bittar(String? value) => throw _privateConstructorUsedError;
  String? get grupKodu => throw _privateConstructorUsedError;
  set grupKodu(String? value) => throw _privateConstructorUsedError;
  String? get borcAlacak => throw _privateConstructorUsedError;
  set borcAlacak(String? value) => throw _privateConstructorUsedError;
  String? get refTarih => throw _privateConstructorUsedError;
  set refTarih(String? value) => throw _privateConstructorUsedError;
  String? get tarihTipi => throw _privateConstructorUsedError;
  set tarihTipi(String? value) => throw _privateConstructorUsedError;
  String? get kod1 => throw _privateConstructorUsedError;
  set kod1(String? value) => throw _privateConstructorUsedError;
  String? get kod2 => throw _privateConstructorUsedError;
  set kod2(String? value) => throw _privateConstructorUsedError;
  String? get kod3 => throw _privateConstructorUsedError;
  set kod3(String? value) => throw _privateConstructorUsedError;
  String? get kod4 => throw _privateConstructorUsedError;
  set kod4(String? value) => throw _privateConstructorUsedError;
  String? get kod5 => throw _privateConstructorUsedError;
  set kod5(String? value) => throw _privateConstructorUsedError;
  String? get kapali => throw _privateConstructorUsedError;
  set kapali(String? value) => throw _privateConstructorUsedError;
  String? get durum => throw _privateConstructorUsedError;
  set durum(String? value) => throw _privateConstructorUsedError;
  String? get vergiNo => throw _privateConstructorUsedError;
  set vergiNo(String? value) => throw _privateConstructorUsedError;
  String? get plasiyerKodu => throw _privateConstructorUsedError;
  set plasiyerKodu(String? value) => throw _privateConstructorUsedError;
  String? get aralikTipi => throw _privateConstructorUsedError;
  set aralikTipi(String? value) => throw _privateConstructorUsedError;
  String? get sirala => throw _privateConstructorUsedError;
  set sirala(String? value) => throw _privateConstructorUsedError;
  String? get bakiyeDurumu => throw _privateConstructorUsedError;
  set bakiyeDurumu(String? value) => throw _privateConstructorUsedError;
  String? get caharInckey => throw _privateConstructorUsedError;
  set caharInckey(String? value) => throw _privateConstructorUsedError;
  String? get belgeTipi => throw _privateConstructorUsedError;
  set belgeTipi(String? value) => throw _privateConstructorUsedError;
  String? get belgeNo => throw _privateConstructorUsedError;
  set belgeNo(String? value) => throw _privateConstructorUsedError;
  String? get isemriNo => throw _privateConstructorUsedError;
  set isemriNo(String? value) => throw _privateConstructorUsedError;
  String? get dinamikParam => throw _privateConstructorUsedError;
  set dinamikParam(String? value) => throw _privateConstructorUsedError;
  String? get kasaharInckey => throw _privateConstructorUsedError;
  set kasaharInckey(String? value) => throw _privateConstructorUsedError;
  String? get uretimFiyatiDahil => throw _privateConstructorUsedError;
  set uretimFiyatiDahil(String? value) => throw _privateConstructorUsedError;
  String? get fiyatTipi => throw _privateConstructorUsedError;
  set fiyatTipi(String? value) => throw _privateConstructorUsedError;
  String? get tblnfStokfiyatgecmisiId => throw _privateConstructorUsedError;
  set tblnfStokfiyatgecmisiId(String? value) =>
      throw _privateConstructorUsedError;
  String? get gorunecekAlanlar => throw _privateConstructorUsedError;
  set gorunecekAlanlar(String? value) => throw _privateConstructorUsedError;
  int? get miktar => throw _privateConstructorUsedError;
  set miktar(int? value) => throw _privateConstructorUsedError;
  String? get yapkod => throw _privateConstructorUsedError;
  set yapkod(String? value) => throw _privateConstructorUsedError;
  String? get kasaKodu => throw _privateConstructorUsedError;
  set kasaKodu(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DicParamsCopyWith<DicParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DicParamsCopyWith<$Res> {
  factory $DicParamsCopyWith(DicParams value, $Res Function(DicParams) then) =
      _$DicParamsCopyWithImpl<$Res, DicParams>;
  @useResult
  $Res call(
      {String? cariKodu,
      String? stokKodu,
      String? sifirHaric,
      String? maliyetTipi,
      String? tlHarDokulsun,
      String? depoKodlari,
      String? haricStokKodlari,
      String? haricStokGrupKodlari,
      String? dovizTipi,
      String? bastar,
      String? bittar,
      String? grupKodu,
      String? borcAlacak,
      String? refTarih,
      String? tarihTipi,
      String? kod1,
      String? kod2,
      String? kod3,
      String? kod4,
      String? kod5,
      String? kapali,
      String? durum,
      String? vergiNo,
      String? plasiyerKodu,
      String? aralikTipi,
      String? sirala,
      String? bakiyeDurumu,
      String? caharInckey,
      String? belgeTipi,
      String? belgeNo,
      String? isemriNo,
      String? dinamikParam,
      String? kasaharInckey,
      String? uretimFiyatiDahil,
      String? fiyatTipi,
      String? tblnfStokfiyatgecmisiId,
      String? gorunecekAlanlar,
      int? miktar,
      String? yapkod,
      String? kasaKodu});
}

/// @nodoc
class _$DicParamsCopyWithImpl<$Res, $Val extends DicParams>
    implements $DicParamsCopyWith<$Res> {
  _$DicParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cariKodu = freezed,
    Object? stokKodu = freezed,
    Object? sifirHaric = freezed,
    Object? maliyetTipi = freezed,
    Object? tlHarDokulsun = freezed,
    Object? depoKodlari = freezed,
    Object? haricStokKodlari = freezed,
    Object? haricStokGrupKodlari = freezed,
    Object? dovizTipi = freezed,
    Object? bastar = freezed,
    Object? bittar = freezed,
    Object? grupKodu = freezed,
    Object? borcAlacak = freezed,
    Object? refTarih = freezed,
    Object? tarihTipi = freezed,
    Object? kod1 = freezed,
    Object? kod2 = freezed,
    Object? kod3 = freezed,
    Object? kod4 = freezed,
    Object? kod5 = freezed,
    Object? kapali = freezed,
    Object? durum = freezed,
    Object? vergiNo = freezed,
    Object? plasiyerKodu = freezed,
    Object? aralikTipi = freezed,
    Object? sirala = freezed,
    Object? bakiyeDurumu = freezed,
    Object? caharInckey = freezed,
    Object? belgeTipi = freezed,
    Object? belgeNo = freezed,
    Object? isemriNo = freezed,
    Object? dinamikParam = freezed,
    Object? kasaharInckey = freezed,
    Object? uretimFiyatiDahil = freezed,
    Object? fiyatTipi = freezed,
    Object? tblnfStokfiyatgecmisiId = freezed,
    Object? gorunecekAlanlar = freezed,
    Object? miktar = freezed,
    Object? yapkod = freezed,
    Object? kasaKodu = freezed,
  }) {
    return _then(_value.copyWith(
      cariKodu: freezed == cariKodu
          ? _value.cariKodu
          : cariKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      sifirHaric: freezed == sifirHaric
          ? _value.sifirHaric
          : sifirHaric // ignore: cast_nullable_to_non_nullable
              as String?,
      maliyetTipi: freezed == maliyetTipi
          ? _value.maliyetTipi
          : maliyetTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      tlHarDokulsun: freezed == tlHarDokulsun
          ? _value.tlHarDokulsun
          : tlHarDokulsun // ignore: cast_nullable_to_non_nullable
              as String?,
      depoKodlari: freezed == depoKodlari
          ? _value.depoKodlari
          : depoKodlari // ignore: cast_nullable_to_non_nullable
              as String?,
      haricStokKodlari: freezed == haricStokKodlari
          ? _value.haricStokKodlari
          : haricStokKodlari // ignore: cast_nullable_to_non_nullable
              as String?,
      haricStokGrupKodlari: freezed == haricStokGrupKodlari
          ? _value.haricStokGrupKodlari
          : haricStokGrupKodlari // ignore: cast_nullable_to_non_nullable
              as String?,
      dovizTipi: freezed == dovizTipi
          ? _value.dovizTipi
          : dovizTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      bastar: freezed == bastar
          ? _value.bastar
          : bastar // ignore: cast_nullable_to_non_nullable
              as String?,
      bittar: freezed == bittar
          ? _value.bittar
          : bittar // ignore: cast_nullable_to_non_nullable
              as String?,
      grupKodu: freezed == grupKodu
          ? _value.grupKodu
          : grupKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      borcAlacak: freezed == borcAlacak
          ? _value.borcAlacak
          : borcAlacak // ignore: cast_nullable_to_non_nullable
              as String?,
      refTarih: freezed == refTarih
          ? _value.refTarih
          : refTarih // ignore: cast_nullable_to_non_nullable
              as String?,
      tarihTipi: freezed == tarihTipi
          ? _value.tarihTipi
          : tarihTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      kod1: freezed == kod1
          ? _value.kod1
          : kod1 // ignore: cast_nullable_to_non_nullable
              as String?,
      kod2: freezed == kod2
          ? _value.kod2
          : kod2 // ignore: cast_nullable_to_non_nullable
              as String?,
      kod3: freezed == kod3
          ? _value.kod3
          : kod3 // ignore: cast_nullable_to_non_nullable
              as String?,
      kod4: freezed == kod4
          ? _value.kod4
          : kod4 // ignore: cast_nullable_to_non_nullable
              as String?,
      kod5: freezed == kod5
          ? _value.kod5
          : kod5 // ignore: cast_nullable_to_non_nullable
              as String?,
      kapali: freezed == kapali
          ? _value.kapali
          : kapali // ignore: cast_nullable_to_non_nullable
              as String?,
      durum: freezed == durum
          ? _value.durum
          : durum // ignore: cast_nullable_to_non_nullable
              as String?,
      vergiNo: freezed == vergiNo
          ? _value.vergiNo
          : vergiNo // ignore: cast_nullable_to_non_nullable
              as String?,
      plasiyerKodu: freezed == plasiyerKodu
          ? _value.plasiyerKodu
          : plasiyerKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      aralikTipi: freezed == aralikTipi
          ? _value.aralikTipi
          : aralikTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      sirala: freezed == sirala
          ? _value.sirala
          : sirala // ignore: cast_nullable_to_non_nullable
              as String?,
      bakiyeDurumu: freezed == bakiyeDurumu
          ? _value.bakiyeDurumu
          : bakiyeDurumu // ignore: cast_nullable_to_non_nullable
              as String?,
      caharInckey: freezed == caharInckey
          ? _value.caharInckey
          : caharInckey // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeTipi: freezed == belgeTipi
          ? _value.belgeTipi
          : belgeTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isemriNo: freezed == isemriNo
          ? _value.isemriNo
          : isemriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      dinamikParam: freezed == dinamikParam
          ? _value.dinamikParam
          : dinamikParam // ignore: cast_nullable_to_non_nullable
              as String?,
      kasaharInckey: freezed == kasaharInckey
          ? _value.kasaharInckey
          : kasaharInckey // ignore: cast_nullable_to_non_nullable
              as String?,
      uretimFiyatiDahil: freezed == uretimFiyatiDahil
          ? _value.uretimFiyatiDahil
          : uretimFiyatiDahil // ignore: cast_nullable_to_non_nullable
              as String?,
      fiyatTipi: freezed == fiyatTipi
          ? _value.fiyatTipi
          : fiyatTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      tblnfStokfiyatgecmisiId: freezed == tblnfStokfiyatgecmisiId
          ? _value.tblnfStokfiyatgecmisiId
          : tblnfStokfiyatgecmisiId // ignore: cast_nullable_to_non_nullable
              as String?,
      gorunecekAlanlar: freezed == gorunecekAlanlar
          ? _value.gorunecekAlanlar
          : gorunecekAlanlar // ignore: cast_nullable_to_non_nullable
              as String?,
      miktar: freezed == miktar
          ? _value.miktar
          : miktar // ignore: cast_nullable_to_non_nullable
              as int?,
      yapkod: freezed == yapkod
          ? _value.yapkod
          : yapkod // ignore: cast_nullable_to_non_nullable
              as String?,
      kasaKodu: freezed == kasaKodu
          ? _value.kasaKodu
          : kasaKodu // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DicParamsImplCopyWith<$Res>
    implements $DicParamsCopyWith<$Res> {
  factory _$$DicParamsImplCopyWith(
          _$DicParamsImpl value, $Res Function(_$DicParamsImpl) then) =
      __$$DicParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? cariKodu,
      String? stokKodu,
      String? sifirHaric,
      String? maliyetTipi,
      String? tlHarDokulsun,
      String? depoKodlari,
      String? haricStokKodlari,
      String? haricStokGrupKodlari,
      String? dovizTipi,
      String? bastar,
      String? bittar,
      String? grupKodu,
      String? borcAlacak,
      String? refTarih,
      String? tarihTipi,
      String? kod1,
      String? kod2,
      String? kod3,
      String? kod4,
      String? kod5,
      String? kapali,
      String? durum,
      String? vergiNo,
      String? plasiyerKodu,
      String? aralikTipi,
      String? sirala,
      String? bakiyeDurumu,
      String? caharInckey,
      String? belgeTipi,
      String? belgeNo,
      String? isemriNo,
      String? dinamikParam,
      String? kasaharInckey,
      String? uretimFiyatiDahil,
      String? fiyatTipi,
      String? tblnfStokfiyatgecmisiId,
      String? gorunecekAlanlar,
      int? miktar,
      String? yapkod,
      String? kasaKodu});
}

/// @nodoc
class __$$DicParamsImplCopyWithImpl<$Res>
    extends _$DicParamsCopyWithImpl<$Res, _$DicParamsImpl>
    implements _$$DicParamsImplCopyWith<$Res> {
  __$$DicParamsImplCopyWithImpl(
      _$DicParamsImpl _value, $Res Function(_$DicParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cariKodu = freezed,
    Object? stokKodu = freezed,
    Object? sifirHaric = freezed,
    Object? maliyetTipi = freezed,
    Object? tlHarDokulsun = freezed,
    Object? depoKodlari = freezed,
    Object? haricStokKodlari = freezed,
    Object? haricStokGrupKodlari = freezed,
    Object? dovizTipi = freezed,
    Object? bastar = freezed,
    Object? bittar = freezed,
    Object? grupKodu = freezed,
    Object? borcAlacak = freezed,
    Object? refTarih = freezed,
    Object? tarihTipi = freezed,
    Object? kod1 = freezed,
    Object? kod2 = freezed,
    Object? kod3 = freezed,
    Object? kod4 = freezed,
    Object? kod5 = freezed,
    Object? kapali = freezed,
    Object? durum = freezed,
    Object? vergiNo = freezed,
    Object? plasiyerKodu = freezed,
    Object? aralikTipi = freezed,
    Object? sirala = freezed,
    Object? bakiyeDurumu = freezed,
    Object? caharInckey = freezed,
    Object? belgeTipi = freezed,
    Object? belgeNo = freezed,
    Object? isemriNo = freezed,
    Object? dinamikParam = freezed,
    Object? kasaharInckey = freezed,
    Object? uretimFiyatiDahil = freezed,
    Object? fiyatTipi = freezed,
    Object? tblnfStokfiyatgecmisiId = freezed,
    Object? gorunecekAlanlar = freezed,
    Object? miktar = freezed,
    Object? yapkod = freezed,
    Object? kasaKodu = freezed,
  }) {
    return _then(_$DicParamsImpl(
      cariKodu: freezed == cariKodu
          ? _value.cariKodu
          : cariKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      stokKodu: freezed == stokKodu
          ? _value.stokKodu
          : stokKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      sifirHaric: freezed == sifirHaric
          ? _value.sifirHaric
          : sifirHaric // ignore: cast_nullable_to_non_nullable
              as String?,
      maliyetTipi: freezed == maliyetTipi
          ? _value.maliyetTipi
          : maliyetTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      tlHarDokulsun: freezed == tlHarDokulsun
          ? _value.tlHarDokulsun
          : tlHarDokulsun // ignore: cast_nullable_to_non_nullable
              as String?,
      depoKodlari: freezed == depoKodlari
          ? _value.depoKodlari
          : depoKodlari // ignore: cast_nullable_to_non_nullable
              as String?,
      haricStokKodlari: freezed == haricStokKodlari
          ? _value.haricStokKodlari
          : haricStokKodlari // ignore: cast_nullable_to_non_nullable
              as String?,
      haricStokGrupKodlari: freezed == haricStokGrupKodlari
          ? _value.haricStokGrupKodlari
          : haricStokGrupKodlari // ignore: cast_nullable_to_non_nullable
              as String?,
      dovizTipi: freezed == dovizTipi
          ? _value.dovizTipi
          : dovizTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      bastar: freezed == bastar
          ? _value.bastar
          : bastar // ignore: cast_nullable_to_non_nullable
              as String?,
      bittar: freezed == bittar
          ? _value.bittar
          : bittar // ignore: cast_nullable_to_non_nullable
              as String?,
      grupKodu: freezed == grupKodu
          ? _value.grupKodu
          : grupKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      borcAlacak: freezed == borcAlacak
          ? _value.borcAlacak
          : borcAlacak // ignore: cast_nullable_to_non_nullable
              as String?,
      refTarih: freezed == refTarih
          ? _value.refTarih
          : refTarih // ignore: cast_nullable_to_non_nullable
              as String?,
      tarihTipi: freezed == tarihTipi
          ? _value.tarihTipi
          : tarihTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      kod1: freezed == kod1
          ? _value.kod1
          : kod1 // ignore: cast_nullable_to_non_nullable
              as String?,
      kod2: freezed == kod2
          ? _value.kod2
          : kod2 // ignore: cast_nullable_to_non_nullable
              as String?,
      kod3: freezed == kod3
          ? _value.kod3
          : kod3 // ignore: cast_nullable_to_non_nullable
              as String?,
      kod4: freezed == kod4
          ? _value.kod4
          : kod4 // ignore: cast_nullable_to_non_nullable
              as String?,
      kod5: freezed == kod5
          ? _value.kod5
          : kod5 // ignore: cast_nullable_to_non_nullable
              as String?,
      kapali: freezed == kapali
          ? _value.kapali
          : kapali // ignore: cast_nullable_to_non_nullable
              as String?,
      durum: freezed == durum
          ? _value.durum
          : durum // ignore: cast_nullable_to_non_nullable
              as String?,
      vergiNo: freezed == vergiNo
          ? _value.vergiNo
          : vergiNo // ignore: cast_nullable_to_non_nullable
              as String?,
      plasiyerKodu: freezed == plasiyerKodu
          ? _value.plasiyerKodu
          : plasiyerKodu // ignore: cast_nullable_to_non_nullable
              as String?,
      aralikTipi: freezed == aralikTipi
          ? _value.aralikTipi
          : aralikTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      sirala: freezed == sirala
          ? _value.sirala
          : sirala // ignore: cast_nullable_to_non_nullable
              as String?,
      bakiyeDurumu: freezed == bakiyeDurumu
          ? _value.bakiyeDurumu
          : bakiyeDurumu // ignore: cast_nullable_to_non_nullable
              as String?,
      caharInckey: freezed == caharInckey
          ? _value.caharInckey
          : caharInckey // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeTipi: freezed == belgeTipi
          ? _value.belgeTipi
          : belgeTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      belgeNo: freezed == belgeNo
          ? _value.belgeNo
          : belgeNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isemriNo: freezed == isemriNo
          ? _value.isemriNo
          : isemriNo // ignore: cast_nullable_to_non_nullable
              as String?,
      dinamikParam: freezed == dinamikParam
          ? _value.dinamikParam
          : dinamikParam // ignore: cast_nullable_to_non_nullable
              as String?,
      kasaharInckey: freezed == kasaharInckey
          ? _value.kasaharInckey
          : kasaharInckey // ignore: cast_nullable_to_non_nullable
              as String?,
      uretimFiyatiDahil: freezed == uretimFiyatiDahil
          ? _value.uretimFiyatiDahil
          : uretimFiyatiDahil // ignore: cast_nullable_to_non_nullable
              as String?,
      fiyatTipi: freezed == fiyatTipi
          ? _value.fiyatTipi
          : fiyatTipi // ignore: cast_nullable_to_non_nullable
              as String?,
      tblnfStokfiyatgecmisiId: freezed == tblnfStokfiyatgecmisiId
          ? _value.tblnfStokfiyatgecmisiId
          : tblnfStokfiyatgecmisiId // ignore: cast_nullable_to_non_nullable
              as String?,
      gorunecekAlanlar: freezed == gorunecekAlanlar
          ? _value.gorunecekAlanlar
          : gorunecekAlanlar // ignore: cast_nullable_to_non_nullable
              as String?,
      miktar: freezed == miktar
          ? _value.miktar
          : miktar // ignore: cast_nullable_to_non_nullable
              as int?,
      yapkod: freezed == yapkod
          ? _value.yapkod
          : yapkod // ignore: cast_nullable_to_non_nullable
              as String?,
      kasaKodu: freezed == kasaKodu
          ? _value.kasaKodu
          : kasaKodu // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(createFactory: true, explicitToJson: true, createToJson: true)
class _$DicParamsImpl implements _DicParams {
  _$DicParamsImpl(
      {this.cariKodu,
      this.stokKodu,
      this.sifirHaric,
      this.maliyetTipi,
      this.tlHarDokulsun,
      this.depoKodlari,
      this.haricStokKodlari,
      this.haricStokGrupKodlari,
      this.dovizTipi,
      this.bastar,
      this.bittar,
      this.grupKodu,
      this.borcAlacak,
      this.refTarih,
      this.tarihTipi,
      this.kod1,
      this.kod2,
      this.kod3,
      this.kod4,
      this.kod5,
      this.kapali,
      this.durum,
      this.vergiNo,
      this.plasiyerKodu,
      this.aralikTipi,
      this.sirala,
      this.bakiyeDurumu,
      this.caharInckey,
      this.belgeTipi,
      this.belgeNo,
      this.isemriNo,
      this.dinamikParam,
      this.kasaharInckey,
      this.uretimFiyatiDahil,
      this.fiyatTipi,
      this.tblnfStokfiyatgecmisiId,
      this.gorunecekAlanlar,
      this.miktar,
      this.yapkod,
      this.kasaKodu});

  factory _$DicParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DicParamsImplFromJson(json);

  @override
  String? cariKodu;
  @override
  String? stokKodu;
  @override
  String? sifirHaric;
  @override
  String? maliyetTipi;
  @override
  String? tlHarDokulsun;
  @override
  String? depoKodlari;
  @override
  String? haricStokKodlari;
  @override
  String? haricStokGrupKodlari;
  @override
  String? dovizTipi;
  @override
  String? bastar;
  @override
  String? bittar;
  @override
  String? grupKodu;
  @override
  String? borcAlacak;
  @override
  String? refTarih;
  @override
  String? tarihTipi;
  @override
  String? kod1;
  @override
  String? kod2;
  @override
  String? kod3;
  @override
  String? kod4;
  @override
  String? kod5;
  @override
  String? kapali;
  @override
  String? durum;
  @override
  String? vergiNo;
  @override
  String? plasiyerKodu;
  @override
  String? aralikTipi;
  @override
  String? sirala;
  @override
  String? bakiyeDurumu;
  @override
  String? caharInckey;
  @override
  String? belgeTipi;
  @override
  String? belgeNo;
  @override
  String? isemriNo;
  @override
  String? dinamikParam;
  @override
  String? kasaharInckey;
  @override
  String? uretimFiyatiDahil;
  @override
  String? fiyatTipi;
  @override
  String? tblnfStokfiyatgecmisiId;
  @override
  String? gorunecekAlanlar;
  @override
  int? miktar;
  @override
  String? yapkod;
  @override
  String? kasaKodu;

  @override
  String toString() {
    return 'DicParams(cariKodu: $cariKodu, stokKodu: $stokKodu, sifirHaric: $sifirHaric, maliyetTipi: $maliyetTipi, tlHarDokulsun: $tlHarDokulsun, depoKodlari: $depoKodlari, haricStokKodlari: $haricStokKodlari, haricStokGrupKodlari: $haricStokGrupKodlari, dovizTipi: $dovizTipi, bastar: $bastar, bittar: $bittar, grupKodu: $grupKodu, borcAlacak: $borcAlacak, refTarih: $refTarih, tarihTipi: $tarihTipi, kod1: $kod1, kod2: $kod2, kod3: $kod3, kod4: $kod4, kod5: $kod5, kapali: $kapali, durum: $durum, vergiNo: $vergiNo, plasiyerKodu: $plasiyerKodu, aralikTipi: $aralikTipi, sirala: $sirala, bakiyeDurumu: $bakiyeDurumu, caharInckey: $caharInckey, belgeTipi: $belgeTipi, belgeNo: $belgeNo, isemriNo: $isemriNo, dinamikParam: $dinamikParam, kasaharInckey: $kasaharInckey, uretimFiyatiDahil: $uretimFiyatiDahil, fiyatTipi: $fiyatTipi, tblnfStokfiyatgecmisiId: $tblnfStokfiyatgecmisiId, gorunecekAlanlar: $gorunecekAlanlar, miktar: $miktar, yapkod: $yapkod, kasaKodu: $kasaKodu)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DicParamsImplCopyWith<_$DicParamsImpl> get copyWith =>
      __$$DicParamsImplCopyWithImpl<_$DicParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DicParamsImplToJson(
      this,
    );
  }
}

abstract class _DicParams implements DicParams {
  factory _DicParams(
      {String? cariKodu,
      String? stokKodu,
      String? sifirHaric,
      String? maliyetTipi,
      String? tlHarDokulsun,
      String? depoKodlari,
      String? haricStokKodlari,
      String? haricStokGrupKodlari,
      String? dovizTipi,
      String? bastar,
      String? bittar,
      String? grupKodu,
      String? borcAlacak,
      String? refTarih,
      String? tarihTipi,
      String? kod1,
      String? kod2,
      String? kod3,
      String? kod4,
      String? kod5,
      String? kapali,
      String? durum,
      String? vergiNo,
      String? plasiyerKodu,
      String? aralikTipi,
      String? sirala,
      String? bakiyeDurumu,
      String? caharInckey,
      String? belgeTipi,
      String? belgeNo,
      String? isemriNo,
      String? dinamikParam,
      String? kasaharInckey,
      String? uretimFiyatiDahil,
      String? fiyatTipi,
      String? tblnfStokfiyatgecmisiId,
      String? gorunecekAlanlar,
      int? miktar,
      String? yapkod,
      String? kasaKodu}) = _$DicParamsImpl;

  factory _DicParams.fromJson(Map<String, dynamic> json) =
      _$DicParamsImpl.fromJson;

  @override
  String? get cariKodu;
  set cariKodu(String? value);
  @override
  String? get stokKodu;
  set stokKodu(String? value);
  @override
  String? get sifirHaric;
  set sifirHaric(String? value);
  @override
  String? get maliyetTipi;
  set maliyetTipi(String? value);
  @override
  String? get tlHarDokulsun;
  set tlHarDokulsun(String? value);
  @override
  String? get depoKodlari;
  set depoKodlari(String? value);
  @override
  String? get haricStokKodlari;
  set haricStokKodlari(String? value);
  @override
  String? get haricStokGrupKodlari;
  set haricStokGrupKodlari(String? value);
  @override
  String? get dovizTipi;
  set dovizTipi(String? value);
  @override
  String? get bastar;
  set bastar(String? value);
  @override
  String? get bittar;
  set bittar(String? value);
  @override
  String? get grupKodu;
  set grupKodu(String? value);
  @override
  String? get borcAlacak;
  set borcAlacak(String? value);
  @override
  String? get refTarih;
  set refTarih(String? value);
  @override
  String? get tarihTipi;
  set tarihTipi(String? value);
  @override
  String? get kod1;
  set kod1(String? value);
  @override
  String? get kod2;
  set kod2(String? value);
  @override
  String? get kod3;
  set kod3(String? value);
  @override
  String? get kod4;
  set kod4(String? value);
  @override
  String? get kod5;
  set kod5(String? value);
  @override
  String? get kapali;
  set kapali(String? value);
  @override
  String? get durum;
  set durum(String? value);
  @override
  String? get vergiNo;
  set vergiNo(String? value);
  @override
  String? get plasiyerKodu;
  set plasiyerKodu(String? value);
  @override
  String? get aralikTipi;
  set aralikTipi(String? value);
  @override
  String? get sirala;
  set sirala(String? value);
  @override
  String? get bakiyeDurumu;
  set bakiyeDurumu(String? value);
  @override
  String? get caharInckey;
  set caharInckey(String? value);
  @override
  String? get belgeTipi;
  set belgeTipi(String? value);
  @override
  String? get belgeNo;
  set belgeNo(String? value);
  @override
  String? get isemriNo;
  set isemriNo(String? value);
  @override
  String? get dinamikParam;
  set dinamikParam(String? value);
  @override
  String? get kasaharInckey;
  set kasaharInckey(String? value);
  @override
  String? get uretimFiyatiDahil;
  set uretimFiyatiDahil(String? value);
  @override
  String? get fiyatTipi;
  set fiyatTipi(String? value);
  @override
  String? get tblnfStokfiyatgecmisiId;
  set tblnfStokfiyatgecmisiId(String? value);
  @override
  String? get gorunecekAlanlar;
  set gorunecekAlanlar(String? value);
  @override
  int? get miktar;
  set miktar(int? value);
  @override
  String? get yapkod;
  set yapkod(String? value);
  @override
  String? get kasaKodu;
  set kasaKodu(String? value);
  @override
  @JsonKey(ignore: true)
  _$$DicParamsImplCopyWith<_$DicParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
