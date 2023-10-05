import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/card/banka_islemleri_card.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_islemleri/model/banka_islemleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_islemleri/view_model/banka_islemleri_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

class BankaIslemleriView extends StatefulWidget {
  const BankaIslemleriView({super.key});

  @override
  State<BankaIslemleriView> createState() => _BankaIslemleriViewState();
}

class _BankaIslemleriViewState extends BaseState<BankaIslemleriView> {
  BankaIslemleriViewModel viewModel = BankaIslemleriViewModel();
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: appBar(),
      floatingActionButton: fab(),
      body: body(),
      bottomNavigationBar: bottomAppBar(),
    );
  }

  AppBar appBar() => AppBar(
        title: Observer(builder: (_) {
          if (viewModel.searchBar) {
            return CustomAppBarTextField(
              onChanged: (value) => viewModel.setSearchText(value),
            );
          } else {
            return AppBarTitle(title: "Banka İşlemleri", subtitle: "${viewModel.getBankaIslemleriListesi?.length ?? 0}");
          }
        }),
        actions: [
          IconButton(
            onPressed: () => viewModel.changeSearchBar(),
            icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined)),
          ),
          IconButton(
            onPressed: filter,
            icon: const Icon(Icons.filter_alt_outlined),
          )
        ],
      );

  Observer fab() => Observer(builder: (_) {
        return CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () {},
        );
      });

  Column body() => Column(
        children: [
          RaporFiltreDateTimeBottomSheetView(
                  filterOnChanged: (index) async {
                    viewModel.setBaslamaTarihi(baslangicTarihiController.text);
                    viewModel.setBitisTarihi(bitisTarihiController.text);
                    await viewModel.resetPage();
                  },
                  baslangicTarihiController: baslangicTarihiController,
                  bitisTarihiController: bitisTarihiController)
              .paddingSymmetric(horizontal: UIHelper.lowSize),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async => await viewModel.resetPage(),
              child: Observer(builder: (_) {
                return viewModel.getBankaIslemleriListesi == null
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : viewModel.getBankaIslemleriListesi.ext.isNullOrEmpty
                        ? const Center(child: Text("Veri bulunamadı"))
                        : ListView.builder(
                            padding: UIHelper.lowPadding,
                            primary: false,
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: viewModel.getBankaIslemleriListesi != null ? ((viewModel.getBankaIslemleriListesi?.length ?? 0) + (viewModel.dahaVarMi ? 1 : 0)) : 0,
                            itemBuilder: (context, index) {
                              if (index == (viewModel.getBankaIslemleriListesi?.length ?? 0)) {
                                return const Center(child: CircularProgressIndicator.adaptive());
                              } else {
                                BankaIslemleriModel? item = viewModel.getBankaIslemleriListesi?[index];
                                return BankaIslemleriCard(
                                    bankaIslemleriModel: item,
                                    onDeleted: (deneme) {
                                      viewModel.resetPage();
                                    });
                              }
                            },
                          );
              }),
            ),
          ),
        ],
      );

  Observer bottomAppBar() {
    return Observer(builder: (_) {
      return BottomBarWidget(isScrolledDown: viewModel.isScrollDown, children: [
        FooterButton(children: [
          const Text("Gelir"),
          Observer(
              builder: (_) =>
                  Text("${(viewModel.paramData?["TOPLAM_GELIR"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: Colors.green)))
        ]),
        FooterButton(children: [
          const Text("Gider"),
          Observer(
              builder: (_) => Text("${(viewModel.paramData?["TOPLAM_GIDER"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: Colors.red)))
        ]),
      ]);
    });
  }

  Future<void> filter() async {
    await bottomSheetDialogManager.showBottomSheetDialog(context,
        title: "Filtrele",
        body: Column(
          children: [
            Observer(builder: (_) {
              return SlideControllerWidget(
                  childrenTitleList: viewModel.hesapTipiMap.keys.toList(),
                  filterOnChanged: (index) {
                    viewModel.setHesapTipi(viewModel.hesapTipiMap.values.toList()[index ?? 0]);
                  },
                  childrenValueList: viewModel.hesapTipiMap.values.toList(),
                  groupValue: viewModel.hesapTipiGroupValue);
            }),
            CustomTextField(
              labelText: "Kasa",
              controller: kasaController,
              readOnly: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.bankaIslemleriRequestModel.kasaKodu ?? "")),
              onTap: () async {
                List<KasaList>? kasaList = parametreModel.kasaList;
                var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                    title: "Kasa Seçiniz", children: List.generate(kasaList?.length ?? 0, (index) => BottomSheetModel(title: kasaList?[index].kasaTanimi ?? "", value: kasaList?[index])));
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
              valueWidget: Observer(builder: (_) => Text(viewModel.bankaIslemleriRequestModel.hesapKodu ?? "")),
              suffix: IconButton(
                  onPressed: () {
                    if (viewModel.bankaIslemleriRequestModel.hesapKodu != null) {
                      dialogManager.showCariGridViewDialog(CariListesiModel(cariKodu: viewModel.bankaIslemleriRequestModel.hesapKodu));
                    } else {
                      dialogManager.showInfoDialog("Cari kodu boş olduğu için bu işlem gerçekleştirilemiyor.");
                    }
                  },
                  icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor)),
              onTap: () async {
                var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
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
              valueWidget: Observer(builder: (_) => Text(viewModel.bankaIslemleriRequestModel.plasiyerKodu ?? "")),
              onTap: () async {
                List<PlasiyerList>? plasiyerList = parametreModel.plasiyerList;
                var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                    title: "Plasiyer Seçiniz",
                    children: List.generate(plasiyerList?.length ?? 0, (index) => BottomSheetModel(title: plasiyerList?[index].plasiyerAciklama ?? "", value: plasiyerList?[index])));
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
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
                        onPressed: () {
                          viewModel.clearFilters();
                          Get.back();
                          viewModel.resetPage();
                        },
                        child: const Text("Temizle"))),
                const SizedBox(width: 10),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          viewModel.resetPage();
                        },
                        child: const Text("Uygula")))
              ],
            ).paddingAll(UIHelper.lowSize)
          ],
        ).paddingAll(UIHelper.lowSize));
  }
}
