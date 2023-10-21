import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/enum/siparis_tipi_enum.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../siparisler/model/siparisler_widget_model.dart";
import "../view_model/siparis_teslim_raporu_view_model.dart";

class SiparisTeslimRaporuView extends StatefulWidget {
  final SiparisTipiEnum siparisTipiEnum;
  final BaseSiparisEditModel? baseSiparisEditModel;
  const SiparisTeslimRaporuView(
      {super.key, required this.siparisTipiEnum, this.baseSiparisEditModel});

  @override
  State<SiparisTeslimRaporuView> createState() => _YaslandirmaRaporuViewState();
}

class _YaslandirmaRaporuViewState extends BaseState<SiparisTeslimRaporuView> {
  SiparisTipiEnum get siparisTipiEnum => widget.siparisTipiEnum;
  late final SiparisTeslimRaporuViewModel viewModel;
  late final TextEditingController belgeNoController;
  late final TextEditingController cariController;
  late final TextEditingController vergiNoController;
  late final TextEditingController stokController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  @override
  void initState() {
    viewModel = SiparisTeslimRaporuViewModel(siparisTipiEnum);
    viewModel.setBelgeNo(widget.baseSiparisEditModel?.belgeNo);
    viewModel.setCariKodu(widget.baseSiparisEditModel?.cariKodu);
    belgeNoController =
        TextEditingController(text: widget.baseSiparisEditModel?.belgeNo ?? "");
    cariController =
        TextEditingController(text: widget.baseSiparisEditModel?.cariAdi ?? "");
    vergiNoController = TextEditingController();
    stokController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    cariController.dispose();
    vergiNoController.dispose();
    stokController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerView(
        filterBottomSheet: filterBottomSheet,
        title:
            "${widget.siparisTipiEnum == SiparisTipiEnum.musteri ? "Müş. Sip." : "Sat. Sip."} Teslim Raporu",
        pdfData: viewModel.pdfModel);
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
                    viewModel.setBaslangicTarihi(
                        baslangicTarihiController.text != ""
                            ? baslangicTarihiController.text
                            : null);
                    viewModel.setBitisTarihi(bitisTarihiController.text != ""
                        ? bitisTarihiController.text
                        : null);
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
                  final result = await Get.toNamed(
                      "/mainPage/siparisMusteriSiparisi",
                      arguments: SiparislerWidgetModel(
                          siparisTipiEnum: SiparisTipiEnum.musteri,
                          isGetData: true));
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
                      dialogManager.showCariGridViewDialog(CariListesiModel()
                        ..cariKodu = viewModel.pdfModel.dicParams?.cariKodu!);
                    } else {
                      dialogManager.showAlertDialog("Cari Kodu Boş Olamaz");
                    }
                  },
                  icon: Icon(Icons.data_exploration_outlined,
                      color: UIHelper.primaryColor),
                ),
                onClear: () {
                  viewModel.setCariKodu(null);
                  cariController.clear();
                },
                onTap: () async {
                  final result = await Get.toNamed("/mainPage/cariListesi",
                      arguments: true);
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
                      labelText: "Vergi No",
                      readOnly: true,
                      suffixMore: true,
                      controller: vergiNoController,
                      onClear: () {
                        viewModel.setVergiNo(null);
                        vergiNoController.clear();
                      },
                      onTap: () async {
                        final result = await Get.toNamed("/mainPage/cariListesi",
                            arguments: true);
                        if (result is CariListesiModel) {
                          vergiNoController.text = result.vergiNumarasi ?? "";
                          viewModel.setVergiNo(result.vergiNumarasi);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Stok",
                      readOnly: true,
                      suffixMore: true,
                      controller: stokController,
                      onClear: () {
                        viewModel.setStokKodu(null);
                        stokController.clear();
                      },
                      onTap: () async {
                        final result = await Get.toNamed("/mainPage/stokListesi",
                            arguments: true);
                        if (result is StokListesiModel) {
                          stokController.text = result.stokAdi ?? "";
                          viewModel.setStokKodu(result.stokKodu);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomWidgetWithLabel(
                          text: "Kapalılar Hariç",
                          isVertical: true,
                          child: Observer(
                              builder: (_) => Switch.adaptive(
                                  value: viewModel.kapaliMi,
                                  onChanged: (value) => viewModel
                                      .setKapali(value ? "E" : "H"))))),
                  Expanded(
                      child: CustomWidgetWithLabel(
                          text: "Sadece Kalanlar",
                          isVertical: true,
                          child: Observer(
                              builder: (_) => Switch.adaptive(
                                  value: viewModel.durum,
                                  onChanged: (value) => viewModel
                                      .setDurum(value ? "K" : null))))),
                ],
              ),
              ElevatedButton(
                      onPressed: () {
                        viewModel.setFuture();
                        Get.back();
                      },
                      child: const Text("Uygula"))
                  .paddingAll(UIHelper.lowSize)
            ],
          ),
        ));
    return Future.value(viewModel.futureController.value);
  }
}
