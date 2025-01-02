import "dart:convert";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/card/banka_islemleri_card.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../banka_hareketleri/model/banka_hareketleri_model.dart";
import "../../banka_listesi/model/banka_listesi_model.dart";
import "../../banka_listesi/model/banka_listesi_request_model.dart";
import "../view_model/banka_islemleri_view_model.dart";

class BankaIslemleriView extends StatefulWidget {
  const BankaIslemleriView({super.key});

  @override
  State<BankaIslemleriView> createState() => _BankaIslemleriViewState();
}

class _BankaIslemleriViewState extends BaseState<BankaIslemleriView> {
  BankaIslemleriViewModel viewModel = BankaIslemleriViewModel();
  late final ScrollController _scrollController;
  late final TextEditingController hesapController;
  late final TextEditingController hesapTipiController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;

  @override
  void initState() {
    _scrollController = ScrollController();
    hesapController = TextEditingController();
    hesapTipiController = TextEditingController();
    baslangicTarihiController = TextEditingController(text: DateTime.now().toDateString);
    bitisTarihiController = TextEditingController(text: DateTime.now().toDateString);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      viewModel
        ..setBaslamaTarihi(baslangicTarihiController.text)
        ..setBitisTarihi(bitisTarihiController.text);
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.setIsScrollDown(false);
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.setIsScrollDown(true);
        }
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          viewModel.setIsScrollDown(true);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    hesapController.dispose();
    hesapTipiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        // resizeToAvoidBottomInset: true,
        // extendBody: true,
        // extendBodyBehindAppBar: false,
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
              return AppBarTitle(
                title: "Banka İşlemleri",
                subtitle: "${viewModel.getBankaIslemleriListesi?.length ?? 0}",
              );
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: () => viewModel.changeSearchBar(),
            icon: Observer(
              builder: (_) => Icon(
                viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined,
              ),
            ),
          ),
          IconButton(
            onPressed: filter,
            icon: const Icon(Icons.filter_alt_outlined),
          ),
        ],
      );

  Observer fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () async {
            final result = await dialogManager.showBankaGridViewDialog(null);
            if (result != null) {
              await viewModel.resetPage();
            }
          },
        ),
      );

  Column body() => Column(
        children: [
          RaporFiltreDateTimeBottomSheetView(
            showBugunFirst: true,
            filterOnChanged: (index) async {
              viewModel
                ..setBaslamaTarihi(baslangicTarihiController.text)
                ..setBitisTarihi(bitisTarihiController.text);
              await viewModel.resetPage();
            },
            baslangicTarihiController: baslangicTarihiController,
            bitisTarihiController: bitisTarihiController,
          ).paddingSymmetric(horizontal: UIHelper.lowSize),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async => await viewModel.resetPage(),
              child: Observer(
                builder: (_) => viewModel.getBankaIslemleriListesi == null
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : viewModel.getBankaIslemleriListesi.ext.isNullOrEmpty
                        ? const Center(child: Text("Veri bulunamadı"))
                        : ListView.builder(
                            padding: UIHelper.lowPadding,
                            primary: false,
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: viewModel.getBankaIslemleriListesi?.length ?? 0,
                            itemBuilder: (context, index) {
                              final BankaHareketleriModel? item = viewModel.getBankaIslemleriListesi?[index];
                              return BankaIslemleriCard(
                                bankaHareketleriModel: item,
                                onDeleted: (deneme) {
                                  viewModel.resetPage();
                                },
                              );
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
                  builder: (_) => Text(
                    "${viewModel.gelenTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    style: const TextStyle(color: ColorPalette.mantis),
                  ),
                ),
              ],
            ),
            FooterButton(
              children: [
                const Text("Gider"),
                Observer(
                  builder: (_) => Text(
                    "${viewModel.gidenTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    style: const TextStyle(color: ColorPalette.persianRed),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Future<void> filter() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        children: [
          CustomTextField(
            labelText: "Hesap",
            controller: hesapController,
            readOnly: true,
            suffixMore: true,
            onClear: () => viewModel.setHesapKodu(null),
            valueWidget: Observer(builder: (_) => Text(viewModel.bankaIslemleriRequestModel.hesapKodu ?? "")),
            onTap: () async {
              // final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(
              //   context,
              //   BankaListesiRequestModel(menuKodu: "YONE_BHRE", ekranTipi: "R"),
              //   viewModel.bankaIslemleriRequestModel.hesapKodu,
              // );
              final result = await Get.toNamed("/mainPage/bankaListesiOzel", arguments: BankaListesiRequestModel(menuKodu: "YONE_BHRE"));
              if (result is BankaListesiModel) {
                hesapController.text = result.hesapAdi ?? "";
                viewModel.setHesapKodu(result.hesapKodu ?? "");
              }
            },
          ),
          CustomTextField(
            labelText: "Hesap Tipi",
            controller: hesapTipiController,
            readOnly: true,
            suffixMore: true,
            onClear: () => viewModel.setHesapTipi(null),
            onTap: () async {
              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<int>(
                context,
                title: "Hesap Tipi Seçiniz",
                groupValues: jsonDecode(viewModel.bankaIslemleriRequestModel.hesapTipi ?? "[]"),
                children: List.generate(
                  viewModel.hesapTipiList.length,
                  (index) => BottomSheetModel(
                    title: viewModel.hesapTipiList[index],
                    value: index,
                    groupValue: index,
                  ),
                ),
              );
              if (result != null) {
                if (result.isNotEmpty) {
                  hesapTipiController.text = viewModel.hesapTipiList.whereIndexed((index, element) => result.contains(index)).join(", ");
                  viewModel.setHesapTipi(result.toList().cast<int>());
                } else {
                  hesapTipiController.clear();
                  viewModel.setHesapTipi(null);
                }
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
                    viewModel.clearFilters();
                    hesapController.clear();
                    hesapTipiController.clear();
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
                  child: Text(loc.generalStrings.apply),
                ),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ],
      ),
    );
  }
}
