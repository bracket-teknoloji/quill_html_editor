import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/mal_kabul_sevkiyat/raporlar/fatura_karlilik_raporu/view_model/fatura_karlilik_raporu_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../model/param_model.dart";

final class FaturaKarlilikRaporuView extends StatefulWidget {
  const FaturaKarlilikRaporuView({super.key});

  @override
  State<FaturaKarlilikRaporuView> createState() => _FaturaKarlilikRaporuViewState();
}

final class _FaturaKarlilikRaporuViewState extends BaseState<FaturaKarlilikRaporuView> {
  final FaturaKarlilikRaporuViewModel viewModel = FaturaKarlilikRaporuViewModel();
  late final TextEditingController belgeNoController;
  late final TextEditingController cariController;
  late final TextEditingController plasiyerController;
  late final TextEditingController maliyetTipiController;
  late final TextEditingController baslangicController;
  late final TextEditingController bitisController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.pdfModel.dicParams?.maliyetTipi = CacheManager.getProfilParametre.faturaKarlilikMaliyetTipi;
    belgeNoController = TextEditingController();
    cariController = TextEditingController();
    plasiyerController = TextEditingController();
    maliyetTipiController = TextEditingController(
      text: viewModel.maliyetTipiList
          .firstWhereOrNull((element) => element.value?.value == viewModel.pdfModel.dicParams?.maliyetTipi)
          ?.title,
    );
    baslangicController = TextEditingController();
    bitisController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    cariController.dispose();
    plasiyerController.dispose();
    maliyetTipiController.dispose();
    baslangicController.dispose();
    bitisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Fatura Karlılık Raporu", pdfData: viewModel.pdfModel);

  Future<bool> filterBottomSheet() async {
    {
      viewModel.resetFuture();
      await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: loc.generalStrings.filter,
        body: Form(
          key: formKey,
          child: Column(
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
                onClear: () => viewModel.pdfModel.dicParams?.belgeNo = "",
                onTap: () async {
                  final result = await Get.toNamed("/mainPage/sevkiyatSatisFaturasiOzel", arguments: true);
                  if (result is BaseSiparisEditModel) {
                    viewModel.pdfModel.dicParams?.belgeNo = result.belgeNo ?? "";
                    belgeNoController.text = result.belgeNo ?? "";
                  }
                },
              ),
              if (yetkiController.cariListesi)
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
                  onClear: () => viewModel.pdfModel.dicParams?.cariKodu = null,
                  onTap: () async {
                    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                    if (result is CariListesiModel) {
                      viewModel.pdfModel.dicParams?.cariKodu = result.cariKodu;
                      cariController.text = result.cariAdi ?? "";
                    }
                  },
                ),
              CustomLayoutBuilder.divideInHalf(
                children: [
                  if (yetkiController.plasiyerUygulamasiAcikMi)
                    CustomTextField(
                      labelText: "Plasiyer",
                      controller: plasiyerController,
                      readOnly: true,
                      onClear: () => viewModel.pdfModel.dicParams?.plasiyerKodu = null,
                      onTap: () async {
                        final List<PlasiyerList>? plasiyerList = CacheManager.getAnaVeri?.paramModel?.plasiyerList;
                        if (plasiyerList != null) {
                          final PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                            context,
                            viewModel.pdfModel.dicParams?.plasiyerKodu,
                          );
                          if (result != null) {
                            plasiyerController.text = result.plasiyerAlani ?? "";
                            viewModel.pdfModel.dicParams?.plasiyerKodu = result.plasiyerKodu ?? "";
                          }
                        }
                      },
                      suffixMore: true,
                    ),
                  CustomTextField(
                    labelText: "Maliyet Tipi",
                    controller: maliyetTipiController,
                    readOnly: true,
                    isMust: true,
                    suffixMore: true,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                        context,
                        title: "Maliyet Tipi",
                        groupValue: viewModel.pdfModel.dicParams?.maliyetTipi,
                        children: viewModel.maliyetTipiList,
                      );
                      if (result != null) {
                        maliyetTipiController.text = result.title;
                        viewModel.pdfModel.dicParams?.maliyetTipi = result.value;
                        CacheManager.setProfilParametre(
                          CacheManager.getProfilParametre.copyWith(faturaKarlilikMaliyetTipi: result.value),
                        );
                      }
                    },
                  ),
                ],
              ),
              CustomLayoutBuilder.divideInHalf(
                children: [
                  Card(
                    child: Observer(
                      builder: (_) => SwitchListTile.adaptive(
                        value: viewModel.pdfModel.dicParams?.irsDahil == "E",
                        onChanged: viewModel.setIrsaliyeDahil,
                        title: const Text("İrsaliye Hariç"),
                      ),
                    ),
                  ),
                  Card(
                    child: Observer(
                      builder: (_) => SwitchListTile.adaptive(
                        value: viewModel.pdfModel.dicParams?.uretimFiyatiDahil == "E",
                        onChanged: viewModel.setUretimFiyatiDahil,
                        title: const Text("Üretim Fiyatı Dahil"),
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Hariç Stok Grup Kodları",
                onChanged: (value) => viewModel.pdfModel.dicParams?.haricStokGrupKodlari = value,
                suffix: IconButton(
                  onPressed: () async => dialogManager.showInfoDialog(
                    "Kodları noktalı virgül (;) ile ayırarak, aralaında boşluk bırakmadan yazınız.\n\nÖrnek: 01;02;02",
                  ),
                  icon: const Icon(Icons.info_outline),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  viewModel.setFuture();
                  Get.back();
                },
                child: Text(loc.generalStrings.apply),
              ).paddingAll(UIHelper.lowSize),
            ],
          ),
        ),
      );
      return Future.value(viewModel.futureController.value);
    }
  }
}
