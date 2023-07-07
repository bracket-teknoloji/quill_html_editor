

import 'package:json_annotation/json_annotation.dart';
import 'package:picker/core/base/model/base_network_mixin.dart';


part 'fiyat_gecmisi_response_model.g.dart';


@JsonSerializable( createToJson: true, includeIfNull: false, fieldRename: FieldRename.screamingSnake)
class FiyatGecmisiResponseModel with NetworkManagerMixin{
  int? id;
    int? subeKodu;
    String? stokKodu;
    String? stokAdi;
    String? yer;
    String? aS;
    double? fiyat;
    double? dovizFiyati;
    int? dovizTipi;
    int? fiyatSirasi;
    DateTime? tarih;
    String? fiyatTipi;
    String? dovizAdi;
    String? yapkod;
  @override
  fromJson(Map<String, dynamic> json)=>  _$FiyatGecmisiResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FiyatGecmisiResponseModelToJson(this);
}