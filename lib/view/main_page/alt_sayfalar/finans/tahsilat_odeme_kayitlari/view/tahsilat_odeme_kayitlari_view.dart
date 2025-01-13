import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/card/tahsilat_odeme_kayitlari_card.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/tahsilat_odeme_kayitlari/view_model/tahsilat_odeme_kayitlari_view_model.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";

final class TahsilatOdemeKayitlariView extends StatefulWidget {
  const TahsilatOdemeKayitlariView({super.key});

  @override
  State<TahsilatOdemeKayitlariView> createState() => _TahsilatOdemeKayitlariViewState();
}

final class _TahsilatOdemeKayitlariViewState extends BaseState<TahsilatOdemeKayitlariView> {
  TahsilatOdemeKayitlariViewModel viewModel = TahsilatOdemeKayitlariViewModel();
  late final ScrollController _scrollController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController cariController;
  late final TextEditingController hareketTuruController;
  late final TextEditingController plasiyerController;

  @override
  void initState() {
    _scrollController = ScrollController();
    hareketTuruController = TextEditingController();
    cariController = TextEditingController();
    plasiyerController = TextEditingController();
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
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    hareketTuruController.dispose();
    cariController.dispose();
    plasiyerController.dispose();
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
              return AppBarTitle(title: "Kayıtlar", subtitle: "${viewModel.getCariHareketleriListesi?.length ?? 0}");
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
            await dialogManager.showOdemeTahsilatGridViewDialog(
              onSelected: (p0) {
                if (p0) {
                  viewModel.resetPage();
                }
              },
            );
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
                builder: (_) => viewModel.getCariHareketleriListesi == null
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : viewModel.getCariHareketleriListesi.ext.isNullOrEmpty
                        ? const Center(child: Text("Veri bulunamadı"))
                        : ListView.builder(
                            padding: UIHelper.lowPadding,
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: _scrollController,
                            itemCount: viewModel.getCariHareketleriListesi?.length,
                            itemBuilder: (context, index) {
                              final CariHareketleriModel item = viewModel.getCariHareketleriListesi![index];
                              return TahsilatOdemeKayitlariCard(
                                cariHareketleriModel: item,
                                update: (value) async {
                                  await viewModel.resetPage();
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
                const Text("Tahsilat"),
                Observer(
                  builder: (_) => Text("${viewModel.toplamTahsilat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: ColorPalette.mantis)),
                ),
              ],
              onPressed: () {
                if (viewModel.cariHareketleriRequestModel.ba == "A") {
                  viewModel.setIslemTuru(null);
                } else {
                  viewModel.setIslemTuru(1);
                }
                viewModel.resetPage();
              },
            ),
            FooterButton(
              children: [
                const Text("Ödeme"),
                Observer(
                  builder: (_) => Text(
                    "${viewModel.toplamOdeme.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    style: const TextStyle(color: ColorPalette.persianRed),
                  ),
                ),
              ],
              onPressed: () {
                if (viewModel.cariHareketleriRequestModel.ba == "B") {
                  viewModel.setIslemTuru(null);
                } else {
                  viewModel.setIslemTuru(2);
                }
                viewModel.resetPage();
              },
            ),
          ],
        ),
      );

  Future<void> filter() async {
    await bottomSheetDialogManager.showBottomSheetDialog(context, title: loc.generalStrings.filter, body: filterBody);
  }

  Widget get filterBody => Column(
        children: [
          Observer(
            builder: (_) => SlideControllerWidget(
              childrenTitleList: viewModel.hesapTipiMap.keys.toList(),
              filterOnChanged: viewModel.setIslemTuru,
              childrenValueList: viewModel.hesapTipiMap.values.toList(),
              groupValue: viewModel.cariHareketleriRequestModel.ba,
            ),
          ),
          CustomTextField(
            labelText: "Cari",
            controller: cariController,
            suffixMore: true,
            readOnly: true,
            valueWidget: Observer(
              builder: (_) => Text(viewModel.cariHareketleriRequestModel.cariKodu ?? ""),
            ),
            onTap: () async {
              final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
              if (result is CariListesiModel) {
                cariController.text = result.cariAdi ?? "";
                viewModel.setCariKodu(result.cariKodu);
              }
            },
          ),
          CustomTextField(
            labelText: "Hareket Türü",
            controller: hareketTuruController,
            suffixMore: true,
            readOnly: true,
            onTap: () async {
              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<MapEntry<String, String>>(
                context,
                title: "Hareket Türü",
                groupValues: jsonDecode(viewModel.cariHareketleriRequestModel.arrHareketTuru ?? "[]"),
                children: List.generate(
                  viewModel.hareketTuruMap.length,
                  (index) => BottomSheetModel(
                    title: viewModel.hareketTuruMap.keys.toList()[index],
                    value: viewModel.hareketTuruMap.entries.toList()[index],
                    groupValue: viewModel.hareketTuruMap.values.toList()[index],
                  ),
                ),
              );
              if (result != null) {
                hareketTuruController.text = result.map((e) => e.key).toList().nullCheckWithGeneric.join(", ");
                viewModel.setHareketTuru(result.map((e) => e.value).toList().nullCheckWithGeneric);
              }
            },
          ),
          CustomTextField(
            labelText: "Plasiyer",
            controller: plasiyerController,
            suffixMore: true,
            readOnly: true,
            onTap: () async {
              final result = await bottomSheetDialogManager.showPlasiyerListesiBottomSheetDialog(context, groupValues: jsonDecode(viewModel.cariHareketleriRequestModel.arrPlasiyerKodu ?? "[]"));
              if (result != null) {
                plasiyerController.text = result.map((e) => e.plasiyerAciklama).toList().nullCheckWithGeneric.join(", ");
                viewModel.setPlasiyerKodu(result.map((e) => e.plasiyerKodu).toList().nullCheckWithGeneric);
              }
            },
          ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                  onPressed: () {
                    viewModel.clearFilters();
                    plasiyerController.clear();
                    cariController.clear();
                    hareketTuruController.clear();
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
      ).paddingAll(UIHelper.lowSize);
}
