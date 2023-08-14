
import "package:json_annotation/json_annotation.dart";

import "../../../../../core/base/model/base_network_mixin.dart";

part "serbest_rapor_response_model.g.dart";

@JsonSerializable(explicitToJson: true, createToJson: true, fieldRename: FieldRename.screamingSnake)
class SerbestRaporResponseModel with NetworkManagerMixin {
  String? adi;
  bool? bosGecilebilir;
  String? tipi;
  String? deger;
  String? rehberTipi;
  Map<String, dynamic>? paramMap;

  bool get plasiyerKoduMu => ["KOD", "KODU","PLASIYER", "PLASIYERKOD","PLASIYER_KOD","PLASIYERKODU","PLASIYER_KODU"].contains(rehberTipi);

  bool get cariKoduMu => ["KOD", "KODU","CARI", "CARIKOD","CARI_KOD","CARIKODU","CARI_KODU"].contains(rehberTipi);

  bool get stokKoduMu => ["KOD", "KODU","STOK", "STOKKOD","STOK_KOD","STOKKODU","STOK_KODU"].contains(rehberTipi);

  bool get dovizTipiMi => rehberTipi == "DOVIZ_TIPI";

  bool get muhasebeKoduMu => rehberTipi == "MUHASEBE_KODU";

  bool get grupKoduMu => rehberTipi?.contains("GRUP_KODU") ?? false;

  bool get numaraliGrupKoduMu => int.tryParse(rehberTipi!.split("").last) != null;

  bool get cariVKNMi => rehberTipi == "CARI_VKN";



  @override
  fromJson(Map<String, dynamic> json) => _$SerbestRaporResponseModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SerbestRaporResponseModelToJson(this);
  

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
      other is SerbestRaporResponseModel &&
          runtimeType == other.runtimeType &&
          adi == other.adi &&
          bosGecilebilir == other.bosGecilebilir &&
          tipi == other.tipi &&
          deger == other.deger &&
          rehberTipi == other.rehberTipi &&
          paramMap == other.paramMap;
  }
  
           
}
