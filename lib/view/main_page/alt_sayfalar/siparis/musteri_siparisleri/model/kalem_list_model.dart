

import 'package:json_annotation/json_annotation.dart';

part 'kalem_list_model.g.dart';


@JsonSerializable( createToJson: true, includeIfNull: true, createFactory: true, fieldRename: FieldRename.screamingSnake)
class KalemListModel{
  List<dynamic>? tempBarkodList;
    int? sira;
    DateTime? tarih;
    DateTime? teslimTarihi;
    String? belgeTipi;
    String? stokKodu;
    String? stokAdi;
    String? cariKodu;
    int? depoKodu;
    String? depoTanimi;
    int? miktar;
    List<dynamic>? seriList;
    int? kdvOrani;
    int? brutFiyat;
    int? dipFiyat;
    bool? iskonto1OranMi;
    int? stokSatDovTip;
    double? stokSatisKuru;
    String? stokSatDovizAdi;
    int? olcuBirimKodu;
    String? olcuBirimAdi;
    int? olcuBirimCarpani;
    String? stokOlcuBirimi;
    String? projeKodu;
    List<dynamic>? kalemListHucreList;
    List<dynamic>? hucreList;
    int? stokBakiye;
    String? kosulKodu;
    int? stokBirimAgirlik;
    
    KalemListModel();

    factory KalemListModel.fromJson(Map<String, dynamic> json) => _$KalemListModelFromJson(json);

    Map<String, dynamic> toJson() => _$KalemListModelToJson(this);
}