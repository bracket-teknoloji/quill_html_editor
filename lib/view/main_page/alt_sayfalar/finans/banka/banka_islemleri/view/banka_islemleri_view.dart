import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/card/banka_islemleri_card.dart";
import "../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../model/banka_islemleri_model.dart";
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
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          viewModel.setIsScrollDown(false);
        }
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          viewModel.setIsScrollDown(true);
        }
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
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
        title: Observer(builder: (_) {
          if (viewModel.searchBar) {
            return CustomAppBarTextField(
              onChanged: (value) => viewModel.setSearchText(value),
            );
          } else {
            return AppBarTitle(
                title: "Banka İşlemleri",
                subtitle: "${viewModel.getBankaIslemleriListesi?.length ?? 0}",);
          }
        },),
        actions: [
          IconButton(
            onPressed: () => viewModel.changeSearchBar(),
            icon: Observer(
                builder: (_) => Icon(viewModel.searchBar
                    ? Icons.search_off_outlined
                    : Icons.search_outlined,),),
          ),
          IconButton(
            onPressed: filter,
            icon: const Icon(Icons.filter_alt_outlined),
          ),
        ],
      );

  Observer fab() => Observer(builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () {},
        ),);

  Column body() => Column(
        children: [
          RaporFiltreDateTimeBottomSheetView(
                  filterOnChanged: (index) async {
                    viewModel.setBaslamaTarihi(baslangicTarihiController.text);
                    viewModel.setBitisTarihi(bitisTarihiController.text);
                    await viewModel.resetPage();
                  },
                  baslangicTarihiController: baslangicTarihiController,
                  bitisTarihiController: bitisTarihiController,)
              .paddingSymmetric(horizontal: UIHelper.lowSize),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async => await viewModel.resetPage(),
              child: Observer(builder: (_) => viewModel.getBankaIslemleriListesi == null
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : viewModel.getBankaIslemleriListesi.ext.isNullOrEmpty
                        ? const Center(child: Text("Veri bulunamadı"))
                        : ListView.builder(
                            padding: UIHelper.lowPadding,
                            primary: false,
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount:
                                viewModel.getBankaIslemleriListesi?.length ?? 0,
                            itemBuilder: (context, index) {
                              final BankaIslemleriModel? item =
                                  viewModel.getBankaIslemleriListesi?[index];
                              return BankaIslemleriCard(
                                  bankaIslemleriModel: item,
                                  onDeleted: (deneme) {
                                    viewModel.resetPage();
                                  },);
                            },
                          ),),
            ),
          ),
        ],
      );

  Observer bottomAppBar() => Observer(builder: (_) => BottomBarWidget(isScrolledDown: viewModel.isScrollDown, children: [
        FooterButton(children: [
          const Text("Gelir"),
          Observer(
              builder: (_) => Text(
                  "${viewModel.gelenTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                  style: const TextStyle(color: Colors.green),),),
        ],),
        FooterButton(children: [
          const Text("Gider"),
          Observer(
              builder: (_) => Text(
                  "${viewModel.gidenTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                  style: const TextStyle(color: Colors.red),),),
        ],),
      ],),);

  Future<void> filter() async {
    await bottomSheetDialogManager.showBottomSheetDialog(context,
        title: "Filtrele",
        body: Column(
          children: [
            CustomTextField(
              labelText: "Hesap",
              controller: hesapController,
              readOnly: true,
              suffixMore: true,
              onTap: () async {
                final result =
                    await Get.toNamed("/mainPage/kasaListesi", arguments: true);
                if (result != null) {
                  hesapController.text = result.kasaAdi ?? "";
                  // viewModel.changeKasaKodu(result.kasaKodu ?? "");
                }
              },
            ),
            CustomTextField(
              labelText: "Hesap Tipi",
              controller: hesapTipiController,
              readOnly: true,
              suffixMore: true,
              onTap: () async {
                final result =
                    await Get.toNamed("/mainPage/cariListesi", arguments: true);
                if (result != null) {
                  hesapTipiController.text = result.cariAdi ?? "";
                  // viewModel.changeCariKodu(result.cariKodu ?? "");
                }
              },
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.white.withOpacity(0.1),),),
                        onPressed: () {
                          viewModel.clearFilters();
                          Get.back();
                          viewModel.resetPage();
                        },
                        child: const Text("Temizle"),),),
                const SizedBox(width: 10),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                          viewModel.resetPage();
                        },
                        child: const Text("Uygula"),),),
              ],
            ).paddingAll(UIHelper.lowSize),
          ],
        ).paddingAll(UIHelper.lowSize),);
  }
}
