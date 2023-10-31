import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/color_palette.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/card/kasa_islemleri_card.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../model/param_model.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../model/kasa_islemleri_model.dart";
import "../view_model/kasa_islemleri_view_model.dart";

class KasaIslemleriView extends StatefulWidget {
  const KasaIslemleriView({super.key});

  @override
  State<KasaIslemleriView> createState() => _KasaIslemleriViewState();
}

class _KasaIslemleriViewState extends BaseState<KasaIslemleriView> {
  KasaIslemleriViewModel viewModel = KasaIslemleriViewModel();
  late final ScrollController _scrollController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController kasaController;
  late final TextEditingController cariController;
  late final TextEditingController plasiyerController;

  @override
  void initState() {
    _scrollController = ScrollController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    kasaController = TextEditingController();
    cariController = TextEditingController();
    plasiyerController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.setIsScrollDown(false);
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.setIsScrollDown(true);
        }
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
          viewModel.setIsScrollDown(true);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    kasaController.dispose();
    cariController.dispose();
    plasiyerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
        bottomNavigationBar: bottomAppBar(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.searchBar) {
              return CustomAppBarTextField(
                onChanged: (value) => viewModel.setSearchText(value),
              );
            } else {
              return AppBarTitle(title: "Kasa İşlemleri", subtitle: "${viewModel.getKasaIslemleriListesi?.length ?? 0}");
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () => viewModel.changeSearchBar(),
            icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined)),
          ),
          IconButton(
            onPressed: filter,
            icon: Observer(builder: (_) => Icon(Icons.filter_alt_outlined, color: viewModel.getAnyFilter ? UIHelper.primaryColor : null)),
          ),
        ],
      );

  Observer fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () async {
            await dialogManager.showKasaGridViewDialog(null, onSelected: (p0) => p0 ? viewModel.resetPage() : null);
            // viewModel.resetPage();
          },
        ),
      );

  Column body() => Column(
        children: [
          RaporFiltreDateTimeBottomSheetView(
            showBugunFirst: true,
            filterOnChanged: (index) async {
              viewModel.setBaslamaTarihi(baslangicTarihiController.text);
              viewModel.setBitisTarihi(bitisTarihiController.text);
              await viewModel.resetPage();
            },
            baslangicTarihiController: baslangicTarihiController,
            bitisTarihiController: bitisTarihiController,
          ).paddingSymmetric(horizontal: UIHelper.lowSize),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async => await viewModel.resetPage(),
              child: Observer(
                builder: (_) => viewModel.getKasaIslemleriListesi == null
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : viewModel.getKasaIslemleriListesi.ext.isNullOrEmpty
                        ? const Center(child: Text("Veri bulunamadı"))
                        : ListView.builder(
                            padding: UIHelper.lowPadding,
                            primary: false,
                            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: viewModel.getKasaIslemleriListesi != null ? ((viewModel.getKasaIslemleriListesi?.length ?? 0) + (viewModel.dahaVarMi ? 1 : 0)) : 0,
                            itemBuilder: (context, index) {
                              if (index == (viewModel.getKasaIslemleriListesi?.length ?? 0)) {
                                return const Center(child: CircularProgressIndicator.adaptive());
                              } else {
                                final KasaIslemleriModel? item = viewModel.getKasaIslemleriListesi?[index];
                                return KasaIslemleriCard(
                                  kasaIslemleriModel: item,
                                  onDeleted: (deneme) {
                                    viewModel.resetPage();
                                  },
                                );
                              }
                            },
                          ),
              ),
            ),
          ),
        ],
      );

  Observer bottomAppBar() => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: viewModel.isScrollDown,
          children: [
            FooterButton(
              children: [
                const Text("Gelir"),
                Observer(
                  builder: (_) =>
                      Text("${(viewModel.paramData?["TOPLAM_GELIR"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: ColorPalette.mantis)),
                ),
              ],
              onPressed: () {
                if (viewModel.hesapTipiGroupValue == "G") {
                  viewModel.setHesapTipi(null);
                } else {
                  viewModel.setHesapTipi("G");
                }
                viewModel.resetPage();
              },
            ),
            FooterButton(
              children: [
                const Text("Gider"),
                Observer(
                  builder: (_) => Text(
                    "${(viewModel.paramData?["TOPLAM_GIDER"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    style: const TextStyle(color: ColorPalette.persianRed),
                  ),
                ),
              ],
              onPressed: () {
                if (viewModel.hesapTipiGroupValue == "C") {
                  viewModel.setHesapTipi(null);
                } else {
                  viewModel.setHesapTipi("C");
                }
                viewModel.resetPage();
              },
            ),
          ],
        ),
      );

  Future<void> filter() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Filtrele",
      body: Column(
        children: [
          Observer(
            builder: (_) => SlideControllerWidget(
              childrenTitleList: viewModel.hesapTipiMap.keys.toList(),
              filterOnChanged: (index) {
                viewModel.setHesapTipi(viewModel.hesapTipiMap.values.toList()[index ?? 0]);
              },
              childrenValueList: viewModel.hesapTipiMap.values.toList(),
              groupValue: viewModel.hesapTipiGroupValue,
            ),
          ),
          CustomTextField(
            labelText: "Kasa",
            controller: kasaController,
            readOnly: true,
            suffixMore: true,
            valueWidget: Observer(builder: (_) => Text(viewModel.kasaIslemleriRequestModel.kasaKodu ?? "")),
            onTap: () async {
              final List<KasaList>? kasaList = parametreModel.kasaList;
              final result = await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: "Kasa Seçiniz",
                children: List.generate(kasaList?.length ?? 0, (index) => BottomSheetModel(title: kasaList?[index].kasaTanimi ?? "", value: kasaList?[index])),
              );
              if (result is KasaList) {
                viewModel.setKasaKodu(result);
                kasaController.text = result.kasaTanimi ?? "";
              }
            },
          ),
          CustomTextField(
            labelText: "Cari",
            controller: cariController,
            readOnly: true,
            suffixMore: true,
            valueWidget: Observer(builder: (_) => Text(viewModel.kasaIslemleriRequestModel.hesapKodu ?? "")),
            suffix: IconButton(
              onPressed: () {
                if (viewModel.kasaIslemleriRequestModel.hesapKodu != null) {
                  dialogManager.showCariGridViewDialog(CariListesiModel(cariKodu: viewModel.kasaIslemleriRequestModel.hesapKodu));
                } else {
                  dialogManager.showInfoDialog("Cari kodu boş olduğu için bu işlem gerçekleştirilemiyor.");
                }
              },
              icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
            ),
            onTap: () async {
              final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
              if (result is CariListesiModel) {
                viewModel.setCariKodu(result);
                cariController.text = result.cariAdi ?? "";
              }
            },
          ),
          CustomTextField(
            labelText: "Plasiyer",
            controller: plasiyerController,
            readOnly: true,
            suffixMore: true,
            valueWidget: Observer(builder: (_) => Text(viewModel.kasaIslemleriRequestModel.plasiyerKodu ?? "")),
            onTap: () async {
              final List<PlasiyerList>? plasiyerList = parametreModel.plasiyerList;
              final result = await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: "Plasiyer Seçiniz",
                children: List.generate(plasiyerList?.length ?? 0, (index) => BottomSheetModel(title: plasiyerList?[index].plasiyerAciklama ?? "", value: plasiyerList?[index])),
              );
              if (result is PlasiyerList) {
                viewModel.setPlasiyerKodu(result);
                plasiyerController.text = result.plasiyerAciklama ?? "";
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                  onPressed: () {
                    viewModel.clearFilters();
                    plasiyerController.text = "";
                    cariController.text = "";
                    kasaController.text = "";
                    Get.back();
                    viewModel.resetPage();
                  },
                  child: const Text("Temizle"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    viewModel.resetPage();
                  },
                  child: const Text("Uygula"),
                ),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ],
      ).paddingAll(UIHelper.lowSize),
    );
  }
}
