import "package:get/get.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";

part "lokal_depo_bakiye_raporu_view_model.g.dart";

class LokalDepoBakiyeRaporuViewModel = _LokalDepoBakiyeRaporuViewModelBase
    with _$LokalDepoBakiyeRaporuViewModel;

abstract class _LokalDepoBakiyeRaporuViewModelBase with Store {
  @observable
  PdfModel pdfModel = PdfModel(
      raporOzelKod: "Rapor_StokLokalDepo",
      standart: true,
      dicParams: DicParams()..sifirHaric = "H");

  List<BottomSheetModel>? bottomSheetList = CacheManager.getAnaVeri()
      ?.paramModel
      ?.depoList
      ?.map((e) => BottomSheetModel(
          title: e.depoTanimi ?? "",
          description: e.depoKodu.toStringIfNotNull ?? "",
          onTap: () => Get.back(result: e.depoKodu.toStringIfNotNull)))
      .toList();
  @observable
  bool sifirHaricValue = false;

  @action
  void setSifirHaric(bool value) {
    sifirHaricValue = value;
    value
        ? pdfModel.dicParams!.sifirHaric = "E"
        : pdfModel.dicParams!.sifirHaric = "H";
  }

  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController =
      ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
