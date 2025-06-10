import "package:collection/collection.dart";
import "package:freezed_annotation/freezed_annotation.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "dekont_duzenle_request_model.dart";

part "dekont_islemler_request_model.freezed.dart";
part "dekont_islemler_request_model.g.dart";

@unfreezed
sealed class DekontIslemlerRequestModel with _$DekontIslemlerRequestModel, NetworkManagerMixin {
  // factory DekontIslemlerRequestModel.singleton();
  factory DekontIslemlerRequestModel({
    String? dekontIslemTuru,
    String? dekontSeri,
    String? guid,
    List<DekontKalemler>? kalemler,
    String? plasiyerKodu,
    String? projeKodu,
    @Default("DekontModel") String? tag,
    DateTime? tarih,
    @JsonKey(name: "_YeniKayit") bool? yeniKayit,
    int? dekontNo,
    @JsonKey(includeFromJson: false, includeToJson: false) String? seriAdi,
    @JsonKey(includeFromJson: false, includeToJson: false) String? plasiyerAdi,
    @JsonKey(includeFromJson: false, includeToJson: false) String? projeAdi,
  }) = _DekontIslemlerRequestModel;

  factory DekontIslemlerRequestModel.fromListOfDekontDuzenleModel(List<DekontDuzenleRequestModel> list) =>
      DekontIslemlerRequestModel(
        plasiyerKodu: list.firstOrNull?.plasiyerKodu,
        tarih: list.firstOrNull?.tarih,
        dekontSeri: list.firstOrNull?.seriNo,
        plasiyerAdi: list.firstOrNull?.plasiyerAciklama,
        seriAdi: list.firstOrNull?.seriNo,
        dekontNo: list.firstOrNull?.dekontNo,
        kalemler: list.map(DekontKalemler.fromDekontDuzenleModel).toList(),
      );
  DekontIslemlerRequestModel._();

  factory DekontIslemlerRequestModel.fromJson(Map<String, dynamic> json) => _$DekontIslemlerRequestModelFromJson(json);

  @override
  DekontIslemlerRequestModel fromJson(Map<String, dynamic> json) => DekontIslemlerRequestModel.fromJson(json);
}

extension DekontIslemleriExtensions on DekontIslemlerRequestModel {
  double get toplamBorc => kalemler?.where((element) => element.ba == "B").map((e) => e.tutar ?? 0).sum ?? 0;

  double get toplamAlacak => kalemler?.where((element) => element.ba == "A").map((e) => e.tutar ?? 0).sum ?? 0;

  bool get ilkSayfaTamamMi => dekontSeri != null && tarih != null && plasiyerKodu != null;
}

final class SingletonDekontIslemlerRequestModel {
  //create a singleton of DekontIslemlerRequestModel
  static final DekontIslemlerRequestModel _instance = DekontIslemlerRequestModel();

  static DekontIslemlerRequestModel get instance => _instance;

  //setter for the singleton
  static void setInstance(DekontIslemlerRequestModel value) {
    _instance.dekontIslemTuru = value.dekontIslemTuru;
    _instance.dekontSeri = value.dekontSeri;
    _instance.guid = value.guid;
    _instance.kalemler = value.kalemler;
    _instance.plasiyerKodu = value.plasiyerKodu;
    _instance.tag = value.tag;
    _instance.tarih = value.tarih;
    _instance.yeniKayit = value.yeniKayit;
    _instance.seriAdi = value.seriAdi;
    _instance.plasiyerAdi = value.plasiyerAdi;
    _instance.dekontNo = value.dekontNo;
  }
}
