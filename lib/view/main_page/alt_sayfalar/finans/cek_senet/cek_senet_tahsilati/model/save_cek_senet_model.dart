import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "save_cek_senet_model.freezed.dart";
part "save_cek_senet_model.g.dart";

@unfreezed
class SaveCekSenetModel with _$SaveCekSenetModel, NetworkManagerMixin{
  
  SaveCekSenetModel._();
  factory SaveCekSenetModel({
    String? belgeTipi,
    String? cariAdi,
    String? cariKodu,
    String? guid,
    int? islemKodu,
    List<CekSenetkalemlerModel>? kalemler,
    String? pickerTahsilatTuru,
    String? plasiyerKodu,
    String? tag,
    DateTime? tarih,
    bool? yeniKayit,
  }) = _SaveCekSenetModel;

  factory SaveCekSenetModel.fromJson(Map<String, dynamic> json) => _$SaveCekSenetModelFromJson(json);

  @override
  SaveCekSenetModel fromJson(Map<String, dynamic> json) => SaveCekSenetModel.fromJson(json);
}

@unfreezed
class  CekSenetkalemlerModel with _$CekSenetkalemlerModel {
   factory CekSenetkalemlerModel({
    String? cariRaporKodu,
    String? cekBanka,
    String? seriNo,
    String? cekSube,
    String? ciroTipi,
    String? gorsel1,
    String? gorsel2,
    String? hesapNo,
    String? ilce,
    String? plasiyerAdi,
    String? plasiyerKodu,
    String? raporKodu,
    String? sehir,
    int? sira,
    String? tag,
    DateTime? tarih,
    int? tutar,
    DateTime? vadeTarihi,
  }) = _CekSenetkalemlerModel;

  factory CekSenetkalemlerModel.fromJson(Map<String, dynamic> json) => _$CekSenetkalemlerModelFromJson(json);
}
