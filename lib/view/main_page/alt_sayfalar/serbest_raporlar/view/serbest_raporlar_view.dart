// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_grup_kodu_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../core/base/state/base_state.dart";
import "../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../core/init/network/login/api_urls.dart";
import "../model/serbest_rapor_response_model.dart";
import "../view_model/serbest_raporlar_view_model.dart";

class SerbestRaporlarView extends StatefulWidget {
  final NetFectDizaynList? dizaynList;
  final CariListesiModel? cariListesiModel;
  final StokListesiModel? stokListesiModel;
  const SerbestRaporlarView(
      {super.key,
      this.dizaynList,
      this.cariListesiModel,
      this.stokListesiModel,});

  @override
  State<SerbestRaporlarView> createState() => _SerbestRaporlarViewState();
}

class _SerbestRaporlarViewState extends BaseState<SerbestRaporlarView> {
  SerbestRaporlarViewModel viewModel = SerbestRaporlarViewModel();

  @override
  Widget build(BuildContext context) => PDFViewerView(
        filterBottomSheet: filterBottomSheet,
        title: widget.dizaynList?.dizaynAdi ?? "Serbest Raporlar",
        pdfData: viewModel.pdfModel,);

  Future<bool> filterBottomSheet() async {
    await getData();
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Filtrele",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Wrap(
                children: viewModel.serbestRaporResponseModelList
                        ?.map((e) {
                          if (e.tipi == "Date") {
                            return CustomTextField(
                                fitContent: true,
                                labelText: e.adi ?? "",
                                controller:
                                    viewModel.textEditingControllerList?[
                                        viewModel.serbestRaporResponseModelList
                                                ?.indexOf(e) ??
                                            0],
                                isMust: e.bosGecilebilir != true,
                                readOnly: true,
                                isDateTime: true,
                                // suffix: const Icon(Icons.calendar_today),
                                onTap: () async {
                                  final DateTime? result =
                                      await dialogManager.showDateTimePicker();
                                  if (result != null) {
                                    viewModel.changeDicParams(
                                        e.adi ?? "", result.toDateString,);
                                  }
                                },);
                          } else if (e.rehberTipi != null) {
                            return CustomTextField(
                                fitContent: true,
                                labelText: e.adi ?? "",
                                controller:
                                    viewModel.textEditingControllerList?[
                                        viewModel.serbestRaporResponseModelList
                                                ?.indexOf(e) ??
                                            0],
                                isMust: e.bosGecilebilir != true,
                                readOnly: true,
                                suffixMore: true,
                                onTap: () {
                                  getRehber(e);
                                },);
                          } else {
                            return CustomTextField(
                                fitContent: true,
                                labelText: e.adi ?? "",
                                readOnly: e.paramMap != null ? true : null,
                                controller:
                                    viewModel.textEditingControllerList?[
                                        viewModel.serbestRaporResponseModelList!
                                            .indexOf(e)],
                                isMust: e.bosGecilebilir != true,
                                suffix: e.paramMap != null
                                    ? const Icon(Icons.more_horiz_outlined)
                                    : null,
                                onTap: e.paramMap == null
                                    ? null
                                    : () async {
                                        final result =
                                            await bottomSheetDialogManager
                                                .showBottomSheetDialog(context,
                                                    title: "Seçiniz",
                                                    children: e
                                                        .paramMap?.values
                                                        .map((value) =>
                                                            BottomSheetModel(
                                                                title: value,
                                                                onTap: () =>
                                                                    Get.back(
                                                                        result:
                                                                            e,),),)
                                                        .toList(),);
                                        if (result != null) {
                                          viewModel.changeDicParams(
                                              e.adi ?? "", result.adi,);
                                        }
                                      },
                                onChanged: (value) {
                                  viewModel.changeDicParams(
                                      e.adi ?? "", value, false,);
                                },);
                          }
                        })
                        .toList()
                        .nullCheckWithGeneric ??
                    [],),
          ),
          ElevatedButton(
                  onPressed: () {
                    //😳 Düzelt kanki
                    if (viewModel.serbestRaporResponseModelList
                            ?.where(
                                (element) => element.bosGecilebilir == false,)
                            .any((element) =>
                                viewModel.dicParams[element.adi ?? ""] ==
                                null,) ??
                        false) {
                      dialogManager
                          .showAlertDialog("Lütfen tüm alanları doldurunuz");
                    } else {
                      viewModel.setFuture();
                      viewModel.pdfModel.dizaynId = widget.dizaynList?.id;
                      viewModel.pdfModel.etiketSayisi =
                          widget.dizaynList?.kopyaSayisi;

                      Get.back();
                    }
                  },
                  child: const Text("Uygula"),)
              .paddingAll(UIHelper.midSize),
        ],
      ).paddingAll(UIHelper.lowSize),
    );
    return Future.value(viewModel.futureController.value);
  }

  void getRehber(SerbestRaporResponseModel model) async {
    if (model.stokKoduMu || model.cariKoduMu) {
      final result = await Get.toNamed(
          "/mainPage/${model.rehberTipi?.toLowerCase()}Listesi",
          arguments: true,);
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "",
            model.stokKoduMu ? result.stokKodu : result.cariKodu,);
      }
    } else if (model.plasiyerKoduMu) {
      final result =
          await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
      // List<PlasiyerList> plasiyerList = CacheManager.getAnaVeri()?.paramModel?.plasiyerList ?? [];
      // var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
      //     title: "Plasiyer Seçiniz", children: plasiyerList.map((e) => BottomSheetModel(title: e.plasiyerAciklama ?? "", onTap: () => Get.back(result: e))).toList());
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.plasiyerKodu ?? "");
      }
    } else if (model.grupKoduMu) {
      final grupKodList = await networkManager.getGrupKod(
          name: model.rehberTipi?.split("_").first ?? "", grupNo: 0,);
      final result = await bottomSheetDialogManager.showBottomSheetDialog(context,
          title: "Grup Kodu Seçiniz",
          children: grupKodList
              .map((e) => BottomSheetModel(
                  title: e.grupAdi ?? "", onTap: () => Get.back(result: e),),)
              .toList(),);
      if (result != null && result is BaseGrupKoduModel) {
        viewModel.changeDicParams(model.adi ?? "", result.grupKodu ?? "");
        viewModel.changeControllerText(model.adi ?? "", result.grupAdi ?? "");
      }
    } else if (model.numaraliGrupKoduMu) {
      final grupKodList = await networkManager.getGrupKod(
          name: model.rehberTipi?.split("_").first ?? "",
          grupNo: int.tryParse(model.rehberTipi!.split("").last) ?? 0,);
      final result = await bottomSheetDialogManager.showBottomSheetDialog(context,
          title: "Grup Kodu Seçiniz",
          children: grupKodList
              .map((e) => BottomSheetModel(
                  title: e.grupKodu ?? "", onTap: () => Get.back(result: e),),)
              .toList(),);
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.grupKodu ?? "");
      }
    } else if (model.dovizTipiMi) {
      // var dovizList = CacheManager.getAnaVeri()?.paramModel?.dovizList ?? [];
      //  = await bottomSheetDialogManager.showBottomSheetDialog(context,
      //     title: "Döviz Seçiniz", children: dovizList.map((e) => BottomSheetModel(title: e.dovizKodu.toStringIfNotNull ?? "", onTap: () => Get.back(result: e))).toList());
      final result =
          await bottomSheetDialogManager.showDovizBottomSheetDialog(context);
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.dovizKodu.toString());
      }
    } else if (model.muhasebeKoduMu) {
      final muhasebeList = await networkManager.dioGet<StokMuhasebeKoduModel>(
          path: ApiUrls.getStokMuhasebeKodlari, bodyModel: StokMuhasebeKoduModel(),);
      final result = await bottomSheetDialogManager.showBottomSheetDialog(context,
          title: "Muhasebe Kodu Seçiniz",
          children: muhasebeList.data
              .map((e) => BottomSheetModel(
                  title: e.muhKodu.toString(),
                  onTap: () => Get.back(result: e),),)
              .toList()
              .cast<BottomSheetModel>(),);
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.muhKodu.toString());
      }
    } else if (model.cariVKNMi) {
      final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
      if (result != null) {
        viewModel.changeDicParams(model.adi ?? "", result.vergiNumarasi);
      }
    }
  }

  Future<void> getData() async {
    // dialogManager.showLoadingDialog("Lütfen Bekleyiniz");
    final result = await networkManager.dioGet<SerbestRaporResponseModel>(
        path: ApiUrls.getDizaynParametreleri,
        bodyModel: SerbestRaporResponseModel(),
        queryParameters: {"ID": widget.dizaynList?.id},);
    if (result.success == true) {
      viewModel.changeSerbestRaporResponseModelList(result.data
          .map((e) => e as SerbestRaporResponseModel)
          .toList()
          .cast<SerbestRaporResponseModel>(),);
    }
    // dialogManager.hideAlertDialog;
  }
}
