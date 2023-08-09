import 'package:json_annotation/json_annotation.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';

import '../../../../../../core/base/model/base_network_mixin.dart';

part 'siparis_edit_reuqest_model.g.dart';


@JsonSerializable(createToJson: true, includeIfNull: true, fieldRename: FieldRename.pascal)
class SiparisEditRequestModel with NetworkManagerMixin{
    String? belgeNo;
    String? belgeTuru;
    String? cariKodu;
    String? ekranTipi;
    String? kayitModu;
    bool? kisitYok;
    int? tempBelgeId;
    

    SiparisEditRequestModel({
        this.belgeNo,
        this.belgeTuru,
        this.cariKodu,
        this.ekranTipi,
        this.kayitModu,
        this.kisitYok,
        this.tempBelgeId,
    });
  factory SiparisEditRequestModel.fromSiparislerModel(BaseSiparisEditModel? model){
    return SiparisEditRequestModel(
      belgeNo: model?.belgeNo,
      belgeTuru: model?.belgeTuru,
      cariKodu: model?.cariKodu,
      ekranTipi: "D",
      kisitYok: true,
      tempBelgeId: model?.tempBelgeId);
  }
  
  @override
  fromJson(Map<String, dynamic> json) => _$SiparisEditRequestModelFromJson(json);
  
  @override
  Map<String, dynamic> toJson() => _$SiparisEditRequestModelToJson(this);
}