import "package:json_annotation/json_annotation.dart";

import "../../../../../../core/base/model/base_network_mixin.dart";

part "stok_hareketleri_model.g.dart";

@JsonSerializable()
final class StokHareketleriModel with NetworkManagerMixin {
  int? inckeyno;
  bool? cikisIslemi;
  String? stokAdi;
  String? stokKodu;
  String? fisno;
  double? stharGcmik;
  DateTime? stharTarih;
  double? stharNf;
  double? stharBf;
  double? stharKdv;
  String? hareketTuru;
  String? hareketTuruAciklama;
  String? belgeTipi;
  String? belgeTipiAciklama;
  String? cariKodu;
  String? ambarIslemi;
  int? depoKodu;
  String? depoAdi;
  String? aciklama;
  int? dovizTipi;
  double? dovizFiyati;
  String? seriAktif;
  String? ekalan1;
  String? ekalan2;
  String? projeKodu;
  String? plasiyerKodu;
  String? plasiyerAciklama;
  String? cariAdi;
  String? seriDurumAdi;
  @override
  StokHareketleriModel fromJson(Map<String, dynamic> json) => _$StokHareketleriModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StokHareketleriModelToJson(this);

  double? get dovizKuru => (stharBf ?? 0) / (dovizFiyati ?? 0);

  double? get dovizliNetFiyat => (stharNf ?? 0) / (dovizKuru ?? 0);

  double? get dovizliNetTutar => (dovizliNetFiyat ?? 0) * (stharGcmik ?? 0);
}
