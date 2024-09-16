import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/grup_kodu_enums.dart";
import "../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../cari_listesi/model/cari_listesi_model.dart";
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
  late final TextEditingController cariController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController stokGrupKoduController;
  late final TextEditingController stokKodu1Controller;
  late final TextEditingController stokKodu2Controller;
  late final TextEditingController stokKodu3Controller;
  late final TextEditingController stokKodu4Controller;
  late final TextEditingController stokKodu5Controller;

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
    Future.delayed(Duration.zero, getData);
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
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: Observer(builder: (_) => viewModel.searchBar ? const CustomAppBarTextField() : const AppBarTitle(title: "Cari Stok Satış Özeti")),
          actions: [
            IconButton(onPressed: () async => viewModel.setSearchBar(), icon: const Icon(Icons.search_outlined)),
            IconButton(
              onPressed: () async {
                viewModel.setSirala(await bottomSheetDialogManager.showBottomSheetDialog(context, title: loc.generalStrings.sort, children: viewModel.bottomSheetModelList));
                getData();
              },
              icon: const Icon(Icons.sort_by_alpha_outlined),
            ),
            IconButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.filter,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomWidgetWithLabel(
                        text: "İrsaliyeler Dahil",
                        isVertical: true,
                        child: Observer(builder: (_) => Switch.adaptive(value: viewModel.irsDahil, onChanged: (value) => viewModel.setIrsDahil(value))),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              labelText: "Stok Grup Kodu",
                              controller: stokGrupKoduController,
                              readOnly: true,
                              suffixMore: true,
                              onTap: () async => await getGrupKodu(0, stokGrupKoduController),
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              labelText: "Stok Kod 1",
                              controller: stokKodu1Controller,
                              readOnly: true,
                              suffixMore: true,
                              onTap: () async => await getGrupKodu(1, stokKodu1Controller),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              labelText: "Stok Kod 2",
                              controller: stokKodu2Controller,
                              readOnly: true,
                              suffixMore: true,
                              onTap: () async => await getGrupKodu(2, stokKodu2Controller),
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              labelText: "Stok Kod 3",
                              controller: stokKodu3Controller,
                              readOnly: true,
                              suffixMore: true,
                              onTap: () async => await getGrupKodu(3, stokKodu3Controller),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              labelText: "Stok Kod 4",
                              controller: stokKodu4Controller,
                              readOnly: true,
                              suffixMore: true,
                              onTap: () async => await getGrupKodu(4, stokKodu4Controller),
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              labelText: "Stok Kod 5",
                              controller: stokKodu5Controller,
                              readOnly: true,
                              suffixMore: true,
                              onTap: () async => await getGrupKodu(5, stokKodu5Controller),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
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
                              child: const Text("Temizle"),
                            ),
                          ),
                          const SizedBox(width: UIHelper.midSize),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                getData();
                                Get.back();
                              },
                              child: const Text("Tamam"),
                            ),
                          ),
                        ],
                      ).paddingAll(UIHelper.lowSize),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.filter_alt_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Observer(
            builder: (_) => Column(
              children: [
                RaporFiltreDateTimeBottomSheetView(
                  filterOnChanged: (value) {
                    viewModel.setDonemTipiIndex(value ?? 0);
                    getData();
                  },
                  baslangicTarihiController: baslangicTarihiController,
                  bitisTarihiController: bitisTarihiController,
                ),
                CustomTextField(
                  labelText: "Cari",
                  // valueText: widget.model?.cariKodu,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model?.cariKodu ?? "")),
                  isMust: true,
                  readOnly: true,
                  controller: cariController,
                  suffixMore: true,
                  onTap: () async {
                    viewModel.model = null;
                    getData();
                  },
                ),
                if (viewModel.modelList != null)
                  viewModel.modelList!.isNotEmpty
                      ? SizedBox(
                          height: context.sized.dynamicHeight(0.8),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: viewModel.modelList?.length,
                            itemBuilder: (context, index) => Card(
                              child: ListTile(
                                title: Text(viewModel.modelList?[index].stokAdi ?? ""),
                                subtitle: CustomLayoutBuilder.divideInHalf(
                                  children: [
                                    Text("Stok Kodu: ${viewModel.modelList?[index].stokKodu ?? ""}"),
                                    Text("Döviz Kuru: ${viewModel.modelList?[index].dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}")
                                        .yetkiVarMi(viewModel.modelList?[index].dovizKuru != null && viewModel.modelList?[index].dovizKuru != 0),
                                    Text("Döviz Tipi: ${viewModel.modelList?[index].dovizAdi ?? ""}").yetkiVarMi(viewModel.modelList?[index].dovizAdi != null),
                                    Text("Döviz Net Tutarı: ${viewModel.modelList?[index].dovNetTutar.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari) ?? ""}")
                                        .yetkiVarMi(viewModel.modelList?[index].dovNetTutar != null && viewModel.modelList?[index].dovNetTutar != 0),
                                  ],
                                ),
                                trailing: Text("${viewModel.modelList?[index].miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? ""} ${viewModel.modelList?[index].olcuBirimAdi ?? ""}"),
                                onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(
                                  context,
                                  title: loc.generalStrings.options,
                                  children: [
                                    BottomSheetModel(
                                      title: "Cari Stok Satış Hareketleri",
                                      iconWidget: Icons.sync_alt_outlined,
                                      onTap: () {
                                        Get.back();
                                        return Get.toNamed("/mainPage/stokHareketleri", arguments: viewModel.modelList?[index].stokKodu);
                                      },
                                    ),
                                    BottomSheetModel(title: "Stok İşlemleri", iconWidget: Icons.list_alt_outlined, onTap: () {}),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : const Center(child: Text("Sonuç Bulunamadı"))
                else
                  const Center(child: CircularProgressIndicator.adaptive()),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );

  Future<void> getData() async {
    if (viewModel.model == null) {
      final result = await Get.toNamed("mainPage/cariListesi", arguments: true) as CariListesiModel?;
      if (result is CariListesiModel) {
        viewModel.setModel(result);
        // viewModel.setCariKodu(result.cariKodu);
      }
    }
    if (viewModel.model != null) {
      cariController.text = viewModel.model?.cariAdi ?? "";
      final map = {
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
      final result = await networkManager.dioGet<CariStokSatisOzetiModel>(path: ApiUrls.getFaturaKalemleri, bodyModel: CariStokSatisOzetiModel(), queryParameters: map);
      if (result.isSuccess) {
        viewModel.setModelList(result.dataList);
      }
    }
  }

  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    if (grupKodList.isEmptyOrNull) {
      dialogManager.showLoadingDialog("Yükleniyor...");
      grupKodList = await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: -1);
      dialogManager.hideAlertDialog;
    }
    final List<BottomSheetModel> bottomSheetList = grupKodList
        .where((e) => e.grupNo == grupNo)
        .toList()
        .cast<BaseGrupKoduModel>()
        .map((e) => BottomSheetModel(title: e.grupAdi ?? "", description: e.grupKodu ?? "", onTap: () => Get.back(result: e)))
        .toList()
        .cast<BottomSheetModel>();
    // ignore: use_build_context_synchronously
    final result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Grup Kodu", children: bottomSheetList);
    if (result != null) {
      controller?.text = result.grupKodu ?? "";
      switch (grupNo) {
        case 0:
          stokGrupKoduController.text = result.grupKodu ?? "";
          viewModel.setArrStokGrupKodu(result.grupKodu ?? "");
        case 1:
          stokKodu1Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod1(result.grupKodu ?? "");
        case 2:
          stokKodu2Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod2(result.grupKodu ?? "");
        case 3:
          stokKodu3Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod3(result.grupKodu ?? "");
        case 4:
          stokKodu4Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod4(result.grupKodu ?? "");
        case 5:
          stokKodu5Controller.text = result.grupKodu ?? "";
          viewModel.setArrStokKod5(result.grupKodu ?? "");
      }
    }
    return null;
  }
}
