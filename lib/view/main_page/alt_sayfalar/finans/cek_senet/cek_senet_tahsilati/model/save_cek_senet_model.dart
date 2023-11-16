import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";

part "save_cek_senet_model.freezed.dart";
part "save_cek_senet_model.g.dart";

@unfreezed
class SaveCekSenetModel with _$SaveCekSenetModel, NetworkManagerMixin {
  SaveCekSenetModel._();
  factory SaveCekSenetModel({
    String? belgeTipi,
    String? cariAdi,
    String? cariKodu,
    String? guid,
    int? islemKodu,
    List<CekSenetKalemlerModel>? kalemler,
    String? pickerTahsilatTuru,
    String? plasiyerKodu,
    String? tag,
    DateTime? tarih,
    bool? yeniKayit,
    String? projeKodu,
  }) = _SaveCekSenetModel;

  factory SaveCekSenetModel.fromJson(Map<String, dynamic> json) => _$SaveCekSenetModelFromJson(json);

  @override
  SaveCekSenetModel fromJson(Map<String, dynamic> json) => SaveCekSenetModel.fromJson(json);
}

@unfreezed
class CekSenetKalemlerModel with _$CekSenetKalemlerModel {
  factory CekSenetKalemlerModel({
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
    int? dovizTipi,
    String? tag,
    DateTime? tarih,
    double? tutar,
    DateTime? vadeTarihi,
    double? dovizKuru,
    double? dovizTutari,
    String? asilCari,
    String? refKod,
    String? refTanimi,
    String? aciklama1,
    String? aciklama2,
    String? aciklama3,
    String? projeAdi,
    String? projeKodu,
    String? verenKodu,
  }) = _CekSenetKalemlerModel;

  factory CekSenetKalemlerModel.fromJson(Map<String, dynamic> json) => _$CekSenetKalemlerModelFromJson(json);
}

extension CekSenetExtensions on CekSenetKalemlerModel {
  bool get ciroMu => ciroTipi == "C";

  bool get dovizliMi => dovizTipi != null && dovizTipi != 0;
}
