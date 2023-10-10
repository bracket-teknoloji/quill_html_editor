// import 'package:freezed_annotation/freezed_annotation.dart';
// import "package:hive_flutter/hive_flutter.dart";
// import "package:injectable/injectable.dart";
// import "package:kartal/kartal.dart";

// import "../../../../../../core/base/model/base_network_mixin.dart";
// import "../../../../../../core/init/cache/cache_manager.dart";
// import "../../../cari/cari_listesi/model/cari_listesi_model.dart";
// import "../../../stok/stok_liste/model/stok_listesi_model.dart";
// import "base_siparis_edit_model.dart";

// part 'deneme_model.freezed.dart';
// part 'deneme_model.g.dart';

// @unfreezed
// @Singleton()
//  class DenemeModel with NetworkManagerMixin, _$DenemeModel {
//   const DenemeModel._();
//   //create singleton
//   static DenemeModel? _instance;
//   static DenemeModel get instance {
//     _instance ??= DenemeModel._();
//     if (_instance?.isNew == true && _instance?.belgeNo != null && _instance?.kalemList.ext.isNotNullOrEmpty == true) {
//       // DenemeModel? otherInstance = CacheManager.getSiparisEdit(_instance?.belgeNo ?? "");
//       // if (_instance != otherInstance) {
//       //   CacheManager.addSiparisEditListItem(_instance!);
//       // }
//     }
//     return _instance!;
//   }

//   factory DenemeModel(
//     DateTime? duzeltmetarihi,
//     int? kalemAdedi,
//     String? cariEfaturami,
//     String? cYedek6,
//     String? duzeltmeyapankul,
//     String? plasiyerAciklama,
//     String? projeAciklama,
//     String? tempJsonData,
//     String? teslimCariAdi,
//     bool? kdvDahilmi,
//     bool? remoteTempBelge,
//     bool? tempBelgeMi,
//     CariListesiModel? cariModel,
//     DateTime? islemeBaslamaTarihi,
//     DateTime? istenilenTeslimTarihi,
//     DateTime? kayittarihi,
//     DateTime? kosulTarihi,
//     DateTime? tarih,
//     DateTime? teslimTarihi,
//     DateTime? vadeTarihi,
//     double? araToplam,
//     double? ekMaliyet1Tutari,
//     double? ekMaliyet2Tutari,
//     double? ekMaliyet3Tutari,
//     double? genelIskonto1,
//     double? genelIskonto2,
//     double? genelIskonto3,
//     double? genelToplam,
//     double? genIsk1o,
//     double? genIsk1t,
//     double? genIsk2o,
//     double? genIsk2t,
//     double? genIsk3o,
//     double? genIsk3t,
//     double? kdv,
//     int? belgeTipi,
//     int? cikisDepoKodu,
//     int? genisk1Tipi,
//     int? genisk2Tipi,
//     int? genisk3Tipi,
//     int? kalemModelAdedi,
//     int? tempBelgeId,
//     int? tempKayitTipi,
//     int? tipi,
//     int? topluDepo,
//     int? vadeGunu,
//     List<dynamic>? tempSipList,
//     List<KalemModel>? kalemList,
//     List<KalemModel>? kalemModeller,
//     List<KalemModel>? kalemModelList,
//     String? acik1,
//     String? acik10,
//     String? acik11,
//     String? acik12,
//     String? acik13,
//     String? acik14,
//     String? acik15,
//     String? acik16,
//     String? acik2,
//     String? acik3,
//     String? acik4,
//     String? acik5,
//     String? acik6,
//     String? acik7,
//     String? acik8,
//     String? acik9,
//     String? belgeKodu,
//     String? belgeNo,
//     String? belgeTuru,
//     String? cariAdi,
//     String? cariKodu,
//     String? ekAcik1,
//     String? ekAcik10,
//     String? ekAcik11,
//     String? ekAcik12,
//     String? ekAcik13,
//     String? ekAcik14,
//     String? ekAcik15,
//     String? ekAcik16,
//     String? ekAcik2,
//     String? ekAcik3,
//     String? ekAcik4,
//     String? ekAcik5,
//     String? ekAcik6,
//     String? ekAcik7,
//     String? ekAcik8,
//     String? ekAcik9,
//     String? ekAciklama,
//     String? islemId,
//     String? kayityapankul,
//     String? kdvDahil,
//     String? kosulKodu,
//     String? mevcutBelgeNo,
//     String? mevcutCariKodu,
//     String? odemeKodu,
//     String? ozelKod1,
//     String? ozelKod2,
//     String? pickerBelgeTuru,
//     String? plasiyerKodu,
//     String? projeKodu,
//     String? remoteTempBelgeEtiketi,
//     String? tag,
//     List<KalemModel>? kalemler,
//     String? siparisTipi,
//     //! Yeni mi diye kontrol etmek için
//     bool? isNew,
//     String? irsaliyelesti,
//     int? irslesenSayi,
//     String? faturalasti,
//     int? dovizTipi,
//     String? dovizAdi,
//     String? kapatilmis,
//     String? aciklama,
//     double? dovizTutari,
//     String? teslimCari,
//     double? fYedek4,
//   ) = _DenemeModel;
//     bool kalemEkliMi(StokListesiModel? model) {
//     if (model != null) {
//       return kalemList?.any((element) => element.stokKodu == model.stokKodu) ?? false;
//     } else {
//       return false;
//     }
//   }

//   double get sumGenIsk1 => kalemList?.map((e) => e.iskonto1).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;
//   double get sumGenIsk2 => kalemList?.map((e) => e.iskonto2).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;
//   double get sumGenIsk3 => kalemList?.map((e) => e.iskonto3).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;
//   double get malFazlasiTutar => kalemList?.map((e) => e.mfTutari).toList().fold(0, (a, b) => (a ?? 0) + (b)) ?? 0;
//   double get satirIskonto => kalemList?.map((e) => e.iskontoTutari).toList().fold(0, (a, b) => (a ?? 0) + (b)) ?? 0;
//   int get toplamKalemMiktari {
//     kalemAdedi = (kalemList?.map((e) => e.toplamKalemMiktari.toInt()).toList().fold(0, (a, b) => (a) + (b)) ?? 0).toInt();
//     return (kalemAdedi ?? 0);
//   }

//   double get toplamBrutTutar => kalemList?.map((e) => (e.brutFiyat ?? 0) * (e.miktar ?? 0)).toList().fold(0, (a, b) => (a ?? 0) + (b)) ?? 0;
//   double get getAraToplam {
//     araToplam = kalemList?.map((e) => e.araToplamTutari).toList().fold(0, (a, b) => (a ?? 0) + (b)) ?? 0;
//     return araToplam ?? 0;
//   }
//   // double get malFazIsk {
//   //   Isko
//   // }

//   bool get yurticiMi => tipi != 6;
//   int get getKalemSayisi => kalemList?.length ?? (kalemAdedi ?? 0);
//   bool get isRemoteTempBelgeNull => remoteTempBelge == null;

//   double get getToplamIskonto => malFazlasiTutar + satirIskonto +((araToplam ??0));
//   double get getBrutTutar => kalemList?.map((e) => e.brutFiyat).toList().fold(0, (a, b) => (a ?? 0) + (b ?? 0)) ?? 0;
//   @override
//   fromJson(Map<String, dynamic> json) => _$DenemeModelFromJson(json);

//   factory DenemeModel.fromJson(Map<String, dynamic> json) => _$DenemeModelFromJson(json);
// }
