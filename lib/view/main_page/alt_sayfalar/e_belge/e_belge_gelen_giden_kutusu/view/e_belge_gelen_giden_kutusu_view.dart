import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/card/e_fatura_listesi_card.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/e_belge_enum.dart";
import "package:picker/core/constants/enum/e_belge_turu_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/view_model/e_belge_gelen_giden_kutusu_view_model.dart";

class EBelgeGelenGidenKutusuView extends StatefulWidget {
  final EBelgeEnum eBelgeEnum;
  const EBelgeGelenGidenKutusuView({super.key, required this.eBelgeEnum});

  @override
  State<EBelgeGelenGidenKutusuView> createState() => _EBelgeGelenGidenKutusuViewState();
}

class _EBelgeGelenGidenKutusuViewState extends BaseState<EBelgeGelenGidenKutusuView> {
  late final EBelgeGelenGidenKutusuViewModel viewModel;
  late final ScrollController _scrollController;
  late final TextEditingController _searchTextController;
  late final TextEditingController _baslangicTarihiController;
  late final TextEditingController _bitisTarihiController;
  @override
  void initState() {
    viewModel = EBelgeGelenGidenKutusuViewModel(eBelgeEnum: widget.eBelgeEnum);
    _scrollController = ScrollController();
    _searchTextController = TextEditingController();
    _baslangicTarihiController = TextEditingController();
    _bitisTarihiController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await filtrele();

      _scrollController.addListener(() async {
        if (_scrollController.hasClients) {
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            if (viewModel.dahaVarMi) {
              await viewModel.getData();
              viewModel.changeIsScrolledDown(true);
            }
          }
          if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
            viewModel.changeIsScrolledDown(false);
          } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
            viewModel.changeIsScrolledDown(true);
          }
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            viewModel.changeIsScrolledDown(false);
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchTextController.dispose();
    _baslangicTarihiController.dispose();
    _bitisTarihiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: Observer(
          builder: (_) => BottomBarWidget(
            isScrolledDown: true,
            children: [
              FooterButton(
                children: [
                  ListTile(
                    subtitle: const Text("Toplam Kayıt:"),
                    trailing: Observer(builder: (_) => Text(((viewModel.paramData?["TOPLAM_KAYIT_SAYISI"] as double?) ?? 0.0).toIntIfDouble.toStringIfNotNull ?? "")),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  AppBar get appBar => AppBar(
        title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(
                  controller: _searchTextController,
                  onFieldSubmitted: (value) async {
                    viewModel.changeSearchText(value);
                    await viewModel.resetPage();
                  },
                )
              : AppBarTitle(title: "E-Fatura (${viewModel.eBelgeListesi?.length ?? 0})", subtitle: widget.eBelgeEnum.appBarTitle),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              viewModel.changeSearchBar();
              viewModel.changeSearchText(null);
              if (!viewModel.searchBar) {
                await viewModel.resetPage();
              }
            },
            icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(icon: Icons.filter_alt_outlined, hasFilter: false, onPressed: filtrele, child: const Text("Filtrele")),
            AppBarButton(icon: Icons.sort_by_alpha_outlined, hasFilter: false, onPressed: sirala, child: const Text("Sırala")),
            AppBarButton(icon: Icons.refresh_outlined, hasFilter: false, onPressed: refresh, child: const Text("Yenile")),
          ],
        ),
      );

  RefreshIndicator get body => RefreshIndicator.adaptive(
        onRefresh: () async => await viewModel.resetPage(),
        child: Observer(
          builder: (_) => viewModel.eBelgeListesi.ext.isNullOrEmpty
              ? (viewModel.eBelgeListesi?.isEmpty ?? false)
                  ? Center(child: Text(viewModel.error ?? "", textAlign: TextAlign.center))
                  : const Center(child: CircularProgressIndicator.adaptive())
              : ListView.builder(
                  primary: false,
                  controller: _scrollController,
                  shrinkWrap: true,
                  padding: UIHelper.lowPadding,
                  itemCount: (viewModel.eBelgeListesi?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index < (viewModel.eBelgeListesi?.length ?? 0)) {
                      return EFaturaListesiCard(eBelgeListesiModel: viewModel.eBelgeListesi![index], eBelgeEnum: widget.eBelgeEnum);
                    } else if (index == viewModel.eBelgeListesi?.length) {
                      return Observer(
                        builder: (_) => Visibility(
                          visible: viewModel.dahaVarMi,
                          child: const Center(child: CircularProgressIndicator.adaptive()),
                        ),
                      );
                    }
                    return null;
                  },
                ),
        ),
      );

  Future<void> filtrele() async => await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: "Filtrele",
        body: Observer(
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RaporFiltreDateTimeBottomSheetView(
                showBugunFirst: true,
                baslangicTarihiController: _baslangicTarihiController,
                bitisTarihiController: _bitisTarihiController,
                filterOnChanged: (index) {
                  viewModel.changeBaslangicTarihi(_baslangicTarihiController.text);
                  viewModel.changeBitisTarihi(_bitisTarihiController.text);
                },
              ),
              CustomWidgetWithLabel(
                text: "E-Belge Türü",
                child: Observer(
                  builder: (_) => SlideControllerWidget(
                    childrenTitleList: viewModel.eBelgeTuru.map((e) => e.name).toList(),
                    childrenValueList: viewModel.eBelgeTuru.map((e) => e.value).toList(),
                    filterOnChanged: (index) => viewModel.changeEBelgeTuru(viewModel.eBelgeTuru.map((e) => e.value).toList()[index ?? 0]),
                    groupValue: viewModel.eBelgeRequestModel.eBelgeTuru,
                  ),
                ),
              ),
              CustomWidgetWithLabel(
                text: "Tarih Türü",
                child: Observer(
                  builder: (_) => SlideControllerWidget(
                    childrenTitleList: viewModel.tarihTuru.keys.toList(),
                    childrenValueList: viewModel.tarihTuru.values.toList(),
                    filterOnChanged: (index) => viewModel.changeTarihTuru(viewModel.tarihTuru.values.toList()[index ?? 0]),
                    groupValue: viewModel.eBelgeRequestModel.kayitTarihineGore,
                  ),
                ),
              ),
              InkWell(
                onTap: () => viewModel.changeSorgulanmasin(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sorgulama Yapmadan Sadece Listele"),
                    Observer(builder: (_) => Switch.adaptive(value: viewModel.eBelgeRequestModel.sorgulanmasin ?? false, onChanged: (value) => viewModel.changeSorgulanmasin())),
                  ],
                ),
              ).paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.eBelgeRequestModel.eBelgeTuru != "AFT"),
              InkWell(
                onTap: () => viewModel.changeDigerGoster(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("Diğer"), Observer(builder: (_) => Icon(viewModel.digerGoster ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down))],
                ),
              ).paddingAll(UIHelper.lowSize),
              Column(
                children: [
                  CustomWidgetWithLabel(
                    text: "Onay Durumu",
                    child: Observer(
                      builder: (_) => SlideControllerWidget(
                        childrenTitleList: viewModel.onayMap.keys.toList(),
                        childrenValueList: viewModel.onayMap.values.toList(),
                        filterOnChanged: (index) => viewModel.changeOnayDurumu(viewModel.onayMap.values.toList()[index ?? 0]),
                        groupValue: viewModel.eBelgeRequestModel.onayDurumu,
                      ),
                    ),
                  ).yetkiVarMi(viewModel.eBelgeRequestModel.eBelgeTuru != "AFT"),
                  CustomWidgetWithLabel(
                    text: "Senaryo",
                    child: Observer(
                      builder: (_) => SlideControllerWidget(
                        childrenTitleList: viewModel.senaryoMap.keys.toList(),
                        childrenValueList: viewModel.senaryoMap.values.toList(),
                        filterOnChanged: (index) => viewModel.changeSenaryo(viewModel.senaryoMap.values.toList()[index ?? 0]),
                        groupValue: viewModel.eBelgeRequestModel.senaryo,
                      ),
                    ),
                  ).yetkiVarMi(viewModel.eBelgeRequestModel.eBelgeTuru == "EFT"),
                  CustomWidgetWithLabel(
                    text: "Basım",
                    child: Observer(
                      builder: (_) => SlideControllerWidget(
                        childrenTitleList: viewModel.basimMap.keys.toList(),
                        childrenValueList: viewModel.basimMap.values.toList(),
                        filterOnChanged: (index) => viewModel.changeBasim(viewModel.basimMap.values.toList()[index ?? 0]),
                        groupValue: viewModel.eBelgeRequestModel.basimDurumu,
                      ),
                    ),
                  ),
                  CustomWidgetWithLabel(
                    text: "Netsis'e İşlenme Durumu",
                    child: Observer(
                      builder: (_) => SlideControllerWidget(
                        childrenTitleList: viewModel.netsisIslenmeMap.keys.toList(),
                        childrenValueList: viewModel.netsisIslenmeMap.values.toList(),
                        filterOnChanged: (index) => viewModel.changeNetsisIslenme(viewModel.netsisIslenmeMap.values.toList()[index ?? 0]),
                        groupValue: viewModel.eBelgeRequestModel.islendi,
                      ),
                    ),
                  ),
                  CustomWidgetWithLabel(
                    text: "Kontrol Edildi",
                    child: Observer(
                      builder: (_) => SlideControllerWidget(
                        childrenTitleList: viewModel.kontrolMap.keys.toList(),
                        childrenValueList: viewModel.kontrolMap.values.toList(),
                        filterOnChanged: (index) => viewModel.changeKontrol(viewModel.kontrolMap.values.toList()[index ?? 0]),
                        groupValue: viewModel.eBelgeRequestModel.kontrolEdildi,
                      ),
                    ),
                  ),
                ],
              ).yetkiVarMi(viewModel.digerGoster),

              // CustomWidgetWithLabel(
              //   text: "Tarih Türü",
              //
              //   child: Observer(
              //     builder: (_) => SlideControllerWidget(
              //         // childrenTitleList: viewModel.bakiyeMap.keys.toList(),
              //         // filterOnChanged: (index) => viewModel.changeFilterBakiye(viewModel.bakiyeMap.values.toList()[index ?? 0]),
              //         // childrenValueList: viewModel.bakiyeMap.values.toList(),
              //         // groupValue: viewModel.cariRequestModel.filterBakiye,
              //         ),
              //   ),
              // ),

              ElevatedButton(
                onPressed: () async {
                  Get.back();
                  return viewModel.resetPage();
                },
                child: const Text("Uygula"),
              ).paddingAll(UIHelper.lowSize),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<void> sirala() async {
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Sırala",
      children: List.generate(viewModel.siralaMap.length, (index) => BottomSheetModel(title: viewModel.siralaMap.keys.toList()[index], value: viewModel.siralaMap.values.toList()[index])),
    );
    if (result != null) {
      viewModel.changeSiralama(result);
      await viewModel.resetPage();
    }
  }

  Future<void> refresh() async => await viewModel.resetPage();
}
