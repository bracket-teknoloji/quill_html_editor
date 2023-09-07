import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../cari_listesi/model/cari_listesi_model.dart";

import "../../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../model/cari_stok_satis_ozeti_model.dart";
import "../view_model/cari_stok_satis_ozeti_view_model.dart";

class CariStokSatisOzetiView extends StatefulWidget {
  final CariListesiModel? model;
  const CariStokSatisOzetiView({super.key, this.model});

  @override
  State<CariStokSatisOzetiView> createState() => _CariStokSatisOzetiViewState();
}

class _CariStokSatisOzetiViewState extends BaseState<CariStokSatisOzetiView> {
  CariStokSatisOzetiViewModel viewModel = CariStokSatisOzetiViewModel();

  List<BaseGrupKoduModel> grupKodList = [];
  late TextEditingController cariController;
  late TextEditingController baslangicTarihiController;
  late TextEditingController bitisTarihiController;
  late TextEditingController stokGrupKoduController;
  late TextEditingController stokKodu1Controller;
  late TextEditingController stokKodu2Controller;
  late TextEditingController stokKodu3Controller;
  late TextEditingController stokKodu4Controller;
  late TextEditingController stokKodu5Controller;

  @override
  void initState() {
    cariController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    stokGrupKoduController = TextEditingController();
    stokKodu1Controller = TextEditingController();
    stokKodu2Controller = TextEditingController();
    stokKodu3Controller = TextEditingController();
    stokKodu4Controller = TextEditingController();
    stokKodu5Controller = TextEditingController();
    viewModel.setModel(widget.model);
    cariController.text = widget.model?.cariKodu ?? "";
    Future.delayed(Duration.zero, () {
      getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    cariController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    stokGrupKoduController.dispose();
    stokKodu1Controller.dispose();
    stokKodu2Controller.dispose();
    stokKodu3Controller.dispose();
    stokKodu4Controller.dispose();
    stokKodu5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return viewModel.searchBar ? const CustomAppBarTextField() : const Text("Cari Stok Satış Özeti");
        }),
        actions: [
          IconButton(onPressed: () async => viewModel.setSearchBar(), icon: const Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () async {
                viewModel.setSirala(await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Sırala", children: viewModel.bottomSheetModelList));
                getData();
              },
              icon: const Icon(Icons.sort_by_alpha_outlined)),
          IconButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(context,
                    title: "Filtrele",
                    body: Column(children: [
                      CustomWidgetWithLabel(
                          text: "İrsaliyeler Dahil", isVertical: true, child: Observer(builder: (_) => Switch.adaptive(value: viewModel.irsDahil, onChanged: (value) => viewModel.setIrsDahil(value)))),
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextField(
                                  labelText: "Stok Grup Kodu", controller: stokGrupKoduController, readOnly: true, suffixMore: true, onTap: () async => await getGrupKodu(0, stokGrupKoduController))),
                          Expanded(
                              child: CustomTextField(
                                  labelText: "Stok Kod 1", controller: stokKodu1Controller, readOnly: true, suffixMore: true, onTap: () async => await getGrupKodu(1, stokKodu1Controller))),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextField(
                                  labelText: "Stok Kod 2", controller: stokKodu2Controller, readOnly: true, suffixMore: true, onTap: () async => await getGrupKodu(2, stokKodu2Controller))),
                          Expanded(
                              child: CustomTextField(
                                  labelText: "Stok Kod 3", controller: stokKodu3Controller, readOnly: true, suffixMore: true, onTap: () async => await getGrupKodu(3, stokKodu3Controller))),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextField(
                                  labelText: "Stok Kod 4", controller: stokKodu4Controller, readOnly: true, suffixMore: true, onTap: () async => await getGrupKodu(4, stokKodu4Controller))),
                          Expanded(
                              child: CustomTextField(
                                  labelText: "Stok Kod 5", controller: stokKodu5Controller, readOnly: true, suffixMore: true, onTap: () async => await getGrupKodu(5, stokKodu5Controller))),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                      onPressed: () {
                                        viewModel.deleteAllArr();
                                        stokGrupKoduController.clear();
                                        stokKodu1Controller.clear();
                                        stokKodu2Controller.clear();
                                        stokKodu3Controller.clear();
                                        stokKodu4Controller.clear();
                                        stokKodu5Controller.clear();
                                        getData();
                                        Get.back();
                                      },
                                      child: const Text("Temizle"))
                                  .paddingOnly(right: UIHelper.lowSize)),
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    getData();
                                    Get.back();
                                  },
                                  child: const Text("Tamam"))),
                        ],
                      )
                    ]));
              },
              icon: const Icon(Icons.filter_alt_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (_) {
          return Column(
            children: [
              RaporFiltreDateTimeBottomSheetView(
                  filterOnChanged: (value) {
                    viewModel.setDonemTipiIndex(value ?? 0);
                    getData();
                  },
                  baslangicTarihiController: baslangicTarihiController,
                  bitisTarihiController: bitisTarihiController),
              CustomTextField(labelText: "Cari", valueText: widget.model?.cariKodu, isMust: true, readOnly: true, controller: cariController, suffixMore: true, onTap: () => getData()),
              viewModel.modelList != null
                  ? (viewModel.modelList!.isNotEmpty
                      ? SizedBox(
                          height: context.sized.dynamicHeight(0.8),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.modelList?.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(viewModel.modelList?[index].stokAdi ?? ""),
                                  subtitle: Text("Stok Kodu: ${viewModel.modelList?[index].stokKodu ?? ""}"),
                                  trailing: Text(viewModel.modelList?[index].miktar.toStringIfNull ?? ""),
                                  onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: [
                                    BottomSheetModel(
                                        title: "Cari Stok Satış Hareketleri",
                                        iconWidget: Icons.inventory_2_outlined,
                                        onTap: () {
                                          Get.back();
                                          return Get.toNamed("/mainPage/stokHareketleri", arguments: viewModel.modelList?[index].stokKodu);
                                        }),
                                    BottomSheetModel(title: "Stok İşlemleri", iconWidget: Icons.list_alt_outlined, onTap: () {}),
                                  ]),
                                ),
                              );
                            },
                          ),
                        )
                      : const Center(child: Text("Sonuç Bulunamadı")))
                  : const Center(child: CircularProgressIndicator()),
            ],
          );
        }),
      ),
    );
  }

  void getData() async {
    viewModel.model == null ? viewModel.setModel(await Get.toNamed("mainPage/cariListesi", arguments: true) as CariListesiModel?) : null;
    if (viewModel.model != null) {
      cariController.text = viewModel.model?.cariAdi ?? "";
      var map = {
        "CariKodu": viewModel.model?.cariKodu,
        "SIRALAMA": viewModel.sirala,
        "EkranTipi": "L",
        "FiltreKodu": 1,
        "PickerBelgeTuru": "",
        "BelgeNo": "",
        "IrsDahil": viewModel.irsDahil ? "E" : "H",
        "DonemTipi": viewModel.donemTipiList[viewModel.donemTipiIndex],
        "BaslamaTarihi": baslangicTarihiController.text,
        "BitisTarihi": bitisTarihiController.text,
        "ArrStokGrupKodu": jsonEncode(viewModel.arrStokGrupKodu.toList()),
        "ArrStokKod1": jsonEncode(viewModel.arrStokKod1.toList()),
        "ArrStokKod2": jsonEncode(viewModel.arrStokKod2.toList()),
        "ArrStokKod3": jsonEncode(viewModel.arrStokKod3.toList()),
        "ArrStokKod4": jsonEncode(viewModel.arrStokKod4.toList()),
        "ArrStokKod5": jsonEncode(viewModel.arrStokKod5.toList()),
      };
      map.removeWhere((key, value) => value == null || value == "[]");
      var result = await networkManager.dioGet<CariStokSatisOzetiModel>(path: ApiUrls.getFaturaKalemleri, bodyModel: CariStokSatisOzetiModel(), queryParameters: map);
      if (result.data != null) {
        viewModel.setModelList(result.data.map((e) => e as CariStokSatisOzetiModel).toList().cast<CariStokSatisOzetiModel>());
      }
    }
  }

  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    if (grupKodList.isEmptyOrNull) {
      dialogManager.loadingDialog();
      grupKodList = await networkManager.getGrupKod(name: "STOK", grupNo: -1);
      dialogManager.hideAlertDialog;
    }
    List<BottomSheetModel>? bottomSheetList = grupKodList
        .where((e) => e.grupNo == grupNo)
        .toList()
        .cast<BaseGrupKoduModel>()
        .map((e) => BottomSheetModel(title: e.grupAdi ?? "", description: e.grupKodu ?? "", onTap: () => Get.back(result: e)))
        .toList()
        .cast<BottomSheetModel>();
    // ignore: use_build_context_synchronously
    var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Grup Kodu", children: bottomSheetList);
    if (result != null) {
      controller?.text = result.grupKodu ?? "";
      switch (grupNo) {
        case 0:
          stokGrupKoduController.text = result.grupKodu ?? "";
          viewModel.setArrStokGrupKodu(result.grupKodu ?? "");
          break;
        case 1:
          stokKodu1Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod1(result.grupKodu ?? "");
          break;
        case 2:
          stokKodu2Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod2(result.grupKodu ?? "");
          break;
        case 3:
          stokKodu3Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod3(result.grupKodu ?? "");
          break;
        case 4:
          stokKodu4Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod4(result.grupKodu ?? "");
          break;
        case 5:
          stokKodu5Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod5(result.grupKodu ?? "");
          break;
      }
    }
    return null;
  }
}
