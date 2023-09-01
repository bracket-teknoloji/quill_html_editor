import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/siparis_tipi_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_widget_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../view_model/stok_ihtiyac_raporu_view_model.dart";

class StokIhtiyacRaporuView extends StatefulWidget {
  final BaseSiparisEditModel? model;
  const StokIhtiyacRaporuView({super.key, this.model});

  @override
  State<StokIhtiyacRaporuView> createState() => _YaslandirmaRaporuViewState();
}

class _YaslandirmaRaporuViewState extends BaseState<StokIhtiyacRaporuView> {
  StokIhtiyacRaporuViewModel viewModel = StokIhtiyacRaporuViewModel();
  late final TextEditingController stokController;
  late final TextEditingController plasiyerController;
  late final TextEditingController siralaController;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;

  @override
  void initState() {
    stokController = TextEditingController();
    plasiyerController = TextEditingController();
    siralaController = TextEditingController();
    grupKoduController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    stokController.dispose();
    plasiyerController.dispose();
    siralaController.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Stok İhtiyaç Raporu", pdfData: viewModel.pdfModel);
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
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Stok",
                      readOnly: true,
                      suffixMore: true,
                      controller: stokController,
                      valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.stokKodu ?? "")),
                      onClear: () {
                        viewModel.setStokKodu(null);
                        stokController.clear();
                      },
                      onTap: () async {
                        var result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                        if (result is StokListesiModel) {
                          stokController.text = result.stokAdi ?? "";
                          viewModel.setStokKodu(result.stokKodu);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Plasiyer",
                      readOnly: true,
                      suffixMore: true,
                      controller: plasiyerController,
                      valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.belgeNo ?? "")),
                      onTap: () async {
                        var result = await Get.toNamed("/mainPage/siparisMusteriSiparisi", arguments: SiparislerWidgetModel(siparisTipiEnum: SiparisTipiEnum.musteri, isGetData: true));
                        if (result is BaseSiparisEditModel) {
                          plasiyerController.text = result.belgeNo ?? "";
                          viewModel.setBelgeNo(result.belgeNo);
                        }
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Sırala",
                  readOnly: true,
                  suffixMore: true,
                  controller: siralaController,
                  valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.cariKodu ?? "")),
                  suffix: IconButton(
                    onPressed: () {
                      if (viewModel.dicParams.cariKodu != null) {
                        dialogManager.showCariGridViewDialog(CariListesiModel()..cariKodu = viewModel.dicParams.cariKodu!);
                      } else {
                        dialogManager.showAlertDialog("Cari Kodu Boş Olamaz");
                      }
                    },
                    icon: Icon(Icons.data_exploration_outlined, color: UIHelper.primaryColor),
                  ),
                  onClear: () {
                    viewModel.setCariKodu(null);
                    siralaController.clear();
                  },
                  onTap: () async {
                    var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                    if (result is CariListesiModel) {
                      siralaController.text = result.cariAdi ?? "";
                      viewModel.setCariKodu(result.cariKodu);
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Grup Kodu",
                      readOnly: true,
                      suffixMore: true,
                      controller: grupKoduController,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Kod 1",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod1Controller,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Kod 2",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod2Controller,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Kod 3",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod3Controller,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Kod 4",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod4Controller,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Kod 5",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod5Controller,
                    ),
                  ),
                ],
              ),
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

  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Grup Kodu", children: []);
    if (result != null) {
      controller?.text = result.grupKodu ?? "";
      switch (grupNo) {
        case 0:
          viewModel.pdfModel.dicParams?.grupKodu = result.grupKodu ?? "";
          break;
        case 1:
          viewModel.pdfModel.dicParams?.kod1 = result.grupKodu ?? "";
          break;
        case 2:
          viewModel.pdfModel.dicParams?.kod2 = result.grupKodu ?? "";
          break;
        case 3:
          viewModel.pdfModel.dicParams?.kod3 = result.grupKodu ?? "";
          break;
        case 4:
          viewModel.pdfModel.dicParams?.kod4 = result.grupKodu ?? "";
          break;
        case 5:
          viewModel.pdfModel.dicParams?.kod5 = result.grupKodu ?? "";
          break;
      }
    }
    return null;
  }

  void filterOnChanged(index) {}
}
