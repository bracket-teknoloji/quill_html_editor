import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/mal_kabul_sevkiyat/raporlar/mal_kabul_sevkiyat_kalem_raporu/view_model/mal_kabul_sevkiyat_kalem_raporu_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../model/param_model.dart";

final class MalKabulSevkiyatKalemRaporuView extends StatefulWidget {
  const MalKabulSevkiyatKalemRaporuView({required this.editTipiEnum, super.key});
  final EditTipiEnum editTipiEnum;

  @override
  State<MalKabulSevkiyatKalemRaporuView> createState() => _MalKabulSevkiyatKalemRaporuViewState();
}

final class _MalKabulSevkiyatKalemRaporuViewState extends BaseState<MalKabulSevkiyatKalemRaporuView> {
  final MalKabulSevkiyatKalemRaporuViewModel viewModel = MalKabulSevkiyatKalemRaporuViewModel();
  late final TextEditingController belgeNoController;
  late final TextEditingController cariController;
  late final TextEditingController plasiyerController;
  late final TextEditingController baslangicController;
  late final TextEditingController bitisController;

  @override
  void initState() {
    belgeNoController = TextEditingController();
    cariController = TextEditingController();
    plasiyerController = TextEditingController();
    baslangicController = TextEditingController();
    bitisController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    cariController.dispose();
    plasiyerController.dispose();
    baslangicController.dispose();
    bitisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PDFViewerView(
    filterBottomSheet: filterBottomSheet,
    title: "${widget.editTipiEnum.getName} Kalemler Raporu",
    pdfData: viewModel.pdfModel,
  );

  Future<bool> filterBottomSheet() async {
    {
      viewModel.resetFuture();
      await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: loc.generalStrings.filter,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Observer(
            //   builder: (_) => SlideControllerWidget(
            //     childrenTitleList: viewModel.bakiyeDurumuTitleList,
            //     filterOnChanged: (index) => viewModel.changeBakiyeDurumu(index),
            //     childrenValueList: viewModel.bakiyeDurumuValueList,
            //     groupValue: viewModel.bakiyeDurumuGroupValue,
            //   ),
            // ),
            RaporFiltreDateTimeBottomSheetView(
              filterOnChanged: (value) {
                viewModel.pdfModel.dicParams?.bastar = baslangicController.text;
                viewModel.pdfModel.dicParams?.bittar = bitisController.text;
              },
              baslangicTarihiController: baslangicController,
              bitisTarihiController: bitisController,
            ),
            CustomTextField(
              labelText: "Belge No",
              controller: belgeNoController,
              readOnly: true,
              suffixMore: true,
              onTap: () async {
                final result = await Get.toNamed(widget.editTipiEnum.getListRoute, arguments: true);
                if (result is BaseSiparisEditModel) {
                  viewModel.pdfModel.dicParams?.belgeNo = result.belgeNo ?? "";
                  belgeNoController.text = result.belgeNo ?? "";
                }
              },
            ),
            CustomTextField(
              labelText: "Cari",
              controller: cariController,
              readOnly: true,
              suffixMore: true,
              suffix: IconButton(
                onPressed: () async {
                  if (viewModel.pdfModel.dicParams?.cariKodu == null) {
                    dialogManager.showAlertDialog("Cari Seçiniz.");
                    return;
                  }
                  dialogManager.showCariIslemleriGridViewDialog(
                    await networkManager.getCariModel(
                      CariRequestModel(kod: [viewModel.pdfModel.dicParams?.cariKodu ?? ""]),
                    ),
                  );
                },
                icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
              ),
              onTap: () async {
                final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                if (result is CariListesiModel) {
                  viewModel.pdfModel.dicParams?.cariKodu = result.cariKodu;
                  cariController.text = result.cariAdi ?? "";
                }
              },
            ),
            if (yetkiController.plasiyerUygulamasiAcikMi)
              CustomTextField(
                labelText: "Plasiyer",
                controller: plasiyerController,
                readOnly: true,
                onTap: () async {
                  final List<PlasiyerList>? plasiyerList = CacheManager.getAnaVeri?.paramModel?.plasiyerList;
                  if (plasiyerList != null) {
                    final PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                      context,
                      viewModel.pdfModel.dicParams?.plasiyerKodu,
                    );
                    if (result != null) {
                      plasiyerController.text = result.plasiyerAciklama ?? "";
                      viewModel.pdfModel.dicParams?.plasiyerKodu = result.plasiyerKodu ?? "";
                    }
                  }
                },
                suffixMore: true,
              ),

            ElevatedButton(
              onPressed: () {
                viewModel.pdfModel.raporOzelKod = "Rapor_Fatura${widget.editTipiEnum.rawValue}Kalem";
                viewModel.pdfModel.dicParams?.belgeTipi = widget.editTipiEnum.rawValue;
                viewModel.setFuture();
                Get.back();
              },
              child: Text(loc.generalStrings.apply),
            ).paddingAll(UIHelper.lowSize),
          ],
        ),
      );
      return Future.value(viewModel.futureController.value);
    }
  }
}
