import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/siparis_tipi_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_widget_model.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../model/param_model.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../view_model/siparis_karlilik_raporu_view_model.dart";

class SiparisKarlilikRaporuView extends StatefulWidget {
  const SiparisKarlilikRaporuView({super.key});

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
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  @override
  void initState() {
    viewModel = SiparisKarlilikRaporuViewModel();
    belgeNoController = TextEditingController();
    cariController = TextEditingController();
    vergiNoController = TextEditingController();
    plasiyerController = TextEditingController();
    maliyetTipiController = TextEditingController();
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
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Sipariş Karlılık Raporu", pdfData: viewModel.pdfModel);
  }

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(context,
        title: "Filtrele",
        body: Padding(
          padding: EdgeInsets.all(UIHelper.lowSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RaporFiltreDateTimeBottomSheetView(
                  filterOnChanged: (value) {
                    viewModel.setBaslangicTarihi(baslangicTarihiController.text != "" ? baslangicTarihiController.text : null);
                    viewModel.setBitisTarihi(bitisTarihiController.text != "" ? bitisTarihiController.text : null);
                  },
                  baslangicTarihiController: baslangicTarihiController,
                  bitisTarihiController: bitisTarihiController),
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
                  var result = await Get.toNamed("/mainPage/siparisMusteriSiparisi", arguments: SiparislerWidgetModel(siparisTipiEnum: SiparisTipiEnum.musteri, isGetData: true));
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
                      dialogManager.showCariGridViewDialog(CariListesiModel()..cariKodu = viewModel.pdfModel.dicParams?.cariKodu!);
                    } else {
                      dialogManager.showAlertDialog("Cari Kodu Boş Olamaz");
                    }
                  },
                  icon: Icon(Icons.data_exploration_outlined, color: UIHelper.primaryColor),
                ),
                onClear: () {
                  viewModel.setCariKodu(null);
                  cariController.clear();
                },
                onTap: () async {
                  var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                  if (result is CariListesiModel) {
                    cariController.text = result.cariAdi ?? "";
                    viewModel.setCariKodu(result.cariKodu);
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    labelText: "Plasiyer",
                    readOnly: true,
                    suffixMore: true,
                    controller: plasiyerController,
                    onTap: () async {
                      PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
                      if (result != null) {
                        plasiyerController.text = result.plasiyerAciklama ?? "";
                        viewModel.pdfModel.dicParams?.plasiyerKodu = result.plasiyerKodu ?? "";
                      }
                    },
                  )),
                  Expanded(
                      child: CustomTextField(
                    labelText: "Maliyet Tipi",
                    readOnly: true,
                    suffixMore: true,
                    isMust: true,
                    controller: maliyetTipiController,
                    onTap: () {},
                  )),
                ],
              ),
              CustomTextField(
                labelText: "Hariç Stok Grup Kodları",
                onTap: () {},
              ),
              CustomWidgetWithLabel(
                  text: "Üretim Fiyatı Dahil",
                  isVertical: true,
                  child: Observer(builder: (_) => Switch.adaptive(value: viewModel.uretimFiyatiDahilMi, onChanged: (value) => viewModel.setUretimFiyatiDahilMi(value ? "K" : null)))),
              ElevatedButton(
                  onPressed: () {
                    viewModel.setFuture();
                    Get.back();
                  },
                  child: const Text("Uygula"))
            ],
          ),
        ));
    return Future.value(viewModel.futureController.value);
  }
}
