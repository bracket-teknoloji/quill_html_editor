import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/musteri_siparisleri/model/kalem_list_model.dart';

part 'musteri_siparisleri_model.g.dart';

@JsonSerializable(createToJson: true, includeIfNull: true, fieldRename: FieldRename.screamingSnake)
class MusteriSiparisleriModel with NetworkManagerMixin {
  String? islemId;
  int? tempKayitTipi;
  int? tempBelgeId;
  bool? tempBelgeMi;
  bool? remoteTempBelge;
  String? remoteTempBelgeEtiketi;
  String? tempJsonData;
  List<dynamic>? tempSipList;
  List<KalemListModel>? kalemList;
  DateTime? tarih;
  DateTime? teslimTarihi;
  DateTime? istenilenTeslimTarihi;
  String? belgeNo;
  String? belgeTuru;
  String? belgeKodu;
  int? kalemAdedi;
  String? cariKodu;
  String? cariAdi;
  int? tipi;
  int? vadeGunu;
  DateTime? vadeTarihi;
  String? projeKodu;
  String? projeAciklama;
  String? kdvDahil;
  String? ozelKod1;
  String? kosulKodu;
  String? kayityapankul;
  DateTime? kayittarihi;
  double? kdv;
  double? genelToplam;
  String? plasiyerKodu;
  String? plasiyerAciklama;
  DateTime? kosulTarihi;
  String? irsaliyelesti;
  String? faturalasti;
  String? cYedek6;
  int? topluDepo;
  int? dovizTipi;
  String? dovizAdi;
  String? kapatilmis;
  String? aciklama;
  String? acik4;
  String? acik10;
  double? dovizTutari;
  String? teslimCari;
  String? teslimCariAdi;
  String? duzeltmeyapankul;
  DateTime? duzeltmetarihi;
  String? odemeKodu;
  double? fYedek4;
  String? acik12;

  double get araToplam => (genelToplam ?? 0) - (kdv ?? 0);

  @override
  fromJson(Map<String, dynamic> json) => _$MusteriSiparisleriModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MusteriSiparisleriModelToJson(this);
}
