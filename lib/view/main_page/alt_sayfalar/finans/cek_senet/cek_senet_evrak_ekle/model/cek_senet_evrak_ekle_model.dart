import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";

part "cek_senet_evrak_ekle_model.freezed.dart";
part "cek_senet_evrak_ekle_model.g.dart";

@unfreezed
class CekSenetEvrakEkleModel with _$CekSenetEvrakEkleModel {
  factory CekSenetEvrakEkleModel({
    String? aciklama,
    String? base64Data,
    String? belgeNo,
    String? belgeTipi,
    int? boyutByte,
    int? islemKodu,
  }) = _CekSenetEvrakEkleModel;

  factory CekSenetEvrakEkleModel.fromJson(Map<String, dynamic> json) => _$CekSenetEvrakEkleModelFromJson(json);

  factory CekSenetEvrakEkleModel.fromCekSenetListesiModel(CekSenetListesiModel model) => CekSenetEvrakEkleModel(
        belgeNo: model.belgeNo,
        belgeTipi: model.belgeTipi,
      );
}
