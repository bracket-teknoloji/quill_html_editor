import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../core/components/card/stok_fiyat_gecmisi_card.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/param_model.dart";
import "../model/fiyat_gecmisi_model.dart";
import "../model/fiyat_gecmisi_response_model.dart";
import "../view_model/fiyat_gecmisi_view_model.dart";

class FiyatGecmisiView extends StatefulWidget {
  const FiyatGecmisiView({super.key});

  @override
  State<FiyatGecmisiView> createState() => _FiyatGecmisiViewState();
}

class _FiyatGecmisiViewState extends BaseState<FiyatGecmisiView> {
  FiyatGecmisiViewModel viewModel = FiyatGecmisiViewModel();
  late final TextEditingController searchBarController;
  late final TextEditingController dizaynController;
  late final TextEditingController yaziciController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController fiyatTipiController;

  @override
  void initState() {
    searchBarController = TextEditingController();
    dizaynController = TextEditingController();
    yaziciController = TextEditingController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    fiyatTipiController = TextEditingController();
    getData();
    super.initState();
  }

  @override
  void dispose() {
    searchBarController.dispose();
    dizaynController.dispose();
    yaziciController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    fiyatTipiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(context),
        body: body(context),
      );

  AppBar appBar(BuildContext context) => AppBar(
        title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(
                  controller: searchBarController,
                  onChanged: (p0) => viewModel.filterModelList(p0),
                )
              : AppBarTitle(
                  title: "Fiyat Geçmişi",
                  subtitle: "${viewModel.modelList?.length ?? 0} kayıt",
                ),
        ),
        actions: [
          IconButton(
            icon: Observer(
              builder: (_) => Icon(
                viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined,
              ),
            ),
            onPressed: () => viewModel.setSearchBar(),
          ),
          Observer(
            builder: (_) => viewModel.searchBar
                ? const SizedBox()
                : IconButton(
                    icon: const Icon(Icons.sort_by_alpha_outlined),
                    onPressed: () async {
                      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                        context,
                        title: loc.generalStrings.sort,
                        groupValue: viewModel.model.sirala,
                        children: List.generate(
                          viewModel.siralaTitleList.length,
                          (index) => BottomSheetModel(
                            title: viewModel.siralaTitleList[index].title,
                            value: viewModel.siralaTitleList[index].value,
                            groupValue: viewModel.siralaTitleList[index].value,
                          ),
                        ),
                      );
                      if (result != null) {
                        viewModel.model.sirala = result;
                        getData();
                      }
                    },
                  ),
          ),
          Observer(
            builder: (_) => viewModel.searchBar
                ? const SizedBox()
                : IconButton(
                    icon: const Icon(Icons.filter_alt_outlined),
                    onPressed: () async {
                      await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        title: loc.generalStrings.filter,
                        body: Column(
                          children: [
                            RaporFiltreDateTimeBottomSheetView(
                              filterOnChanged: (index) => log(""),
                              baslangicTarihiController: baslangicTarihiController,
                              bitisTarihiController: bitisTarihiController,
                            ),
                            Observer(
                              builder: (_) => SlideControllerWidget(
                                title: "Yazdırma Durumu",
                                childrenTitleList: viewModel.yazdirmaDurumuMap.keys.toList(),
                                childrenValueList: viewModel.yazdirmaDurumuMap.values.toList(),
                                filterOnChanged: (index) => viewModel.setYazdirmaGroupValue(index ?? 0),
                                groupValue: viewModel.yazdirmaGroupValue,
                              ),
                            ),
                            Observer(
                              builder: (_) => SlideControllerWidget(
                                title: "Alış/Satış Fiyat Tipi",
                                childrenTitleList: viewModel.alisSatisDurumuMap.keys.toList(),
                                childrenValueList: viewModel.alisSatisDurumuMap.values.toList(),
                                filterOnChanged: (index) => viewModel.setAlisSatisGroupValue(index ?? 0),
                                groupValue: viewModel.alisSatisGroupValue,
                              ),
                            ),
                            CustomTextField(
                              labelText: "Fiyat Tipi",
                              readOnly: true,
                              controller: fiyatTipiController,
                              suffixMore: true,
                              onClear: () => viewModel.model.fiyatTipi = "",
                              onTap: () async {
                                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                                  context,
                                  title: "Fiyat Tipi",
                                  groupValue: viewModel.model.fiyatTipi,
                                  children: List.generate(
                                    viewModel.fiyatTipiMap.length,
                                    (index) => BottomSheetModel(
                                      title: viewModel.fiyatTipiMap.keys.toList()[index],
                                      value: viewModel.fiyatTipiMap.values.toList()[index],
                                      groupValue: viewModel.fiyatTipiMap.values.toList()[index],
                                    ),
                                  ),
                                );
                                if (result != null) {
                                  viewModel.model.fiyatTipi = result;
                                  fiyatTipiController.text = viewModel.fiyatTipiMap.keys.toList()[viewModel.fiyatTipiMap.values.toList().indexOf(result)];
                                }
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                        theme.colorScheme.onSurface.withOpacity(0.1),
                                      ),
                                    ),
                                    onPressed: () {
                                      viewModel.model = FiyatGecmisiModel();
                                      baslangicTarihiController.clear();
                                      bitisTarihiController.clear();
                                      fiyatTipiController.clear();
                                      viewModel.yazdirmaGroupValue = "";
                                      viewModel.alisSatisGroupValue = "";
                                      viewModel.model.sirala = "";
                                      viewModel.model.fiyatTipi = "";
                                      getData();
                                      Get.back();
                                    },
                                    child: const Text("Temizle"),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      viewModel.model.baslamaTarihi = baslangicTarihiController.text;
                                      viewModel.model.bitisTarihi = bitisTarihiController.text;
                                      getData();
                                      Get.back();
                                    },
                                    child: Text(loc.generalStrings.apply),
                                  ),
                                ),
                              ],
                            ).paddingAll(UIHelper.lowSize),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      );

  RefreshIndicator body(BuildContext context) => RefreshIndicator.adaptive(
        onRefresh: () async => getData(),
        child: Observer(
          builder: (_) => viewModel.modelList.ext.isNullOrEmpty
              ? (viewModel.modelList?.isEmpty ?? false)
                  ? const Center(child: Text("Kayıt Bulunamadı"))
                  : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
              : Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Dizayn",
                            controller: dizaynController,
                            readOnly: true,
                            suffixMore: true,
                            onClear: () => viewModel.setDizaynId(null),
                            onTap: () async {
                              final List<NetFectDizaynList>? dizaynList = parametreModel.netFectDizaynList
                                  ?.where(
                                    (element) =>
                                        element.ozelKod == "StokEtiket" &&
                                        (profilYetkiModel.yazdirmaDizaynStokEtiketi?.any(
                                              (element2) => element.id == element2,
                                            ) ??
                                            true),
                                  )
                                  .toList();
                              final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                                context,
                                title: "Dizayn",
                                groupValue: viewModel.printModel.dizaynId,
                                children: List.generate(
                                  dizaynList?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: dizaynList?[index].dizaynAdi ?? "",
                                    value: dizaynList?[index],
                                    groupValue: dizaynList?[index].id,
                                  ),
                                ),
                              );
                              if (result != null) {
                                dizaynController.text = result.dizaynAdi ?? "";
                                viewModel.setDizaynId(result.id);
                              } else {
                                return;
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Yazıcı",
                            controller: yaziciController,
                            suffixMore: true,
                            readOnly: true,
                            onClear: () => viewModel.setYaziciAdi(null),
                            onTap: () async {
                              final List<YaziciList>? yaziciList = parametreModel.yaziciList
                                  ?.where(
                                    (element) =>
                                        profilYetkiModel.yazdirmaStokEtiketiYazicilari?.any(
                                          (element2) => element2 == element.yaziciAdi,
                                        ) ??
                                        true,
                                  )
                                  .toList();
                              final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                                context,
                                title: "Yazıcı",
                                groupValue: viewModel.printModel.yaziciAdi,
                                children: List.generate(
                                  yaziciList?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: yaziciList?[index].yaziciAdi ?? "",
                                    value: yaziciList?[index],
                                    groupValue: yaziciList?[index].yaziciAdi,
                                  ),
                                ),
                              );
                              if (result != null) {
                                yaziciController.text = result.yaziciAdi ?? "";
                                viewModel.setYaziciAdi(result);
                              } else {
                                return;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Observer(
                        builder: (_) => ListView.builder(
                          itemCount: viewModel.filteredModelList?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final FiyatGecmisiResponseModel? model = viewModel.filteredModelList?[index];
                            return StokFiyatGecmisiCard(
                              model: model,
                              onPrint: () async {
                                if (dizaynController.text.ext.isNullOrEmpty) {
                                  dialogManager.showErrorSnackBar(
                                    "Lütfen Dizayn Seçiniz",
                                  );
                                  return;
                                }
                                if (yaziciController.text.ext.isNullOrEmpty) {
                                  dialogManager.showErrorSnackBar(
                                    "Lütfen Yazıcı Seçiniz",
                                  );
                                  return;
                                }
                                final DicParams dicParams = DicParams(
                                  stokKodu: model?.stokKodu,
                                  fiyatTipi: model?.fiyatTipi,
                                  tblnfStokfiyatgecmisiId: model?.id.toStringIfNotNull,
                                );
                                viewModel.setDicParams(dicParams);
                                final result = await bottomSheetDialogManager.showPrintBottomSheetDialog(
                                  context,
                                  viewModel.printModel,
                                  null,
                                  null,
                                );
                                if (result != null) {
                                  getData();
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<void> getData() async {
    viewModel.setModelList(null);
    final result = await networkManager.dioPost<FiyatGecmisiResponseModel>(
      path: ApiUrls.getStokFiyatGecmisi,
      bodyModel: FiyatGecmisiResponseModel(),
      data: viewModel.model.toJson(),
    );
    if (result.isSuccess) {
      viewModel.setModelList(
        result.dataList,
      );
    }
  }

  Future<void> deleteData(int id, int islemKodu) async {
    final result = await networkManager.dioPost<FiyatGecmisiResponseModel>(
      path: ApiUrls.savestokFiyatGecmisi,
      bodyModel: FiyatGecmisiResponseModel(),
      data: {"ID": id, "ISLEM_KODU": islemKodu},
    );
    if (result.isSuccess) {
      dialogManager.showSuccessSnackBar("Silindi");
      getData();
    }
  }
}
