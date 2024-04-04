import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/card/siparisler_card.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../base_siparis_edit/model/base_siparis_edit_model.dart";
import "../model/siparis_edit_request_model.dart";
import "../model/siparisler_widget_model.dart";
import "../view_model/siparisler_view_model.dart";

class SiparislerView extends StatefulWidget {
  final SiparislerWidgetModel widgetModel;
  const SiparislerView({super.key, required this.widgetModel});

  @override
  State<SiparislerView> createState() => _SiparislerViewState();
}

class _SiparislerViewState extends BaseState<SiparislerView> {
  late final ScrollController scrollController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController cariController;
  late final TextEditingController cariTipiController;
  late final TextEditingController plasiyerController;
  late final TextEditingController projeController;
  late final TextEditingController ozelKod1Controller;
  late final TextEditingController ozelKod2Controller;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  late SiparislerViewModel viewModel;
  List<BaseSiparisEditModel?>? get musteriSiparisleriList => viewModel.musteriSiparisleriList;

  @override
  void initState() {
    viewModel = SiparislerViewModel(pickerBelgeTuru: widget.widgetModel.editTipiEnum.rawValue);
    // BaseSiparisEdit
    BaseSiparisEditModel.instance.belgeTuru = widget.widgetModel.editTipiEnum.rawValue;
    scrollController = ScrollController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    cariController = TextEditingController();
    cariTipiController = TextEditingController();
    plasiyerController = TextEditingController();
    projeController = TextEditingController();
    ozelKod1Controller = TextEditingController();
    ozelKod2Controller = TextEditingController();
    grupKoduController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getData();
    });
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
        await Future.delayed(const Duration(milliseconds: 500), getData);
        viewModel.changeIsScrolledDown(true);
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeIsScrolledDown(true);
      } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeIsScrolledDown(false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    cariController.dispose();
    cariTipiController.dispose();
    plasiyerController.dispose();
    projeController.dispose();
    ozelKod1Controller.dispose();
    ozelKod2Controller.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: appBar(context),
        floatingActionButton: fab(),
        body: body(),
        bottomNavigationBar: bottomNavigationBar(),
      );

  AppBar appBar(BuildContext context) => AppBar(
        //*Title
        title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(
                  onFieldSubmitted: (value) {
                    viewModel.setSearchText(value);
                    viewModel.setSiparislerList(null);
                    viewModel.setDahaVarMi(true);
                    viewModel.resetSayfa();
                    getData();
                  },
                )
              : AppBarTitle(title: "${widget.widgetModel.editTipiEnum.musteriMi ? "Müşteri" : "Satıcı"} Siparişleri", subtitle: viewModel.musteriSiparisleriList?.length.toString()),
        ),
        //*Actions
        actions: [
          IconButton(
            onPressed: () {
              viewModel.changeSearchBar();
              getData();
            },
            icon: Observer(builder: (_) => viewModel.searchBar ? const Icon(Icons.search_off_outlined) : const Icon(Icons.search_outlined)),
          ),
        ],
        //*Bottom
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              iconWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(
                    builder: (_) => Icon(
                      Icons.filter_alt_outlined,
                      color: viewModel.hasFilter ? theme.colorScheme.inversePrimary : null,
                      size: UIHelper.midSize * 2,
                    ),
                  ),
                  Text(loc.generalStrings.filter),
                ],
              ),
              onPressed: () async => await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: loc.generalStrings.filter,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RaporFiltreDateTimeBottomSheetView(
                      filterOnChanged: (index) {
                        viewModel.setBaslamaTarihi(baslangicTarihiController.text);
                        viewModel.setBitisTarihi(bitisTarihiController.text);
                      },
                      baslangicTarihiController: baslangicTarihiController,
                      bitisTarihiController: bitisTarihiController,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Cari",
                            controller: cariController,
                            suffixMore: true,
                            readOnly: true,
                            onClear: () {
                              viewModel.setCariKodu(null);
                              cariController.clear();
                            },
                            onTap: () async {
                              final result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                              if (result != null) {
                                cariController.text = result.cariAdi;
                                viewModel.setCariKodu(result.cariKodu);
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Cari Tipi",
                            controller: cariTipiController,
                            suffixMore: true,
                            readOnly: true,
                            onClear: () {
                              viewModel.setCariTipi(null);
                              cariTipiController.clear();
                            },
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCariTipiBottomSheetDialog(context, viewModel.cariTipi);
                              if (result != null) {
                                cariTipiController.text = result.title ?? "";
                                //😳 Bunu düzenle
                                viewModel.setCariTipi(result.value);
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
                            labelText: "Plasiyer",
                            controller: plasiyerController,
                            suffixMore: true,
                            readOnly: true,
                            onClear: () => viewModel.setArrPlasiyerKodu(null),
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showPlasiyerListesiBottomSheetDialog(
                                context,
                                groupValues: ((jsonDecode(viewModel.musteriSiparisleriRequestModel.arrPlasiyerKodu ?? "[]")) as List).map((e) => e as String).toList().cast<String>(),
                              );
                              if (result.ext.isNotNullOrEmpty) {
                                plasiyerController.text = result!.map((e) => e?.plasiyerAciklama).join(", ");

                                viewModel.setArrPlasiyerKodu(result.map((e) => e?.plasiyerKodu.toString()).toList().cast<String>());
                              }
                            },
                          ),
                        ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Proje",
                            controller: projeController,
                            suffixMore: true,
                            readOnly: true,
                            onClear: () => viewModel.setProjeKodu(null),
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.projeKodu);
                              if (result != null) {
                                projeController.text = result.projeAciklama ?? "";
                                viewModel.setProjeKodu(result.projeKodu);
                              }
                            },
                          ),
                        ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Özel Kod 1",
                            controller: ozelKod1Controller,
                            onChanged: (value) => viewModel.setOzelKod1(value),
                            suffix: IconButton(
                              onPressed: () async {
                                final result = await bottomSheetDialogManager.showOzelKod1BottomSheetDialog(context, viewModel.ozelKod1);
                                if (result != null) {
                                  ozelKod1Controller.text = result.aciklama ?? "";
                                  viewModel.setOzelKod1(result.kod);
                                }
                              },
                              icon: const Icon(Icons.more_horiz_outlined),
                            ),
                          ),
                        ).yetkiVarMi(yetkiController.satisOzelKod1AktifMi),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Özel Kod 2",
                            controller: ozelKod2Controller,
                            onChanged: (value) => viewModel.setOzelKod2(value),
                            suffix: IconButton(
                              onPressed: () async {
                                final result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(context, viewModel.ozelKod2);
                                if (result != null) {
                                  ozelKod2Controller.text = result.aciklama ?? "";
                                  viewModel.setOzelKod2(result.kod);
                                }
                              },
                              icon: const Icon(Icons.more_horiz_outlined),
                            ),
                          ),
                        ).yetkiVarMi(yetkiController.satisOzelKod2AktifMi),
                      ],
                    ),
                    CustomWidgetWithLabel(
                      isVertical: true,
                      text: "Kapalı Belgeler Listelenmesin",
                      child: Observer(builder: (_) => Switch.adaptive(value: viewModel.kapaliBelgelerListelenmesin, onChanged: (value) => viewModel.setKapaliBelgelerListelenmesin(value))),
                    ),
                    Observer(
                      builder: (_) => SlideControllerWidget(
                        scroll: false,
                        title: "Teslimat Durumu",
                        childrenTitleList: viewModel.teslimatDurumu,
                        filterOnChanged: (x) => viewModel.setTeslimatDurumuGroupValue(x),
                        childrenValueList: viewModel.teslimatDurumuValueList,
                        groupValue: viewModel.teslimatDurumuGroupValue,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (viewModel.grupKodList.ext.isNullOrEmpty) {
                          viewModel.changeGrupKodList(await networkManager.getGrupKod(name: "CARI", grupNo: -1));
                        }
                        viewModel.changeGrupKodlariGoster();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Cari Rapor Kodları"),
                          Observer(builder: (_) => Icon(viewModel.grupKodlariGoster ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined)),
                        ],
                      ).paddingAll(UIHelper.lowSize),
                    ),
                    // viewModel.musteriSiparisleriList.firstOrNull?.o
                    Observer(
                      builder: (_) => AnimatedContainer(
                        height: viewModel.grupKodlariGoster ? null : 0,
                        duration: const Duration(seconds: 1),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    labelText: "Grup Kodu",
                                    controller: grupKoduController,
                                    readOnly: true,
                                    suffixMore: true,
                                    onTap: () => getGrupKodu(0, grupKoduController),
                                  ),
                                ).yetkiVarMi(viewModel.grupKodList0),
                                Expanded(
                                  child: CustomTextField(
                                    labelText: "Kod 1",
                                    controller: kod1Controller,
                                    readOnly: true,
                                    suffixMore: true,
                                    onClear: () {
                                      viewModel.setArrKod1(null);
                                      kod1Controller.clear();
                                    },
                                    onTap: () => getGrupKodu(1, kod1Controller),
                                  ),
                                ).yetkiVarMi(viewModel.grupKodList1),
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
                                    onClear: () {
                                      viewModel.setArrKod2(null);
                                      kod2Controller.clear();
                                    },
                                    onTap: () => getGrupKodu(2, kod2Controller),
                                  ),
                                ).yetkiVarMi(viewModel.grupKodList2),
                                Expanded(
                                  child: CustomTextField(
                                    labelText: "Kod 3",
                                    controller: kod3Controller,
                                    readOnly: true,
                                    suffixMore: true,
                                    onClear: () {
                                      viewModel.setArrKod3(null);
                                      kod3Controller.clear();
                                    },
                                    onTap: () => getGrupKodu(3, kod3Controller),
                                  ),
                                ).yetkiVarMi(viewModel.grupKodList3),
                              ],
                            ),
                            Observer(
                              builder: (_) => Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      labelText: "kod 4",
                                      controller: kod4Controller,
                                      readOnly: true,
                                      suffixMore: true,
                                      onClear: () {
                                        viewModel.setArrKod4(null);
                                        kod4Controller.clear();
                                      },
                                      onTap: () => getGrupKodu(4, kod4Controller),
                                    ),
                                  ).yetkiVarMi(viewModel.grupKodList4),
                                  Expanded(
                                    child: CustomTextField(
                                      labelText: "kod 5",
                                      controller: kod5Controller,
                                      readOnly: true,
                                      suffixMore: true,
                                      onClear: () {
                                        viewModel.setArrKod5(null);
                                        kod5Controller.clear();
                                      },
                                      onTap: () => getGrupKodu(5, kod5Controller),
                                    ),
                                  ).yetkiVarMi(viewModel.grupKodList5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              viewModel.resetFilter();
                              clearTextEditingControllers();
                              getData();
                              Get.back();
                            },
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                            child: const Text("Temizle"),
                          ),
                        ),
                        SizedBox(width: context.sized.dynamicWidth(0.02)),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              viewModel.setSiparislerList(null);
                              viewModel.setDahaVarMi(true);
                              viewModel.resetSayfa();
                              getData();
                              Get.back();
                            },
                            child: const Text("Kaydet"),
                          ),
                        ),
                      ],
                    ).paddingAll(UIHelper.lowSize),
                  ],
                ),
              ),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Sıralama",
                  groupValue: viewModel.siralama,
                  children: List.generate(
                    viewModel.siralaMap.length,
                    (index) => BottomSheetModel(
                      title: viewModel.siralaMap.keys.toList()[index],
                      value: viewModel.siralaMap.values.toList()[index],
                      groupValue: viewModel.siralaMap.values.toList()[index],
                    ),
                  ),
                );
                if (result != null) {
                  viewModel.setSiralama(result);
                  viewModel.resetSayfa();
                  viewModel.setSiparislerList(null);
                  viewModel.setDahaVarMi(true);
                  getData();
                }
              },
              child: Text(loc.generalStrings.sort),
            ),
            AppBarButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.options,
                  children: [
                    BottomSheetModel(
                      title: "Görünecek Ekstra Alanlar",
                      iconWidget: Icons.add_circle_outline_outlined,
                      onTap: () async {
                        Get.back();
                        await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Görünecek Ekstra Alanlar",
                          body: Column(
                            children: [
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Ek Açıklamalar"),
                                  value: viewModel.ekstraAlanlarMap["EK"] ?? false,
                                  onChanged: (value) => viewModel.changeEkstraAlanlarMap("EK", value),
                                ),
                              ),
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Miktar"),
                                  value: viewModel.ekstraAlanlarMap["MİK"] ?? false,
                                  onChanged: (value) {
                                    viewModel.changeEkstraAlanlarMap("MİK", value);
                                  },
                                ),
                              ),
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Vade"),
                                  value: viewModel.ekstraAlanlarMap["VADE"] ?? false,
                                  onChanged: (value) => viewModel.changeEkstraAlanlarMap("VADE", value),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
              child: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
      );

  Observer fab() => Observer(
        builder: (_) => Visibility(
          visible: viewModel.musteriSiparisleriList != null && yetkiController.siparisKaydet,
          child: CustomFloatingActionButton(
            isScrolledDown: viewModel.isScrolledDown,
            onPressed: () async {
              await Get.toNamed(
                "mainPage/siparisEdit",
                arguments: BaseEditModel(model: SiparisEditRequestModel(), baseEditEnum: BaseEditEnum.ekle, editTipiEnum: widget.widgetModel.editTipiEnum),
              );
              viewModel.setSiparislerList(null);
              viewModel.setDahaVarMi(true);
              viewModel.resetSayfa();
              getData();
            },
          ),
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setSiparislerList(null);
          viewModel.setDahaVarMi(true);
          viewModel.resetSayfa();
          getData();
        },
        child: Observer(
          builder: (_) => musteriSiparisleriList.ext.isNullOrEmpty
              ? (viewModel.musteriSiparisleriList?.isEmpty ?? false)
                  ? const Center(child: Text("Stok Bulunamadı"))
                  : const ListViewShimmer()
              : Observer(
                  builder: (_) => ListView.builder(
                    primary: false,
                    padding: UIHelper.lowPadding,
                    controller: scrollController,
                    itemCount: musteriSiparisleriList?.length != null ? musteriSiparisleriList!.length + 1 : 0,
                    itemBuilder: (context, index) {
                      if (index == viewModel.musteriSiparisleriList?.length) {
                        return Visibility(
                          visible: viewModel.dahaVarMi,
                          child: const Center(child: CircularProgressIndicator.adaptive()),
                        );
                      }
                      return Observer(
                        builder: (_) => SiparislerCard(
                          isGetData: widget.widgetModel.isGetData,
                          showEkAciklama: viewModel.ekstraAlanlarMap["EK"] ?? false,
                          showMiktar: viewModel.ekstraAlanlarMap["MİK"] ?? false,
                          showVade: viewModel.ekstraAlanlarMap["VADE"] ?? false,
                          model: viewModel.musteriSiparisleriList?[index] ?? BaseSiparisEditModel(),
                          index: index,
                          editTipiEnum: widget.widgetModel.editTipiEnum,
                          onDeleted: () => viewModel.removeSiparislerList(index),
                          onUpdated: (value) {
                            if (value) {
                              viewModel.setSiparislerList(null);
                              viewModel.setDahaVarMi(true);
                              viewModel.resetSayfa();
                              getData();
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
        ),
      );

  Observer bottomNavigationBar() => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: viewModel.isScrolledDown,
          visible: viewModel.paramData?.isNotEmpty == true,
          children: [
            FooterButton(
              children: [
                const Text("KDV Hariç"),
                Observer(builder: (_) => Text("${(viewModel.paramData?["ARA_TOPLAM"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
              ],
            ),
            FooterButton(
              children: [
                const Text("KDV"),
                Observer(builder: (_) => Text("${(viewModel.paramData?["KDV"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
              ],
            ),
            FooterButton(
              children: [
                const Text("KDV Dahil"),
                Observer(builder: (_) => Text("${(viewModel.paramData?["GENEL_TOPLAM"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
              ],
            ),
          ],
        ),
      );

  Future<void> getData() async {
    viewModel.setDahaVarMi(false);
    final result = await networkManager.dioGet<BaseSiparisEditModel>(path: ApiUrls.getFaturalar, bodyModel: BaseSiparisEditModel(), queryParameters: viewModel.musteriSiparisleriRequestModel.toJson());
    if (result.data != null) {
      if (viewModel.sayfa == 1) {
        viewModel.setSiparislerList(CacheManager.getSiparisEditLists(widget.widgetModel.editTipiEnum)?.toList().cast<BaseSiparisEditModel?>());
        viewModel.setParamData(result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).cast<String, dynamic>() ?? {});
      }
      final List<BaseSiparisEditModel?>? list = result.data.map((e) => e as BaseSiparisEditModel?).toList().cast<BaseSiparisEditModel?>();
      if ((list?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
        viewModel.setDahaVarMi(false);
      } else {
        viewModel.setDahaVarMi(true);
        viewModel.increaseSayfa();
      }
      if (viewModel.musteriSiparisleriList.ext.isNullOrEmpty) {
        viewModel.setSiparislerList(list);
      } else {
        viewModel.addSiparislerList(list);
      }
    }
  }

  Future<String?> getGrupKodu(int grupNo, TextEditingController? controller) async {
    final List<BottomSheetModel> bottomSheetList = viewModel.grupKodList
        .where((e) => e.grupNo == grupNo)
        .toList()
        .cast<BaseGrupKoduModel>()
        .map((e) => BottomSheetModel(title: e.grupKodu ?? "", groupValue: e.grupKodu))
        .toList()
        .cast<BottomSheetModel>();
    // ignore: use_build_context_synchronously
    final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
      context,
      title: "Grup Kodu $grupNo",
      groupValues: grupKodList(grupNo),
      children: bottomSheetList,
    );
    if (result != null) {
      controller?.text = result.join(", ");
      switch (grupNo) {
        case 0:
          viewModel.setArrGrupKodu(result.map((e) => e.toString()).toList().cast<String>() ?? "");
        case 1:
          viewModel.setArrKod1(result.map((e) => e.toString()).toList().cast<String>() ?? "");
        case 2:
          viewModel.setArrKod2(result.map((e) => e.toString()).toList().cast<String>() ?? "");
        case 3:
          viewModel.setArrKod3(result.map((e) => e.toString()).toList().cast<String>() ?? "");
        case 4:
          viewModel.setArrKod4(result.map((e) => e.toString()).toList().cast<String>() ?? "");
        case 5:
          viewModel.setArrKod5(result.map((e) => e.toString()).toList().cast<String>() ?? "");
      }
    }
    return null;
  }

  List grupKodList(int index) {
    switch (index) {
      case 0:
        return jsonDecode(viewModel.musteriSiparisleriRequestModel.arrGrupKodu ?? "[]").toList();
      case 1:
        return jsonDecode(viewModel.musteriSiparisleriRequestModel.arrKod1 ?? "[]").toList();
      case 2:
        return jsonDecode(viewModel.musteriSiparisleriRequestModel.arrKod2 ?? "[]").toList();
      case 3:
        return jsonDecode(viewModel.musteriSiparisleriRequestModel.arrKod3 ?? "[]").toList();
      case 4:
        return jsonDecode(viewModel.musteriSiparisleriRequestModel.arrKod4 ?? "[]").toList();
      case 5:
        return jsonDecode(viewModel.musteriSiparisleriRequestModel.arrKod5 ?? "[]").toList();
      default:
        return [];
    }
  }

  void clearTextEditingControllers() {
    baslangicTarihiController.clear();
    bitisTarihiController.clear();
    cariController.clear();
    cariTipiController.clear();
    plasiyerController.clear();
    projeController.clear();
    ozelKod1Controller.clear();
    ozelKod2Controller.clear();
    grupKoduController.clear();
    kod1Controller.clear();
    kod2Controller.clear();
    kod3Controller.clear();
    kod4Controller.clear();
    kod5Controller.clear();
  }
}
