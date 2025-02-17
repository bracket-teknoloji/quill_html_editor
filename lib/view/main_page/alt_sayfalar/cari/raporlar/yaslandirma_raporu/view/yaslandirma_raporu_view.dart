import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/enum/grup_kodu_enums.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../model/param_model.dart";
import "../../../cari_listesi/model/cari_listesi_model.dart";
import "../view_model/yaslandirma_raporu_view_model.dart";

final class YaslandirmaRaporuView extends StatefulWidget {
  const YaslandirmaRaporuView({super.key, this.model});
  final CariListesiModel? model;

  @override
  State<YaslandirmaRaporuView> createState() => _YaslandirmaRaporuViewState();
}

final class _YaslandirmaRaporuViewState extends BaseState<YaslandirmaRaporuView> {
  YaslandirmaRaporuViewModel viewModel = YaslandirmaRaporuViewModel();
  List<BaseGrupKoduModel> grupKodList = [];
  late final TextEditingController cariController;
  late final TextEditingController referansTarihController;
  late final TextEditingController plasiyerController;
  late final TextEditingController tarihTipiController;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;

  @override
  void initState() {
    cariController = TextEditingController();
    referansTarihController = TextEditingController();
    plasiyerController = TextEditingController();
    tarihTipiController = TextEditingController();
    grupKoduController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    if (widget.model != null) {
      cariController.text = widget.model?.cariAdi ?? "";
      viewModel.pdfModel.dicParams?.cariKodu = widget.model?.cariKodu ?? "";
    }
    super.initState();
  }

  @override
  void dispose() {
    cariController.dispose();
    referansTarihController.dispose();
    plasiyerController.dispose();
    tarihTipiController.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Yaşlandırma Raporu", pdfData: viewModel.pdfModel);

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Observer(
            builder:
                (_) => SlideControllerWidget(
                  childrenTitleList: viewModel.sureAraligiList,
                  filterOnChanged: (index) => viewModel.changeSureAraligi(index),
                  childrenValueList: viewModel.sureAraligivalue,
                  groupValue: viewModel.sureAraligiGroupValue,
                ),
          ),
          Observer(
            builder:
                (_) => SlideControllerWidget(
                  childrenTitleList: viewModel.odemeTipiList,
                  filterOnChanged: (index) => viewModel.changeOdemeTipi(index),
                  childrenValueList: viewModel.odemeTipiValue,
                  groupValue: viewModel.odemeTipiGroupValue,
                ),
          ),
          CustomTextField(
            labelText: "Cari",
            controller: cariController,
            readOnly: true,
            suffixMore: true,
            onTap: () async {
              final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
              if (result != null) {
                cariController.text = result.cariAdi ?? "";
                viewModel.pdfModel.dicParams?.cariKodu = result.cariKodu ?? "";
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Referans Tarih",
                  isMust: true,
                  readOnly: true,
                  controller: referansTarihController,
                  isDateTime: true,
                  // suffix: const Icon(Icons.calendar_today_outlined),
                  onTap: () async {
                    final DateTime? result = await dialogManager.showDateTimePicker(
                      initialDate: viewModel.pdfModel.dicParams?.refTarih?.toDateTimeDDMMYYYY(),
                    );
                    if (result != null) {
                      referansTarihController.text = result.toDateString;
                      viewModel.pdfModel.dicParams?.refTarih = result.toDateString;
                    }
                  },
                ),
              ),
              if (yetkiController.plasiyerUygulamasiAcikMi)
                Expanded(
                  child: CustomTextField(
                    labelText: "Plasiyer",
                    readOnly: true,
                    controller: plasiyerController,
                    onTap: () async {
                      final List<PlasiyerList>? plasiyerList = CacheManager.getAnaVeri?.paramModel?.plasiyerList;
                      if (plasiyerList != null) {
                        final PlasiyerList? result = await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Plasiyer",
                          children:
                              plasiyerList
                                  .map((e) => BottomSheetModel(title: e.plasiyerAciklama ?? "", value: e))
                                  .toList(),
                        );
                        if (result != null) {
                          plasiyerController.text = result.plasiyerAciklama ?? "";
                          viewModel.pdfModel.dicParams?.plasiyerKodu = result.plasiyerKodu ?? "";
                        }
                      }
                    },
                    suffixMore: true,
                  ),
                ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Tarih Tipi",
                  isMust: true,
                  readOnly: true,
                  controller: tarihTipiController,
                  suffixMore: true,
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Tarih Tipi",
                      children: [
                        BottomSheetModel(title: "Vade Tarihi", value: "Vade Tarihi"),
                        BottomSheetModel(title: "Kayıt Tarihi", value: "Kayıt Tarihi"),
                      ],
                    );
                    if (result != null) {
                      tarihTipiController.text = result;
                      viewModel.pdfModel.dicParams?.tarihTipi = result.split("")[0];
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
                  labelText: "Grup Kodu",
                  controller: grupKoduController,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async => await getGrupKodu(0, grupKoduController),
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 1",
                  controller: kod1Controller,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async => await getGrupKodu(1, kod1Controller),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 2",
                  controller: kod2Controller,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async => await getGrupKodu(2, kod2Controller),
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 3",
                  controller: kod3Controller,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async => await getGrupKodu(3, kod3Controller),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 4",
                  controller: kod4Controller,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async => await getGrupKodu(4, kod4Controller),
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Kod 5",
                  controller: kod5Controller,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async => await getGrupKodu(5, kod5Controller),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (viewModel.pdfModel.dicParams?.refTarih == null || viewModel.pdfModel.dicParams?.tarihTipi == null) {
                dialogManager.showAlertDialog("Lütfen tüm alanları doldurunuz");
              } else {
                viewModel.setFuture();
                Get.back();
              }
            },
            child: Text(loc.generalStrings.apply),
          ).paddingAll(UIHelper.lowSize),
        ],
      ),
    );
    return Future.value(viewModel.futureController.value);
  }

  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    if (grupKodList.isEmptyOrNull) {
      grupKodList = await networkManager.getGrupKod(name: GrupKoduEnum.cari, grupNo: -1);
    }
    final List<BottomSheetModel<BaseGrupKoduModel>> bottomSheetList =
        grupKodList
            .where((e) => e.grupNo == grupNo)
            .map((e) => BottomSheetModel(title: e.grupKodu ?? "", value: e))
            .toList();
    // ignore: use_build_context_synchronously
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Grup Kodu",
      children: bottomSheetList,
    );
    if (result != null) {
      controller?.text = result.grupKodu ?? "";
      switch (grupNo) {
        case 0:
          viewModel.pdfModel.dicParams?.grupKodu = result.grupKodu ?? "";
        case 1:
          viewModel.pdfModel.dicParams?.kod1 = result.grupKodu ?? "";
        case 2:
          viewModel.pdfModel.dicParams?.kod2 = result.grupKodu ?? "";
        case 3:
          viewModel.pdfModel.dicParams?.kod3 = result.grupKodu ?? "";
        case 4:
          viewModel.pdfModel.dicParams?.kod4 = result.grupKodu ?? "";
        case 5:
          viewModel.pdfModel.dicParams?.kod5 = result.grupKodu ?? "";
      }
    }
    return null;
  }

  void filterOnChanged(int? index) {}
}
