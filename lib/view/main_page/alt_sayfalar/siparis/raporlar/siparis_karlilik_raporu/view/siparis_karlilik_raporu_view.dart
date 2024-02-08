import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../model/param_model.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../view_model/siparis_karlilik_raporu_view_model.dart";

class SiparisKarlilikRaporuView extends StatefulWidget {
  final BaseSiparisEditModel? model;
  const SiparisKarlilikRaporuView({super.key, this.model});

  @override
  State<SiparisKarlilikRaporuView> createState() => _YaslandirmaRaporuViewState();
}

class _YaslandirmaRaporuViewState extends BaseState<SiparisKarlilikRaporuView> {
  late final SiparisKarlilikRaporuViewModel viewModel;
  late final TextEditingController belgeNoController;
  late final TextEditingController cariController;
  late final TextEditingController vergiNoController;
  late final TextEditingController plasiyerController;
  late final TextEditingController maliyetTipiController;
  late final TextEditingController haricStokGrupKodlariController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  //create a form key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel = SiparisKarlilikRaporuViewModel();
    viewModel.setBelgeNo(widget.model?.belgeNo);
    belgeNoController = TextEditingController(text: widget.model?.belgeNo ?? "");
    viewModel.setCariKodu(widget.model?.cariKodu);
    cariController = TextEditingController(text: widget.model?.cariAdi ?? "");
    vergiNoController = TextEditingController();
    plasiyerController = TextEditingController();
    maliyetTipiController = TextEditingController();
    haricStokGrupKodlariController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    cariController.dispose();
    vergiNoController.dispose();
    plasiyerController.dispose();
    maliyetTipiController.dispose();
    haricStokGrupKodlariController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PDFViewerView(
        filterBottomSheet: filterBottomSheet,
        title: "Sipariş Karlılık Raporu",
        pdfData: viewModel.pdfModel,
      );

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc(context).generalStrings.filter,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaporFiltreDateTimeBottomSheetView(
              filterOnChanged: (value) {
                viewModel.setBaslangicTarihi(
                  baslangicTarihiController.text != "" ? baslangicTarihiController.text : null,
                );
                viewModel.setBitisTarihi(
                  bitisTarihiController.text != "" ? bitisTarihiController.text : null,
                );
              },
              baslangicTarihiController: baslangicTarihiController,
              bitisTarihiController: bitisTarihiController,
            ),
            CustomTextField(
              labelText: "Belge No",
              readOnly: true,
              suffixMore: true,
              controller: belgeNoController,
              onClear: () {
                viewModel.setBelgeNo(null);
                belgeNoController.clear();
              },
              onTap: () async {
                final result = await Get.toNamed(
                  "/mainPage/siparisMusteriSiparisi",
                  arguments: true,
                );
                if (result is BaseSiparisEditModel) {
                  belgeNoController.text = result.belgeNo ?? "";
                  viewModel.setBelgeNo(result.belgeNo);
                  if (result.cariKodu != null) {
                    viewModel.setCariKodu(result.cariKodu);
                    cariController.text = result.cariAdi ?? "";
                  }
                }
              },
            ),
            CustomTextField(
              labelText: "Cari",
              readOnly: true,
              suffixMore: true,
              controller: cariController,
              suffix: IconButton(
                onPressed: () {
                  if (viewModel.pdfModel.dicParams?.cariKodu != null) {
                    dialogManager.showCariGridViewDialog(
                      CariListesiModel()..cariKodu = viewModel.pdfModel.dicParams?.cariKodu!,
                    );
                  } else {
                    dialogManager.showAlertDialog("Cari Kodu Boş Olamaz");
                  }
                },
                icon: Icon(
                  Icons.data_exploration_outlined,
                  color: theme.colorScheme.inversePrimary,
                ),
              ),
              onClear: () {
                viewModel.setCariKodu(null);
                cariController.clear();
              },
              onTap: () async {
                final result = await Get.toNamed(
                  "/mainPage/cariListesi",
                  arguments: true,
                );
                if (result is CariListesiModel) {
                  cariController.text = result.cariAdi ?? "";
                  viewModel.setCariKodu(result.cariKodu);
                }
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Plasiyer",
                    readOnly: true,
                    suffixMore: true,
                    controller: plasiyerController,
                    onClear: () {
                      viewModel.setPlasiyer(null);
                      plasiyerController.clear();
                    },
                    onTap: () async {
                      final PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.pdfModel.dicParams?.plasiyerKodu);
                      if (result != null) {
                        plasiyerController.text = result.plasiyerAciklama ?? "";
                        viewModel.setPlasiyer(result.plasiyerKodu);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Maliyet Tipi",
                    readOnly: true,
                    suffixMore: true,
                    isMust: true,
                    controller: maliyetTipiController,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        title: "Maliyet Tipi",
                        children: List.generate(
                          viewModel.maliyetTipiList.length,
                          (index) => BottomSheetModel(
                            title: viewModel.maliyetTipiList.keys.toList()[index],
                            value: viewModel.maliyetTipiList.values.toList()[index],
                          ),
                        ),
                      );
                      if (result != null) {
                        maliyetTipiController.text = result ?? "";
                        viewModel.setMaliyetTipi(result ?? "");
                      }
                    },
                  ),
                ),
              ],
            ),
            CustomTextField(
              labelText: "Hariç Stok Grup Kodları",
              suffix: IconButton(
                onPressed: () => dialogManager.showInfoDialog(
                  "Kodları noktalı virgül (;) ile ayırarak, aralaında boşluk bırakmadan yazınız.\n\nÖrnek: 01;02;02",
                ),
                icon: Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.inversePrimary,
                ),
              ),
              controller: haricStokGrupKodlariController,
            ),
            CustomWidgetWithLabel(
              text: "Üretim Fiyatı Dahil",
              isVertical: true,
              child: Observer(
                builder: (_) => Switch.adaptive(
                  value: viewModel.uretimFiyatiDahilMi,
                  onChanged: (value) => viewModel.setUretimFiyatiDahilMi(value ? "E" : "H"),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  viewModel.setFuture();
                  Get.back();
                }
              },
              child: Text(loc(context).generalStrings.apply),
            ).paddingAll(UIHelper.lowSize),
          ],
        ),
      ),
    );
    return Future.value(viewModel.futureController.value);
  }
}
