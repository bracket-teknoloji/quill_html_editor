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
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../view_model/musteri_siparisi_durum_raporu_view_model.dart";

class MusteriSiparisiDurumRaporuView extends StatefulWidget {
  final BaseSiparisEditModel? model;
  const MusteriSiparisiDurumRaporuView({super.key, this.model});

  @override
  State<MusteriSiparisiDurumRaporuView> createState() => _YaslandirmaRaporuViewState();
}

class _YaslandirmaRaporuViewState extends BaseState<MusteriSiparisiDurumRaporuView> {
  MusteriSiparisiDurumRaporuViewModel viewModel = MusteriSiparisiDurumRaporuViewModel();
  late final TextEditingController belgeNoController;
  late final TextEditingController stokController;
  late final TextEditingController cariController;
  late final TextEditingController gorunecekAlanlarController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  @override
  void initState() {
    belgeNoController = TextEditingController();
    stokController = TextEditingController();
    cariController = TextEditingController();
    gorunecekAlanlarController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    stokController.dispose();
    cariController.dispose();
    gorunecekAlanlarController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Müşteri Sipariş Durum Raporu", pdfData: viewModel.pdfModel);
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
                filterOnChanged: (int? index) {
                  viewModel.pdfModel.dicParams?.bastar = baslangicTarihiController.text;
                  viewModel.pdfModel.dicParams?.bittar = bitisTarihiController.text;
                },
                baslangicTarihiController: baslangicTarihiController,
                bitisTarihiController: bitisTarihiController,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Belge No",
                      readOnly: true,
                      suffixMore: true,
                      controller: belgeNoController,
                      valueWidget: Observer(builder: (_) => Text(viewModel.pdfModel.dicParams?.belgeNo ?? "")),
                      onTap: () async {
                        var result = await Get.toNamed("/mainPage/siparisMusteriSiparisi", arguments: SiparislerWidgetModel(siparisTipiEnum: SiparisTipiEnum.musteri, isGetData: true));
                        if (result is BaseSiparisEditModel) {
                          belgeNoController.text = result.belgeNo ?? "";
                          viewModel.setBelgeNo(result.belgeNo);
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
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Cari",
                      readOnly: true,
                      suffixMore: true,
                      controller: cariController,
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
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Görünecek Alanlar",
                      readOnly: true,
                      suffixMore: true,
                      controller: gorunecekAlanlarController,
                    ),
                  ),
                ],
              ),
              SlideControllerWidget(
                title: "Karşılanma Durumu",
                groupValue: null,
                childrenTitleList: const ["Tümü", "Kalanlar", "Tamamlananlar"],
                childrenValueList: const [1, 2, 3],
                filterOnChanged: (int? index) {},
              ),
              SlideControllerWidget(
                title: "Sipariş Durumu",
                groupValue: null,
                childrenTitleList: const ["Tümü", "Açık", "Kapalı"],
                childrenValueList: const [1, 2, 3],
                filterOnChanged: (int? index) {},
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
