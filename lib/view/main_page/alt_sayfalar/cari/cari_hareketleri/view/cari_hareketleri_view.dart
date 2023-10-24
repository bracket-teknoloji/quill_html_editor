import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/color_palette.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/card/cari_hareketler_card.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/grid_tile/custom_animated_grid/view/custom_animated_grid_view.dart";
import "../../../../../../core/components/helper_widgets/scrollable_widget.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/islem_tipi_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/param_model.dart";
import "../../cari_listesi/model/cari_listesi_model.dart";
import "../model/cari_hareketleri_model.dart";
import "../view_model/cari_hareketleri_view_model.dart";

class CariHareketleriView extends StatefulWidget {
  final CariListesiModel? cari;
  const CariHareketleriView({super.key, this.cari});

  @override
  State<CariHareketleriView> createState() => _CariHareketleriViewState();
}

class _CariHareketleriViewState extends BaseState<CariHareketleriView> {
  CariHareketleriViewModel viewModel = CariHareketleriViewModel();
  late final ScrollController scrollController;
  late final TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    viewModel.setCariListesiModel(widget.cari);
    scrollController = ScrollController();
    searchController = TextEditingController();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    searchController.dispose();
  }

  void init() async {
    viewModel.setCariHareketleri(await getData());
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeScrollDown(true);
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeScrollDown(false);
      }
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        viewModel.changeScrollDown(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: appBar(context),
        floatingActionButton: fab(),
        bottomNavigationBar: bottomButtonBar(),
        body: body(),
      );

  AppBar appBar(BuildContext context) => AppBar(
        // materialType: MaterialType.transparency,
        backgroundColor: Colors.transparent,
        // controller: scrollController!,
        title: Observer(
          builder: (_) => viewModel.isSearchBarOpened
              ? SizedBox(
                  height: kToolbarHeight * 0.9,
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(),
                  ).marginAll(5),
                )
              : AppBarTitle(
                  title: "Cari Hareketleri ${viewModel.cariHareketleriList?.isNotEmpty ?? false ? '(${viewModel.cariHareketleriList!.length})' : ''}",
                  subtitle: widget.cari?.cariAdi.toString() ?? "",
                ),
        ),
        leading: viewModel.isSearchBarOpened
            ? IconButton(
                onPressed: () {
                  viewModel.changeSearchBar();
                },
                icon: const Icon(Icons.arrow_back),
              )
            : null,
        actions: [
          IconButton(
            onPressed: () {
              viewModel.changeSearchBar();
            },
            icon: Observer(builder: (_) => Icon(viewModel.isSearchBarOpened ? Icons.search_off_outlined : Icons.search_outlined)),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.07),
          child: SizedBox(
            height: height * 0.07,
            child: ListView(
              shrinkWrap: true,
              itemExtent: width * 0.33,
              scrollDirection: Axis.horizontal,
              children: [
                AppBarButton(
                  onPressed: () {
                    dialogManager.showGridViewDialog(CustomAnimatedGridView(cariListesiModel: widget.cari, islemTipi: IslemTipiEnum.cari));
                  },
                  icon: Icons.tune_outlined,
                  child: const Text("Cari İşlemleri"),
                ),
                AppBarButton(
                  icon: Icons.sort_by_alpha_outlined,
                  onPressed: () async {
                    final siralama = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                      context,
                      title: "Sıralama seçiniz",
                      children: [
                        BottomSheetModel(title: "Tarih (Eskiden-Yeniye)", onTap: () => Get.back(result: "TARIH_AZ")),
                        BottomSheetModel(title: "Tarih (Yeniden-Eskiye)", onTap: () => Get.back(result: "TARIH_ZA")),
                      ],
                    );
                    if (siralama != viewModel.siralama && siralama != null) {
                      viewModel.setSiralama(siralama!);
                      viewModel.setCariHareketleri(null);
                      return getData().then((value) => viewModel.setCariHareketleri(value));
                    }
                  },
                  child: const Text("Sırala"),
                ),
                AppBarButton(
                  icon: Icons.refresh_outlined,
                  child: const Text("Yenile"),
                  onPressed: () {
                    viewModel.setCariHareketleri(null);
                    return getData().then((value) => viewModel.setCariHareketleri(value));
                  },
                ),
              ].map((e) => e.paddingAll(UIHelper.lowSize)).toList(),
            ),
          ),
        ),
      );

  // scrollController?.appBar.setPinState(false);
  Widget fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () async {
            await Get.toNamed(
              "/mainPage/cariYeniKayit",
              arguments: BaseEditModel<CariHareketleriModel>(
                model: CariHareketleriModel()
                  ..cariAdi = widget.cari!.cariAdi
                  ..cariKodu = widget.cari!.cariKodu,
                baseEditEnum: BaseEditEnum.ekle,
              ),
            );
            viewModel.setCariHareketleri(null);
            return getData().then((value) => viewModel.setCariHareketleri(value));
          },
        ).yetkiVarMi(yetkiController.cariHareketleriYeniKayit),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setCariHareketleri(null);
          return getData().then((value) => viewModel.setCariHareketleri(value));
        },
        child: Observer(
          builder: (_) => (viewModel.cariHareketleriList.ext.isNullOrEmpty
              ? (viewModel.cariHareketleriList?.isEmpty ?? false)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(Icons.crisis_alert_outlined, color: theme.colorScheme.primary), const Text("Cari Hareket Detayı Bulunamadı")],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator.adaptive())
              : Observer(
                  builder: (_) => ListView.builder(
                    primary: false,
                    controller: scrollController,
                    itemCount: viewModel.cariHareketleriList != null ? viewModel.cariHareketleriList!.length : 0,
                    itemBuilder: (context, index) => Observer(
                      builder: (_) => Visibility(
                        visible: viewModel.cariHareketleriList.ext.isNotNullOrEmpty,
                        child: CariHareketlerCard(
                          dovizTipi: widget.cari?.dovizAdi,
                          cariHareketleriModel: viewModel.cariHareketleriList![index],
                          onTap: () {
                            final List<BottomSheetModel> children2 = [
                              //TODO DÜZELT. ORJİNAL PİCKER'A BAK

                              // BottomSheetModel(
                              //     iconWidget: Icons.view_comfy_outlined,
                              //     title: "Görüntüle",
                              //     onTap: () async {
                              //       Get.back();
                              //       await Get.toNamed("/mainPage/cariYeniKayit",
                              //           arguments: BaseEditModel<CariHareketleriModel>(baseEditEnum: BaseEditEnum.goruntule, model: viewModel.cariHareketleriList![index]));
                              //     }),

                              //! BottomSheetModel(iconWidget: Icons.display_settings_outlined, title: "İşlemler", onTap: () {}),
                              BottomSheetModel(
                                iconWidget: Icons.picture_as_pdf_outlined,
                                title: "PDF Görüntüle",
                                onTap: () async {
                                  final PdfModel pdfModel = PdfModel(raporOzelKod: "CariHareket", dicParams: DicParams());
                                  final anaVeri = CacheManager.getAnaVeri;
                                  final result = anaVeri?.paramModel?.netFectDizaynList?.where((element) => element.ozelKod == "CariHareket").toList();
                                  NetFectDizaynList? dizaynList;
                                  if (result.ext.isNotNullOrEmpty) {
                                    if (result!.length == 1) {
                                      pdfModel.dizaynId = result.first.id;
                                      pdfModel.etiketSayisi = result.first.kopyaSayisi;
                                      pdfModel.dicParams?.caharInckey = viewModel.cariHareketleriList![index].inckeyno.toStringIfNotNull;
                                      dizaynList = result.first;
                                    } else {
                                      dizaynList = await bottomSheetDialogManager.showBottomSheetDialog(
                                        context,
                                        title: "Dizayn Seçiniz",
                                        children: result.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", onTap: () => Get.back(result: e))).toList(),
                                      );
                                    }
                                    Get.to(() => PDFViewerView(title: dizaynList?.dizaynAdi ?? "", pdfData: pdfModel));
                                  }
                                },
                              ),
                            ];
                            if (viewModel.cariHareketleriList![index].devirMi) {
                              children2.add(
                                BottomSheetModel(
                                  iconWidget: Icons.display_settings_outlined,
                                  title: "Düzenle",
                                  onTap: () async {
                                    Get.back();
                                    final result = await Get.toNamed(
                                      "/mainPage/cariYeniKayit",
                                      arguments: BaseEditModel<CariHareketleriModel>(baseEditEnum: BaseEditEnum.duzenle, model: viewModel.cariHareketleriList![index]),
                                    );
                                    if (result != null) {
                                      viewModel.setCariHareketleri(null);
                                      return getData().then((value) => viewModel.setCariHareketleri(value));
                                    }
                                  },
                                ),
                              );
                              children2.add(
                                BottomSheetModel(
                                  iconWidget: Icons.view_comfy_outlined,
                                  title: "Görüntüle",
                                  onTap: () async {
                                    Get.back();
                                    await Get.toNamed(
                                      "/mainPage/cariYeniKayit",
                                      arguments: BaseEditModel<CariHareketleriModel>(baseEditEnum: BaseEditEnum.goruntule, model: viewModel.cariHareketleriList![index]),
                                    );
                                  },
                                ),
                              );
                            }
                            // B = Kasa hareketi
                            // G = Ta
                            if ((viewModel.cariHareketleriList![index].kasaMi || viewModel.cariHareketleriList![index].musteriCekMi || viewModel.cariHareketleriList![index].musteriSenediMi) &&
                                viewModel.cariHareketleriList![index].alacak != null) {
                              children2.add(
                                BottomSheetModel(
                                  iconWidget: Icons.picture_as_pdf_outlined,
                                  title: "Tahsilat Makbuzu",
                                  onTap: () async {
                                    final PdfModel pdfModel = PdfModel(raporOzelKod: "TahsilatMakbuzu", dicParams: DicParams());
                                    final anaVeri = CacheManager.getAnaVeri;
                                    final result = anaVeri?.paramModel?.netFectDizaynList?.where((element) => element.ozelKod == "TahsilatMakbuzu").toList();
                                    NetFectDizaynList? dizaynList;
                                    if (result.ext.isNotNullOrEmpty) {
                                      if (result!.length == 1) {
                                        pdfModel.dicParams?.caharInckey = viewModel.cariHareketleriList![index].inckeyno.toStringIfNotNull;
                                        pdfModel.dizaynId = result.first.id;
                                        //😳 Bunu sor kanka 👇🏼👇🏼
                                        pdfModel.dicParams?.kasaharInckey = viewModel.cariHareketleriList![index].kasaMi ? "1" : "0";

                                        dizaynList = result.first;
                                      } else {
                                        dizaynList = await bottomSheetDialogManager.showBottomSheetDialog(
                                          context,
                                          title: "Dizayn Seçiniz",
                                          children: result.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", onTap: () => Get.back(result: e))).toList(),
                                        );
                                        pdfModel.dizaynId = dizaynList?.id;
                                        pdfModel.dicParams?.caharInckey = viewModel.cariHareketleriList![index].inckeyno.toStringIfNotNull;
                                        pdfModel.dicParams?.kasaharInckey = viewModel.cariHareketleriList![index].kasaMi ? "1" : "0";
                                      }
                                      Get.to(() => PDFViewerView(title: dizaynList?.dizaynAdi ?? "", pdfData: pdfModel));
                                    }
                                  },
                                ),
                              );
                            }
                            bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: children2);
                          },
                        ),
                      ),
                    ),
                  ),
                )),
        ),
      );

  Widget bottomButtonBar() => Observer(
        builder: (_) => ScrollableWidget(
          isScrolledDown: viewModel.isScrollDown,
          child: SizedBox(
            height: context.isPortrait ? (height * 0.07) : (height * 0.1 < 60 ? 60 : height * 0.1),
            child: Row(
              children: [
                Expanded(
                  child: FooterButton(
                    children: [
                      const Text("Borç"),
                      Observer(
                        builder: (_) => Text(
                          "${(viewModel.borclarToplami).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.cari?.dovizAdi ?? mainCurrency}",
                          style: const TextStyle(color: ColorPalette.persianRed),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: FooterButton(
                    children: [
                      const Text("Alacak"),
                      Observer(
                        builder: (_) => Text(
                          "${(viewModel.alacaklarToplami).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.cari?.dovizAdi ?? mainCurrency}",
                          style: const TextStyle(color: ColorPalette.mantis),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: FooterButton(
                    children: [
                      Text((viewModel.toplamBakiye) < 0 ? "Ödenecek" : "Tahsil Edilecek"),
                      Observer(
                        builder: (_) => Text(
                          "${(viewModel.toplamBakiye).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.cari?.dovizAdi ?? mainCurrency}",
                          style: TextStyle(color: (viewModel.borclarToplami - viewModel.alacaklarToplami) < 0 ? ColorPalette.persianRed : ColorPalette.mantis),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  bool getFilter(CariHareketleriModel model, String filter) =>
      model.belgeNo!.toLowerCase().contains(filter.toLowerCase()) ||
      model.hareketAciklama!.toLowerCase().contains(filter.toLowerCase()) ||
      model.aciklama!.toLowerCase().contains(filter.toLowerCase());
  // ("${"("})").toLowerCase().contains(filter.toLowerCase());

  Future<List<CariHareketleriModel>> getData() async {
    final response = await networkManager.dioGet<CariHareketleriModel>(
      path: ApiUrls.getCariHareketleri,
      bodyModel: CariHareketleriModel(),
      queryParameters: {"SIRALAMA": viewModel.siralama, "EkranTipi": "L", "CariKodu": widget.cari?.cariKodu ?? ""},
      addSirketBilgileri: true,
    );
    return (response.data).map((e) => e as CariHareketleriModel).toList().cast<CariHareketleriModel>();
  }
}
