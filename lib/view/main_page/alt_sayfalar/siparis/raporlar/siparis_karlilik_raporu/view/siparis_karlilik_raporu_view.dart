import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";

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

final class SiparisKarlilikRaporuView extends StatefulWidget {
  const SiparisKarlilikRaporuView({super.key, this.model});
  final BaseSiparisEditModel? model;

  @override
  State<SiparisKarlilikRaporuView> createState() => _YaslandirmaRaporuViewState();
}

final class _YaslandirmaRaporuViewState extends BaseState<SiparisKarlilikRaporuView> {
  late final SiparisKarlilikRaporuViewModel viewModel;
  late final TextEditingController belgeNoController;
  late final TextEditingController cariController;
  late final TextEditingController teslimCariController;
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
    if (widget.model?.belgeNo case final belgeNo?) viewModel.setBelgeNo(belgeNo);
    belgeNoController = TextEditingController(text: widget.model?.belgeNo ?? "");
    viewModel.setCariKodu(widget.model?.cariKodu);
    cariController = TextEditingController(text: widget.model?.cariAdi ?? "");
    teslimCariController = TextEditingController();
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
    teslimCariController.dispose();
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
      title: loc.generalStrings.filter,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaporFiltreDateTimeBottomSheetView(
              filterOnChanged: (value) {
                viewModel
                  ..setBaslangicTarihi(baslangicTarihiController.text != "" ? baslangicTarihiController.text : null)
                  ..setBitisTarihi(bitisTarihiController.text != "" ? bitisTarihiController.text : null);
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
                viewModel.setBelgeNo("");
                belgeNoController.clear();
              },
              onTap: () async {
                final result = await Get.toNamed("/mainPage/siparisMusteriSiparisi", arguments: true);
                if (result is BaseSiparisEditModel) {
                  belgeNoController.text = result.belgeNo ?? "";
                  if (result.belgeNo case final belgeNo?) viewModel.setBelgeNo(belgeNo);
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
                      CariListesiModel()..cariKodu = viewModel.pdfModel.dicParams?.cariKodu,
                    );
                  } else {
                    dialogManager.showAlertDialog("Cari Kodu Boş Olamaz");
                  }
                },
                icon: const Icon(Icons.data_exploration_outlined, color: UIHelper.primaryColor),
              ),
              onClear: () {
                viewModel.setCariKodu(null);
                cariController.clear();
              },
              onTap: () async {
                final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                if (result is CariListesiModel) {
                  cariController.text = result.cariAdi ?? "";
                  viewModel.setCariKodu(result.cariKodu);
                }
              },
            ),
            CustomTextField(
              labelText: "Teslim Cari",
              readOnly: true,
              suffixMore: true,
              controller: teslimCariController,
              onClear: () => viewModel.setTeslimCariKodu(null),
              onTap: () async {
                final result = await Get.toNamed(
                  "/mainPage/cariListesiOzel",
                  arguments: CariRequestModel(
                    bagliCariKodu: viewModel.pdfModel.dicParams?.teslimCariKodu,
                    teslimCari: "E",
                    menuKodu: "CARI_CARI",
                  ),
                );
                if (result is CariListesiModel) {
                  teslimCariController.text = result.cariAdi ?? "";
                  viewModel.setTeslimCariKodu(result.cariKodu ?? "");
                }
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (yetkiController.plasiyerUygulamasiAcikMi)
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
                        final PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                          context,
                          viewModel.pdfModel.dicParams?.plasiyerKodu,
                        );
                        if (result != null) {
                          plasiyerController.text = result.plasiyerAlani ?? "";
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
                        maliyetTipiController.text = result;
                        viewModel.setMaliyetTipi(result);
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
                icon: const Icon(Icons.info_outline, color: UIHelper.primaryColor),
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
              child: Text(loc.generalStrings.apply),
            ).paddingAll(UIHelper.lowSize),
          ],
        ),
      ),
    );
    return Future.value(viewModel.futureController.value);
  }
}
