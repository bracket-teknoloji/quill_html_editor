import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/siparis_tipi_enum.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";

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
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/islem_tipi_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async => await init());
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    searchController.dispose();
  }

  Future<void> init() async {
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
                    dialogManager.showGridViewDialog(CustomAnimatedGridView(cariListesiModel: widget.cari, islemTipi: IslemTipiEnum.cari, title: widget.cari?.cariAdi));
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
                      groupValue: viewModel.siralama,
                      children: [
                        BottomSheetModel(title: "Tarih (Eskiden-Yeniye)", groupValue: "TARIH_AZ", value: "TARIH_AZ"),
                        BottomSheetModel(title: "Tarih (Yeniden-Eskiye)", groupValue: "TARIH_ZA", value: "TARIH_ZA"),
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
                  builder: (_) => SlidableAutoCloseBehavior(
                    child: ListView.builder(
                      primary: false,
                      controller: scrollController,
                      padding: UIHelper.lowPadding,
                      itemCount: viewModel.cariHareketleriList != null ? viewModel.cariHareketleriList!.length : 0,
                      itemBuilder: (context, index) {
                        final CariHareketleriModel model = viewModel.cariHareketleriList![index];
                        return Observer(
                          builder: (_) => Visibility(
                            visible: viewModel.cariHareketleriList.ext.isNotNullOrEmpty,
                            child: CariHareketlerCard(
                              dovizTipi: widget.cari?.dovizAdi,
                              cariHareketleriModel: model,
                              onTap: () {
                                bottomSheetDialogManager.showBottomSheetDialog(
                                  context,
                                  title: "Seçenekler",
                                  //TODO DÜZELT. ORJİNAL PİCKER'A BAK
                                  children: [
                                    //! BottomSheetModel(iconWidget: Icons.display_settings_outlined, title: "İşlemler", onTap: () {}),
                                    BottomSheetModel(
                                      iconWidget: Icons.preview_outlined,
                                      title: "Görüntüle",
                                      onTap: () async {
                                        Get.back();
                                        if (model.faturaMi) {
                                          await Get.toNamed(
                                            "/mainPage/faturaEdit",
                                            arguments: BaseEditModel(
                                              baseEditEnum: BaseEditEnum.goruntule,
                                              siparisTipiEnum: SiparisTipiEnum.alisFatura.getSiparisTipiEnumWithRawValue(model.belgeTipi),
                                              model: SiparisEditRequestModel.fromCariHareketleriModel(model),
                                            ),
                                          );
                                        } else if (model.kasaMi) {
                                          await Get.toNamed("/mainPage/kasaHareketDetayi", arguments: model);
                                        } else {
                                          await Get.toNamed("/mainPage/cariYeniKayit", arguments: BaseEditModel<CariHareketleriModel>(baseEditEnum: BaseEditEnum.goruntule, model: model));
                                        }
                                      },
                                    ).yetkiKontrol(!model.dekontMu && yetkiController.cariHareketleriHarDetayGorsun),
                                    BottomSheetModel(
                                      iconWidget: Icons.preview_outlined,
                                      title: "E-Belge Görüntüle",
                                      onTap: () async {
                                        Get.back();
                                        await Get.toNamed(
                                          "/mainPage/eBelgePdf",
                                          arguments: EBelgeListesiModel(
                                            resmiBelgeNo: model.resmiBelgeNo,
                                            belgeTuru: model.belgeTipi,
                                            ebelgeTuru: model.ebelgeTuru,
                                          ),
                                        );
                                      },
                                    ).yetkiKontrol(model.resmiBelgeNo != null),
                                    BottomSheetModel(
                                      iconWidget: Icons.list_alt_outlined,
                                      title: "İşlemler",
                                      onTap: () async {
                                        Get.back();
                                        await dialogManager.showCariHareketleriGridViewDialog(CariListesiModel.fromCariHareketleriModel(viewModel.cariHareketleriList?[index]));
                                      },
                                    ),
                                    BottomSheetModel(
                                      iconWidget: Icons.edit_outlined,
                                      title: "Düzenle",
                                      onTap: () async {
                                        Get.back();
                                        final result = await Get.toNamed(
                                          "/mainPage/cariYeniKayit",
                                          arguments: BaseEditModel<CariHareketleriModel>(baseEditEnum: BaseEditEnum.duzenle, model: model),
                                        );
                                        if (result != null) {
                                          viewModel.setCariHareketleri(null);
                                          return getData().then((value) => viewModel.setCariHareketleri(value));
                                        }
                                      },
                                    ).yetkiKontrol(model.devirMi && yetkiController.cariHareketleriDuzenleme),
                                    BottomSheetModel(
                                      title: "Sil",
                                      iconWidget: Icons.delete_outline_outlined,
                                      onTap: () async {
                                        Get.back();
                                        await dialogManager.showAreYouSureDialog(
                                          () async {
                                            final result =
                                                await networkManager.dioPost(path: ApiUrls.deleteCariHareket, bodyModel: CariHareketleriModel(), queryParameters: {"INCKEYNO": model.inckeyno});
                                            if (result.success == true) {
                                              dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                                              viewModel.setCariHareketleri(null);
                                              return getData().then((value) => viewModel.setCariHareketleri(value));
                                            } else {
                                              dialogManager.showErrorSnackBar(result.message ?? "");
                                            }
                                          },
                                          title: "Bu hareket kaydını silmek istediğinizden emin misiniz?",
                                        );
                                      },
                                    ).yetkiKontrol(model.devirMi && yetkiController.cariHareketleriSilme),

                                    BottomSheetModel(
                                      iconWidget: Icons.receipt_long_outlined,
                                      title: "Tahsilat Makbuzu",
                                      onTap: () async => await showPdf("TahsilatMakbuzu", model.inckeyno.toStringIfNotNull ?? ""),
                                    ).yetkiKontrol(model.kasaMi),
                                    BottomSheetModel(
                                      iconWidget: Icons.picture_as_pdf_outlined,
                                      title: "PDF Görüntüle",
                                      onTap: () async {
                                        await showPdf("CariHareket", model.inckeyno.toStringIfNotNull ?? "");
                                        // final PdfModel pdfModel = PdfModel(raporOzelKod: "CariHareket", dicParams: DicParams());
                                        // final anaVeri = CacheManager.getAnaVeri;
                                        // final result = anaVeri?.paramModel?.netFectDizaynList?.where((element) => element.ozelKod == "CariHareket").toList();
                                        // NetFectDizaynList? dizaynList;
                                        // if (result.ext.isNotNullOrEmpty) {
                                        //   if (result!.length == 1) {
                                        //     pdfModel.dizaynId = result.first.id;
                                        //     pdfModel.etiketSayisi = result.first.kopyaSayisi;
                                        //     pdfModel.dicParams?.caharInckey = model.inckeyno.toStringIfNotNull;
                                        //     dizaynList = result.first;
                                        //     Get.back();
                                        //   } else {
                                        //     dizaynList = await bottomSheetDialogManager.showBottomSheetDialog(
                                        //       context,
                                        //       title: "Dizayn Seçiniz",
                                        //       children: result.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", onTap: () => Get.back(result: e))).toList(),
                                        //     );
                                        //   }
                                        //   Get.to(() => PDFViewerView(title: dizaynList?.dizaynAdi ?? "", pdfData: pdfModel));
                                        // }
                                      },
                                    ),
                                  ].nullCheckWithGeneric,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )),
        ),
      );

  Widget bottomButtonBar() => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: viewModel.isScrollDown,
          children: [
            FooterButton(
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
            FooterButton(
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
            FooterButton(
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
          ],
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

  Future<void> showPdf(String ozelKod, String inckeyno) async {
    final PdfModel pdfModel = PdfModel(raporOzelKod: ozelKod, dicParams: DicParams());
    final result = parametreModel.netFectDizaynList?.where((element) => element.ozelKod == ozelKod).toList();
    NetFectDizaynList? dizaynList;
    if (result.ext.isNotNullOrEmpty) {
      Get.back();
      if (result!.length == 1) {
        pdfModel.dizaynId = result.first.id;
        pdfModel.etiketSayisi = result.first.kopyaSayisi;
        pdfModel.dicParams?.caharInckey = inckeyno;
        dizaynList = result.first;
      } else {
        dizaynList = await bottomSheetDialogManager.showBottomSheetDialog(
          context,
          title: "Dizayn Seçiniz",
          children: result.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", onTap: () => Get.back(result: e))).toList(),
        );
        pdfModel.dizaynId = dizaynList?.id;
        pdfModel.etiketSayisi = dizaynList?.kopyaSayisi;
        pdfModel.dicParams?.caharInckey = inckeyno;
        // pdfModel.dicParams?.belgeNo = dizaynList?.;
      }
      Get.to(() => PDFViewerView(title: dizaynList?.dizaynAdi ?? "", pdfData: pdfModel));
    }
  }
}
